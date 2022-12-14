#cs-------------------------
Script feito em : 14/12/2022

Feito por : Vinicius C Moreira

Titulo : Player Music

Linguagem : AutoIT
#ce---------------------------
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Sound.au3>

#Region ### START Koda GUI section ### Form=

Global $vol = 50  ;Volume inicia-se em 50
Global $music

$Form1 = GUICreate("Form1", 585, 200, 192, 124)
GUISetBkColor(0x000000)
$Play = GUICtrlCreateButton("Play", 112, 56, 139, 57)
GUICtrlSetFont(-1, 14, 800, 0, "NI7SEG")
$Stop = GUICtrlCreateButton("Stop", 328, 56, 123, 57)
GUICtrlSetFont(-1, 14, 800, 0, "NI7SEG")
$UP = GUICtrlCreateButton("UP", 480, 64, 75, 25)
GUICtrlSetFont(-1, 11, 800, 0, "MV Boli")
$DOWN = GUICtrlCreateButton("DOWN", 480, 96, 75, 25)
GUICtrlSetFont(-1, 11, 800, 0, "MV Boli")
$Arquivo = GUICtrlCreateButton("Arquivo", 24, 136, 75, 25)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

	    Case $Play
		SoundPlay($music, 0) ; recebe a variavel $music para selecionar a musica 

		Case $Stop
		SoundPlay("", 0)
 
		Case $UP          ;Condição se volume"$vol" menor que 100 então ao clicar deve aumentar + 10
		if $vol < 100 Then 
		$vol += 10
		EndIf

		Case $DOWN          ;Condição se volume"$vol"  que 100 então ao clicar deve diminuir - 10
		if $vol > 100 Then 
		$vol += 10
		EndIf

		Case $Arquivo
		$music = FileOpenDialog("MP3 Music", @ScriptDir, "MP3 (*.*)") ;Abre o caminho das pastas que se encontra os arquivos MP3

		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch

	SoundSetWaveVolume($vol)
WEnd