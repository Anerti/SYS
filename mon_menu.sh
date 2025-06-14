#!/bin/bash



menu () #creation d'une fonction pour mieux encapsuler le contenu
{
  while true; do # boucle infinie
    echo -e "\n\n" #aller a la ligne 2 fois
    neofetch -l --ascii_distro linux #afficher tux
    echo -e "--- Menu Système Principal---\n" #afficher le menu
    echo "1. Afficher la date et l'heure actuelles"
    echo "2. Afficher l'espace disque disponible"
    echo "3. Afficher le temps de fonctionnement du système"
    echo '4. Accéder au "Sous-Menu : Analyse de Log Système"'
    echo -e "5. Quitter le script\n"
    echo -n "Entrer une option: "
    read input_1 #enregistrer la saisie de l'utilisateur dans la variable input_1
    clear #effacer le terminale
    echo -e "\n"
    case "$input_1" in
      1) date;; #executer la commande date si input_1 = 1
      2) df -h;; #executer la commande df -h si input_1 = 2
      3) uptime;; #executer la commande uptime si input_1 = 3
      4) echo -e "---Log Système journalctl---\n\n"
         echo "1. Afficher les erreurs"
         echo -e "2. Afficher les avertissements et informations\n"
         echo -e "Dans chacun des option, appuyer sur Q pour quitter\n"
         echo -n "Entrer une option: "
         read input_2 #enregistrer la saisie de l'utilsateur dans la variable input_2
         echo -e "\n"
         clear
         case "$input_2" in
           1) journalctl | grep -iw "error" | less;; #executer la commande journalctl, passer l'output de la commande a grep qui recherche le mot exacte error (-w) tout en ignorant la casse (-i) puis passer l'output de la commande à less
           2) journalctl | grep -iwE "info|warning" | less;; #executer la commande journalctl, passer l'output à grep qui recherche le mot exacte (-w) info ou warning (-E) et passer l'output à la commande less
           *) echo "Option invalide";; #afficher un message d'erreur lorsque l'utilisateur entre une option invalide
         esac;; #marqueur de fin de la condition case
      5) break;; #sortir de la boucle
      *) echo "Option invalide";;
    esac
  done
}



menu
neofetch -l --ascii_distro linux #afficher tux
echo -e "Sortie ...\n\n"
