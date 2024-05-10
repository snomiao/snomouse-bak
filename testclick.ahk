#SingleInstance force ;只允许单个该脚本运行,脚本强制替换
#NoEnv ;不检查空变量是否为环境变量
#HotkeyModifierTimeout 0  ;影响热键修饰符的行为：CTRL、ALT、WIN 和 SHIFT。设为 0 时则总是超时 (修饰键总是不会被推回到按下的状态).
SetWorkingDir, %A_ScriptDir%
Process,priority, , high ;脚本进程优先级为高

~!\::
if (onoff := !onoff)
{
    run,%A_ScriptDir%\SimMouse\SnoMouse.ahk
}
else
{
    scriptname:="SnoMouse.ahk "
    sendcmd("退出",scriptname)
}
    ; MsgBox, 布尔值为%onoff%`n第二次关
Return

sendcmd(cmd,scriptname)
{
	DetectHiddenWindows, on
	SetTitleMatchMode,2
	cmd_no:={重启:65303,编辑:65304,挂起:65305,暂停:65306,退出:65307}
	PostMessage, 0x111,cmd_no[cmd],,,%scriptname%
	return %cmd%
}