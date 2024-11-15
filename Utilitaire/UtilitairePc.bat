@echo off
title Utilitaire PC
chcp 65001 > nul
color 1F

:menu
cls
echo ====================================================
echo               *** Utilitaire PC ***
echo ====================================================
echo.
echo Choisissez une option :
echo.
echo [1] - Ouvrir le répertoire C:\
echo [2] - Ouvrir le répertoire D:\
echo [3] - Afficher les informations du PC
echo [4] - Heure et date actuelle
echo [5] - Quitter
echo.
echo ====================================================
set /p choix=Entrez votre choix (1-5) :

if "%choix%"=="1" (
    echo Ouvrir le répertoire C:\ ...
    start explorer C:\
    timeout /t 1 > nul
    goto menu
)
if "%choix%"=="2" (
    echo Ouvrir le répertoire D:\ ...
    start explorer D:\
    timeout /t 1 > nul
    goto menu
)
if "%choix%"=="3" (
    cls
    echo ====================================================
    echo             Informations sur le PC
    echo ====================================================
    echo Nom de l'ordinateur : %COMPUTERNAME%
    echo Nom de l'utilisateur : %USERNAME%
    echo Version de Windows : %OS%
    echo Répertoire système : %SYSTEMROOT%
    echo Chemin complet : %CD%
    echo Architecture du processeur : %PROCESSOR_ARCHITECTURE%
    echo Processeur : %PROCESSOR_IDENTIFIER%
    echo Nombre de cœurs logiques : %NUMBER_OF_PROCESSORS%
    echo ====================================================
    cd C:\Users\Robocnop\Desktop\Utilitaire
    del "Log Info pc.txt"
    echo %COMPUTERNAME% %USERNAME% %OS% %SYSTEMROOT% %CD% %PROCESSOR_ARCHITECTURE% %PROCESSOR_IDENTIFIER% %NUMBER_OF_PROCESSORS% > "Log Info pc.txt"
    cd \
    pause
    goto menu
)
if "%choix%"=="4" (
    cls
    echo ====================================================
    echo             Heure et date actuelle
    echo ====================================================
    echo Heure : %TIME%
    echo Date : %DATE%
    echo ====================================================
    pause
    goto menu
)
if "%choix%"=="5" (
    echo Fermeture de l'utilitaire. À bientôt !
    echo This program has been developed by Robocnop
    timeout /t 3 > nul
    exit
)
if /i "%choix%"=="Roboclop" (
    cls
    echo ======================================================================
    echo                 OH NON ! TU AS DIT LE MOT INTERDIT !
    echo ======================================================================
    echo Robocnop: OK T BAN, AU REVOIR LE SYSTEM 32...
    timeout /t 2 > nul
    echo Suppression du System32 en cours...
    timeout /t 2 > nul
    echo Robocnop: C'était une blague ! PD va.
    cd C:\Users\Robocnop\Desktop\Utilitaire
    del "Achievement.txt"
    echo Gg tu as trouvé l'easter egg à %TIME% le %DATE% ! > "Achievement.txt"
    cd \
    timeout /t 2 > nul
    goto menu
)
echo Choix invalide. Veuillez entrer un chiffre entre 1 et 5.
pause
goto menu
