#!/bin/sh
version="(jarvis-crontab ver: 1.1) ATTENTION Ce Script traite que les commandes Pour Jarvis (Jarvis doit apparaitre à chaque commande dans le Cron) !!!
"
separe () {
echo " "
echo "\033[45m--------------------------------------------------------------------------------------------\033[0m"
echo " "
}

testvariable() {
[ $var -eq 0 ] 2>/dev/null
if [ $? -eq 0 -o $? -eq 1 ]
then 
  # echo "c'est un entier"
  retourtest="1"
else
  # echo "c'est pas un entier"
  retourtest="0"
fi
}

testresultatcontrab() {
# --- Je test @ ---
if [ $(LC_CTYPE=C printf '%d' "'$vardebut ") != "42" ]; then if [ $vardebut = '@' ]; then echo "qui serra exécuté à chaque démarrage du Rapsberry"; return; fi; fi

# --- Je test jours Du Lundi au Dimanche---
if [ $(LC_CTYPE=C printf '%d' "'$varjourouweek") != "42" ]; then 
	var7=`echo  $varjourouweek| sed -n '/,/='`
	if [ "$var7" = "1" ]; then
	var12=$((`echo $varjourouweek | grep -o "," | wc -l` + 2 ))
	chaineatrouve=","
	cpt2=1
	var11=""
	while [ "$cpt2" != "$var12" ]; do
	var13=`echo $(echo $varjourouweek | cut -d"$chaineatrouve" -f$cpt2)`
	convertitestlesjour
	cpt2=$(($cpt2+1))
	done
		if [ "$var7" = "" ]; then echo " "; echo "Ou là...Il me semble que vous vous êtes trompé dans la commande..."; return
		else
		echo "les $var11 du mois"; 
		fi

	fi
	
	var7=`echo  $varjourouweek | sed -n '/-/='`
	if [ "$var7" = "1" ]; then
	var11=""
	cpt2=`echo $varjourouweek| cut -d'-' -f1`
	var12=$((`echo $varjourouweek |cut -d'-' -f2` + 1 ))
	chaineatrouve="-"
	while [ "$cpt2" != "$var12" ]; do
	var13=$cpt2
	convertitestlesjour
	cpt2=$(($cpt2+1))
	done
		if [ "$var7" = "" ]; then echo " "; echo "Ou là...Il me semble que vous vous êtes trompé dans la commande..."; return
		else
		echo "tous les $var11 du mois"; 
		fi
	fi

fi

# --- Je test jours ---
if [ $(LC_CTYPE=C printf '%d' "'$varjour") != "42" ]; then 
var7=`echo  $varjour | sed -n '/,/='`
	if [ "$var7" = "1" ]; then
	echo "Les $varjour du mois"; 
	else
	echo "Tous les $varjour du mois"; 
	fi
fi


# --- Je test mois ---
if [ $(LC_CTYPE=C printf '%d' "'$varmois") != "42" ]; then 
var7=`echo  $varmois | sed -n '/,/='`
	if [ "$var7" = "1" ]; then
	convertitestlesmois
		if [ "$var10" = "" ]; then echo " "; echo "Ou là...Il me semble que vous vous êtes trompé dans la commande..."; return
		else
		echo "En $var10"
		fi	
	else
	convertitestlesmois
		if [ "$var10" = "" ]; then echo " "; echo "Ou là... Il me semble que vous vous êtes trompé dans la commande..."; return
		else
		echo "Tous les mois de: $var10"
		fi
	fi
fi


# --- Que si c'est les heures ou que les minutes ---
if [ $(LC_CTYPE=C printf '%d' "'$varheure") = "42" -a  $(LC_CTYPE=C printf '%d' "'$varminute") != "42" ]; then echo "toutes les $varminute minutes"; fi
if [ $(LC_CTYPE=C printf '%d' "'$varheure") != "42" -a  $(LC_CTYPE=C printf '%d' "'$varminute") = "42" ]; then echo "toutes les $varheure heure"; fi



# --- Je test Heure et Minutes ---
if [ $(LC_CTYPE=C printf '%d' "'$varheure") != "42" -a  $(LC_CTYPE=C printf '%d' "'$varminute") != "42" ]; then var=$varheure; testvariable
	if [ $retourtest = '1' ]; then var=$varminute; testvariable;
		if [ $retourtest = '1' ]; then
		echo "à $varheure heure $varminute minutes la commande serra exécutée"	
		fi
	else
	echo "entre $varheure heure de cette période la commande serra exécutée "	
	fi
fi


# --- Je test toutes les minutes ---
if  [ "$vardebutminslash" != "" -a "$vardebutminslash" != " " -a "$vardebutminslash" != "0" -a $(LC_CTYPE=C printf '%d' "'$vardebutminslash") != "42"  ]; then
if  [ $vardebutminslash = '/' ]; then echo "toutes les $varminute minutes la commande serra exécutée"; fi
fi

# --- Je test toutes les Heures ---
if  [ "$vardebutheuslash" != "" -a "$vardebutheuslash" != " " -a "$vardebutheuslash" != "0" -a $(LC_CTYPE=C printf '%d' "'$vardebutheuslash") != "42"  ]; then
if  [ $vardebutheuslash = '/' ]; then echo "toutes les $varheure heures la commande serra exécutée"; fi
fi

}

convertitestlesmois() {
var8=$((`echo $varmois | grep -o "," | wc -l` + 2 ))
cpt1=1
var10=""
while [ "$cpt1" != "$var8" ]; do
var9=`echo $(echo $varmois | cut -d"," -f$cpt1)`
if [ "$var9" = "1" ]; then var10="$var10 Janvier, "; fi
if [ "$var9" = "2" ]; then var10="$var10 Février, "; fi
if [ "$var9" = "3" ]; then var10="$var10 Mars, "; fi
if [ "$var9" = "4" ]; then var10="$var10 Avril, "; fi
if [ "$var9" = "5" ]; then var10="$var10 Mai, "; fi
if [ "$var9" = "6" ]; then var10="$var10 Juin, "; fi
if [ "$var9" = "7" ]; then var10="$var10 Juillet, "; fi
if [ "$var9" = "8" ]; then var10="$var10 Aout, "; fi
if [ "$var9" = "9" ]; then var10="$var10 Septembre, "; fi
if [ "$var9" = "10" ]; then var10="$var10 Octobre, "; fi
if [ "$var9" = "11" ]; then var10="$var10 Novembre, "; fi
if [ "$var9" = "12" ]; then var10="$var10 Decembre, "; fi
cpt1=$(($cpt1+1))
done
}

convertitestlesjour() {
if [ "$var13" = "0" ]; then var11="$var11 Dimanche, "; fi
if [ "$var13" = "1" ]; then var11="$var11 Lundi, "; fi
if [ "$var13" = "2" ]; then var11="$var11 Mardi, "; fi
if [ "$var13" = "3" ]; then var11="$var11 Mercredi, "; fi
if [ "$var13" = "4" ]; then var11="$var11 Jeudi, "; fi
if [ "$var13" = "5" ]; then var11="$var11 Vendredi, "; fi
if [ "$var13" = "6" ]; then var11="$var11 Vendredi, "; fi
}


affichecrontab () {
pi=pi
reset

crontab -l > pi
# je récupère le numéro des ligne sans le # et contenant Jarvis
var3=`echo $(sed -n '/#/g ; /jarvis/=' pi)` 


# Compte le nombre de ligne à afficher
var4=$((`echo $(echo $var3 | wc -w)` + 1 ))
echo "$version\033[33m IL Y A $(($var4-1)) LIGNES DANS LE CRONTAB POUR 'JARVIS'  N° $var3:\033[0m"
separe 

# Récupère le numéro de la première ligne
# var5=`echo $(echo $var3 | cut -d" " -f1)`
# echo "1) Ligne Num $var5"

# Affiche le Ligne Num 1
# sed -n $var5\p pi

# boucle for
cpt=1

while [ "$cpt" != "$var4" ]; do

echo  "COMMANDE NUMERO $cpt:"
var5=`echo $(echo $var3 | cut -d" " -f$cpt)`
sed -n $var5\p pi
echo " "
varminute=`sed -n $var5\p pi |  awk {'print $1'}`
varheure=`sed -n $var5\p pi |  awk {'print $2'}`
varjour=`sed -n $var5\p pi |  awk {'print $3'}`
varmois=`sed -n $var5\p pi |  awk {'print $4'}`
varjourouweek=`sed -n $var5\p pi |  awk {'print $5'}`
varcommande=`sed -n $var5\p pi |  awk {'print $6'}`
vardebut=`(echo $varminute | cut -c1)`
vardebutminslash=`(echo $varminute | cut -c2)`
vardebutheuslash=`(echo $varheure | cut -c2)`

testresultatcontrab
separe 
cpt=$(($cpt+1))
done
}




quefaire () {
echo "Que souhaitez vous faire ?"
echo "1 --> Supprimer une commande"
echo "2 --> Ajouter une commande"
echo "3 --> De l'aide complémentaire...un Bug..."

echo " "
echo "Q --> Quitter"
echo " "
read reponse

if [ "$reponse" = "Q" ]; then
sudo rm $pi >/dev/null 2>&1 
echo "Merci à la prochaine..."
exit
fi
	if [ "$reponse" = "1" ]; then
	echo " "
	echo "quelle numéro de commande vous voulez supprimer ?"
	echo " "
	read reponse
		if [ "$reponse" -le "$var4" ]; then
		echo " "
		var5=`echo $(echo $var3 | cut -d" " -f$reponse)`
		sed -n $var5\p pi
		echo "Etes vous bien sur de vouloir supprimer cette commande ? (O/N)"
		echo " "
		read reponse
			if [ "$reponse" = "O"  ]; then
			echo " "
			echo "Ok j'efface"
			sed -i $var5'd' pi  >/dev/null 2>&1 
			crontab pi >/dev/null 2>&1 
			sudo rm $pi >/dev/null 2>&1 
			else
			echo " "
			echo "Ok je garde..."
			fi
		else
		echo "Erreur dans votre demande..."
		fi

	fi

	if [ "$reponse" = "2" ]; then
	reset
	echo " "
	echo "Jarvis Events"
	echo " Add your events according to format at bottom"
	echo " Remove the leading # to enable a rule"
	echo " Format:"
	echo " Minutes Hours DayofMth Months DaysofWk Command to execute"
	echo " "
	echo " Amounts formats: * (all), */2 (every 2), 1,2 (1 and 2), 1-3 (from 1 to 3)"
	echo " Shortcuts: @reboot, @yearly, @annually, @monthly, @weekly, @daily    , @midnight, @hourly"
	echo " "
	echo "                                                 LEGEND"
	echo "    ____________________________________________ Minutes (0-59)"
	echo "   |        ____________________________________ Hours (0-23)"
	echo "   |       |        ____________________________ Days of Month (1-31)"
	echo "   |       |       |        ____________________ Months (1-12)"
	echo "   |       |       |       |        ____________ Days of Week (0-6, 0 is Sun)"
	echo "   |       |       |       |       |         ___ Command to execute"
	echo "___|_______|_______|_______|_______|________|_________________________________"
	echo "                            Examples"
	echo "---|-------|-------|-------|-------|--------|---------------------------------"
	echo '   @reboot                                 ~/jarvis/jarvis.sh -b' # au redemarage du Raspberry'
	echo '   0       16       1,15    *       *       ~/jarvis/jarvis.sh -s "Il faut allez à la salle de Gym" # Tous les 1 et 15 de chaque mois à 16h00'
	echo '   30      6       *       *       1-5     ~/jarvis/jarvis.sh -s "Allez il faut se réveiller" # Tous les jours à 6h30 sauf week-end'
	echo '   0       8       30      7       *       ~/jarvis/jarvis.sh -s "Bon anniversaire Paul" # "Le 30 Juillet à  8h"'
	echo '   0       8       *       *       *       ~/jarvis/jarvis.sh -x "quelle est la météo?" # à tous les jours à 8 h'
	echo '   0       7-21    *       *       *       ~/jarvis/jarvis.sh -x "quelle heure est-il?" # toues les heures'
	echo '   */10    *       *       *       *       ~/jarvis/jarvis.sh -x "vérifie mes emails"  # toutes les 10 mins'
	echo "___|_______|_______|_______|_______|________|_________________________________"
	echo " "	
	echo "---|-------|-------|-------|-------|--------|---------------------------------"

	echo " "
	echo "Que souhaitez vous rajouter ? (Ca serra tester avant sa mise en service)"
	echo " "
	read reponse

	var7=`echo  $reponse | sed -n '/arvis/='`
	if [ "$var7" = "1" ]; then
	separe
	echo "$reponse" >> $pi
	var3=`echo $(sed -n '/#/g ; /jarvis/=' pi)`
	var4=$((`echo $(echo $var3 | wc -w)` + 1 ))
	var5=`echo $(echo $var3 | cut -d" " -f$cpt)`
	sed -n $var5\p pi

	varminute=`sed -n $var5\p pi |  awk {'print $1'}`
	varheure=`sed -n $var5\p pi |  awk {'print $2'}`
	varjour=`sed -n $var5\p pi |  awk {'print $3'}`
	varmois=`sed -n $var5\p pi |  awk {'print $4'}`
	varjourouweek=`sed -n $var5\p pi |  awk {'print $5'}`
	varcommande=`sed -n $var5\p pi |  awk {'print $6'}`
	vardebut=`(echo $varminute | cut -c1)`
	vardebutminslash=`(echo $varminute | cut -c2)`
	vardebutheuslash=`(echo $varheure | cut -c2)`

	testresultatcontrab
	separe


	echo "Ok on valide ? (O/N)"
	echo " "
	read rep
		if [ "$rep" = "O"  ]; then
		echo "$reponse" >> $pi
		crontab $pi > /dev/null
		sudo rm $pi > /dev/null
		else
		echo "Ok je ne fais rien..."
		fi
	
	else
	echo "Désolé cette commande n'ai pas pris en charche le mot 'Jarvis' n'apparait pas (Si c'est important rajouer '# Pour Jarvis' à la fin de votre commande)."
	echo "Appuyez sur une touche pour revenir au menu..."
	read reponse
	fi
	fi	

	if [ "$reponse" = "3" ]; then
	reset
	echo " "
	separe
	echo " "

	echo "Programme réalisé pour Jarvis par Jean-Bernard H."
	echo " "
	separe
	echo " "

	echo "Pour une aide complémentaire à l'usage de Cron:"
	echo "https://technique.arscenic.org/commandes-linux-de-base/article/cron-gestion-des-taches-planifiees"
	echo " "
	separe
	echo " "

	echo "Pour apporter une amélioration, veuillez consulter cette page:"
	echo "http://domotiquefacile.fr/jarvis/plugins/jarvis-crontab"
	echo " "
	separe
	echo " "
	echo $version
	echo " "
	separe
	echo " "


	echo "Appuyez sur une touche pour revenir au menu..."
	read reponse
	fi

affichecrontab 
quefaire
}

affichecrontab 
quefaire 

