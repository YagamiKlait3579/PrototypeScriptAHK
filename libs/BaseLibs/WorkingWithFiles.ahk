;;;;;;;;;; Search ;;;;;;;;;;
    CheckingFiles(params*) {
        /* 
            CheckingFiles ищет файлы указанные в params по порядку,
            и возвращает переменную в виде FilePath_ИмяФайла в которой находится путь до файла с именем и расширением самого файла.
            Если имя файла указано без расширения то будет найдем первый попавшийся файл.
            Поиск происходит в директории запуска исполняемого файла скрипта и во всех вложенных папках.
            Если файл не найден, переменная FilePath_ИмяФайла не создается.
        */
        global
        local A_Loop, A_key, filePattern, varName
        for A_Loop, A_key in params {
            filePattern := InStr(A_key, ".") ? A_key : A_key "*.*"
            varName := InStr(A_key, ".") ? SubStr(A_key, 1, InStr(A_key, ".") - 1) : A_key
            Loop, Files, % A_ScriptDir "\" filePattern, R 
            {
                if A_LoopFileFullPath { 
                    FilePath_%varName% := A_LoopFileFullPath
                    Break
                }
            }
        }
    }

    ProgramSearch(params*) {
        /* 
            ProgramSearch ищет сдери установленных программ в реестре указанные в params программы по порядку,
            и возвращает путь до исполняемого файла первой найденной программы в списке.
            Если ни одной программы не найдено, функция возвращает 0.
        */
        RegKey := "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"    
        for A_Loop, A_key in params
            Loop, Reg, %RegKey%, k 
            {            
                RegRead, ProgramName , %RegKey%\%A_LoopRegName%, DisplayName
                StringReplace, A_String, ProgramName, %A_key%
                if !ErrorLevel {
                    RegRead, FilePath , %RegKey%\%A_LoopRegName%, DisplayIcon
                    Return FilePath
                }
            }
        Return 0
    }

;;;;;;;;;; Working with ini files ;;;;;;;;;;
    LoadIniSection(FilePath, Sections*) {
        /* 
            LoadIniSection загружает все переменные из секции в INI фале в скрипт.
            Все переменные создаются глобальными, но не супер-глобальным,
            подробнее можете почитать тут https://www.autohotkey.com/docs/v1/Functions.htm#SuperGlobal.

            FilePath = Путь до или файла (включая имя самого файла, расширение .ini можно не указывать)
            
            В качестве первого парамера Sections можно указать "All" 
            для того чтобы загрузить все переменные из всех секций в файле.
        */
        global
        local A_Loop, A_Section, AllVar, AllSections, OutputVar, OutputVar1, OutputVar2
        if !InStr(FilePath, ".ini")
            FilePath .= ".ini"
        if (Sections.1 = "All") {
            IniRead, AllSections, %FilePath%
            Sections := []
            loop, parse, AllSections, `n 
                Sections.Push(A_LoopField)
        }
        for A_Loop, A_Section in Sections {
            IniRead, AllVar, %FilePath%, %A_Section%
            loop, parse, AllVar, `n 
                RegExMatch(A_LoopField, "(.*?)=(.*)", OutputVar), %OutputVar1% := OutputVar2
        }
    }