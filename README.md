本仓库收录的原文由原作者 VVXahk 在以下地址作成，作者将 CapsLockX 的鼠标控制部分独立了出来。

- [脱胎于CapslockX的雪星鼠标-键盘模拟鼠标 – AutoAHK]( https://www.autoahk.com/archives/44126 )

原文使用 lanzou 云存储，本仓库收录了完整代码，仅作备份。

原文内容如下

---

# 脱胎于CapslockX的雪星鼠标-键盘模拟鼠标

我经常手痛，但是又离不开电脑，自从接触了ahk脚本以后，仿佛打开了新世界的大门。在不断地折腾快捷键中，我发现已经有大佬做出了键盘执行鼠标事件的应用，有capslock，capslockmagic，capslockx等，这里面我试了以后都不太理想，一个是和脚本冲突，再一个我的经常写代码通过修改注册表已经把capslock移走了，远离了舒适区。由于我太想要键盘控制鼠标功能了，我自己写的控制事件太卡顿了，因此我把雪星大佬（github snolab）开发的capslockx中关于鼠标部分的代码研究了一下，然后做成了热键的形式。通过自己方便的热键来触发鼠标模拟事件，现在鼠标事件只剩下简单的aswdrfqe四个键，而且代码被我删了，可以根据自己操作习惯修改按键位置了。这个鼠标完全来自雪星大佬的工作，因此，这个鼠标的名字叫做雪星鼠标！完整代码放在这里了https://wwm.lanzouy.com/i7rZY0dzz9gj

（这个文章是我在有道云笔记里面写好，分别将标题、正文、代码复制，然后使用影子输入法超级命令和SnoMouse共同完成的，完全用不到鼠标，哈哈！）

```ahk
;键盘模拟鼠标  原开发者叫雪星我们就叫它雪星鼠标吧。
~!u::
if (onoff := !onoff)
{
    run,%A_ScriptDir%\SimMouse\SnoMouse.ahk
    ToolTip, 启动雪星鼠标`nSnoMouse is working!
    Sleep, 1000
    ToolTip
}
else
{
    scriptname:="SnoMouse.ahk "
    sendcmd("退出",scriptname)
    ToolTip, 退出雪星鼠标`nSnoMouse quit!
    Sleep, 1000
    ToolTip
}
Return
sendcmd(cmd,scriptname)
{
    DetectHiddenWindows, on
    SetTitleMatchMode,2
    cmd_no:={重启:65303,编辑:65304,挂起:65305,暂停:65306,退出:65307}
    PostMessage, 0x111,cmd_no[cmd],,,%scriptname%
    return %cmd%
}
```
