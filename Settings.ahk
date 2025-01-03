﻿/* 
Все буквенные клавиши указываются в нижнем регистре (без использования Shift или CapsLock).
Правильное написание клавиш можно посмотреть тут: https://ahk-wiki.ru/keylist

Если вам нужно использовать действие для буквы ё, указывайте её ID (SC0x29), 
так как символы ё и ` различаются и могут не работать в зависимости от раскладки клавиатуры.
Чтобы узнать SC или VK код клавиши, воспользуйтесь программой KeyInfo. 
Её можно найти в трее во вкладке "Other programs".

В некоторых скриптах я заменяю клавишу CapsLock на F13, чтобы её можно было использовать для биндов. 
Если вам нужно сделать то же самое, следуйте инструкциям по ссылке: https://github.com/YagamiKlait3579/Edit-CapsLock-key
*/

;;;;; Basic settings (Базовые настройки) ;;;;;
StartKey          = XButton2  ; Основная кнопка запуска\остановки скриптов
SuspendKey        = Home      ; Отключение клавиш скрипта, кроме клавиш перезагрузки и закрытия скрипта.
ReloadScriptKey   = Insert    ; Перезагрузка скрипта
StopScriptKey     = Delete    ; Закрытие скрипта

;;;;; Interface ;;;;;
; Координаты интерфейса задаются относительно левого верхнего угла экрана.
; Диапазон значений: от 0.0001 до 0.9999
; Пример: 0.1 — левая или верхняя граница, 0.500 — центр, 0.999 — правая или нижняя граница.
GuiPositionX     := 0.2850    ; Положение интерфейса по горизонтали (X-координата)
GuiPositionY     := 0.9800    ; Положение интерфейса по вертикали (Y-координата)
gTransparency    := 100       ; Уровень прозрачности интерфейса (0 — полностью прозрачный, 255 — непрозрачный)
gBlur            := 255       ; Интенсивность размытия фона интерфейса (0 — нет размытия, 255 — максимальное размытие)
gInterfaceScale  := 100       ; Масштаб интерфейса в процентах
HideTheInterface := False     ; Скрывать интерфейс при сворачивании игры (True — скрывать, False — не скрывать)
DebugGui         := True      ; Отображение окна отладки (True — включено, False — выключено)