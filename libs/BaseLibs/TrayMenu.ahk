;;;;;;;;;; Loading ;;;;;;;;;;
    CheckingFiles("Base_ICO", "Settings.ahk", "AdvancedSettings.ahk")
    
;;;;;;;;;; Tray ;;;;;;;;;;
    Menu, Tray, Tip, Game Helper
    Menu, Tray, icon, %FilePath_Base_ICO%,1, 1

    Menu, Tray, NoStandard
    Menu, Tray, Add, Settings, OpenScriptSettings
    Menu, Tray, icon, Settings, %FilePath_Base_ICO%,9

    Menu, Tray, Add, Advanced settings, OpenAdvancedSettings
    Menu, Tray, icon, Advanced settings, %FilePath_Base_ICO%, 10

    Menu, Tray, Add, Edit script, EditTheRunningScript
    Menu, Tray, icon, Edit script, %FilePath_Base_ICO%, 14
    
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
    if !FileExist(FilePath_Settings) {
        Menu, Tray, Default, Edit script
        Menu, Tray, Disable, Settings
    } Else
        Menu, Tray, Default, Settings

    if !FileExist(FilePath_AdvancedSettings) || !EditAdvancedSettings
        Menu, Tray, Disable, Advanced settings

;;;;;;;;;; Links ;;;;;;;;;;
    OpenDiscord() { 
        Run, https://discord.gg/yrRfUMXAnk
    }

    OpenGitHub() {
        Run, https://github.com/YagamiKlait3579
    }

;;;;;;;;;; Open Settings ;;;;;;;;;;
    EditTheRunningScript() {
        global
        local GetProgramPath
        if GetProgramPath := ProgramSearch("Visual Studio Code", "Notepad++")
            Run, %GetProgramPath% %A_ScriptFullPath%
        else
            Run, Notepad.exe %A_ScriptFullPath%     
    }

    OpenScriptSettings() {
        global
        local GetProgramPath
        if GetProgramPath := ProgramSearch("Visual Studio Code", "Notepad++")
            Run, %GetProgramPath% %FilePath_Settings%
        else
            Run, Notepad.exe %FilePath_Settings%     
    }

    OpenAdvancedSettings() {
        global
        local GetProgramPath
        if GetProgramPath := ProgramSearch("Visual Studio Code", "Notepad++")
            Run, %GetProgramPath% %FilePath_AdvancedSettings%
        else
            Run, Notepad.exe %FilePath_AdvancedSettings%   
    }