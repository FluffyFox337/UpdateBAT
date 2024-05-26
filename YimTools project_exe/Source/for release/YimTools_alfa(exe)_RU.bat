@ECHO OFF

:: ========================================================================================================================================
:: ===================================== Script's Heading =================================================================================
:: ========================================================================================================================================

   :: ===== File info =====
   :: encoding OEM866 
   :: syntaxis Batch CMD BAT
   :: last edit:26.05.24 / 16:37 msk
   :: last compile:13.05.24 / 16:42 msk
   :: =====================

:: ----------------------- Notes Here -----------------------------------------------------------------------------------------------------

   :: Set environment variables for source and destination paths
   ::   in the code, do not forget the "\" symbol after the %link%
   ::   to set %link% if you need to operate with the root section of the link. 
   ::   Sample: set "link=C\data"   -OutFile '%link%\file.txt'  >> C\data\file.txt
   ::                              -OutFile '%link%file.txt'   >> C\file.txt

   :: C:\Program Files (x86)\Steam\steamapps\common\Soundpad
   
   :: need fix link to download ultimate menu from original repository (error 404 ) = FIXED =
   ::   set "UltimateMenu_orig_Url=https://github.com/L7NEG/Ultimate-Menu/raw/main/YimMenu/Ultimate_Menu%20For%20YimMenu%20V2.1%201.68.lua"   
   ::   UPD-used link shortening


:: === 0111 Search Codes. Navigate at this code. 0111 ===
:: 
:: debug plates -------------------- 1001 1002 1003 1004 1005 1006
:: sets names
:: sets default folders
:: sets custom folders
:: net check ----------------------- 20201
:: menu online --------------------- 20202
::
::
::



:: ========================================================================================================================================
:: ===================================== Script's Settings ================================================================================
:: ========================================================================================================================================


:: ------------------ TRIGGERS ------------------------------------

set /a "offline_mode=0"
set /a "st_start=0"
set /a "skip_update_mode=0"
set /a "blocked_mode=0"
set /a "block_test_YT_v=0"

set /a "develop_mode=0"
set /a "default_mode=0"
set /a "custom_folders_mode=0"
set /a "replaced_mode=0"

set /a "cpne=0"
set /a "cdne=0"
set /a "ymne=0"

:: ------------------ PATHS_SETS --------------------------------
set "/cfg=%APPDATA%\txtcfg"
set "/cfga=%APPDATA%\txtcfg\txtcfga"

set "/trigs=%APPDATA%\txtcfg\trigs"
set "/trigsA=%APPDATA%\txtcfg\txtcfga\trigs"
set "/paths=%APPDATA%\txtcfg\paths"
set "/versions=%APPDATA%\txtcfg\versions"

set "/SF=%~dp0"
set "/YimMenu=%APPDATA%\YimMenu"
set "/Scripts=%APPDATA%\YimMenu\scripts"
set "/scripts_cfg=%APPDATA%\YimMenu\scripts_config"
set "/json_vehicles=%APPDATA%\YimMenu\saved_json_vehicles"
:: .....................................
if not exist "%/cfg%" (
   
   MD "%/trigsA%" >nul
   MD "%/trigs%" >nul
   MD "%/paths%" >nul   
   MD "%/versions%" >nul
   
   rmdir /s /q %/YimMenu%
   

   set "st_start=1"
   :: set /a develop_mode=1
   )
 
REM set last_start_date=%date:~-10%
REM @echo started_data:name.txt>%cfg%\%last_start_date%.txt

if "%develop_mode%"=="1" (
cls
echo ����������������������������������������������������������������Ŀ
echo � 1000                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo ------------------------------------------------------------------
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1000

)
:cnt1000 

:: ------------------ NAMES_SETS ----------------------------------
set "name_dwn_YT=YimTools_alfa.exe.new"
set "name_YT=YimTools_alfa.exe"

set "name_YT_Replace_exe=�� �����祭"
set "name_YT_Replace=�� �����祭"
 
set "name_Xenos=Xenos64.exe"
set "name_Xenos-instructions=instructions_Xenos.txt"
set "name_FateInjector=FateInjector.exe"

set "name_YM=YimMenu_3179.dll"
set "name_YM-settings=settings.json"

set "name_E-a=Extras-Addon.lua"
set "name_E-j=json.lua"
set "name_E-d=Extras-data.lua"

set "name_UM=Ultimate_Menu For YimMenu V2.1 1.68.lua"
set "name_aDC=animDictsCompact.json"

  :: set "name_cfg_folder=txtcfg"
set "name_txtcfg_YT_version=YT_version.txt"
set "name_txtcfg_YM_version=YM_version.txt"
set "name_txtcfg_UM_version=UM_version.txt"
set "name_txtcfg_EA_version=EA_version.txt"
set "name_txtcfg_EA_md_version=EA_md_version.txt"
set "name_txtcfg_log=log.txt"


 
:: ++++++++++++++++++ Trig_Actions +++++++++++++++++++++++++++++++

:: ---------- txtVAR -----------------
if exist "%/trigs%\gg.txt" (
   set /a blocked_mode=1
   goto blocked )

if exist "%/trigs%\dv_m.txt" (
   set /a develop_mode=1 )

if exist "%/trigs%\cf_m.txt" (
   set /a custom_folders_mode=1
    )
   
if exist "%/trigs%\su_m.txt" (
   set /a skip_update_mode=1 )

:: ----------  -----------------

if "%develop_mode%"=="1" (
cls
echo ����������������������������������������������������������������Ŀ
echo � 1001                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo                                             ----------------------
echo cdne:=%cdne%=
echo cpne:=%cpne%=
echo ymne:=%ymne%=
echo ------------------------------------------------------------------
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1001

)
:cnt1001 
:: ++++++++++++++++++ Trig_Actions +++++++++++++++++++++++++++++++ 


:: -------------- DEFAULT_PATHS_SETS ------------------------

set "/Downloads=%USERPROFILE%\Downloads"
set "/RF=�� �����祭"
  :: set /RF=< %APPDATA%\txtcfg\versions\YT_version.txt >nul 2>&1


if "%develop_mode%"=="1" (
cls
echo ����������������������������������������������������������������Ŀ
echo � 1002                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo                                             ----------------------
echo cdne:=%cdne%=
echo cpne:=%cpne%=
echo ymne:=%ymne%=
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1002
)

:cnt1002
:: .....................................
if not exist "%/Downloads%" (
   set "/Downloads=%USERPROFILE%\OneDrive\Desktop" )
if not exist "%/Downloads%" (
   set "/Downloads=%USERPROFILE%\Desktop" )

if not exist "%/YimMenu%" set /a ymne=1
		
if "%custom_folders_mode%"=="0" goto skip_cpfs
:: -------------- CUSTOM_PATHS_SETS -------------------------
:cfs
  
if not exist "%/paths%\path_downloads.txt" (
    set /a cdne=1
    )
if not exist "%/paths%\path_replace.txt" (
    set /a cpne=1
    )
if not exist "%/paths%\name_replace.txt" (
    set /a cpne=1
    )



if "%cdne%"=="1" goto skip_cdfs
set /p /Downloads=< %APPDATA%\txtcfg\paths\path_downloads.txt >nul 2>&1
:skip_cdfs
if "%cpne%"=="1" goto skip_cpfs
set /a replaced_mode=1
set /p /RF=< %APPDATA%\txtcfg\paths\path_replace.txt >nul 2>&1
set /p name_YT_Replace_exe=< %APPDATA%\txtcfg\paths\name_replace.txt >nul 2>&1

:skip_cpfs

if "%develop_mode%"=="1" (
@echo.
echo ------------------------------------------------------------------
@echo.

echo ����������������������������������������������������������������Ŀ
echo � 1003                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo cdne:=%cdne%=
echo cpne:=%cpne%=
echo ymne:=%ymne%=
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1003

)
:cnt1003
:: ================== URL_SETS ================== URL_SETS ================== _URL_SETS ==================================================

:: ------------------ txt cfg ----------------------------------------
set "EA_md_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/EA_md_version.txt"
set "EA_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/EA_version.txt"
set "UM_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/UM_version.txt"
set "YM_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/YM_version.txt"
set "YT_version_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/txtcfg/YT_version.txt"

:: +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
powershell -command "& { Invoke-WebRequest -Uri '%YT_version_Url%' -OutFile '%/cfga%\%name_txtcfg_YT_version%' }" >nul
if "%develop_mode%"=="0" goto dwnActVersionsOF

powershell -command "& { Invoke-WebRequest -Uri '%YM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_YM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%UM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_UM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_md_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_md_version%' }" >nul
set /a dwnActVersionsStatus=1
:dwnActVersionsOF
:: +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:: ------------------ Update YimTools --------------------------------
set "updateScript_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa.exe"

set "updateScript_club_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/YimTools_alfa_club.exe"
:: -------------------------------------------------------------------

:: ------------------ items URL_SETS ----------------------

set "Xenos64_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Xenos64.exe"

set "YimMenu_item_Url=https://github.com/FluffyFox337/YimMenu_Actual/raw/master/RELEASE/YimMenu.dll"
set "YimMenu_item_instructions_txt_Url=https://raw.githubusercontent.com/FluffyFox337/YimTools/main/items/instructions_Xenos.txt"

set "settings_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/settings.json"

set "Extras-Addon_item_mod_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Extras-Addon_Modded.lua"
set "UltimateMenu_item_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/Ultimate_Menu_YimMenu-V2.1-1.68.lua"


set "annis_ZR350_anime_drift_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/annis_ZR350_anime_drift.json"
set "karin_sultan_RS_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/karin_sultan_RS_anime.json"
set "futo_GTX_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/futo_GTX_anime.json"
set "ocelot_jugular_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/ocelot_jugular_anime.json"
set "zion_classic_anime_Url=https://github.com/FluffyFox337/YimTools/raw/main/items/saved_json_vehicles/zion_classic_anime.json"



:: ------------------ orig URL_SETS ----------------------
                   
set "FateInjector_orig_Url=https://github.com/fligger/FateInjector/releases/download/1.0/FateInjector.exe"

set "Extras-Addon_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-Addon.lua"
set "Extras-Data_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/Extras-data.lua"
set "Extras-Json_orig_Url=https://raw.githubusercontent.com/Deadlineem/Extras-Addon-for-YimMenu/main/json.lua"

set "UltimateMenu_orig_Url=https://goo.su/aUUeUEl"

set "XML_maps_Url=https://mega.nz/folder/BnM2jQoT#Lb6MG4m24nGv0GkNGsD3sQ"
set "aDC_orig_Url=https://raw.githubusercontent.com/DurtyFree/gta-v-data-dumps/master/animDictsCompact.json"
set "YimActions_orig_Url=https://github.com/xesdoog/YimActions/raw/main/YimActions.lua"
set "YimActions_animdata_orig_Url=https://github.com/xesdoog/YimActions/raw/main/animdata.lua"



:: ------------------- Versions SETS -------------------------------------------------------------------------------------------------------

set /p YT_version=< %APPDATA%\txtcfg\versions\YT_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YT_version.txt" (
  set "YT_version=�� ��⠭�����" )
		  
set /p YM_version=< %APPDATA%\txtcfg\versions\YM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YM_version.txt" (
  set "YM_version=�� ��⠭�����" )

set "EA_version_qst=�� ��⠭�����"		  
  if exist "%APPDATA%\txtcfg\versions\EA_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1 )
  
  if exist "%APPDATA%\txtcfg\versions\EA_md_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1 )
		  
set /p UM_version=< %APPDATA%\txtcfg\versions\UM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\UM_version.txt" (
  set "UM_version=�� ��⠭�����" )

set /p YT_versionA=< %APPDATA%\txtcfg\txtcfga\YT_version.txt >nul 2>&1
set /p YM_versionA=< %APPDATA%\txtcfg\txtcfga\YM_version.txt >nul 2>&1
set /p EA_version_origA=< %APPDATA%\txtcfg\txtcfga\EA_version.txt >nul 2>&1
set /p EA_version_modA=< %APPDATA%\txtcfg\txtcfga\EA_md_version.txt >nul 2>&1
set /p UM_versionA=< %APPDATA%\txtcfg\txtcfga\UM_version.txt >nul 2>&1

:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
cls
echo ����������������������������������������������������������������Ŀ
echo � 1004                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 2 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1004
)

:cnt1004

if "%st_start%"=="1" (

del "%/Scripts%\%name_UM% >nul 2>&1
del "%/Scripts%\%name_E-a% >nul 2>&1
del "%/Scripts%\%name_E-d% >nul 2>&1
del "%/Scripts%\%name_E-j% >nul 2>&1

)

if "%block_test_YT_v%"=="1" (
set "YT_versionA=blocked"
)
:: +++++++++++++++++++++++++++++++++++++++++
if "%YT_versionA%"=="blocked" goto blocked
:: +++++++++++++++++++++++++++++++++++++++++

:: ========================================================================================================================================
:: ===================================== Net_Check ========================================================================================
:: ========================================================================================================================================


:net_check

set /a "connect_error=0"
set /a "offline_mode=0"

:: --------------------------------------
::20201
cls
echo ��������������������������������������������������������������������ͻ
echo �   �஢�ઠ ������ ���୥� ᮥ�������...                        �
echo ��������������������������������������������������������������������͹
timeout /t 1 /nobreak >nul

ping -n 1 google.com >nul
if errorlevel 1 (

echo � Google ...  ! ERROR CONNECTION !                                 ! �
echo ��������������������������������������������������������������������Ĵ
set /a connect_error=2
timeout /t 1 /nobreak >nul

) else (
echo � Google ...  OK                                                   V �
echo ��������������������������������������������������������������������Ĵ

)

ping -n 1 ya.ru >nul
if errorlevel 1 (

echo � Yandex ...  ! ERROR CONNECTION !                                 ! �
echo ��������������������������������������������������������������������Ĵ
set /a connect_error=2
timeout /t 1 /nobreak >nul

) else (
echo � Yandex ...  OK                                                   V �
echo ��������������������������������������������������������������������Ĵ

)

ping -n 1 github.com >nul
if errorlevel 1 (

echo � Github ...  ! ERROR CONNECTION !                                 ! �
echo ��������������������������������������������������������������������Ĵ

set /a connect_error=1
timeout /t 1 /nobreak >nul

) else (
echo � Github ...  OK                                                   V �
echo ��������������������������������������������������������������������Ĵ

)

if "%connect_error%"=="0" goto online
if "%connect_error%"=="1" goto offline
if "%connect_error%"=="2" goto semionline

:offline
set /a offline_mode=1
goto error_net

:semionline
set /a offline_mode=0
goto success_net2

:online
set /a offline_mode=0
goto success_net


:error_net

echo � !  ��������� ����� � github...                                ! �
echo ��������������������������������������������������������������������ͼ

echo ��⮭���� ०�� ��⨢�஢��
echo -----------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 3 /nobreak >nul
cls
echo ����������������������������������������������������������������Ŀ
echo � 1005                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo connect_error:=%connect_error%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
@echo.
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1005
)

:cnt1005
timeout /t 3 /nobreak >nul

goto russianscript


:success_net2
 
echo � ?  ���� �஡�����, �� github ����㯥�                            ? �
echo ��������������������������������������������������������������������ͼ
echo ----------------------------------------------------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 2 /nobreak >nul
cls
echo ����������������������������������������������������������������Ŀ
echo � 1006                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo connect_error:=%connect_error%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
@echo.
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1006
)
:cnt1006
timeout /t 2 /nobreak >nul

goto russianscript


:success_net

echo �   ���୥� ᮥ������� � ���浪�                                   �
echo ��������������������������������������������������������������������ͼ
echo ----------------------------------------------------------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%develop_mode%"=="1" (
timeout /t 2 /nobreak >nul
cls
echo ����������������������������������������������������������������Ŀ
echo � 1007                �⫠��� �ਣ��஢-��६�����               �
echo ������������������������������������������������������������������
timeout /t 1 /nobreak >nul
echo ------------------------------------------------------------------
echo 1st_start:=%st_start%=
echo ------------------------------------------------------------------
echo offline_mode:=%offline_mode%=
echo connect_error:=%connect_error%=
echo blocked_mode:=%blocked_mode%=
echo replaced_mode:=%replaced_mode%=
echo develop_mode:=%develop_mode%=
echo default_mode:=%default_mode%=
echo skip_update_mode:=%skip_update_mode%=
echo ------------------------------------------------------------------
echo custom_folders_mode:=%custom_folders_mode%=
echo custom_folders_notExists:=%ctne%=
echo ------------------------------------------------------------------
@echo.
echo ------------------------------------------------------------------
echo /Downloads:=%/Downloads%=
echo /RF:=%/RF%=
echo name_YT_Replace_exe:=%name_YT_Replace_exe%=
echo ------------------------------------------------------------------
echo ------------------------------------------------------------------
echo = YT_version:=%YT_version%=
echo = YT_versionA:=%YT_versionA%=
@echo.
echo = YM_version:=%YM_version%=
echo = YM_versionA:=%YM_versionA%=
@echo.
echo = UM_version:=%UM_version%=
echo = UM_versionA:=%UM_versionA%=
echo ========================================
echo = EA_version_qst:=%EA_version_qst%=
echo ========================================
echo = EA_version_origA:=%EA_version_origA%=
echo = EA_version_modA:=%EA_version_modA%=
echo ========================================
@echo.
@echo.
echo [1] ������ ��� �த�������...
choice /c 1 /n
 if errorlevel 1 goto cnt1007
)
:cnt1007

timeout /t 1 /nobreak >nul

goto russianscript
 

:russianscript

:: ========================================================================================================================================
:: ======UPDATE========UPDATE=========UPDATE=======UPDATE======= UPDATE =======UPDATE=========UPDATE==========UPDATE=======================
:: ========================================================================================================================================

:: ------------- Skip update (for debug&develop) -----------------------
:: ----------------------------------------------------------------------------------------------------------------------------------------
if "%skip_update_mode%"=="1" goto check_offline_mode

:: ---------------------------------------------------------------------

cls
echo ��������������������������������������������������������������������ͻ
echo �   �஢�ઠ ������ ����� ���ᨨ %name_YT%...             �
echo ��������������������������������������������������������������������͹
timeout /t 1 /nobreak >nul

:: del "%/SF%%name_YT%.old" >nul 2>&1

if "%offline_mode%"=="1" (

echo � !           ���������� ����������. Github ������㯥�.            ! �
echo ��������������������������������������������������������������������ͼ
echo ----------------------------------------------------------------------
echo  ������ �����: %YT_version%
timeout /t 1 /nobreak >nul
goto check_offline_mode
) else (

if "%replaced_mode%"=="1" (

:: Compare the current script with the updated version == REPLACED_MODE ==
fc "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
 if errorlevel 1 (
 
    echo � ���������� �������! ����㧪� ����� ���ᨨ %name_YT% ...      �
    echo ��������������������������������������������������������������������͹
	
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%.new' }"

    
	:: 6060
    move /y "%/RF%%name_YT_Replace_exe%.new" "%/RF%%name_YT_Replace_exe%" >nul

	del "%/versions%\%name_txtcfg_YT_version%" >nul 2>&1
	move /y "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
	
	
    echo �            �ணࠬ�� �ᯥ譮 ���������!                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo  ������ �����: %YT_version%
	echo =====================================
	echo [��������! ����祭 ०�� ����饭��]
	echo =====================================
	echo [~]  ��१����.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
	
    echo �            � ��� 㦥 ᠬ�� ����� �����                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo  ������ �����: %YT_version%
    timeout /t 1 /nobreak >nul
    goto check_offline_mode
)

)

:: Compare the current script with the updated version 
fc "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
 if errorlevel 1 (
 
    echo � ���������� �������! ����㧪� ����� ���ᨨ %name_YT% ...      �
    echo ��������������������������������������������������������������������͹
	
powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/SF%%name_dwn_YT%' }"

    move /y "%/SF%%name_dwn_YT%" "%/SF%%name_YT%" >nul

	del "%/versions%\%name_txtcfg_YT_version%" >nul 2>&1
	move /y "%/cfga%\%name_txtcfg_YT_version%" "%/versions%\%name_txtcfg_YT_version%" >nul
	
	
    echo �            �ணࠬ�� �ᯥ譮 ���������!                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo  ������ �����: %YT_version%
	echo [~]  ��१����.
    timeout /t 1 /nobreak >nul
    goto restart_RU
 
) else (
	
    echo �            � ��� 㦥 ᠬ�� ����� �����                          �
    echo ��������������������������������������������������������������������ͼ
    echo ----------------------------------------------------------------------
    echo  ������ �����: %YT_version%
    timeout /t 1 /nobreak >nul
    goto check_offline_mode
)
)

:: ========================================================================================================================================
:: ===================================== Script's Body ====================================================================================
:: ========================================================================================================================================
:check_offline_mode
if "%offline_mode%"=="1" (
goto menu_offline_RU
) else (
goto menu_online_RU )

:menu_online_RU
cls
echo �������������������������������������������������������������������Ŀ
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo �                     YimTools exe edition                          �
echo �                                                                   �
echo �                   ����� �ਯ�: %YT_version%                         �
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo ���������������������������������������������������������������������
echo  ����� �� ᠩ�: %YT_versionA%

if "%develop_mode%"=="1" (
echo dwnActVersionsStatus:=%dwnActVersionsStatus%= )
echo ---------------------------------------------------------------------
echo   �� �ணࠬ�� ����� ����� ᪠稢���� ᢥ��� ���ᨩ YimMenu,
echo   �ਯ⮢ � ���� � �������� ��㣨� ������ ���襪. 
echo                   ~ �������� � 㤮�����⢨�� ~
@echo.
echo                               �������-�⥫� ������� (FluffyFox337)
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



timeout /t 1 /nobreak >nul
@echo.

if "%dwnActVersionsStatus%"=="0" goto dwnActVersionsInfo
if "%dwnActVersionsStatus%"=="1" goto dwnActVersionsInfo_Done

:dwnActVersionsInfo_Done
::20202
echo ---------------------------------------------------------------------
echo 			������� ����
echo ---------------------------------------------------------------------
if "%replaced_mode%"=="1" (
echo ---------------------------------------------------------------------
echo  ��⨢�஢�� ०�� ����饭�� 
echo ---------------------------------------------------------------------
)
if "%ymne%"=="1" (
echo ---------------------------------------------------------------------
echo  ����� YimMenu �� �����㦥��, ������� �� � ��१������ YimTools.  
@echo.
echo ����������������������������������������������������������������Ŀ
echo �             ����� ��⠭���� ������� ����������!               �
echo ������������������������������������������������������������������
@echo.
start %/YimMenu%
echo ---------------------------------------------------------------------
)

echo �������������������������������������������������������������������ͻ
echo �                         ������� ����                            �
echo �������������������������������������������������������������������Ķ
echo � 1 ������-��⠭����� (��,�������,������)                      1 �
echo �������������������������������������������������������������������Ķ
echo � 2 �������⥫�� ���誨 (�࠭ᯮ��,������ ����஥� � ��...)     2 �
echo �������������������������������������������������������������������Ķ
echo � 3 ����ன��                                                     3 �
echo �������������������������������������������������������������������ͼ
echo [8] �������� �� ������ ��.
echo [9] ��� �� �ணࠬ��.
echo ---------------------------------------------------------------------
echo ����������������������������������������������������������������Ŀ
echo � �᫨ ����� ����㧮� ��室���� �� � �㦭�� ���� ��� �� ����,   �
echo �  ⮣�� �� 㬮�砭�� ����㧪� ���� �� ࠡ�祬 �⮫�.           �
echo ������������������������������������������������������������������

choice /c 12389 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 3 goto menu_settings
 if errorlevel 2 goto optional_downloads_RU
 if errorlevel 1 goto menu_downloads



:menu_offline_RU
cls
echo �������������������������������������������������������������������Ŀ
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo �  //OFFLINE//          YimTools exe edition           //OFFLINE//  �
echo �                                                                   �
echo �                   ����� �ਯ�: %YT_version%                         �
echo �   ______   ______   ______   ______   ______   ______   ______    �
echo �  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/  /_____/    �
echo �                                                                   �
echo ���������������������������������������������������������������������
echo ---------------------------------------------------------------------
echo �������������������������������������������������������������������ͻ
echo � !                          ��������                             ! �
echo �������������������������������������������������������������������Ķ
echo �  ���� ����㯠 � Github. ����祭 ��⮭���� ०��.                 �
echo �������������������������������������������������������������������ͼ

echo ---------------------------------------------------------------------
echo   �� �ணࠬ�� ����� ����� ᪠稢���� ᢥ��� ���ᨩ YimMenu,
echo   �ਯ⮢ � ���� � �������� ��㣨� ������ ���襪. 
echo                   ~ �������� � 㤮�����⢨�� ~
@echo.
echo                               �������-�⥫� ������� (FluffyFox337)
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
echo 			������� ����  (��⮭���� ०��)
echo ---------------------------------------------------------------------
echo �������������������������������������������������������������������ͻ
echo � ?           �롥� �� ���� ᤥ����                           ? �
echo �������������������������������������������������������������������Ķ
echo � 1 ���������                                                     1 �
echo �===================================================================�
echo � ! � ��� ��� ���୥� ᮥ�������, ���⮬� ��� ���� �㭪⮢...    ! �
echo �������������������������������������������������������������������ͼ
echo [8] �������� �� ������ ��.
echo [9] ��� �� �ணࠬ��.
echo ---------------------------------------------------------------------
echo ����������������������������������������������������������������Ŀ
echo � �᫨ ����� ����㧮� ��室���� �� � �㦭�� ���� ��� �� ����,   �
echo �  ⮣�� �� 㬮�砭�� ����㧪� ���� �� ࠡ�祬 �⮫�.           �
echo ������������������������������������������������������������������

choice /c 189 /n
 if errorlevel 9 goto goodbye_RU
 if errorlevel 8 goto instructions_RU
 if errorlevel 1 goto menu_settings


:menu_downloads
cls
echo �������������������������������������������������������������������ͻ
echo � ?           �롥� �� ���� ᤥ����                           ? �
echo �������������������������������������������������������������������͹
echo � 1 ������ �ணࠬ��-�������                                    1 �
echo �������������������������������������������������������������������Ķ
echo � 2 ������ �� ���� YimMenu                                      2 �
echo �������������������������������������������������������������������Ķ
echo � 3 ��⠭����� ����������-�ਯ�� ��� YimMenu                     3 �
echo �������������������������������������������������������������������ͼ
echo [8] �������� �� ������ ��.
echo [9] �������� � ������� ����.
echo ---------------------------------------------------------------------
echo ����������������������������������������������������������������Ŀ
echo � �᫨ ����� ����㧮� ��室���� �� � �㦭�� ���� ��� �� ����,   �
echo �  ⮣�� �� 㬮�砭�� ����㧪� ���� �� ࠡ�祬 �⮫�.           �
echo ������������������������������������������������������������������

choice /c 12389 /n
 if errorlevel 9 goto check_offline_mode
 if errorlevel 8 goto instructions_RU
 if errorlevel 3 goto choice_addons_RU
 if errorlevel 2 goto download_yimmenu_RU
 if errorlevel 1 goto choice_injectors_RU

:menu_settings
cls
echo �������������������������������������������������������������������ͻ
echo � �                          ���������                            � �
echo �������������������������������������������������������������������͹
echo � 1 ������ ����� ��� YimMenu (������ 䨪� ��᫥ ������ GTA V) 1 �
echo �������������������������������������������������������������������Ĵ
echo � 2 ������ ���㠫쭮�� ���ᨩ (�஢��� �� ���५� �� ���)     2 �
echo �������������������������������������������������������������������Ĵ
echo � 3 ������ ����� /YimTools. ����� � ���䨣���ﬨ.              3 �
echo �������������������������������������������������������������������Ĵ
echo � 4 ������ ����� /Scripts. ����� � ��������.                     4 �
echo �������������������������������������������������������������������Ĵ
echo � 5 ������ ����� /xml_vehicles-maps. ����� � XML ���⥭⮬.      5 �
echo �������������������������������������������������������������������Ĵ
echo � 6 ������ ����� /json_vehicles. ����� � JSON �࠭ᯮ�⮬.       6 �
echo �������������������������������������������������������������������Ĵ
echo � 7 � ���� ����஥� � 㤠����� ��� 䠩��� YM � YM.            � 7 �
echo ���������������������������������������������������������������������
echo ---------------------------------------------------------------------
echo [8] �������� �� ������ ��.
echo [9] �������� � ������� ����.
echo ---------------------------------------------------------------------
echo ����������������������������������������������������������������Ŀ
echo � �᫨ ����� ����㧮� ��室���� �� � �㦭�� ���� ��� �� ����,   �
echo �  ⮣�� �� 㬮�砭�� ����㧪� ���� �� ࠡ�祬 �⮫�.           �
echo ������������������������������������������������������������������

choice /c 123456789 /n
 if errorlevel 9 goto check_offline_mode
 if errorlevel 8 goto instructions_RU
 if errorlevel 7 goto reset
 if errorlevel 6 goto open_json_folder_RU
 if errorlevel 5 goto open_xml_folder_RU
 if errorlevel 4 goto open_scripts_folder_RU
 if errorlevel 3 goto open_YT_folder_RU
 if errorlevel 2 goto dwnActVersionsInfo_Table
 if errorlevel 1 goto delete_cache_folder_RU
 
 
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
 if errorlevel 1 goto check_offline_mode
 
 

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
 if errorlevel 3 goto check_offline_mode
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
    goto check_offline_mode
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
	goto check_offline_mode
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
goto check_offline_mode

:download_extras_addon_RU
cls
echo ��������������������������������������������������������ͻ
echo �        ��⠭����  Extras Addon �� ९������        �
echo ��������������������������������������������������������͹
timeout /t 1 /nobreak >nul
echo � �������� ����� OLD �������...                       � �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1

timeout /t 1 /nobreak >nul


if exist "%/Scripts%\%name_E-a%" (

  echo � �����㦥� Extras-Addon.lua. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_E-a%" "%name_E-a%.old"
  rename "%/Scripts%\%name_E-j%" "%name_E-j%.old"
  rename "%/Scripts%\%name_E-d%" "%name_E-d%.old"
  
  echo � ����� ᮧ���. ��⠭���� Extras-Addon...                �
  echo ��������������������������������������������������������Ĵ
  
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_E-a%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_E-j%' }"
  powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_E-d%' }"
  
) else (
	  
    echo � Extras-Addon.lua �� �����㦥�. ����� ��⠭����...     �
    echo ��������������������������������������������������������Ĵ
	  
    del "%/Scripts%\%name_E-a%" >nul 2>&1
	del "%/Scripts%\%name_E-j%" >nul 2>&1
    del "%/Scripts%\%name_E-d%" >nul 2>&1
      
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_orig_Url%' -OutFile '%/Scripts%\%name_E-a%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Json_orig_Url%' -OutFile '%/Scripts%\%name_E-j%' }"
    powershell -command "& { Invoke-WebRequest -Uri '%Extras-Data_orig_Url%' -OutFile '%/Scripts%\%name_E-d%' }"
	  
	timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_E-a%" (

  if exist "%/Scripts%\%name_E-j%" (
  goto continue_dwn_extras_addon 
  
  ) else (
	echo � ! ERROR: �� 㤠���� ᪠��� 䠩� json.lua            ! �
    echo ��������������������������������������������������������Ĵ
	timeout /t 2 /nobreak >nul
	              
	echo � ! ����⠭������� ������...                           ! �
    echo ����������������������������������������������������������
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_E-a%" >nul 2>&1
	del "%/Scripts%\%name_E-j%" >nul 2>&1
    del "%/Scripts%\%name_E-d%" >nul 2>&1
	
    rename "%/Scripts%\%name_E-a%.old" %name_E-a%
    rename "%/Scripts%\%name_E-j%.old" %name_E-j%
    rename "%/Scripts%\%name_E-d%.old" %name_E-d%
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
    if errorlevel 1 goto check_offline_mode 
	    )
				  
) else (

  echo � ! ERROR: �� 㤠���� ᪠��� 䠩� Extras-Addon.lua    ! �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  
  echo � ! ����⠭������� ������...                           ! �
  echo ����������������������������������������������������������
  timeout /t 1 /nobreak >nul
  del "%/Scripts%\%name_E-a%" >nul 2>&1
  del "%/Scripts%\%name_E-j%" >nul 2>&1
  del "%/Scripts%\%name_E-d%" >nul 2>&1
  
  rename "%/Scripts%\%name_E-a%.old" %name_E-a%
  rename "%/Scripts%\%name_E-j%.old" %name_E-j%
  rename "%/Scripts%\%name_E-d%.old" %name_E-d%
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
  if errorlevel 1 goto check_offline_mode
       )
		
:continue_dwn_extras_addon
					   
if exist "%/Scripts%\%name_E-d%" (
  goto download_extras_addon_RU_Success 
  
  ) else (
	echo � ! ERROR: �� 㤠���� ᪠��� 䠩� Extras-data.lua     ! �
    echo ��������������������������������������������������������Ĵ
	timeout /t 1 /nobreak >nul
						
	echo � ! ����⠭������� %name_E-d%...               ! �
    echo ����������������������������������������������������������
	@echo.
	rename "%/Scripts%\%name_E-d%.old" %name_E-d%
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
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1
				 
				 
echo � ��ਯ� Extras-addon �ᯥ譮 ��⠭�����.               �
echo ��������������������������������������������������������ͼ
@echo.
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/versions%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul

set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1

echo ----------------------------------------------------------
echo  ����� extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_E-a%"
echo "��� 䠩�?   ���: %/Scripts%\%name_E-j%"
echo "��� 䠩�?   ���: %/Scripts%\%name_E-d%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

				               

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
del "%/Scripts%\%name_E-a%.old" >nul 2>&1
del "%/Scripts%\%name_E-j%.old" >nul 2>&1
del "%/Scripts%\%name_E-d%.old" >nul 2>&1
				 
				 
echo �! ��ਯ� Extras-addon ������� �ᯥ譮 ��⠭�����.     ! �
echo ��������������������������������������������������������ͼ
@echo.
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_version%" "%/versions%\%name_txtcfg_EA_version%" >nul
timeout /t 1 /nobreak >nul
set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1
echo ----------------------------------------------------------
echo  ����� extras-addon : %Extras-Addon_version_qst%
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_E-a%"
echo "��� 䠩�?   ���: %/Scripts%\%name_E-j%"
echo "��� 䠩�?   ���: %/Scripts%\%name_E-d%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode 
					 

:download_extras_addon_custom_RU
cls
echo ��������������������������������������������������������ͻ
echo �        ��⠭���� ���⮬���� Extras Addon             �
echo ��������������������������������������������������������͹
timeout /t 1 /nobreak >nul
echo � �������� �ਣ����쭮�� Extras Addon...               � �
echo ��������������������������������������������������������Ĵ
timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_E-a%" >nul 2>&1

echo � ����㧪� ���⮬���� Extras-Addon...                    �
echo ��������������������������������������������������������Ĵ

powershell -command "& { Invoke-WebRequest -Uri '%Extras-Addon_item_mod_Url%' -OutFile '%/Scripts%\%name_E-a%' }"

if exist "%/Scripts%\%name_E-a%" (

echo � ���⮬�� Extras-addon �ᯥ譮 ��⠭�����.            �
echo ��������������������������������������������������������ͼ
@echo.

del "%/versions%\%name_txtcfg_EA_version%" >nul 2>&1
del "%/versions%\%name_txtcfg_EA_md_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_EA_md_version%" "%/versions%\%name_txtcfg_EA_md_version%" >nul
set /p Extras-Addon_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1

timeout /t 1 /nobreak >nul

echo ----------------------------------------------------------
echo  ����� ���⮬���� extras-addon : %Extras-Addon_version_qst%
echo  ����� �ਣ����� extras-addon : %Extras-Addon_version_origA%
echo ----------------------------------------------------------
echo "��� 䠩�?   ���: %/Scripts%\%name_E-a%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode
) else (

    echo � ! ERROR: �� 㤠���� ᪠��� 䠩� Extras-addon.lua    ! �
    echo ����������������������������������������������������������
	timeout /t 1 /nobreak >nul
	echo ----------------------------------------------------------
    echo [1]  ��� � ������� ����.
    choice /c 1 /n
    if errorlevel 1 goto check_offline_mode
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
del "%/Scripts%\%name_UM%.old" >nul 2>&1


if exist "%/Scripts%\%name_UM%" (

  echo � �����㦥� UltimateMenu.lua. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/Scripts%\%name_UM%" "%name_UM%.old"

  echo � ����� ᮧ���. ����㧪� UltimateMenu...                 �
  echo ��������������������������������������������������������Ĵ
  
  powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UM%' } "
  
) else (

echo � UltimateMenu.lua �� �����㦥�. ����� ��⠭����...    �
echo ��������������������������������������������������������Ĵ
	  
del "%/Scripts%\%name_UM%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%UltimateMenu_orig_Url%' -OutFile '%/Scripts%\%name_UM%' } "

timeout /t 3 /nobreak >nul )


if exist "%/Scripts%\%name_UM%" (

timeout /t 1 /nobreak >nul
echo � UltimateMenu.lua �ᯥ譮 ����㦥�.                    �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul
echo �  �������� ������...                                    �
echo ��������������������������������������������������������Ĵ

timeout /t 1 /nobreak >nul
del "%/Scripts%\%name_UM%.old" >nul 2>&1
				 
				 
echo � ��ਯ� UltimateMenu �ᯥ譮 ��⠭�����.               �
echo ��������������������������������������������������������ͼ
@echo.
del "%/versions%\%name_txtcfg_UM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_UM_version%" "%/versions%\%name_txtcfg_UM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  ����� YimMenu : %Ultimate_Menu_version%
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/Scripts%\%name_UM%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

	) else (
	
	echo � ! ERROR: �� 㤠���� ᪠��� 䠩� UltimateMenu.lua    ! �
    echo ��������������������������������������������������������Ĵ

    timeout /t 2 /nobreak >nul	
	echo � ! ����⠭������� ������...                           ! �
    echo ����������������������������������������������������������
    timeout /t 1 /nobreak >nul
    del "%/Scripts%\%name_UM%" >nul 2>&1
    rename "%/Scripts%\%name_UM%.old" %name_UM%

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
    if errorlevel 1 goto check_offline_mode 
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
del "%/Downloads%\%name_YM%.old" >nul 2>&1

if exist "%/Downloads%\%name_YM%" (

  echo � �����㦥� %name_YM%. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/Downloads%\%name_YM%" "%name_YM%.old"

  echo � ����� ᮧ���. ����㧪� YimMenu...                      �
  echo ��������������������������������������������������������Ĵ

  powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YM%' }"
	
) else (

echo � YimMenu.dll �� �����㦥�.      ����� ��⠭����...    �
echo ��������������������������������������������������������Ĵ
	  
del "%/Downloads%\%name_YM%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%YimMenu_item_Url%' -OutFile '%/Downloads%\%name_YM%' }"

timeout /t 3 /nobreak >nul )

if exist "%/Downloads%\%name_YM%" (

timeout /t 1 /nobreak >nul
echo � YimMenu.dll �ᯥ譮 ����㦥�.                         �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul
echo �  �������� ������...                                    �
echo ��������������������������������������������������������Ĵ

timeout /t 1 /nobreak >nul
del "%/Downloads%\%name_YM%.old" >nul 2>&1
				 
				 
echo � ���-����  YimMenu �ᯥ譮 ��⠭�����.                 �
echo ��������������������������������������������������������ͼ
@echo.
del "%/versions%\%name_txtcfg_YM_version%" >nul 2>&1
copy /y "%/cfga%\%name_txtcfg_YM_version%" "%/versions%\%name_txtcfg_YM_version%" >nul
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo  ����� YimMenu : %YM_version%
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/Downloads%\%name_YM%"
echo ----------------------------------------------------------
echo [1]  ��� � ������� ����.
choice /c 1 /n
 if errorlevel 1 goto check_offline_mode

) else (

    echo � ! ERROR: �� 㤠���� ᪠��� 䠩� YimMenu.dll         ! �
    echo ��������������������������������������������������������Ĵ

    timeout /t 2 /nobreak >nul	
	echo � ! ����⠭������� ������...                           ! �
    echo ����������������������������������������������������������
    timeout /t 1 /nobreak >nul
    del "%/Downloads%\%name_YM%" >nul 2>&1
    rename "%/Downloads%\%name_YM%.old" %name_YM%

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
    if errorlevel 1 goto check_offline_mode 
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
goto check_offline_mode 

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
goto check_offline_mode )


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
 if errorlevel 3 goto check_offline_mode
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
echo [7] � ������ ����� /YimTools. ����� � ���䨣���ﬨ.
@echo.
echo [8] � ������ YimTools � %RF%/%name_YT_Replace_exe%
echo [9] � ������ Xenos64 � %RF%/%name_YT_Replace_exe%

choice /c 123456789 /n
 if errorlevel 9 goto put_Xenos_R
 if errorlevel 8 goto put_YimTools_R
 if errorlevel 7 goto open_YT_folder_RU
 if errorlevel 6 goto open_YimMenu_folder_RU
 if errorlevel 5 goto check_offline_mode
 if errorlevel 4 goto choice_settings_RU
 if errorlevel 3 goto download_extras_addon_custom_RU
 if errorlevel 2 goto download_animDictsCompact_RU
 if errorlevel 1 goto download_XML_Maps_RU
 
:optional_downloads_RU_ofline
cls
echo �������������������������������������������������������������ͻ
echo �         ������� ���誨 (Offline)                        �
echo �������������������������������������������������������������͹
echo � 1 � ������ ����� /YimTools. ����� � ���䨣���ﬨ.      � �
echo �������������������������������������������������������������Ĵ
echo � 2 � ������ ����� /YimMenu. ��୥��� ����� ��-����.      � �
echo �������������������������������������������������������������Ĵ
echo � 3 � ������ ����� /Scripts. ����� � ��������.             � �
echo �������������������������������������������������������������Ĵ
echo � 4 � ������ ����� /xml_vehicles. ����� � XML �࠭ᯮ�⮬. � �
echo ���������������������������������������������������������������
echo [5]  ��� � ������� ����.
echo ----------------------------------------------------------

choice /c 1235 /n
 if errorlevel 5 goto check_offline_mode
 if errorlevel 4 goto open_xml_folder_RU
 if errorlevel 3 goto open_scripts_folder_RU
 if errorlevel 2 goto open_YimMenu_folder_RU
 if errorlevel 1 goto open_YT_folder_RU


:dwnActVersionsInfo_Table
cls

:: ------------------- Versions SETS -------------------------------------------------------------------------------------------------------

set /p YT_version=< %APPDATA%\txtcfg\versions\YT_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YT_version.txt" (
  set "YT_version=�� ��⠭�����" )
		  
set /p YM_version=< %APPDATA%\txtcfg\versions\YM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\YM_version.txt" (
  set "YM_version=�� ��⠭�����" )
		  
set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\EA_version.txt" (
  set /p EA_version_qst=< %APPDATA%\txtcfg\versions\EA_md_version.txt >nul 2>&1 )
		   
  if not exist "%APPDATA%\txtcfg\versions\EA_md_version.txt" (
  set "EA_version_qst=�� ��⠭�����" )
		  
set /p UM_version=< %APPDATA%\txtcfg\versions\UM_version.txt >nul 2>&1
  if not exist "%APPDATA%\txtcfg\versions\UM_version.txt" (
  set "UM_version=�� ��⠭�����" )

set /p YT_versionA=< %APPDATA%\txtcfg\txtcfga\YT_version.txt >nul 2>&1
set /p YM_versionA=< %APPDATA%\txtcfg\txtcfga\YM_version.txt >nul 2>&1
set /p EA_version_origA=< %APPDATA%\txtcfg\txtcfga\EA_version.txt >nul 2>&1
set /p EA_version_modA=< %APPDATA%\txtcfg\txtcfga\EA_md_version.txt >nul 2>&1
set /p UM_versionA=< %APPDATA%\txtcfg\txtcfga\UM_version.txt >nul 2>&1

:: ----------------------------------------------------------------------------------------------------------------------------------------
	
cls
echo =====================================================================
echo ----           ����騥 ��⠭������� ���ᨨ                      ----
echo ----           � ���㠫�� ���ᨨ �� ᠩ�:                     ----
echo ---------------------------------------------------------------------
timeout /t 1 /nobreak >nul
@echo.
@echo.
echo =====================================================================
echo  ��⠭�������� ����� YimTools : %YT_version%
echo ---------------------------------------------------------------------
echo  ���㠫쭠� ����� YimTools : %YT_versionA%
echo =====================================================================
@echo.
echo =====================================================================
echo  ��⠭�������� ����� YimMenu : %YM_version%
echo ---------------------------------------------------------------------
echo  ���㠫쭠� ����� YimMenu : %YM_versionA%
echo =====================================================================
@echo.
echo =====================================================================
echo  ��⠭�������� ����� Extras-Addon : %EA_version_qst%
echo ---------------------------------------------------------------------
echo  ���㠫쭠� ����� Extras-Addon : %EA_version_origA%
echo =====================================================================
@echo.
echo =====================================================================
@echo.
echo =====================================================================
echo  ��⠭�������� ����� UltimateMenu : %UM_version%
echo ---------------------------------------------------------------------
echo  ���㠫쭠� ����� UltimateMenu : %UM_versionA%
echo =====================================================================

echo [1]  ��� � ������� ����.

choice /c 1 /n
 if errorlevel 1 goto check_offline_mode




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
del "%/YimMenu%\%name_aDC%.old" >nul 2>&1

if exist "%/YimMenu%\%name_aDC%" (

  echo � �����㦥� animDictsCompact. �������� ������ ������...  �
  echo ��������������������������������������������������������Ĵ
  timeout /t 2 /nobreak >nul
  rename "%/YimMenu%\%name_aDC%" "%name_aDC%.old"

  echo � ����� ᮧ���. ����㧪� animDictsCompact...             �
  echo ��������������������������������������������������������Ĵ
  
powershell -command "& { Invoke-WebRequest -Uri '%aDC_orig_Url%' -OutFile '%/YimMenu%/%name_aDC%' }"

) else (

echo � animDictsCompact �� �����㦥�.   ����� ��⠭����...  �
echo ��������������������������������������������������������Ĵ
	  
del "%/YimMenu%\%name_aDC%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%aDC_orig_Url%' -OutFile '%/YimMenu%/%name_aDC%' }"

timeout /t 3 /nobreak >nul )

if exist "%/YimMenu%\%name_aDC%" (

timeout /t 1 /nobreak >nul
echo � animDictsCompact �ᯥ譮 ����㦥�.                    �
echo ��������������������������������������������������������Ĵ
	             
timeout /t 1 /nobreak >nul
echo �  �������� ������...                                    �
echo ��������������������������������������������������������Ĵ

timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_aDC%.old" >nul 2>&1
				 
				 
echo � ���� ������ �����権 �ᯥ譮 ��⠭������.             �
echo ��������������������������������������������������������ͼ
@echo.
timeout /t 1 /nobreak >nul
echo ----------------------------------------------------------
echo "��� 䠩�?  ���: %/YimMenu%/%name_aDC%"
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
    del "%/YimMenu%\%name_aDC%" >nul 2>&1
    rename "%/YimMenu%\%name_aDC%.old" %name_aDC%

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
    if errorlevel 1 goto check_offline_mode 
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

if exist "%/YimMenu%/%name_YM-settings%" (

echo "����� 㦥 ��������� ����஥� settings.json ..."
timeout /t 2 /nobreak >nul
rename "%/YimMenu%\%name_YM-settings%" "%name_YM-settings%.old"
timeout /t 1 /nobreak >nul
goto dwn_settings_noexist
) else (
:dwn_settings_noexist
echo "��⠭���� ���⮬���� settings.json �� ���� YimTools..."
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YM-settings%" >nul 2>&1

powershell -command "& { Invoke-WebRequest -Uri '%settings_item_Url%' -OutFile '%/YimMenu%/%name_YM-settings%' }"

if not exist "%/YimMenu%/%name_YM-settings%" (
		echo "Error: �� 㤠���� ᪠��� 䠩� %name_YM-settings%. �஢���� ����稥 ���୥� ᮥ������� ��� ���㠫쭮��� ��뫪� �� 䠩� � ����."
	) else (
	    cls
		echo "���⮬�� ����ன�� �ᯥ譮 ��⠭������. "
		echo "��� 䠩�? ���: %/YimMenu%/%name_YM-settings%"
		echo "Returning to the main menu in 5 seconds." )
timeout /t 5 /nobreak >nul
cls
goto check_offline_mode )

:restore_settings_RU
cls
echo ------------------------------------------------------------------
echo 	���⠭������� ����஥� settings.json ��� �� ���� YimMenu 
echo ------------------------------------------------------------------
echo " �஢�ઠ ������ ������ 䠩�� settigs.json... "
timeout /t 2 /nobreak >nul
if exist "%/YimMenu%/%name_YM-settings%.old" (
echo " �믮������ ����⠭������� 䠩�� settigs.json... "
timeout /t 1 /nobreak >nul
del "%/YimMenu%\%name_YM-settings%" >nul 2>&1
rename "%/YimMenu%\%name_YM-settings%.old" %name_YM-settings%
if exist "%/YimMenu%/%name_YM-settings%" (
echo " ����⠭������� 䠩�� %name_YM-settings% ��諮 ������� "
) else (
echo " ����⠭������� 䠩�� %name_YM-settings% �� ������� " )
timeout /t 2 /nobreak >nul
goto check_offline_mode
) else (
cls
echo " ��� 䠩�� %name_YM-settings% �� ������ "
timeout /t 3 /nobreak >nul
goto check_offline_mode )

:: //////////////////////////////////////////////////////////////////////
:: \\\\\\\\\\\\\ \\\\\\\\\\\ astions link \\\\\\\\\\\\\\\\\\\\\\\\\\\\\
:: /////////////////////////////////////////////////////////////////////

:open_YT_folder_RU
start %/cfg%
goto menu_settings

:open_scripts_folder_RU
start %/Scripts%
goto menu_settings

:open_YimMenu_folder_RU
start %/YimMenu%
goto menu_settings

:open_xml_folder_RU
start %/YimMenu%\xml_maps
start %/YimMenu%\xml_vehicles
cls
goto menu_settings

:open_json_folder_RU
start %/json_vehicles%
cls
goto menu_settings

:restart_RU
echo "����� ����� ���ᨨ YimTools ..."
timeout /t 2 /nobreak >nul
start %name_YT%
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

:put_YimTools_R
cls
if "%/RF%"=="�� �����祭" (
echo �����������������������������������������������������������ͻ
echo � !                     ��������                          ! �
echo �����������������������������������������������������������Ķ
echo � ���� ������ �� �����祭. �஢���� txt ���䨣����       �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo ���� ���:  %/paths%\path_replace.txt
echo ----------------------------------------------------------------------------
@echo.
echo ============================================================================
echo [1] ������ 1 ��� ��室� � ������� ���� ...
echo [2] ������ 2 ��� ������ 䠩�� ���䨣��樨 ...

choice /c 12 /n
 if errorlevel 2 start %/paths%\path_replace.txt
 if errorlevel 1 goto check_offline_mode
 
)

if "%name_YT_Replace_exe%"=="�� �����祭" (
echo �����������������������������������������������������������ͻ
echo � !                     ��������                          ! �
echo �����������������������������������������������������������Ķ
echo � ��� ������ �� �����祭�. �஢���� txt ���䨣����       �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo ���� ���:  %/paths%\name_replace.txt
echo ----------------------------------------------------------------------------
@echo.
echo ============================================================================
echo [1] ������ 1 ��� ��室� � ������� ���� ...
echo [2] ������ 2 ��� ������ 䠩�� ���䨣��樨 ...

choice /c 12 /n
 if errorlevel 2 start %/paths%\name_replace.txt exit
 if errorlevel 1 goto check_offline_mode
)


echo �����������������������������������������������������������ͻ
echo � !                     ��������                          ! �
echo �����������������������������������������������������������Ķ
echo � YimTools ������� ᮡ�� 㪠������ � ���䨣��樨 �ணࠬ�� �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo �����������������������������������������������������������ͻ
echo � �� 㢥७� �� ��� �������� %name_YT_Replace_exe% �ਯ⮬?         �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo ���� �㤥� ���:  %/RF%\%name_YT_Replace_exe%
echo ----------------------------------------------------------------------------

set /p yn=������ Y � ��砥 ������⥫쭮�� �⢥�:
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%updateScript_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%' }"

timeout /t 1 /nobreak >nul
echo �����������������������������ͻ
echo �    �ᯥ譮 ����㦥��        �
echo �����������������������������ͼ
timeout /t 1 /nobreak >nul
exit
) else (

cls
echo �����������������������������ͻ
echo �         ��室...            �
echo �����������������������������ͼ
timeout /t 1 /nobreak >nul
exit
)

:put_Xenos_R
cls
echo �����������������������������������������������������������ͻ
echo � !                     ��������                          ! �
echo �����������������������������������������������������������Ķ
echo � Xenos �㤥� ᪠砭 � ����� �ணࠬ�� %name_YT_Replace_exe% �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo �����������������������������������������������������������ͻ
echo � �� 㢥७� �� ��� �������� %name_YT_Replace_exe% �ਯ⮬?         �
echo �����������������������������������������������������������ͼ
echo ----------------------------------------------------------------------------
echo "���� �㤥� ���:  %/RF%\%name_YT_Replace_exe%"
echo ----------------------------------------------------------------------------

set /p yn=������ Y � ��砥 ������⥫쭮�� �⢥�:
if /i "%yn%"=="y" (

powershell -command "& { Invoke-WebRequest -Uri '%Xenos64_item_Url%' -OutFile '%/RF%\%name_YT_Replace_exe%' }"

timeout /t 1 /nobreak >nul
echo �����������������������������ͻ
echo �    �ᯥ譮 ����㦥��        �
echo �����������������������������ͼ
timeout /t 1 /nobreak >nul
exit

) else (

cls
echo �����������������������������ͻ
echo �         ��室...            �
echo �����������������������������ͼ
timeout /t 1 /nobreak >nul
exit
)

:dwnActVersionsInfo
powershell -command "& { Invoke-WebRequest -Uri '%YM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_YM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%UM_version_Url%' -OutFile '%/cfga%\%name_txtcfg_UM_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_version%' }" >nul
powershell -command "& { Invoke-WebRequest -Uri '%EA_md_version_Url%' -OutFile '%/cfga%\%name_txtcfg_EA_md_version%' }" >nul
set /a dwnActVersionsStatus=1
goto dwnActVersionsInfo_Done


:here_nothing_now
cls
echo ��� ���� �� ��祣� ����, �������� � ���饬
echo ����� �����-����� ����� �㭪��...
timeout /t 2 /nobreak >nul
goto check_offline_mode

:reset
cls
rmdir /s /q %/YimMenu%
rmdir /s /q %/cfg%
timeout /t 1 /nobreak >nul
echo �����������������������������ͻ
echo �   ���� ����஥� �믮����   �
echo �����������������������������ͼ
timeout /t 1 /nobreak >nul
echo ===============================
goto goodbye_RU

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

:blocked
cls

echo �����������������������������������������������������������ͻ
echo � !                     ��������                          ! �
echo �����������������������������������������������������������Ķ
echo � ����� ���짮������ �� ���� ��������᭮.                 �
echo � �ணࠬ�� �������஢��� �� ������ ������᭮� ������.   �
echo �����������������������������������������������������������ͼ
@echo.
echo �����������������������������������������������������Ŀ
echo � ~        ���ᨡ� �� �ᯮ�짮����� YimTools,       ~ �
echo � ~                ���⭮� ����!                   ~ �
echo �������������������������������������������������������
timeout /t 5 /nobreak >nul
exit

:auto_mode_RU
cls
goto check_offline_mode
:: ------------- YimMenu -------------------------------



:: ------------- Xenos64 -------------------------------

