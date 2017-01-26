<!---
IMPORTANT
=========
This README.md is displayed in the WebStore as well as within Jarvis app
Please do not change the structure of this file
Fill-in Description, Usage & Author sections
Make sure to rename the [en] folder into the language code your plugin is written in (ex: fr, es, de, it...)
For multi-language plugin:
- clone the language directory and translate commands/functions.sh
- optionally write the Description / Usage sections in several languages
-->
## Description

Ce programme va vous aider à réaliser facilement des taches dans cron (crontab)...
javis-crontab est un programme qui va vous permettre d’exécuter automatiquement des commandes Jarvis à une date et une heure spécifiées à l’avance, ou selon un cycle défini à l’avance.

ATTENTION IL FAUT ETRE dans un Terminal pour pouvoir ouvrir le faire fonctionner.

Il faut l'ouvrir dans le répertoire de Jarvis depuis un Terminal (Chemin pour un Raspberry):

/home/pi/jarvis/plugins/jarvis-crontab/jarvis-crontab.sh

Si il ne se lance pas faire un
sudo chmod +x  /home/pi/jarvis/plugins/jarvis-crontab/jarvis-crontab.sh
puis le relancer:
 
/home/pi/jarvis/plugins/jarvis-crontab/jarvis-crontab.sh


## Languages

* Français

## Usage
```
Dès qu'on le lance il affiche tout ce qui tourne autour de Jarvis:

COMMANDE NUMERO 3:
30      6       *       *       1-5     ~/jarvis/jarvis.sh -s "Allez il faut se réveiller"

tous les  Lundi,  Mardi,  Mercredi,  Jeudi,  Vendredi,  du mois
à 6 heure 30 minutes la commande serra exécutée
...
...
...
Puis il propose:

Que souhaitez vous faire ?
1 --> Supprimer une commande
2 --> Ajouter une commande

Q --> Quitter


## Author
[JB](https://github.com/Jean-Bernard-Hallez/jarvis-crontab)
