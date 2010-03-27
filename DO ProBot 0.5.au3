#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Author:         FreakX

 Script Function:
	Darkorbit Bot; Zum einsammeln von Bonusboxen + Cargoboxen & abschiesen von NPCs

#ce ----------------------------------------------------------------------------

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=C:\Users\Daniel\Documents\Form1.kxf
$Form1 = GUICreate("Form1", 388, 263, 286, 183)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Starten = GUICtrlCreateButton("Starten", 32, 216, 332, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "StartenClick")
$Checkbox1 = GUICtrlCreateCheckbox("Bonusboxen Sammeln", 32, 32, 145, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Aliens abschieﬂen", 32, 48, 145, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Cargoboxen einsammeln", 32, 64, 161, 17)
$Label1 = GUICtrlCreateLabel("zur Basis nach X Feinden auf der Map", 32, 104, 184, 17)
$Checkbox4 = GUICtrlCreateCheckbox("1 Feind", 48, 120, 161, 17)
$Checkbox5 = GUICtrlCreateCheckbox("2 Feinden", 48, 136, 97, 17)
$Checkbox6 = GUICtrlCreateCheckbox("3 Feinden", 48, 152, 161, 17)
$Checkbox7 = GUICtrlCreateCheckbox("4 Feinden", 48, 168, 105, 17)
$Checkbox8 = GUICtrlCreateCheckbox("5 Feinden", 48, 184, 121, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;Globale Variablen - Definition
Global $mousespeed = 2;
Global $pause = False;
Global $lefttop[2] = [0,0];
Global $leftmiddle[2] = [0,0];
Global $leftbottom[2] = [0,0];
Global $top[2] = [0,0];
Global $bottom[2] = [0,0];
Global $righttop[2] = [0,0];
Global $rightmiddle[2] = [0,0];
Global $rightbottom[2] = [0,0];
Global $mappos[2] = [0,0];
Global $movesec = 1
Global $size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
;Globale Variablen - Ende

While 1
	Sleep(100)
WEnd
Func Form1Close()
	_exit()
EndFunc
Func StartenClick()
	_main()
EndFunc


#Region ### START Define Moves###

Func movelefttop()
	MouseMove($lefttop[0],$lefttop[1],$mousespeed)
	MouseDown("left")
EndFunc
Func moveleftmiddle()
	MouseMove($leftmiddle[0],$leftmiddle[1],$mousespeed)
	MouseDown("left")
EndFunc
Func moveleftbottom()
	MouseMove($leftbottom[0],$leftbottom[1],$mousespeed)
	MouseDown("left")
EndFunc
Func movetop()
	MouseMove($top[0],$top[1],$mousespeed)
	MouseDown("left")
EndFunc
Func movebottom()
	MouseMove($bottom[0],$bottom[1],$mousespeed)
	MouseDown("left")
EndFunc
Func moverighttop()
	MouseMove($righttop[0],$righttop[1],$mousespeed)
	MouseDown("left")
EndFunc
Func moverightmiddle()
	MouseMove($rightmiddle[0],$rightmiddle[1],$mousespeed)
	MouseDown("left")
EndFunc
Func moverightbottom()
	MouseMove($rightbottom[0],$rightbottom[1],$mousespeed)
	MouseDown("left")
EndFunc
#EndRegion ### END Define Moves###
#Region ### START react ###
Func react_stop()
	;Function zum Stoppen des Schiffes

EndFunc
Func react_box()
	;Funktion zum Reagieren auf eine Box

EndFunc
Func react_cargo()
	;Funktion zum reagieren auf eine Cargobox

EndFunc
Func react_alien()
	;Funktion zum reagieren auf ein Alien ( Haupts‰chlich Streuner )

EndFunc
Func react_zone()
	;Funktion zum reagieren auf einen Flug in die Strahlenzone

EndFunc
Func react_other_sec()
	;Funktion zum Schalten in eine Neue Richtung

EndFunc
#EndRegion ### END react ###
#Region ### START search ###
Func search_box()
	;Funktion zum Suchen einer Bonusbox return (x,y)
	$boxsearch = PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0x7C72D7, 11)
	Return $boxsearch
EndFunc
Func search_cargo()
	;Funktion zum suchen einer Cagobox return (x,y)
	$cargosearch = PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0xFCFD55, 15)
	return $cargosearch
EndFunc
Func search_alien()
	;Funktion zum suchen eines Aliens return (x,y)
	$streuner = PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0xB00000, 5)
	If IsArray($streuner) Then
		$rechts = $streuner[1]   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (rechts x-achse)
		$rechts2 = $rechts-30   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (rechts x-achse)
		$links = $streuner[0]   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (links y-achse)
		$links2 = $links+20   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (links y-achse)
		Local $ally[2] = [$links2, $rechts2]
		return $ally
	EndIf
EndFunc
Func search_zone()
	;Funktion zum checken ob man sich in der Strahlenzohne befindet return True|False

EndFunc
#EndRegion ### END search ###

#Region ### START main funcs ###
Func resetmove()
	MouseUp("left")
	Switch $movesec
		Case 1
			movelefttop()
		Case 2
			movetop()
		Case 3
			moverighttop()
		Case 4
			moverightmiddle()
		Case 5
			moverightbottom()

		Case 6
			movebottom()
		Case 7
			moveleftbottom()
		Case 8
			moveleftmiddle()
	EndSwitch
EndFunc
Func _pause()
	Switch $pause
		Case False
			$pause = True
		Case True
			$pause = False
	EndSwitch
EndFunc
Func _exit()
	Exit 0
EndFunc
#EndRegion ### END main funcs ###





Func _main()
	While 1
		if Not $pause Then
			resetmove()
			Do
				$box = search_box();
				$cargo = search_cargo();
				$alien = search_alien();
				$zone = search_zone()
			Until IsArray($box) Or IsArray($cargo) Or IsArray($alien) Or $zone == True
			react_stop()
			Select
				Case IsArray($box)
					react_box()
				Case IsArray($cargo)
					react_cargo()
				Case IsArray($alien)
					react_alien()
				Case $zone == True
					react_zone()
			EndSelect
			react_other_sec()
		EndIf
	WEnd
EndFunc

