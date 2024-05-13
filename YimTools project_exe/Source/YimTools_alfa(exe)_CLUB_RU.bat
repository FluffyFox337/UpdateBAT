
@ECHO OFF
:: ========================================================================================================================================
:: ===================================== Script's Heading =================================================================================
:: ========================================================================================================================================

   :: ==== File info ====
   :: encoding OEM866 
   :: syntaxis Batch
   :: ===================

:: ----------------------- Other Info Here ------------------------------------------------------------------------------------------------

   :: Set environment variables for source and destination paths
   :: in the code, do not forget the "\" symbol after the %link%
   ::  to set %link% if you need to operate with the root section of the link. 
   ::  Sample: set "link=C\data"   -OutFile '%link%\file.txt'  >> C\data\file.txt
   ::                              -OutFile '%link%file.txt'   >> C\file.txt

   :: C:\Program Files (x86)\Steam\steamapps\common\Soundpad
   
   :: needed fix link to download ultimate menu from original repository (error 404 )
   ::set "UltimateMenu_orig_Url=https://github.com/L7NEG/Ultimate-Menu/raw/main/YimMenu/Ultimate_Menu%20For%20YimMenu%20V2.1%201.68.lua"


:: ------------------- Version SETS -------------------------------------------------------------------------------------------------------

set "YimTools_version=alfa 0.0.0.7"
set "YimMenu_version=b3179-Commits on May 13, 2024"
set "Extras-Addon_version_orig=v1.0.5_b3179"
set "Extras-Addon_version_mod=v1.0.5_b3179"
set "Ultimate_Menu_version=v2.1_b3179-Commits on Apr 22, 2024"

echo = Script Version: %YimTools_version% =
timeout /t 1 /nobreak >nul


:: ========================================================================================================================================
:: ===================================== Script's Settings ================================================================================
:: ========================================================================================================================================

:: ================== Folders SETS ========================================================================================================

set "/scriptFolder=%~dp0"
set "/YimMenu=%APPDATA%\YimMenu"
set "/Scripts=%APPDATA%\YimMenu\scripts"
set "/Downloads=%USERPROFILE%\Downloads"
set "/ReplaceFolder=C:\Program Files (x86)\Steam\steamapps\common\Soundpad"

:: If Downloads folder does not exist default to onedrive desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\OneDrive\Desktop" )
:: If Onedrive destination does not exist, default to normal Desktop
if not exist "%/Downloads%" (
    set "/Downloads=%USERPROFILE%\Desktop" )
	
:: ================== Update YimTools URL_SETS ===========================================================================================
	
set "updateScript_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"

set "updateScript_club_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa_club.exe"


:: ================== Downloads items URL_SETS ===========================================================================================

set "Xenos64_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Xenos64.exe"

set "YimMenu_item_Url=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"
set "YimMenu_item_instructions_txt_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/items/instructions_Xenos.txt"

set "settings_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/settings.json"

set "Extras-Addon_item_mod_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Extras-Addon_Modded.lua"
set "UltimateMenu_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Ultimate_Menu_YimMenu-V2.1-1.68.lua"

:: ------------------ orig URL_SETS ----------------------
                   
set "FateInjector_orig_Url=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "Extras-Addon_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-Data_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-Json_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

set "UltimateMenu_orig_Url=https://goo.su/aUUeUEl"

set "XML_maps_Url=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "animDictsCompact_orig_Url=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"
set "YimActions_orig_Url=https://github.com/xesdoog/YimActions/raw/main/YimActions.lua"
set "YimActions_animdata_orig_Url=https://github.com/xesdoog/YimActions/raw/main/animdata.lua"


:: ////////////////// Names downloaded files NAME_SETS ///////////////////////////////////////////////////////////////////////////////////
set "name_dwn_YimTools=YimTools_alfa_club.exe.new"
set "name_YimTools=YimTools_alfa_club.exe"
set "name_YimTools_Replace_exe=Soundpad.exe"
set "name_YimTools_Replace=Soundpad"
 
set "name_Xenos=Xenos64.exe"
set "name_Xenos-instructions=instructions_Xenos.txt"
set "name_FateInjector=FateInjector.exe"

set "name_YimMenu=YimMenu_3179.dll"
set "name_YimMenu-settings=settings.json"

set "name_Extras-Addon=Extras-Addon.lua"
set "name_Extras-json=json.lua"
set "name_Extras-data=Extras-data.lua"

set "name_UltimateMenu=Ultimate_Menu For YimMenu V2.1 1.68.lua"
set "name_animDictsCompact=animDictsCompact.json"


:russianscript

:: ========================================================================================================================================
:: ======UPDATE========UPDATE=========UPDATE=======UPDATE======= UPDATE =======UPDATE=========UPDATE==========UPDATE=======================
:: ========================================================================================================================================
:: ------------- Skip update (for debug&develop) -----------------------
 goto menu_RU
:: ---------------------------------------------------------------------

cls
echo ��������������������������������������������������������������������ͻ
echo �   �஢�ઠ ������ ����� ���ᨨ %name_YimTools%...             �
echo ��������������������������������������������������������������������͹
timeout /t 1 /nobreak >nul

powershell -command "& { Invoke-WebRequest -Uri '%updateScript_club_Url%' -OutFile '%/scriptFolder%%name_dwn_YimTools%' }"

:: Compare the current script with the updated version
fc "%/scriptFolder%%name_dwn_YimTools%" "%/scriptFolder%%name_YimTools%" >nul
 if errorlevel 1 (
 
    echo � ���������� �������! ����㧪� ����� ���ᨨ %name_YimTools% ...    �
    echo ��������������������������������������������������������������������͹
	
	rename "%/scriptFolder%%name_dwn_YimTools%" %name_YimTools%
	
    echo �            �ணࠬ�� �ᯥ譮 ���������!                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo  ������ �����: %YimTools_version%
	echo [~]  ��१����.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (

    del "%/scriptFolder%%name_dwn_YimTools%" >nul 2>&1s
	
    echo �            � ��� 㦥 ᠬ�� ����� �����                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo  ������ �����: %YimTools_version%
    timeout /t 1 /nobreak >nul
    goto menu_RU
)

:: ========================================================================================================================================
:: ===================================== Script's Body ====================================================================================
:: ========================================================================================================================================


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
@echo.
echo                     ��稭��騩 �������-�⥫� ������� (FluffyFox337)
echo ---------------------------------------------------------------------
echo ========== ��������� �⨬ ��� �� ��ࠥ� � 㤮�����⢨�� ===========
@echo.
echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
echo                     RazorGamerX, FluffyFox337
echo    ------------ � ��㣨� 㢠����� ࠧࠡ��稪�! --------------------

REM echo ========================= CREDITS ===================================
REM echo       Yimura, L7Neg, Loled69, Alestarov, Gir489returns, TheKuter, 
REM echo     USBMenus, Ezeholz, Razethion, Deadlineem, Xesdoog, Silent-Night,
REM echo                     RazorGamerX, FluffyFox337
REM echo    ------------ and more respectfull developers! --------------------



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
echo �        ��⠭����  Extras Addon �� ९������        �
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
  rename "%/Scripts%\%name_Extras-Addon%" "%name_Extras-Addon%.old"
  rename "%/Scripts%\%name_Extras-json%" "%name_Extras-json%.old"
  rename "%/Scripts%\%name_Extras-data%" "%name_Extras-data%.old"
  
  echo � ����� ᮧ���. ��⠭���� Extras-Addon...                �
  echo ��������������������������������������������������������Ĵ
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_Extras-json%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_Extras-data%' }"
  
) else (
	  
    echo � Extras-Addon.lua �� �����㦥�. ����� ��⠭����...     �
    echo ��������������������������������������������������������Ĵ
	  
    del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1
	del "%/Scripts%\%name_Extras-json%" >nul 2>&1
    del "%/Scripts%\%name_Extras-data%" >nul 2>&1
      
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_Extras-json%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_Extras-data%' }"
	  
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
echo  ����� extras-addon : %Extras-Addon_version_orig%
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-Addon%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-json%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto menu_RU

				               

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
echo  ����� extras-addon : %Extras-Addon_version_orig%
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-Addon%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-json%"
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-data%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto menu_RU 
					 

:download_extras_addon_custom_RU
cls
echo ��������������������������������������������������������ͻ
echo �        ��⠭���� ���⮬���� Extras Addon             �
echo ��������������������������������������������������������͹
timeout /t 1 /nobreak >nul
echo � �������� �ਣ����쭮�� Extras Addon...               � �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_Extras-Addon%" >nul 2>&1

echo � ����㧪� ���⮬���� Extras-Addon...                    �
echo ��������������������������������������������������������Ĵ

powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_item_mod_Url%' -OutFile '%/Scripts%\%name_Extras-Addon%' }"

if exist "%/Scripts%\%name_Extras-Addon%" (

echo � ���⮬�� Extras-addon �ᯥ譮 ��⠭�����.            �
echo ��������������������������������������������������������ͼ
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  ����� ���⮬���� extras-addon : %Extras-Addon_version_mod%
echo  ����� �ਣ����� extras-addon : %Extras-Addon_version_orig%
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_Extras-Addon%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto menu_RU
) else (

    echo � ! ERROR: �� 㤠���� ᪠��� 䠩� Extras-addon.lua    ! �
    echo ����������������������������������������������������������
	timeout /t 1 /nobreak >nul
	echo ----------------------------------------------------------
    echo [1]  ��� � ������� ����.
    choice /c 1 /n
    if errorlevel 1 goto menu_RU
			)		 
			
			
:download_ultimate_menu_RU
cls
echo ��������������������������������������������������������ͻ
echo �        ��⠭���� UltimateMenu �� ९������         �
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
  rename "%/Scripts%\%name_UltimateMenu%" "%name_UltimateMenu%.old"

  echo � ����� ᮧ���. ����㧪� UltimateMenu...                 �
  echo ��������������������������������������������������������Ĵ
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "
  
) else (

echo � Extras-Addon.lua �� �����㦥�. ����� ��⠭����...    �
echo ��������������������������������������������������������Ĵ
	  
del "%/Scripts%\%name_UltimateMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UltimateMenu%' } "

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
echo  ����� YimMenu : %Ultimate_Menu_version%
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/Scripts%\%name_UltimateMenu%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto menu_RU

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

  echo � �����㦥� %name_YimMenu%. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YimMenu%" "%name_YimMenu%.old"

  echo � ����� ᮧ���. ����㧪� YimMenu...                      �
  echo ��������������������������������������������������������Ĵ

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YimMenu%' }"
	
) else (

echo � YimMenu.dll �� �����㦥�.      ����� ��⠭����...    �
echo ��������������������������������������������������������Ĵ
	  
del "%/Downloads%\%name_YimMenu%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YimMenu%' }"

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
echo  ����� YimMenu : %YimMenu_version%
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/Downloads%\%name_YimMenu%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto menu_RU

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
   powershell -command "& { Invoke-WebRequest -Uri '%FateInjector_orig_Url%' -OutFile '%/Downloads%\%name_FateInjector%' }"
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
  powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/Downloads%\%name_Xenos%' }"
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
echo � 3  ��⠭����� ���⮬�� Extras-addon                 3 �
echo ��������������������������������������������������������Ĵ
echo � 4  ��ࠢ����� ����ன���� YimMenu (settings.json)    4 �
echo ����������������������������������������������������������
echo [5]  ��� � ������� ����.
echo ----------------------------------------------------------
echo [6] � ������ ����� /YimMenu. ��୥��� ����� ��-����.
@echo.
echo [7] � ������ YimTools � /Steam/%name_YimTools_Replace%.
echo [8] � ������ Xenos64 � /Steam/%name_YimTools_Replace%.

choice /c 12345678 /n
 if errorlevel 8 goto put_Xenos_steam
 if errorlevel 7 goto put_YimTools_steam
 if errorlevel 6 goto open_YimMenu_folder_RU
 if errorlevel 5 goto menu_RU
 if errorlevel 4 goto choice_settings_RU
 if errorlevel 3 goto download_extras_addon_custom_RU
 if errorlevel 2 goto download_animDictsCompact_RU
 if errorlevel 1 goto download_XML_Maps_RU
 

:download_XML_Maps_RU
cls
echo �������������������������������������������������������������������Ŀ
echo � ����⨥ ��뫪� MagicModz89's MEGA � ��㧥�...                  �
echo ���������������������������������������������������������������������
timeout /t 1 /nobreak >nul
start "XML Maps" "%XML_maps_Url%"

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
  rename "%/YimMenu%\%name_animDictsCompact%" "%name_animDictsCompact%.old"

  echo � ����� ᮧ���. ����㧪� animDictsCompact...             �
  echo ��������������������������������������������������������Ĵ
  
powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompact_orig_Url%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

) else (

echo � animDictsCompact �� �����㦥�.   ����� ��⠭����...  �
echo ��������������������������������������������������������Ĵ
	  
del "%/YimMenu%\%name_animDictsCompact%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%animDictsCompact_orig_Url%' -OutFile '%/YimMenu%/%name_animDictsCompact%' }"

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
rename "%/YimMenu%\%name_YimMenu-settings%" "%name_YimMenu-settings%.old"
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "��⠭���� ���⮬���� settings.json �� ���� YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YimMenu-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settings_item_Url%' -OutFile '%/YimMenu%/%name_YimMenu-settings%' }"

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

:put_YimTools_steam
cls
echo �����������������������������������������������������������ͻ
echo � !                     ��������                          ! �
echo �����������������������������������������������������������Ķ
echo � YimTools �㤥� ᪠砭 � ����� �ணࠬ�� %name_YimTools_Replace% (Steam)  �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo �����������������������������������������������������������ͻ
echo � �� 㢥७� �� ��� �������� %name_YimTools_Replace% �ਯ⮬?         �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo "���� �㤥� ���:  %/ReplaceFolder%\%name_YimTools_Replace_exe%"
echo ----------------------------------------------------------------------------

set /p yn=������ Y � ��砥 ������⥫쭮�� �⢥�:
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%updateScript_club_Url%' -OutFile '%/ReplaceFolder%\%name_YimTools_Replace_exe%' }"

) else (

cls
echo �����������������������������ͻ
echo �         ��室...            �
echo �����������������������������ͼ
timeout /t 1 /nobreak >nul
exit
)

:put_Xenos_steam
cls
echo �����������������������������������������������������������ͻ
echo � !                     ��������                          ! �
echo �����������������������������������������������������������Ķ
echo � Xenos �㤥� ᪠砭 � ����� �ணࠬ�� %name_YimTools_Replace% (Steam)     �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo �����������������������������������������������������������ͻ
echo � �� 㢥७� �� ��� �������� %name_YimTools_Replace% �ਯ⮬?         �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo "���� �㤥� ���:  %/ReplaceFolder%\%name_YimTools_Replace_exe%"
echo ----------------------------------------------------------------------------

set /p yn=������ Y � ��砥 ������⥫쭮�� �⢥�:
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/ReplaceFolder%\%name_YimTools_Replace_exe%' }"

) else (

cls
echo �����������������������������ͻ
echo �         ��室...            �
echo �����������������������������ͼ
timeout /t 1 /nobreak >nul
exit
)


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

