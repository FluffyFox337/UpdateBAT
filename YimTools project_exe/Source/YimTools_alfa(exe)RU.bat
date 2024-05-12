@ECHO OFF

:: ==== File info ====
:: encoding OEM866 
:: syntaxis Batch
:: ===================


:: Set environment variables for source and destination paths
  :: in the code, do not forget the "\" symbol after the %link%
  ::  to set %link% if you need to operate with the root section of the link. 
  ::  Sample: set "link=C\data"   -OutFile '%link%\file.txt'  >> C\data\file.txt
  ::                              -OutFile '%link%file.txt'   >> C\file.txt


:://///////////////////////////////////////////////////////////////
set "YimTools_version=alfa 0.0.0.5"
:://///////////////////////////////////////////////////////////////



echo ///////// Script Version: %YimTools_version%  //////////  
timeout /t 1 /nobreak >nul

:: ////////////////// FOLDERS SETS //////////////////////////////////////////////////////

set "scriptFolder=%~dp0"
set "/YimMenu=%APPDATA%\YimMenu"
set "/Scripts=%APPDATA%\YimMenu\scripts"
set "/Downloads=%USERPROFILE%\Downloads"

:: If Downloads folder does not exist default to onedrive desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\OneDrive\Desktop" )
:: If Onedrive destination does not exist, default to normal Desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\Desktop" )
	
:: Set update script/exe link
:: set "updateScriptUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"
set "updateScriptUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"


:: ////////////////// Download URL SETS //////////////////////////////////////////////////////

set "Xenos64Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Xenos64.exe"
set "FateInjectorUrl=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "YimMenuUrl=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"

set "settingsUrl=https://github.com/FluffyFox337/YimTools/raw/main/items/settings.json"

set "Extras-AddonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-DataUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-JsonUrl=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

:: needed fix link to download ultimate menu from original repository (error 404 )
::set "UltimateMenuUrl2=https://raw.githubusercontent.com/L7NEG/Ultimate-Menu/main/YimMenu/Ultimate_Menu%20For%20YimMenu%20V2.1%201.68.lua"
set "UltimateMenuUrl=https://github.com/FluffyFox337/YimTools/raw/main/items/Ultimate_Menu_YimMenu-V2.1-1.68.lua"

set "XML_mapsUrl=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "animDictsCompactUrl=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"
set "YimMenu_instructionstxtUrl=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/items/instructions_Xenos.txt"

:: ////////////////// NAMES DOWNLOADED FILES SETS //////////////////////////////////////////////////////

set "name_dwn_YimTools=YimTools_alfa.exe.new"
set "name_YimTools=YimTools_alfa.exe"

set "name_Xenos=Xenos64.exe"
set "name_Xenos-instructions=instructions_Xenos.txt"
set "name_FateInjector=FateInjector.exe"

set "name_YimMenu=YimMenu_3179.dll"
set "name_YimMenu-settings=settings.json"

set "name_Extras-Addon=Extras-Addon.lua"
set "name_Extras-json=json.lua"
set "name_Extras-data=Extras-data.lua"

set "name_UltimateMenu=Ultimate_Menu_For_YimMenu_V2.1.1.68.lua"
set "name_animDictsCompact=animDictsCompact.json"


:languageQUEST
cls
echo ��������������������������������������������������������ͻ
echo � ?      Choice language  / �롥�� ��              ? �
echo ��������������������������������������������������������͹
echo � 1  English                                           1 �
echo ��������������������������������������������������������Ĵ
echo � 2  ���᪨�                                           2 �
echo ����������������������������������������������������������
echo [3]  Exit / ��室

choice /c 123 /n
 if errorlevel 3 goto goodbye_RU
 if errorlevel 2 goto russianscript
 if errorlevel 1 goto englishscript
 


:englishscript

:: Skip update (for debug&develop)
:: goto menu_EN


:: Check for updates
echo Checking Repository for updates to YimTools_alfa.exe...
powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%YimTools_alfa.exe.new' }"

:: Compare the current script with the updated version
fc "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
 if errorlevel 1 (
    echo Update found! Updating your YimTools_alfa.exe to the latest version...
    move /y "%scriptFolder%YimTools_alfa.exe.new" "%scriptFolder%YimTools_alfa.exe" >nul
	cls
    echo Exe updated successfully!
    timeout /t 1 /nobreak >nul
    goto restart_EN
 
) else (
    echo No updates found.
    del "%scriptFolder%YimTools_alfa.exe.new" >nul
    echo "Returning to the main menu."
    timeout /t 1 /nobreak >nul
    goto menu_EN
)


	
:: Continue with the main script

:menu_EN

cls
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "
echo "                                                               "
echo "                    YimTools exe edition                       "
echo "                                                               "
echo "                  Script Version: alfa 0.0.0.3                 "
echo "  ______   ______   ______   ______   ______   ______   ______ "
echo " /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/ "


echo ------------------------------------------------------------------
echo   This app is for easily Downloading/Updating YimMenu/Addons
echo 	  and tools you may want/need for YimMenu itself.
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo 			Main Menu
echo ------------------------------------------------------------------
echo Choose an option:
echo 1. Download Injector (To Downloads or Desktop)
echo 2. Download YimMenu (To Downloads or Desktop)
echo 3. Download Addons (To YimMenu\scripts)
echo 4. Delete YimMenu Cache Folder (Quick fix when GTA updates)
echo 5. Optional Downloads
echo 6. Instruction to install/use YimMenu
echo 7. Exit the application

echo ------------------------------------------------------------------
echo If your downloads folder is not in the proper location on your
echo harddrive, the downloads will default to your desktop, instead.

choice /c 1234567 /n
 if errorlevel 7 goto goodbye_EN
 if errorlevel 6 goto instructions_EN
 if errorlevel 5 goto optional_downloads_EN
 if errorlevel 4 goto delete_cache_folder_EN
 if errorlevel 3 goto choice_addons_EN
 if errorlevel 2 goto download_yimmenu_EN
 if errorlevel 1 goto choice_injectors_EN
 


:instructions_EN

cls
echo ------------------------------------------------------------------
echo 		How to Install/Use YimMenu
echo ------------------------------------------------------------------
echo ��������������������������������������������������������ͻ
echo � 1                   Start GTA 5                      1 �
echo ��������������������������������������������������������Ķ
echo �  Wait until it fully loads into story mode or online.  �
echo ��������������������������������������������������������ͼ

timeout /t 3 /nobreak >nul
@echo.
echo ��������������������������������������������������������ͻ
echo � 2           Open your preferred injector             2 �
echo ��������������������������������������������������������Ķ
echo �     and find/select YimMenu.dll file.                  �
echo ��������������������������������������������������������ͼ

timeout /t 3 /nobreak >nul
@echo.
echo ��������������������������������������������������������ͻ
echo � 3           Select the process (gta5.exe)            3 �
echo ��������������������������������������������������������Ķ
echo �     inject the cheat by pressing the INJECT button.    �
echo ��������������������������������������������������������ͼ

timeout /t 3 /nobreak >nul
@echo.
echo ��������������������������������������������������������ͻ
echo � 4        Once YimMenu is injected open GTA.          4 �
echo ��������������������������������������������������������ͼ

timeout /t 2 /nobreak >nul
@echo.
echo    ______                                    ______
echo   /_____/ If everything went well, the game /_____/
echo  /_____/ should display the YimMenu window./_____/

timeout /t 2 /nobreak >nul
@echo.
echo -------------------------------------------------------------------
echo -------------------------------------------------------------------
echo  =  Press the INSERT key to open/close the menu.
echo  =  To update the cache, go to the settings and press UPDATE CACHE.
echo  =  Go to Settings - GUI and uncheck Show Overlay to show/hide Yim.

timeout /t 5 /nobreak >nul
@echo.
@echo.
echo ===================================================================
echo  Press 1 to exit to the main menu ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto menu_EN



:choice_injectors_EN

cls
echo ------------------------------------------------------------------
echo 	Download injectors
echo ------------------------------------------------------------------
echo Choose Injector:
echo 1. Xenos
echo 2. Fate_Injector
echo 3. Back to Main Menu
echo ------------------------------------------------------------------
echo More injectors may be added in the future!

choice /c 1234 /n
 if errorlevel 3 goto menu_EN
 if errorlevel 2 goto download_fate_injector_EN
 if errorlevel 1 goto download_xenos_EN

:check_yimmenu_E_EN

cls
set /p yn=Have you downloaded/used YimMenu before? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_extras_addon_EN
    ) else (
		cls
        echo "Please download and use YimMenu first before installing the Extras Addon."
        echo "After using YimMenu, you can come back and install the Extras Addon."
        echo "to use YimMenu, download an injector like FateInjector, Xenos or ProcessHacker2."
		echo ------------------------------------------------------------------
		echo "When running YimMenu for the first time, click Update Cache and load into story mode or online."
		echo "If you don't know how to use YimMenu, press 6 on the main menu for instructions"
		echo ------------------------------------------------------------------
		echo "Returning to the main menu in 15 seconds."
        timeout /t 15 /nobreak >nul
        cls
        goto menu_EN
	)
	
:check_yimmenu_U_EN

set /p yn=Have you downloaded/used YimMenu before? (Y/N): 
if /i "%yn%"=="Y" (
        goto download_ultimate_menu_EN
    ) else (
		cls
        echo "Please download and use YimMenu first before installing the UltimateMenu."
        echo "After using YimMenu, you can come back and install the UltimateMenu."
        echo "to use YimMenu, download an injector like FateInjector, Xenos or ProcessHacker2."
		echo ------------------------------------------------------------------
		echo "When running YimMenu for the first time, click Update Cache and load into story mode or online."
		echo "If you don't know how to use YimMenu, press 6 on the main menu for instructions"
		echo ------------------------------------------------------------------
		echo "Returning to the main menu in 15 seconds."
		timeout /t 15 /nobreak >nul
		cls
		goto menu_EN
    )

:delete_cache_folder_EN

echo "Deleting YimMenu's cache folder, this is ONLY necessary if you've updated YimMenu.dll and you're still crashing."
echo "If this does not fix the issue, check their github issues page at https://github.com/YimMenu/YimMenu/issues"
rmdir /s /q "%/YimMenu%\cache"
cls
echo "Cache folder deleted successfully."
echo "Returning to main menu in 10 seconds."
timeout /t 10 /nobreak >nul
goto menu_EN

:download_extras_addon_EN

cls
echo ------------------------------------------------------------------
echo 	Downloading Extras Addon from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of Extras Addon"
del "%/Scripts%\Extras-Addon.lua" >nul 2>&1

echo "Downloading new version of Extras-Addon.lua from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\Extras-Addon.lua' }"
	powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\json.lua' }"
	powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\Extras-data.lua' }"

if not exist "%/Scripts%\Extras-Addon.lua" (
		echo "Error: Failed to download Addon. Check the internet connection or the source URL."
	) else if not exist "%/Scripts%\json.lua" (
		echo "Error: Failed to download Json. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Extras Addon downloaded successfully."
		echo "File Location: %/Scripts%\Extras-Addon.lua"
		echo "Json downloaded successfully. (Required json config file) "
		echo "File Location: %/Scripts%\json.lua"
		echo "Extras-data downloaded successfully. (Required, stores objects, vehicles, etc.) "
		echo "File Location: %/Scripts%\json.lua"
		echo "Returning to the main menu in 10 seconds."
	)
timeout /t 10 /nobreak >nul
cls
goto menu_EN
	
:download_ultimate_menu_EN
cls
echo ------------------------------------------------------------------
echo 	Downloading UltimateMenu.lua from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of Extras Addon"
del "%/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua" >nul 2>&1

echo "Downloading new version of Ultimate_Menu.lua from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua' } "

if not exist "%/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua" (
		echo "Error: Failed to download Addon. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Ultimate_Menu downloaded successfully. "
		echo "File Location: %/Scripts%\Ultimate_Menu_For_YimMenu_V2.1.1.68.lua"
	)
timeout /t 10 /nobreak >nul
cls
goto menu_EN
	
:download_yimmenu_EN
cls
echo ------------------------------------------------------------------
echo 	Downloading YimMenu from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of YimMenu"
del "%/Downloads%\YimMenu.dll" >nul 2>&1

echo "Downloading new version of YimMenu.dll from the repository..."

    powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\YimMenu_3179.dll' }"

if not exist "%/Downloads%\YimMenu_3179.dll" (
    echo "Error: Failed to download YimMenu. Check the internet connection or the source URL."
) else (
    cls
    echo "YimMenu downloaded successfully. "
	echo "File Location: %/Downloads%\YimMenu_3179.dll"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu_EN



:download_fate_injector_EN
cls
echo ------------------------------------------------------------------
echo 	Downloading FateInjector from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of FateInjector"
if exist "%/Downloads%\FateInjector.exe" (
    echo "Found FateInjector, You do not need to download this again."
) else (
    echo "No existing application was found."
)

echo "Downloading FateInjector from the repository..."

    powershell -command "& { Invoke-WebRequest -Uri '%FateInjectorUrl%' -OutFile '%/Downloads%\FateInjector.exe' }"

if not exist "%/Downloads%\FateInjector.exe" (
    echo "Error: Failed to download FateInjector. Check the internet connection or the source URL."
) else (
    cls
    echo "FateInjector downloaded successfully. "
	echo "File Location: %/Downloads%\FateInjector.exe"
    echo "Returning to the main menu in 3 seconds."
)
timeout /t 3 /nobreak >nul
cls
goto menu_EN

:download_xenos_EN

cls
echo ------------------------------------------------------------------
echo 	Downloading Xenos64 from the repository 
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of Xenos"

if exist "%/Downloads%\Xenos64.exe" (
cls
echo " Found Xenos64, You do not need to download this again. "
goto quest_start_Xenos_EN
) else (
  echo "Downloading Xenos64 from the repository..."
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\Xenos64.exe' }"
  if not exist "%/Downloads%\Xenos64.exe" (
  echo "Error: Failed to download Xenox64 injector. Check the internet connection or the source URL." 
  ) else (
    cls
    echo "Xenos64 Injector downloaded successfully. "
    @echo.
    echo "File Location: %/Downloads%\Xenos64.exe"
    timeout /t 1 /nobreak >nul
    goto quest_start_Xenos_EN )
)

:quest_start_Xenos_EN
cls
set /p yn=Do you wanna start Xenos64? (Y/N): 
if /i "%yn%"=="y" (
goto start_Xenos_EN
) else (
cls
echo "Exit to the main menu..."
timeout /t 1 /nobreak >nul
cls
goto menu_EN )


:choice_addons_EN
cls
echo ------------------------------------------------------------------
echo 	Download addons (to /scripts)
echo ------------------------------------------------------------------
echo Choose addon:
echo 1. Extras-Addon
echo 2. Ultimate-Menu
echo 3. Back to Main Menu
echo ------------------------------------------------------------------
echo More injectors may be added in the future!

choice /c 1234 /n
 if errorlevel 3 goto menu_EN
 if errorlevel 2 goto check_yimmenu_U_EN
 if errorlevel 1 goto check_yimmenu_E_EN


:optional_downloads_EN
cls
echo ------------------------------------------------------------------
echo 	Optional Downloads
echo ------------------------------------------------------------------
echo Choose an option:
echo 1. Get XML Maps/Vehicles (Opens in Browser)
echo 2. Download Animations Dictionary (To YimMenu Root Folder)
echo 3. Import YimMenu's settings ( my settings, maybe you like that )
echo 4. Back to Main Menu
echo ------------------------------------------------------------------
echo More optional downloads may be added in the future!

choice /c 1234 /n
 if errorlevel 4 goto menu_EN
 if errorlevel 3 goto import_settings_EN
 if errorlevel 2 goto download_animDictsCompact_EN
 if errorlevel 1 goto download_XML_Maps_EN

:download_XML_Maps_EN
echo Opening MagicModz89's MEGA drive in a browser window...
start "XML Maps" "%XML_mapsUrl%"

:: cscript //nologo BringToFront.vbs

echo To use these, download the file as zip and extract the corresponding contents to %/YimMenu%\xml_maps and xml_vehicles
echo Returning to Optional Downloads Menu
timeout /t 5 /nobreak >nul
goto optional_downloads_EN

:download_animDictsCompact_EN
cls
echo ------------------------------------------------------------------
echo 	Downloading Animations Dictionary from the repository
echo ------------------------------------------------------------------
echo "Checking to see if there is an existing version of animDictsCompact.json"
del "%/YimMenu%\animDictsCompact.json" >nul 2>&1

echo "Downloading new version of animDictsCompact.json from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/animDictsCompact.json' }"

if not exist "%/YimMenu%/animDictsCompact.json" (
		echo "Error: Failed to download Animations. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Extras Addon downloaded successfully. "
		echo "File Location: %/YimMenu%/animDictsCompact.json"
		echo "Returning to the main menu in 5 seconds."
	)
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_EN

:import_settings_EN

cls
echo ------------------------------------------------------------------
echo 	Downloading settings.json to the YimMenu repository
echo ------------------------------------------------------------------
echo "Deleting old settings.json"
del "%/YimMenu%\animDictsCompact.json" >nul 2>&1

echo "Downloading new version of custom settings.json from the repository..."
	
	powershell -command "& { Invoke-WebRequest -Uri '%settingsUrl%' -OutFile '%/YimMenu%/settings.json' }"

if not exist "%/YimMenu%/settings.json" (
		echo "Error: Failed to download settings. Check the internet connection or the source URL."
	) else (
	    cls
		echo "Settings downloaded successfully. "
		echo "File Location: %/YimMenu%/settigs.json"
		echo "Returning to the main menu in 5 seconds."
	)
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_EN

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions links EN \\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:start_Xenos_EN

cls
echo Starting injector Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\Xenos64.exe
:: start Xenos64.exe
exit

:restart_EN
echo "restarting new exe file. Exit..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

:goodbye_EN
echo "Thank you for using YimTools!"
echo "Exiting in 3 seconds."
timeout /t 3 /nobreak >nul
exit

:exit_EN
echo Exiting...
exit /b



:russianscript

:: Skip update (for debug&develop)
:: goto menu_RU


:: Check for updates

cls
echo ��������������������������������������������������������������������ͻ
echo �   �஢�ઠ ������ ����� ���ᨨ %name_YimTools%...             �
echo ��������������������������������������������������������������������͹
timeout /t 1 /nobreak >nul

powershell -command "& { Invoke-WebRequest -Uri '%updateScriptUrl%' -OutFile '%scriptFolder%%name_dwn_YimTools%' }"

:: Compare the current script with the updated version
fc "%scriptFolder%%name_dwn_YimTools%" "%scriptFolder%%name_YimTools%" >nul
 if errorlevel 1 (
 
    echo � ���������� �������! ����㧪� ����� ���ᨨ %name_YimTools% ...    �
    echo ��������������������������������������������������������������������͹
	
	rename "%scriptFolder%%name_dwn_YimTools%" %name_YimTools%
    ::move /y "%scriptFolder%%name_YimTools%.new" "%scriptFolder%%name_YimTools%" >nul
	::del "%scriptFolder%%name_YimTools%.new" >nul 2>&1s
	
    echo �            �ணࠬ�� �ᯥ譮 ���������!                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo ������ �����: %YimTools_version%
	echo [~]  ��१����.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (

    del "%scriptFolder%%name_dwn_YimTools%" >nul 2>&1s
	
    echo �            � ��� 㦥 ᠬ�� ����� �����                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo ������ �����: %YimTools_version%
    timeout /t 1 /nobreak >nul
    goto menu_RU
)


	
:: Continue with the main script

:menu_RU

cls
echo �������������������������������������������������������������������Ŀ
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo �                     YimTools exe edition                          �
echo �                                                                   �
echo �                   ����� �ਯ�: %YimTools_version%                    �
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo ���������������������������������������������������������������������

echo ---------------------------------------------------------------------
echo   �� �ணࠬ�� ����� ����� ᪠稢���� ᢥ��� ���ᨩ YimMenu,
echo   �ਯ⮢ � ���� � �������� ��㣨� ������ ���襪. 
echo                   ~ �������� � 㤮�����⢨�� ~
echo ---------------------------------------------------------------------
timeout /t 2 /nobreak >nul
@echo.

echo ---------------------------------------------------------------------
echo 			������� ����
echo ---------------------------------------------------------------------
echo �������������������������������������������������������������������ͻ
echo � ?           �롥� �� ���� ᤥ����                           ? �
echo �������������������������������������������������������������������Ķ
echo � 1 ������ �ணࠬ��-�������                                    1 �
echo �������������������������������������������������������������������Ķ
echo � 2 ������ �� ���� YimMenu                                      2 �
echo �������������������������������������������������������������������Ķ
echo � 3 ��⠭����� ����������-�ਯ�� ��� YimMenu                     3 �
echo �������������������������������������������������������������������Ķ
echo � 4 ������ ����� ��� YimMenu (������ 䨪� ��᫥ ������ GTA V) 4 �
echo �������������������������������������������������������������������Ķ
echo � 5 �������⥫�� ���誨                                         5 �
echo �������������������������������������������������������������������Ķ
echo � 6                                                               6 �
echo �������������������������������������������������������������������Ķ
echo � 7             \\ ��� ����, ᤥ����� �� ᠬ� //                  �
echo �������������������������������������������������������������������ͼ
echo [8] �������� �� ������ ��.
echo [9] ��� �� �ணࠬ��.
echo ---------------------------------------------------------------------
echo ����������������������������������������������������������������Ŀ
echo � �᫨ ����� ����㧮� ��室���� �� � �㦭�� ���� ��� �� ����,   �
echo �  ⮣�� �� 㬮�砭�� ����㧪� ���� �� ࠡ�祬 �⮫�.           �
echo ������������������������������������������������������������������

choice /c 123456789 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 7 goto here_nothing_now
 if errorlevel 6 goto here_nothing_now
 if errorlevel 5 goto optional_downloads_RU
 if errorlevel 4 goto delete_cache_folder_RU
 if errorlevel 3 goto choice_addons_RU
 if errorlevel 2 goto download_yimmenu_RU
 if errorlevel 1 goto choice_injectors_RU
 

:instructions_RU

cls
echo ------------------------------------------------------------------
echo 	  ��� ��⠭�����/�ᯮ�짮���� �� ���� YimMenu
echo ------------------------------------------------------------------
echo ��������������������������������������������������������ͻ
echo � 1                   ������� GTA 5                  1 �
echo ��������������������������������������������������������Ķ
echo � �������� ������ ����㧪� � ��� ०�� ��� ������. �
echo ��������������������������������������������������������ͼ

timeout /t 3 /nobreak >nul
@echo.
echo ��������������������������������������������������������ͻ
echo � 2            ������� �ணࠬ�� �������            2 �
echo ��������������������������������������������������������Ķ
echo �  � �롥�� 䠩� YimMenu.dll ��� ������ � ����        �
echo ��������������������������������������������������������ͼ

timeout /t 2 /nobreak >nul
@echo.
echo ��������������������������������������������������������ͻ
echo � 3     �롥�� 㦥 ����饭�� ����� (gta5.exe)     3 �
echo ��������������������������������������������������������Ķ
echo �  ��᫥ 祣� �믮���� ������ �� ����� ������ INJECT  �
echo ��������������������������������������������������������ͼ

timeout /t 2 /nobreak >nul
@echo.
echo ��������������������������������������������������������ͻ
echo � 4        ��᫥ ������ ������ � GTA V.              4 �
echo ��������������������������������������������������������ͼ

timeout /t 2 /nobreak >nul
@echo.
echo    ______                                    ______
echo   /_____/ �᫨ �� ��諮 �ᯥ譮, � ���   /_____/
echo  /_____/ ������ �⮡ࠧ����� ���� YimMenu. /_____/

timeout /t 2 /nobreak >nul
@echo.
echo -------------------------------------------------------------------
echo -------------------------------------------------------------------
echo  =  ��� ������/������� ��-���� ������ ������� INSERT.
echo  =  �⮡� �������� ��� ������ � ����ன�� ��-���� � ������ ������ �������� ���/Update Cache.
echo  =  ��� ����� ���� �� � ����� ���孥� 㣫� 
echo      �ன��� � ����ன��: Settings - GUI � 㡥�� ������ � �㭪� Show Overlay 
@echo.
@echo.
echo ===================================================================
echo [1] ������ 1 ��� ��室� � ������� ���� ...

timeout /t 1 /nobreak >nul

choice /c 1 /n
 if errorlevel 1 goto menu_RU
 
 

:choice_injectors_RU

cls
echo ��������������������������������������������������������ͻ
echo �         ������ �ணࠬ��-�������                   �
echo ��������������������������������������������������������͹
echo � 1  Xenos                                             1 �
echo ��������������������������������������������������������Ĵ
echo � 2  Fate_Injector                                     2 �
echo ����������������������������������������������������������
echo [3]  ��� � ������� ����.

choice /c 123 /n
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto download_fate_injector_RU
 if errorlevel 1 goto download_xenos_RU

:check_yimmenu_E_RU

cls
echo ��������������������������������������������������������ͻ
echo � ?        �ᯮ�짮����-�� �� YimMenu ࠭��? (Y/N)     ? �
echo ��������������������������������������������������������ͼ

set /p yn= ������ Y � ��砥 ������⥫쭮�� �⢥�: 
if /i "%yn%"=="Y" (
goto download_extras_addon_RU
) else (
    cls
    echo "�������� ᭠砫� ����㧨� � ������� YimMenu ��। ����㧪�� Extras Addon."
    echo "��᫥ ����᪠ YimMenu, �� ����� �������� � ��� �㭪� � ����㧨�� Extras Addon."
    echo "��� ����᪠ YimMenu ��� ����室��� ����㧨�� �ணࠬ��-������� FateInjector, Xenos � ���."
	echo ------------------------------------------------------------------
	echo "��। ����᪮� YimMenu ����㧨��� � ��� ०�� ��� ������."
	echo "�᫨ �� �� �����, ��� �ᯮ�짮���� YimMenu, ������ 6 � ������� ����, �⮡� ������� ������樨."
	echo ------------------------------------------------------------------
	echo "��室 � ������� ���� (15ᥪ)."
    timeout /t 15 /nobreak >nul
    cls
    goto menu_RU
	)
	
:check_yimmenu_U_RU

cls
echo ��������������������������������������������������������ͻ
echo � ?        �ᯮ�짮����-�� �� YimMenu ࠭��? (Y/N)     ? �
echo ��������������������������������������������������������ͼ

set /p yn= ������ Y � ��砥 ������⥫쭮�� �⢥�: 
if /i "%yn%"=="Y" (
 goto download_ultimate_menu_RU
 ) else (
	cls
    echo "�������� ᭠砫� ����㧨� � ������� YimMenu ��। ����㧪�� Extras Addon."
    echo "��᫥ ����᪠ YimMenu, �� ����� �������� � ��� �㭪� � ����㧨�� Extras Addon."
    echo "��� ����᪠ YimMenu ��� ����室��� ����㧨�� �ணࠬ��-������� FateInjector, Xenos � ���."
	echo ------------------------------------------------------------------
	echo "��। ����᪮� YimMenu ����㧨��� � ��� ०�� ��� ������."
	echo "�᫨ �� �� �����, ��� �ᯮ�짮���� YimMenu, ������ 6 � ������� ����, �⮡� ������� ������樨."
	echo ------------------------------------------------------------------
	echo "��室 � ������� ���� (15ᥪ)."
	timeout /t 15 /nobreak >nul
	cls
	goto menu_RU
    )

:delete_cache_folder_RU

cls
echo �������������������������������������������������������������������ͻ
echo � !                         ��������                              ! �
echo �������������������������������������������������������������������Ķ
echo �    �������� ��� YimMenu ����室��� ������ �᫨ �� ��������       �
echo �     YimMenu.dll, �� ᡮ� �� �� �ந�室��.                      �
echo �������������������������������������������������������������������͹
timeout /t 2 /nobreak >nul
echo � �믮������ ����⪠ ���...                                      �
echo �������������������������������������������������������������������Ĵ
timeout /t 2 /nobreak >nul
rmdir /s /q "%/YimMenu%\cache"
echo � ��� �� �ᯥ譮 ��饭.                                           �
echo �������������������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
echo �  ��室 � ������� ���� .                                           �
echo ���������������������������������������������������������������������
echo ---------------------------------------------------------------------
echo �������������������������������������������������������������������Ŀ
echo � �᫨ �� �� ��� �஡����, �஢���� ��࠭��� �஡��� �� GitHub  �
echo �  �� ����� https://github.com/YimMenu/YimMenu/issues .            �
echo ���������������������������������������������������������������������

timeout /t 3 /nobreak >nul
cls

echo �������������������������������������������������������������������ͻ
echo � !                         ��������                              ! �
echo �������������������������������������������������������������������Ķ
echo �    �������� ��� YimMenu ����室��� ������ �᫨ �� ��������       �
echo �     YimMenu.dll, �� ᡮ� �� �� �ந�室��.                      �
echo �������������������������������������������������������������������͹
echo � �믮������ ����⪠ ���...                                      �
echo �������������������������������������������������������������������Ĵ
echo � ��� �� �ᯥ譮 ��饭.                                           �
echo �������������������������������������������������������������������Ĵ
echo �  ��室 � ������� ���� ..                                         �
echo ���������������������������������������������������������������������
echo ---------------------------------------------------------------------
echo �������������������������������������������������������������������Ŀ
echo � �᫨ �� �� ��� �஡����, �஢���� ��࠭��� �஡��� �� GitHub  �
echo �  �� ����� https://github.com/YimMenu/YimMenu/issues .            �
echo ���������������������������������������������������������������������

timeout /t 6 /nobreak >nul
cls

echo �������������������������������������������������������������������ͻ
echo � !                         ��������                              ! �
echo �������������������������������������������������������������������Ķ
echo �    �������� ��� YimMenu ����室��� ������ �᫨ �� ��������       �
echo �     YimMenu.dll, �� ᡮ� �� �� �ந�室��.                      �
echo �������������������������������������������������������������������͹
echo � �믮������ ����⪠ ���...                                      �
echo �������������������������������������������������������������������Ĵ
echo � ��� �� �ᯥ譮 ��饭.                                           �
echo �������������������������������������������������������������������Ĵ
echo �  ��室 � ������� ���� ...                                        �
echo ���������������������������������������������������������������������
echo ---------------------------------------------------------------------
echo �������������������������������������������������������������������Ŀ
echo � �᫨ �� �� ��� �஡����, �஢���� ��࠭��� �஡��� �� GitHub  �
echo �  �� ����� https://github.com/YimMenu/YimMenu/issues .            �
echo ���������������������������������������������������������������������

timeout /t 1 /nobreak >nul
goto menu_RU

:download_extras_addon_RU
cls
echo ��������������������������������������������������������ͻ
echo �        ��⠭����  Extras Addon �� ९������          �
echo ��������������������������������������������������������͹
timeout /t 1 /nobreak >nul
echo � �������� ����� OLD �������...                       � �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1

timeout /t 1 /nobreak >nul


if exist "%/Scripts%\%name_Extras-Addon%" (

  echo � �����㦥� Extras-Addon.lua. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_Extras-Addon%" %name_Extras-Addon%.old
  rename "%/Scripts%\%name_Extras-json%" %name_Extras-json%.old
  rename "%/Scripts%\%name_Extras-data%" %name_Extras-data%.old
  
  echo � ����� ᮧ���. ��⠭���� Extras-Addon...                �
  echo ��������������������������������������������������������Ĵ
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\%name_Extras-json%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\%name_Extras-data%' }"
  
) else (
	  
    echo � Extras-Addon.lua �� �����㦥�. ����� ��⠭����...     �
    echo ��������������������������������������������������������Ĵ
	  
    del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
	del "%/Scripts%\%name_Extras-json%" >nul 2>&1
    del "%/Scripts%\%name_Extras-data%" >nul 2>&1
      
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-AddonUrl%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-JsonUrl%' -OutFile '%/Scripts%\%name_Extras-json%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-DataUrl%' -OutFile '%/Scripts%\%name_Extras-data%' }"
	  
	timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_Extras-Addon%" (

  if exist "%/Scripts%\%name_Extras-json%" (
  goto continue_dwn_extras_addon 
  
  ) else (
	echo � ! ERROR: �� 㤠���� ᪠��� 䠩� json.lua            ! �
    echo ��������������������������������������������������������Ĵ
	timeout /t 2 /nobreak >nul
	              
	echo � ! ����⠭������� ������...                           ! �
    echo ����������������������������������������������������������
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
	del "%/Scripts%\%name_Extras-json%" >nul 2>&1
    del "%/Scripts%\%name_Extras-data%" >nul 2>&1
	
    rename "%/Scripts%\%name_Extras-Addon%.old" %name_Extras-Addon%
    rename "%/Scripts%\%name_Extras-json%.old" %name_Extras-json%
    rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
    timeout /t 1 /nobreak >nul
    @echo.
    echo ��������������������������������������������������������ͻ
    echo � !                     ��������                       ! �
    echo ��������������������������������������������������������Ķ
    echo �  ����� ����⠭�����. ����㧪� ����� 䠩��� �� �������  �
    echo ��������������������������������������������������������ͼ
	@echo.
    echo ----------------------------------------------------------
    echo �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� 
    echo  ��뫪� �� 䠩� � ����.
    echo ----------------------------------------------------------
    echo [1]  ��� � ������� ����.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )
				  
) else (

  echo � ! ERROR: �� 㤠���� ᪠��� 䠩� Extras-Addon.lua    ! �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  
  echo � ! ����⠭������� ������...                           ! �
  echo ����������������������������������������������������������
  timeout /t 1 /nobreak >nul
  del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
  del "%/Scripts%\%name_Extras-json%" >nul 2>&1
  del "%/Scripts%\%name_Extras-data%" >nul 2>&1
  
  rename "%/Scripts%\%name_Extras-Addon%.old" %name_Extras-Addon%
  rename "%/Scripts%\%name_Extras-json%.old" %name_Extras-json%
  rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
  timeout /t 1 /nobreak >nul
  @echo.
  @echo.
  echo ��������������������������������������������������������ͻ
  echo � !                     ��������                       ! �
  echo ��������������������������������������������������������Ķ
  echo �  ����� ����⠭�����. ����㧪� ����� 䠩��� �� �������  �
  echo ��������������������������������������������������������ͼ
  @echo.
  echo ----------------------------------------------------------
  echo �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� 
  echo  ��뫪� �� 䠩� � ����.
  echo ----------------------------------------------------------
  echo [1]  ��� � ������� ����.
  choice /c 1 /n
  if errorlevel 1 goto menu_RU
       )
		
:continue_dwn_extras_addon
					   
if exist "%/Scripts%\%name_Extras-data%" (
  goto download_extras_addon_RU_Success 
  
  ) else (
	echo � ! ERROR: �� 㤠���� ᪠��� 䠩� Extras-data.lua     ! �
    echo ��������������������������������������������������������Ĵ
	timeout /t 1 /nobreak >nul
						
	echo � ! ����⠭������� %name_Extras-data%...               ! �
    echo ����������������������������������������������������������
	@echo.
	rename "%/Scripts%\%name_Extras-data%.old" %name_Extras-data%
    timeout /t 2 /nobreak >nul
	goto download_extras_addon_RU_Success_Data_Notice )
				  	  
:download_extras_addon_RU_Success
	             
echo � Extras-addon.lua �ᯥ譮 ����㦥�.                    �
echo ��������������������������������������������������������Ĵ
				 
timeout /t 1 /nobreak >nul
echo � Json.lua �ᯥ譮 ����㦥�.                            �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul
echo � Extras-data.lua �ᯥ譮 ����㦥�.                     �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul

echo �  �������� ������...                                    �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1
				 
				 
echo � ��ਯ� Extras-addon �ᯥ譮 ��⠭�����.               �
echo ��������������������������������������������������������ͼ
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-Addon%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-json%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo  ��室 � ������� ���� �१ 10 ᥪ...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 
				               

:download_extras_addon_RU_Success_Data_Notice
	             
echo � Extras-addon.lua �ᯥ譮 ����㦥�.                    �
echo ��������������������������������������������������������Ĵ
@echo.
@echo.
				 
timeout /t 1 /nobreak >nul
echo � Json.lua �ᯥ譮 ����㦥�.                            �
echo ��������������������������������������������������������Ĵ
@echo.
@echo.
	             
timeout /t 1 /nobreak >nul
echo � Extras-data.lua ����⠭�����. ����㧪� �� 㤠����   ! �
echo ��������������������������������������������������������Ĵ
@echo.
@echo.
	             
echo ==================================================
timeout /t 1 /nobreak >nul
@echo.
@echo.
echo � �������� ������...                                     �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-json%.old" >nul 2>&1
del "%/Scripts%\%name_Extras-data%.old" >nul 2>&1
				 
				 
echo �! ��ਯ� Extras-addon ������� �ᯥ譮 ��⠭�����.     ! �
echo ��������������������������������������������������������ͼ
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-Addon%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-json%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo  ��室 � ������� ���� �१ 10 ᥪ...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 
					 
					 
:download_ultimate_menu_RU
cls
echo ��������������������������������������������������������ͻ
echo �        ��⠭���� UltimateMenu �� ९������          �
echo ��������������������������������������������������������͹
timeout /t 1 /nobreak >nul
echo � �������� ����� OLD �������...                       � �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UltimateMenu%.old" >nul 2>&1


if exist "%/Scripts%\%name_UltimateMenu%" (

  echo � �����㦥� UltimateMenu.lua. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_UltimateMenu%" %name_UltimateMenu%.old

  echo � ����� ᮧ���. ����㧪� Extras-Addon...                 �
  echo ��������������������������������������������������������Ĵ
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "
  
) else (

echo � Extras-Addon.lua �� �����㦥�. ����� ��⠭����...    �
echo ��������������������������������������������������������Ĵ
	  
del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenuUrl%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "

timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_UltimateMenu%" (

timeout /t 1 /nobreak >nul
echo � UltimateMenu.lua �ᯥ譮 ����㦥�.                    �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul
echo �  �������� ������...                                    �
echo ��������������������������������������������������������Ĵ

timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UltimateMenu%.old" >nul 2>&1
				 
				 
echo � ��ਯ� UltimateMenu �ᯥ譮 ��⠭�����.               �
echo ��������������������������������������������������������ͼ
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/Scripts%\%name_UltimateMenu%"
echo ----------------------------------------------------------
echo  ��室 � ������� ���� �१ 10 ᥪ...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 

	) else (
	
	echo � ! ERROR: �� 㤠���� ᪠��� 䠩� UltimateMenu.lua    ! �
    echo ��������������������������������������������������������Ĵ

    timeout /t 2 /nobreak >nul	
	echo � ! ����⠭������� ������...                           ! �
    echo ����������������������������������������������������������
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1
    rename "%/Scripts%\%name_UltimateMenu%.old" %name_UltimateMenu%

    @echo.
    echo ��������������������������������������������������������ͻ
    echo � !                     ��������                       ! �
    echo ��������������������������������������������������������Ķ
    echo �  ����� ����⠭�����. ����㧪� ����� 䠩��� �� �������  �
    echo ��������������������������������������������������������ͼ
	@echo.
    echo ----------------------------------------------------------
    echo �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� 
    echo  ��뫪� �� 䠩� � ����.
    echo ----------------------------------------------------------
    echo [1]  ��� � ������� ����.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )

	
:download_yimmenu_RU
cls
echo ��������������������������������������������������������ͻ
echo �       ����㧪� ����� ���ᨨ YimMenu �� ९������   �
echo ��������������������������������������������������������͹
timeout /t 1 /nobreak >nul
echo � �������� ����� OLD �������...                       � �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YimMenu%.old" >nul 2>&1

if exist "%/Downloads%\%name_YimMenu%" (

  echo � �����㦥� %name_YimMenu%. �������� ������ ������...    �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YimMenu%" %name_YimMenu%.old

  echo � ����� ᮧ���. ����㧪� YimMenu...                      �
  echo ��������������������������������������������������������Ĵ

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\%name_YimMenu%' }"
	
) else (

echo � YimMenu.dll �� �����㦥�.      ����� ��⠭����...    �
echo ��������������������������������������������������������Ĵ
	  
del "%/Downloads%\%name_YimMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenuUrl%' -OutFile '%/Downloads%\%name_YimMenu%' }"

timeout /t 3 /nobreak >nul )

if exist "%/Downloads%\%name_YimMenu%" (

timeout /t 1 /nobreak >nul
echo � YimMenu.dll �ᯥ譮 ����㦥�.                         �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul
echo �  �������� ������...                                    �
echo ��������������������������������������������������������Ĵ

timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YimMenu%.old" >nul 2>&1
				 
				 
echo � ���-����  YimMenu �ᯥ譮 ��⠭�����.                 �
echo ��������������������������������������������������������ͼ
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/Downloads%\%name_YimMenu%"
echo ----------------------------------------------------------
echo  ��室 � ������� ���� �१ 10 ᥪ...
timeout /t 10 /nobreak >nul
cls
goto menu_RU 

) else (

    echo � ! ERROR: �� 㤠���� ᪠��� 䠩� YimMenu.dll         ! �
    echo ��������������������������������������������������������Ĵ

    timeout /t 2 /nobreak >nul	
	echo � ! ����⠭������� ������...                           ! �
    echo ����������������������������������������������������������
    timeout /t 1 /nobreak >nul
    del "%/Downloads%\%name_YimMenu%" >nul 2>&1
    rename "%/Downloads%\%name_YimMenu%.old" %name_YimMenu%

    @echo.
    echo ��������������������������������������������������������ͻ
    echo � !                     ��������                       ! �
    echo ��������������������������������������������������������Ķ
    echo �  ����� ����⠭�����. ����㧪� ����� 䠩��� �� �������  �
    echo ��������������������������������������������������������ͼ
	@echo.
    echo ----------------------------------------------------------
    echo �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� 
    echo  ��뫪� �� 䠩� � ����.
    echo ----------------------------------------------------------
    echo [1]  ��� � ������� ����.
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	    )


:download_fate_injector_RU
cls
echo ------------------------------------------------------------------
echo 	������ ������� FateInjector �� ९������ 
echo ------------------------------------------------------------------
echo "�஢�ઠ ������ FateInjector.exe � ����� ����㧪� ��� �� ࠡ�祬 �⮫� ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\%name_FateInjector%" (
 echo "������ FateInjector, ��� �� �㦭� ᪠稢��� ��� ᭮��."
 timeout /t 1 /nobreak >nul
 goto quest_start_Fateinjector_RU
 ) else (
   echo "����㧪� FateInjector ..."
   powershell -command "& { Invoke-WebRequest -Uri '%FateInjectorUrl%' -OutFile '%/Downloads%\%name_FateInjector%' }"
   if not exist "%/Downloads%\%name_FateInjector%" (
    echo "Error: �� 㤠���� ᪠��� 䠩� %name_FateInjector%. �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� ��뫪� �� 䠩� ."
    ) else (
      cls
      echo "FateInjector �ᯥ譮 ����㦥�. "
	  echo "��� 䠩�?   ���: %/Downloads%\%name_FateInjector%"
	  timeout /t 3 /nobreak >nul )
	  )
	  
:quest_start_Fateinjector_RU
cls		  
set /p yn=���� �������� �ணࠬ��-������� FateInjector.exe? (Y/N): 
if /i "%yn%"=="y" (
goto start_FateInjector_RU
) else (
cls
echo "��室 � ������� ����..."
timeout /t 1 /nobreak >nul
cls
goto menu_RU 

:download_xenos_RU
cls
echo ------------------------------------------------------------------
echo 	������ ������� Xenos64 �� ९������ 
echo ------------------------------------------------------------------
echo " �஢�ઠ ������ Xenos64.exe � ����� ����㧪� ��� �� ࠡ�祬 �⮫� ..."
timeout /t 1 /nobreak >nul
cls

if exist "%/Downloads%\%name_Xenos%" (
echo " ������ Xenos64, ��� �� �㦭� ᪠稢��� ��� ᭮��."
timeout /t 2 /nobreak >nul
goto quest_start_Xenos_RU
) else (
  echo "����㧪� Xenos64 ..."
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64Url%' -OutFile '%/Downloads%\%name_Xenos%' }"
  if not exist "%/Downloads%\%name_Xenos%" (
  echo "Error: �� 㤠���� ᪠��� 䠩� %name_Xenos%. �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� ��뫪� �� 䠩� � ����."
  ) else (
    cls
    echo "Xenos64 Injector downloaded successfully. "
	@echo.
	echo "File Location: %/Downloads%\%name_Xenos%"
	timeout /t 1 /nobreak >nul )
	goto quest_start_Xenos_RU
	)

:quest_start_Xenos_RU
cls
set /p yn=���� �������� �ணࠬ��-������� %name_Xenos%? (Y/N): 
if /i "%yn%"=="y" (
goto start_Xenos_RU
) else (
cls
echo "��室 � ������� ����..."
timeout /t 1 /nobreak >nul
cls
goto menu_RU )


:choice_addons_RU
cls
echo ��������������������������������������������������������ͻ
echo �  �롥�� �ਯ�-����� ��� ��⠭����. (to /scripts)  �
echo ��������������������������������������������������������͹
echo � [1]  Extras-Addon                                    1 �
echo ��������������������������������������������������������Ĵ
echo � [2]  Ultimate-Menu                                   2 �
echo ����������������������������������������������������������
echo [3]  ��� � ������� ����.
echo ----------------------------------------------------------
echo [4] � ������ ����� /scripts. ��� �ਯ��-����������.

choice /c 1234 /n
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto menu_RU
 if errorlevel 2 goto check_yimmenu_U_RU
 if errorlevel 1 goto check_yimmenu_E_RU


:optional_downloads_RU
cls
echo ��������������������������������������������������������ͻ
echo �         ������� ���誨                             �
echo ��������������������������������������������������������͹
echo � 1  Get XML Maps/Vehicles (Opens in Browser)          1 �
echo ��������������������������������������������������������Ĵ
echo � 2  Download Animations Dictionary (Yim root folder)  2 �
echo ��������������������������������������������������������Ĵ
echo � 3  ��ࠢ����� ����ன���� YimMenu (settings.json)    3 �
echo ����������������������������������������������������������
echo [4]  ��� � ������� ����.
echo ----------------------------------------------------------
echo [5] � ������ ����� /YimMenu. ��୥��� ����� ��-����.

choice /c 12345 /n
 if errorlevel 5 goto open_YimMenu_folder_RU
 if errorlevel 4 goto menu_RU
 if errorlevel 3 goto choice_settings_RU
 if errorlevel 2 goto download_animDictsCompact_RU
 if errorlevel 1 goto download_XML_Maps_RU

:download_XML_Maps_RU
cls
echo �������������������������������������������������������������������Ŀ
echo � ����⨥ ��뫪� MagicModz89's MEGA � ��㧥�...                  �
echo ���������������������������������������������������������������������
timeout /t 1 /nobreak >nul
start "XML Maps" "%XML_mapsUrl%"

:: cscript //nologo BringToFront.vbs
:xml_info
echo �������������������������������������������������������������������Ŀ
echo � �⮡� �ᯮ�짮���� ��, ����㧨� 䠩� � �ଠ� zip               �
echo �  � �������� ᮮ⢥�����饥 ᮤ�ন��� �� ���:                  �
echo �-------------------------------------------------------------------�
echo �  %/YimMenu%\xml_maps and xml_vehicles � 
echo ���������������������������������������������������������������������
echo ---------------------------------------------------------------------
echo [1]  ��� � ���� ��� ���襪.
echo [2] � ������ ����� /xml_maps and xml_vehicles.
choice /c 12 /n
 if errorlevel 2 goto open_xml_folder_RU
 if errorlevel 1 goto optional_downloads_RU
 

:download_animDictsCompact_RU
cls
echo ��������������������������������������������������������ͻ
echo �    ����㧪� ���� ������ �����権 �� ९������      �
echo ��������������������������������������������������������͹
timeout /t 1 /nobreak >nul
echo � �������� ����� OLD �������...                       � �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_animDictsCompact%.old" >nul 2>&1

if exist "%/YimMenu%\%name_animDictsCompact%" (

  echo � �����㦥� animDictsCompact. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/YimMenu%\%name_animDictsCompact%" %name_animDictsCompact%.old

  echo � ����� ᮧ���. ����㧪� animDictsCompact...             �
  echo ��������������������������������������������������������Ĵ
  
powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

) else (

echo � animDictsCompact �� �����㦥�.   ����� ��⠭����...  �
echo ��������������������������������������������������������Ĵ
	  
del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompactUrl%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

timeout /t 3 /nobreak >nul )

if exist "%/YimMenu%\%name_animDictsCompact%" (

timeout /t 1 /nobreak >nul
echo � animDictsCompact �ᯥ譮 ����㦥�.                    �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul
echo �  �������� ������...                                    �
echo ��������������������������������������������������������Ĵ

timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_animDictsCompact%.old" >nul 2>&1
				 
				 
echo � ���� ������ �����権 �ᯥ譮 ��⠭������.             �
echo ��������������������������������������������������������ͼ
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/YimMenu%/%name_animDictsCompact%"
echo ----------------------------------------------------------
echo  ��室 � ���� ��� ���襪 �१ 5 ᥪ...
timeout /t 5 /nobreak >nul
cls
goto optional_downloads_RU

) else (

    echo � ! ERROR: �� 㤠���� ᪠��� animDictsCompact         ! �
    echo ��������������������������������������������������������Ĵ

    timeout /t 2 /nobreak >nul	
	echo � ! ����⠭������� ������...                           ! �
    echo ����������������������������������������������������������
    timeout /t 1 /nobreak >nul
    del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1
    rename "%/YimMenu%\%name_animDictsCompact%.old" %name_animDictsCompact%

    @echo.
    echo ��������������������������������������������������������ͻ
    echo � !                     ��������                       ! �
    echo ��������������������������������������������������������Ķ
    echo �  ����� ����⠭�����. ����㧪� ����� 䠩��� �� �������  �
    echo ��������������������������������������������������������ͼ
	@echo.
    echo ----------------------------------------------------------
    echo �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� 
    echo  ��뫪� �� 䠩� � ����.
    echo ----------------------------------------------------------
    echo [1]  ��� � ���� ��� ���襪
	choice /c 1 /n
    if errorlevel 1 goto menu_RU 
	)


:choice_settings_RU

cls
echo ��������������������������������������������������������ͻ
echo �    ��ࠢ����� ����ன���� YimMenu (Settings.json)    �
echo ��������������������������������������������������������͹
echo � [1] ��⠭����� ���⮬�� ����ன�� �� ���� YimTools  �
echo ��������������������������������������������������������Ĵ
echo � [2] ����⠭����� ᢮� ࠭�� ����⢮���訥 ����ன��   �
echo ����������������������������������������������������������
echo [3]  ��� � ���� ��� ���襪.

choice /c 123 /n
 if errorlevel 3 goto optional_downloads_RU
 if errorlevel 2 goto restore_settings_RU
 if errorlevel 1 goto import_settings_RU


:import_settings_RU
cls
echo ------------------------------------------------------------------
echo 	���⮬�� ����ன�� settings.json ��� �� ���� YimMenu 
echo ------------------------------------------------------------------
echo " �஢�ઠ ������ 㦥 �������饣� 䠩�� ����஥�... "

if exist "%/YimMenu%/%name_YimMenu-settings%" (

echo "����� 㦥 ��������� ����஥� settings.json ..."
timeout /t 2 /nobreak >nul
rename "%/YimMenu%\%name_YimMenu-settings%" %name_YimMenu-settings%.old
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "��⠭���� ���⮬���� settings.json �� ���� YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settingsUrl%' -OutFile '%/YimMenu%/%name_YimMenu-settings%' }"

if not exist "%/YimMenu%/%name_YimMenu-settings%" (
		echo "Error: �� 㤠���� ᪠��� 䠩� %name_YimMenu-settings%. �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� ��뫪� �� 䠩� � ����."
	) else (
	    cls
		echo "���⮬�� ����ன�� �ᯥ譮 ��⠭������. "
		echo "��� 䠩�? ���: %/YimMenu%/%name_YimMenu-settings%"
		echo "Returning to the main menu in 5 seconds." )
timeout /t 5 /nobreak >nul
cls
goto menu_RU )

:restore_settings_RU
cls
echo ------------------------------------------------------------------
echo 	���⠭������� ����஥� settings.json ��� �� ���� YimMenu 
echo ------------------------------------------------------------------
echo " �஢�ઠ ������ ������ 䠩�� settigs.json... "
timeout /t 2 /nobreak >nul
if exist "%/YimMenu%/%name_YimMenu-settings%.old" (
echo " �믮������ ����⠭������� 䠩�� settigs.json... "
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1
rename "%/YimMenu%\%name_YimMenu-settings%.old" %name_YimMenu-settings%
echo " ����⠭������� 䠩�� %name_YimMenu-settings% ��諮 ������� "
timeout /t 2 /nobreak >nul
goto menu_RU
) else (
cls
echo " ��� 䠩�� %name_YimMenu-settings% �� ������ "
timeout /t 3 /nobreak >nul
goto menu_RU )

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions link \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:open_scripts_folder_RU
start %/Scripts%
goto choice_addons_RU

:open_YimMenu_folder_RU
start %/YimMenu%
goto optional_downloads_RU

:open_xml_folder_RU
start %/YimMenu%\xml_maps
start %/YimMenu%\xml_vehicles
cls
goto xml_info

:restart_RU
echo "����� ����� ���ᨨ YimTools ..."
timeout /t 2 /nobreak >nul
start YimTools_alfa.exe
exit

:start_Xenos_RU

cls
echo ����� �ணࠬ��-������� Xenos ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_Xenos%
:: start Xenos64.exe
exit

:start_instructions_Xenos
cls
echo ����� ⥪�⮢�� ������樨 ������ YimMenu
start "" %/Downloads%\%name_Xenos-instructions%
exit

:start_FateInjector_RU

cls
echo ����� �ணࠬ��-������� FateInjector ...
timeout /t 2 /nobreak >nul
start "" %/Downloads%\%name_FateInjector%
:: FateInjector.exe
exit

:here_nothing_now
cls
echo ��� ���� �� ��祣� ����, �������� � ���饬
echo ����� �����-����� ����� �㭪��...
timeout /t 2 /nobreak >nul
goto menu_RU

:goodbye_RU
cls
echo �����������������������������������������������������Ŀ
echo � ~        ���ᨡ� �� �ᯮ�짮����� YimTools,       ~ �
echo � ~                ���⭮� ����!                   ~ �
echo �������������������������������������������������������
timeout /t 2 /nobreak >nul
exit

:exit_RU
echo ��室 ...
exit /b


:auto_mode_RU
cls
goto menu_RU
:: ------------- YimMenu -------------------------------



:: ------------- Xenos64 -------------------------------

