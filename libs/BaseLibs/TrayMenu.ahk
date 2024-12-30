;;;;;;;;;; Loading ;;;;;;;;;;
    CheckingFiles("Base_ICO", "Settings.ahk", "AdvancedSettings.ahk")
    
;;;;;;;;;; Tray ;;;;;;;;;;
    Menu, Tray, Tip, Game Helper
    Menu, Tray, icon, %FilePath_Base_ICO%,1, 1

    Menu, Tray, NoStandard
    Menu, Tray, Add, Setting, OpenScriptSetting
    Menu, Tray, icon, Setting, %FilePath_Base_ICO%,9
    Menu, Tray, Default, Setting

    Menu, Tray, Add, Advanced settings, OpenAdvancedSettings
    Menu, Tray, icon, Advanced settings, %FilePath_Base_ICO%, 10

    Menu, Tray, Add
    Menu, Tray, Add, Discord, OpenDiscord
    Menu, Tray, icon, Discord, %FilePath_Base_ICO%,16

    Menu, Tray, Add, GitHub, OpenGitHub
    Menu, Tray, icon, GitHub, %FilePath_Base_ICO%,17

    Menu, Tray, Add
    Menu, Tray, Add, Reload, ReloadScript 
    Menu, Tray, icon, Reload, %FilePath_Base_ICO%,5

    Menu, Tray, Add, Suspend, SuspendScript
    Menu, Tray, icon, Suspend, %FilePath_Base_ICO%,7

    Menu, Tray, Add, Stop (exit), StopScript 
    Menu, Tray, icon, Stop (exit), %FilePath_Base_ICO%,3
    ;--------------------------------------------------
    if !FileExist(FilePath_AdvancedSettings) || !EditAdvancedSettings
        Menu, Tray, Disable, Advanced settings

;;;;;;;;;; Links ;;;;;;;;;;
    OpenDiscord() { 
        Run, https://discord.gg/yrRfUMXAnk
    }

    OpenGitHub() {
        Run, https://github.com/YagamiKlait3579
    }

;;;;;;;;;; Open Setting ;;;;;;;;;;
    OpenScriptSetting() {
        global
        local GetProgramPath, A_FilePath := FilePath_Settings ? FilePath_Settings : A_ScriptFullPath
        if GetProgramPath := ProgramSearch("Visual Studio Code", "Notepad++")
            Run, %GetProgramPath% %A_FilePath%
        else
            Run, Notepad.exe %A_FilePath%     
    }

    OpenAdvancedSettings() {
        global
        local GetProgramPath
        if GetProgramPath := ProgramSearch("Visual Studio Code", "Notepad++")
            Run, %GetProgramPath% %FilePath_AdvancedSettings%
        else
            Run, Notepad.exe %FilePath_AdvancedSettings%   
    }