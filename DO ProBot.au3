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
$Form1 = GUICreate("DarOrbit ProBot", 388, 263, 1030,0)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Starten = GUICtrlCreateButton("Starten", 32, 216, 332, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "StartenClick")
$Checkbox1 = GUICtrlCreateCheckbox("Bonusboxen Sammeln", 32, 32, 145, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Aliens abschießen", 32, 48, 145, 17)
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
HotKeySet("!e", "_exit")
Global $mousespeed = 2;
Global $pause = False;
Global $lefttop[2] = [263, 243];
Global $leftmiddle[2] = [331, 418];
Global $leftbottom[2] = [293, 612];
Global $top[2] = [519, 247];
Global $bottom[2] = [519, 617];
Global $righttop[2] = [729, 251];
Global $rightmiddle[2] = [723, 424];
Global $rightbottom[2] = [757, 592];
Global $clicker1[2] = [512, 337]
Global $clicker2[2] = [512, 506]
Global $mappos[2] = [0,0];
Global $movesec = 1
Global $loopcount = 0
Global $zonehelp = 0
WinActivate("www.DarkOrbit.com - Mozilla Firefox")
Sleep(1000)
Global $size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
if IsArray($size) Then
	WinSetOnTop("DarOrbit ProBot", "", 1)
	WinSetOnTop("www.DarkOrbit.com - Mozilla Firefox","",1)
	Sleep(1000)
	MouseMove($size[0] + 100, $size[1] + 10)
	MouseDown("left")
	MouseMove(100, 10)
	MouseUp("left")
	WinActivate("DarOrbit ProBot")
Else
	MsgBox(1, "Kein DarkOrbit Fenster geöffnet", "DarkOrbit ProBot hat festgestellt, dass kein DarkOrbit Fenster geöffnet ist")
	_exit()
EndIf
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
	click($clicker1[0],$clicker1[1])
	Sleep(400)
	click($clicker2[0],$clicker2[1])
	Sleep(400)

EndFunc
Func react_box()
	;Funktion zum Reagieren auf eine Box
	$box = search_box()
	While IsArray($box)
		If IsArray($box) Then
			click($box[0],$box[1])
			Sleep(2000)
		EndIf
		$box = search_box()
	WEnd
EndFunc
Func react_cargo()
	;Funktion zum reagieren auf eine Cargobox
	$cargo = search_cargo()
	While IsArray($cargo)
		If IsArray($cargo) Then
			click($cargo[0],$cargo[1])
			Sleep(2000)
		EndIf
		$cargo = search_cargo()
	WEnd
EndFunc
Func react_alien()
	;Funktion zum reagieren auf ein Alien ( Hauptsächlich Streuner )
	;$alien = search_alien()
	$alien = search_alien()
	if IsArray($alien) Then
		click($alien[0],$alien[1])
		Sleep(200)
		Send("{LCTRL}")
		Send("{SPACE}")
		Sleep(5000)
		Send("{LCTRL}")
		$cargo = search_cargo()
		While IsArray($cargo)
		If IsArray($cargo) Then
			click($cargo[0],$cargo[1])
			Sleep(2000)
		EndIf
		$cargo = search_cargo()
	WEnd
	EndIf
EndFunc
Func react_zone()
	;Funktion zum reagieren auf einen Flug in die Strahlenzone
	MouseUp("left")
	Switch $movesec
		Case 1
			$movesec = 5
		Case 2
			$movesec = 6
		Case 3
			$movesec = 7
		Case 4
			$movesec = 8
		Case 5
			$movesec = 1
		Case 6
			$movesec = 2
		Case 7
			$movesec = 3
		Case 8
			$movesec = 4
	EndSwitch
	resetmove()
EndFunc
Func react_other_sec()
	;Funktion zum Schalten in eine Neue Richtung
	$dim = Ceiling(Random(1,8))
	$movesec = $dim
	resetmove()
EndFunc
#EndRegion ### END react ###
#Region ### START search ###
Func search_box()
	;Funktion zum Suchen einer Bonusbox return (x,y)
	$size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
	$boxsearch = PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0x7C72D7, 11)
	Return $boxsearch
EndFunc
Func search_cargo()
	;Funktion zum suchen einer Cagobox return (x,y)
	$size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
	$cargosearch = PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0xFCFD55, 15)
	return $cargosearch
EndFunc
Func search_alien()
	;Funktion zum suchen eines Aliens return (x,y)
	$size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
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
	$zonesearch = PixelSearch(433, 224, 608, 340, 0x5C0000, 10);
	if IsArray($zonesearch) Then
		return True
	Else
		return False
	EndIf
	$zonesearch = False
EndFunc
#EndRegion ### END search ###

#Region ### START main funcs ###
Func click($x,$y)
	MouseClick("left", $x , $y, 1, 0)
EndFunc
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
	MouseUp("left")
	Switch $pause
		Case False
			$pause = True
		Case True
			$pause = False
	EndSwitch
EndFunc
Func _exit()
	WinSetOnTop("www.DarkOrbit.com - Mozilla Firefox","",0)
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
				if $loopcount >= 30 Then
					$loopcount = 0
					react_other_sec()
				Else
					$loopcount = $loopcount + 1
				EndIf
			Until IsArray($box) Or IsArray($cargo) Or IsArray($alien) Or $zone == True

			Select
				Case IsArray($box)
					react_stop()
					Sleep(500)
					react_box()
				Case IsArray($cargo)
					react_stop()
					react_cargo()
				Case IsArray($alien)
					react_stop()
					react_alien()
				Case $zone == True
					react_zone()
					Sleep(4000)
					$zone = False
			EndSelect
			react_other_sec()
			resetmove()

		EndIf
	WEnd
EndFunc



