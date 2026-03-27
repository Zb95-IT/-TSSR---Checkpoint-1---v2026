#!/bin/bash
 # Script de création d'utilisateurs
# Utilisation : ./addUsers.sh user1 user2 user3
 # Vérification qu'il y a bien des arguments
if [ $# -eq 0 ]
then
	echo "Il manque les noms d'utilisateurs en argument - Fin du script"
fi
for user in $@
do
	# On vérifie si l'utilisateur existe déjà dans le système
	if id "$user" > /dev/null 
	then
		echo "L'utilisateur $user existe déjà"
	else
		# L'utilisateur n'existe pas, on le crée
		useradd -m -s /bin/bash $user
 
		# On vérifie si la création s'est bien passée
		if [ $? -eq 0 ]
		then
			echo "L'utilisateur $user a été crée"
		else
			echo "Erreur à la création de l'utilisateur $user"
		fi
	fi
 
done
