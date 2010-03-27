#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=BOT-Version2.9.2.0.exe
#AutoIt3Wrapper_Res_Language=1031
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.4.0
	Author:         myName

	Script Function:
	Template AutoIt script.

#ce ------------------------------ --------------------------------------------

; Script Start - Add your code below here
;#include <Timers.au3>
;AdlibRegister( "_return", 7000 )
;Global $TimerInit = TimerInit()


HotKeySet("!e", "_exit")
HotKeySet("!p", "_pause")
HotKeySet("!h", "_reject")
HotKeySet("!n", "_enemy")
HotKeySet("!s", "_start")
Global $pos1[2] = [829, 644]
Global $pos2[2] = [917, 644]
Global $pos3[2] = [987, 644]
Global $pos6[2] = [829, 740]
Global $pos5[2] = [917, 740]
Global $pos4[2] = [960, 728]
Global $homepos[2] = [809, 640]
Global $clicker1[2] = [512, 337]
Global $clicker2[2] = [512, 506]
Global $risk = False
Global $pause = False
Global $not = False
Global $size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
$ini = IniRead("C:\bot.ini", "Saves", "pos", "1")
Global $pos = $ini
Func search_box()
	$box2 = PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0x7C72D7, 11)
	Return $box2
EndFunc   ;==>search_box
Func search_alien()
	$streuner= PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0xB00000, 5)
	If IsArray($streuner) Then
		$rechts = $streuner[1]   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (rechts x-achse)
		$rechts2 = $rechts-30   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (rechts x-achse)
		$links = $streuner[0]   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (links y-achse)
		$links2 = $links+20   ;da er nach dem roten schriftzug sucht muss hier der mouseclick korriegiert werden (links y-achse)
		Local $ally[2] = [$links2, $rechts2]
		return $ally
	EndIf
EndFunc
Func search_cargo()
	$res = PixelSearch(12 + $size[0], 5 + $size[1], 1020 + $size[0], 717 + $size[1], 0xFCFD55, 15)
	return $res
EndFunc
Func click($koo)
	if IsArray($koo) Then
	MouseClick("left", $koo[0], $koo[1], 1, 1)
	EndIf
EndFunc   ;==>click
Func _return()
	$risk = False
	$var = Hex(PixelGetColor(793, 754), 6)
	If $var == Hex(16772505, 6) Then
		$risk = True
	EndIf
	If $var == Hex(16767296, 6) Then
		$risk = True
	EndIf
	If $var == Hex(16763955, 6) Then
		$risk = True
	EndIf
	If $var == Hex(16751360, 6) Then
		$risk = True
	EndIf
	If $not == True Then
		$risk = True
	EndIf
	If Not $risk == True Then
		If $pause == False Then
			If $pos == 1 Then
				click($pos1)
				$pos = 1
				$var = Hex(PixelGetColor($pos1[0], $pos1[1]), 6)

				If $var == Hex(3394560, 6) Then
					$pos = 2
				EndIf

			EndIf
			If $pos == 2 Then
				click($pos2)
				$pos = 2
				$var = Hex(PixelGetColor($pos2[0], $pos2[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 3

				EndIf

			EndIf
			If $pos == 3 Then
				click($pos3)
				$pos = 3
				$var = Hex(PixelGetColor($pos3[0], $pos3[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 4
				EndIf
			EndIf

			If $pos == 4 Then
				click($pos4)
				$pos = 4
				$var = Hex(PixelGetColor($pos4[0], $pos4[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 5
				EndIf

			EndIf
			If $pos == 5 Then
				click($pos5)
				$pos = 5
				$var = Hex(PixelGetColor($pos5[0], $pos5[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 6
				EndIf

			EndIf
			If $pos == 6 Then
				click($pos6)
				$pos = 6
				$var = Hex(PixelGetColor($pos6[0], $pos6[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 7
				EndIf
			EndIf
			If $pos == 7 Then
				click($pos1)
				$pos = 7
				$var = Hex(PixelGetColor($pos1[0], $pos1[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 8
				EndIf
			EndIf
			If $pos == 8 Then
				click($pos5)
				$pos = 8
				$var = Hex(PixelGetColor($pos5[0], $pos5[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 9
				EndIf
			EndIf
			If $pos == 9 Then
				click($pos2)
				$pos = 9
				$var = Hex(PixelGetColor($pos2[0], $pos2[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 10
				EndIf
			EndIf
			If $pos == 10 Then
				click($pos4)
				$pos = 10
				$var = Hex(PixelGetColor($pos4[0], $pos4[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 11
				EndIf
			EndIf
			If $pos == 11 Then
				click($pos3)
				$pos = 11
				$var = Hex(PixelGetColor($pos3[0], $pos3[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 12
				EndIf
			EndIf
			If $pos == 12 Then
				click($pos5)
				$pos = 12
				$var = Hex(PixelGetColor($pos5[0], $pos5[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 13
				EndIf
			EndIf
			If $pos == 13 Then
				click($pos2)
				$pos = 13
				$var = Hex(PixelGetColor($pos2[0], $pos2[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 14
				EndIf
			EndIf
			If $pos == 14 Then
				click($pos6)
				$pos = 14
				$var = Hex(PixelGetColor($pos6[0], $pos6[1]), 6)
				If $var == Hex(3394560, 6) Then
					$pos = 1
				EndIf
			EndIf
			If $pos >= 15 Then
				$pos = 1
			EndIf
		EndIf
	EndIf
	If $pause == False Then
		If $risk == True Then
			click($homepos)
		EndIf
	EndIf
	IniWrite("C:\bot.ini", "Saves", "pos", $pos)
EndFunc   ;==>_return
Func _exit()
	Exit
EndFunc   ;==>_exit
Func _reject()
	$pos = $pos + 1
EndFunc   ;==>_reject
Func _pause()
	If $pause == False Then
		$pause = True
	Else
		$pause = False
	EndIf

EndFunc   ;==>_pause
Func _enemy()
	If $not == False Then
		$not = True
	Else
		$not = False
	EndIf

EndFunc   ;==>_enemy
Func _start()
	$not = False
EndFunc   ;==>_start



Sleep(5000)
Global $size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
MouseMove($size[0] + 100, $size[1] + 10)
MouseDown("left")
MouseMove(100, 10)
MouseUp("left")
Global $size = WinGetPos("www.DarkOrbit.com - Mozilla Firefox")
While True

	Do
		_return()
		If $pause == False Then
			$box = search_box()
			$alien = search_alien()
			$cargo = search_cargo()
		Else
			$box = False
			$alien = False
			$cargo = False
		EndIf
	Until IsArray($box) = True Or IsArray($alien) = True Or IsArray($cargo)
	Sleep(200)
	;$cur = PixelSearch(803, 638, 1003, 750, 0x33CC00, 10)
	;if Isarray($cur) Then
	;	Dim $koof[2] = [$cur[0], $cur[1]]
	;	click($koof)
	;EndIf
	;Sleep(300)
	;$cur = PixelSearch(803, 638, 1003, 750, 0x33CC00, 10)
	;if Isarray($cur) Then
	;	Dim $koof[2] = [$cur[0], $cur[1]]
	;	click($koof)
	;EndIf
	;Sleep(600)
	; Stehenbleib Code (verbessert)
	click($clicker1)
	Sleep(400)
	click($clicker2)
	Sleep(400)
	if IsArray($box) Then
		While IsArray($box)
			$box = search_box()
			If IsArray($box) Then
				click($box)
			EndIf
			Sleep(2200)
			$box = search_box()
		WEnd
	EndIf
	if IsArray($alien) Then
		while IsArray($alien)
			$alien = search_alien()
			if IsArray($alien) Then
				click($alien)
				Sleep(200)
				Send("{LCTRL}")
				Send("{SPACE}")
				Sleep(5000)
				Send("{LCTRL}")

			EndIf
			$cargo = search_cargo()
			While IsArray($cargo)
				$cargo = search_cargo()
				If IsArray($cargo) Then
					click($cargo)
				EndIf
				Sleep(2200)
				$cargo = search_cargo()
			WEnd
			$alien = search_alien()
		WEnd
	EndIf
	if IsArray($cargo) Then
		$cargo = search_cargo()
		While IsArray($cargo)
			$cargo = search_cargo()
			If IsArray($cargo) Then
				click($cargo)
			EndIf
			Sleep(2200)
			$cargo = search_cargo()
		WEnd
	EndIf

WEnd
