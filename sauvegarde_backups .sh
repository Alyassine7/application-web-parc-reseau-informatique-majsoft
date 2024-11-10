#!/bin/bash


# Boucle pour demander la confirmation de l'utilisateur

while true; do
    read -p "Voulez-vous continuer la syncronisation ? (oui/non) : " reponse
    case $reponse in
        oui)

# Arrête le script en cas d'erreur et affiche un message d'erreur

set -e
trap 'echo "Une erreur est survenue. Arrêt du script immediatement"' ERR

#pourcentange
pourcentage="100%"
# Chemin local des addons PostgreSQL

addons_dir_local="/mon_test/"

date=$(date +"%H:%M:%S %d-%m-%Y")

# Adresses IP des serveurs distants
remote_ips=("10.8.0.42")

#remote_ips=("alyas.com" "mohamed.com")

#sudo ./utilisateur.sh

# Répertoire distant pour recevoir les addons
remote_dir="/mon_test/"

# Utilisateur et groupe propriétaire pour les fichiers spécifiques sur les serveurs distants
remote_user="root"
remote_group="root"


# Taille totale des fichiers à synchroniser
total_size=$(du -sb "$addons_dir_local" | awk '{print $1}')

# Fonction pour afficher un message coloré
function echo_green {
    echo -e "\e[32m$1\e[0m"
 #echo -e "\e[32m100%\e[0m"
}

# Copier les addons vers chaque serveur distant via SSH
for remote_ip in "${remote_ips[@]}"
do
  echo_green "Démarrage de la copie via rsync vers $remote_ip"
read -p "appuyez une touche dans le clavir puis Entrer pour continuer: "

#read a
#read -p "Entrez le nom du nouvel utilisateur: "
  # Utilisation de rsync via SSH pour copier les fichiers
  rsync -avz --delete "$addons_dir_local/" "$remote_user@$remote_ip:$remote_dir"
#echo_green | pv -s $total_size -p -e -r -a > /dev/null


# echo_green "Copie via rsync effectuée avec succès vers $remote_ip. user@IP:dossier = $remote_user@$remote_ip:$remote_dir" | pv -s $total_size -p -e -r -a > /dev/null

 echo_green "Copie via rsync effectuée avec succès vers $remote_ip. user@IP:dossier = $remote_user@$remote_ip:$remote_dir"
read -p "appuyez une touche dans le clavir puis Entrer pour continuer: "
  # Vérifier si la commande rsync a réussi
  if [ $? -eq 0 ]; then


 #echo_green "Envoi des addons vers $remote_ip terminé avec succès." | pv -s $total_size -p -e -r -a > /dev/null
 echo_green "Envoi des addons vers $remote_ip terminé avec succès."

read -p "appuyez une touche dans le clavier puis Entrer  pour continuer: "

  else
    echo "Échec de l'envoi des addons vers $remote_ip.$(date +"%H:%M:%S %d-%m-%Y")"
read -p "appuyez une touche dans le clavier puis Entrer pour quitter: "
    exit 1
  fi


 # echo_green "Démarrage du changement de propriétaire $remote_user vers: $remote_ip" | pv -s $total_size -p -e -r -a > /dev/null
echo_green "Démarrage du changement de propriétaire $remote_user vers: $remote_ip"

read -p "appuyez une touche dans le clavir puis Entrer pour continuer: "
  # Construire et exécuter la commande SSH pour changer le propriétaire des fichiers


ssh "$remote_user@$remote_ip" "chown -R $remote_user:$remote_group $remote_dir"

  # Vérifier si la commande SSH a réussi
  if [ $? -eq 0 ]; then


    #echo_green "Changement de propriétaire $remote_user vers $remote_ip terminé avec succès." | pv -s $total_size -p -e -r -a > /dev/null
 echo_green "Changement de propriétaire $remote_user vers $remote_ip terminé avec succès."


read -p "appuyez une touche dans le clavir puis Entrer pour continuer: "
 else
    echo "Échec du changement de propriétaire $remote_user: vers $remote_ip. $(date +"%H:%M:%S %d-%m-%Y")"
read -p "appuyez une touche dans le clavier puis Entrer pour quitter: "
 exit 1

  fi

done

echo_green "Tous les envois d'addons et les changements de propriétaire sont terminés avec succès vers $(date +"%H:%M:%S %d-%m-%Y"):============================>$pourcentage"

            # Ajoutez les commandes à exécuter si l'utilisateur choisit "oui"
            break
            ;;
        non)
            echo "Vous avez choisi d'arrêter."
            exit 0
            ;;
        *)
            echo "Réponse invalide. Veuillez répondre par 'oui' ou 'non'."
            ;;
    esac
done
