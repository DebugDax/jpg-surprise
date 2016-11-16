#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

If $CmdLine[0] <> 2 Then
	MsgBox(64, "Error", "Drag the two files onto this executable." & @CRLF & "Your JPG image and a zip/rar file.")
	Exit
ElseIf $CmdLine[0] == 2 Then
	If StringInStr($CmdLine[1], ".zip") Or StringInStr($CmdLine[1], ".rar") Then
		$zipFile = $CmdLine[1]
		if stringinstr($CmdLine[2], ".jpg") Then
			$jpg = $CmdLine[2]
		Else
			msgbox(16, "Error", "Second file is not a JPG.")
			Exit
		EndIf
	Elseif stringinstr($CmdLine[1], ".jpg") Then
		$jpg = $CmdLine[1]
		If StringInStr($CmdLine[2], ".zip") Or StringInStr($CmdLine[2], ".rar") Then
			$zipFile = $CmdLine[2]
		Else
			msgbox(16, "Error", "Second file is not a compatible archive file.")
			Exit
		EndIf
	Else
		MsgBox(16, "Error", "Unknown Error" & @CRLF & "Possibly missing or wrong file types?")
		Exit
	EndIf
Else
	MsgBox(16, "Error", "Unknown Error" & @CRLF & "Possibly missing or wrong file types?")
	Exit
EndIf
$jpg_new = StringReplace($jpg, ".jpg", "-new.jpg")
Run('cmd /k copy /b "' & $jpg & '"+"' & $zipFile & '" "' & $jpg_new & '" && exit', "", @SW_HIDE)
