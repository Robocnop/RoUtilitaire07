@echo off
title WinToolbox
chcp 65001 > nul
color 1F

:menu
cls
echo ====================================================
echo             *** WinToolbox V1.1.0 *** 
echo ====================================================
echo.
echo Choisissez une option :
echo.
echo [1] - Ouvrir le répertoire C:\
echo [2] - Ouvrir le répertoire D:\
echo [3] - Afficher les informations du PC
echo [4] - Heure et date actuelle
echo [5] - Outils Réseau
echo [6] - Outils Processus
echo [7] - Supprimer le Filigrane
echo [8] - Redémarrage dans le BIOS
echo [9] - Annnulé le redémarrage
echo [10] - Quitter
echo.
echo ====================================================
set /p choix=Entrez votre choix (1-8) :

if "%choix%"=="1" (
    echo Ouverture du répertoire C:\ ...
    start explorer C:\
    timeout /t 1 > nul
    goto menu
)
if "%choix%"=="2" (
    echo Ouverture du répertoire D:\ ...
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
    echo Chemin actuel : %CD%
    echo Architecture du processeur : %PROCESSOR_ARCHITECTURE%
    echo Processeur : %PROCESSOR_IDENTIFIER%
    echo Nombre de cœurs logiques : %NUMBER_OF_PROCESSORS%
    echo ====================================================
    pause
    goto menu
)
if "%choix%"=="4" (
    cls
    echo ====================================================
    echo             Heure et date actuelles
    echo ====================================================
    echo Heure : %TIME%
    echo Date : %DATE%
    echo ====================================================
    pause
    goto menu
)
if "%choix%"=="5" (
    goto Reseau
)
if "%choix%"=="6" (
    goto Processus
)
if "%choix%"=="7" (
    goto Filigrane
)
if "%choix%"=="8" (
    echo "Attention redémarrage. Sauvegardez vos fichiers ! (Vous avez 10 secondes)"
    timeout /t 2 > nul
    PowerShell -Command "Start-Process PowerShell -ArgumentList '-Command shutdown /r /fw /t 10' -Verb RunAs" >nul
    echo Redémarrage échoué
    timeout /t 2 > nul
    goto menu
)
if "%choix%"=="9" (
    echo Annnulation du redémarrage
    shutdown -a
    timeout /t 2 > nul
    goto menu
)
if "%choix%"=="10" (
    echo Fermeture de la Toolbox. À bientôt !
    echo "Ce programme a été développé par Robocnop & Tronix"
    timeout /t 3 > nul
    exit
)
if /i "%choix%"=="Roboclop" (
    cls
    echo ======================================================================
    echo                 OH NON ! TU AS DIT LE MOT INTERDIT !
    echo ======================================================================
    echo Robocnop: OK, T’ES BAN. AU REVOIR LE SYSTEM32...
    timeout /t 2 > nul
    echo Suppression du System32 en cours...
    timeout /t 2 > nul
    echo Robocnop: C'était une blague ! Pd va.
    timeout /t 2 > nul
    goto menu
)
echo Choix invalide. Veuillez entrer un chiffre entre 1 et 8.
pause
goto menu

:: Menu Réseau

:Reseau
cls
echo ====================================================
echo               *** Outils Réseau ***
echo ====================================================
echo [1] - Afficher les informations réseau
echo [2] - Ping une adresse IP
echo [3] - Afficher les connexions réseau actives (NetStat)
echo [4] - Retour au menu principal
echo ====================================================
set /p choix_reseau=Entrez votre choix (1-4) :

if "%choix_reseau%"=="1" (
    ipconfig
    pause
    goto Reseau
)
if "%choix_reseau%"=="2" (
    set /p ipadress="Entrez l'adresse IP à pinguer : "
    ping "%ipadress%"
    pause
    goto Reseau
)
if "%choix_reseau%"=="3" (
    echo /!\ Pour quitter NetStat, utilisez CTRL+C /!\
    netstat
    pause
    goto Reseau
)
if "%choix_reseau%"=="4" (
    goto menu
)
echo Choix invalide. Veuillez entrer un chiffre entre 1 et 4.
pause
goto Reseau

:: Menu Processus

:Processus
cls
echo ===============================================
echo              Processus Systèmes
echo ===============================================
echo [1] - Lister les processus				    
echo [2] - Fermer une tâche (Beta)					 
echo [3] - Retour au menu                                 

set /p choixx=Entrez votre choix (1-3) :

if "%choixx%"=="1" (
    tasklist
    set /p pid="Entrez le PID du processus : "
    pause
    goto Processus
)

if "%choixx%"=="2" (
    echo Entrez d'abord un PID via l'option [1].
    taskkill /PID %pid% /F
    pause
    goto Processus
)

if "%choixx%"=="3" (   
    goto menu
)

:: Menu Filigrane

:Filigrane
cls
echo ===============================================
echo            Suppression du Filigrane
echo ===============================================
echo [1] - Supprimer le filigrane "Activer Windows" (temporaire)


set /p choix_Filigrane=Entrez votre choix (1-ou fermer le programme) :

if "%choix_Filigrane%"=="1" (
    cls
    echo Suppression du filigrane en cours...
    echo Attention : cette suppression est temporaire.
    timeout /t 2 > nul
    echo Utilisez Massgrave pour activer Windows définitivement.
    timeout /t 2 > nul
    echo Un redémarrage est nécessaire. Sauvegardez vos fichiers ! (Vous avez 10 secondes)
    timeout /t 10 > nul
    echo Redémarrage...
    timeout /t 2 > nul
    slmgr /renouveler
    shutdown /r
)


:: Programme développé par Robocnop & Tronix
:: Et sous license GPL-3.0
:: Version 1.1.0
