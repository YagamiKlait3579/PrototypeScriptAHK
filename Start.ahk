#include %A_Scriptdir%\libs\BaseLibs\Header.ahk

;;;;;;;;;; Gui ;;;;;;;;;;
    PlaceForTheText := "Ширина самого длинного текста"
    ;--------------------------------------------------
    UpdateDGP({"Transparency" : gTransparency, "Blur" : gBlur, "Scale" : gInterfaceScale})
    GuiInGame("Start", "MainInterface")
        Gui, MainInterface: Add, Text, xm ym +Center vT1, %PlaceForTheText%
        GuiControl, MainInterface: Text, T1, Test GUI in Game
        Gui, MainInterface: Add, Text, xm y+m +Center vT2, %PlaceForTheText%
    GuiInGame("End", "MainInterface", {"ratio" : [GuiPositionX,GuiPositionY]})
    fSuspendGui("On", "MainInterface")
    if DebugGui
        fDebugGui("Create", MainInterface)
    
Return
