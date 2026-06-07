; Git repo and readme.md is at https://github.com/usman-f/better-ctrl-ahk

; Part 1 - Use Caps and Enter as Ctrl

Capslock::Control
Insert::Capslock

; Enter as a dual-role key:
;   tap  -> {Enter}
;   hold -> {Control}  (combine with another key for Ctrl+key)

^enter::^enter
enter::
    SendInput {ctrl down}
    KeyWait, enter
    SendInput {ctrl up}
    if (A_PriorKey = "enter")
        SendInput {enter}
return


; Part 2 - Caret movement & text manipulation

; motion cluster (skipped in Emacs / VS Code)
#If !(WinActive("ahk_exe emacs.exe") || WinActive("ahk_exe Code.exe"))

^i::Send, {Up}
^+i::Send, +{Up}

^k::Send, {Down}
^+k::Send, +{Down}

^l::^Right
^+l::^+Right

^j::^Left
^+j::^+Left

^o::^Del
^u::^Backspace

^,::Send, {Left}
^+,::Send, +{Left}
^.::Send, {Right}
^+.::Send, +{Right}

^':: ; Delete till end of line
    Send, {Shift down} ; Hold Shift
    Send, {End}        ; Move to the end of the line
    Send, {Shift up}   ; Release Shift
    Send, {Delete}     ; Delete the selected text
    Return

#IfWinNotActive

^m::Send, {Backspace} ; can't be defined in Emacs, hence not excluded from Emacs
^/::Send, {Del}

^;::Send, {End}
^h::Send, {Home}

^+*::Send, ^{Home}
^+(::Send, ^{End}