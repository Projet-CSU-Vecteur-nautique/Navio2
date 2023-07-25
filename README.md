# Navio2

*Ce répertoire sert de documentation pour le Navio2. Il relatera des diffrents tests effectués avec l'autopilote.*

## Installation du Navio2

### Montage du Navio2

Pour monter le Navio2 sur le RPi, suivre le tutoriel fourni par emlid disponible à l'adresse suivante : [assemblage du matériel](https://docs.emlid.com/navio2/hardware-setup).

### Configuration du Raspberry Pi

1. Télécharger le système d'exploitation à mettre sur la carte SD

    [lien de téléchargement](https://files.emlid.com/images/emlid-raspbian-20220608.img.xz)

2. Flasher l'image ISO sur la carte SD

    Plusieurs options sont disponibles:

    - [Raspberry Pi Imager](https://www.raspberrypi.com/news/raspberry-pi-imager-imaging-utility/), l'outil de la fondation Raspberry Pi
    - Un utilitaire standard, tel que [balenaEtcher](https://balenaetcher.org/) ou autre.

    Pour plus d'informations sur l'installation, se référer au [guide d'emlid](https://docs.emlid.com/navio2/configuring-raspberry-pi).

3. Configurer le wifi

    [guide emlid](https://docs.emlid.com/navio2/configuring-raspberry-pi/#configure-wi-fi-access)

    Pour cette étape, se référer au tutoriel d'emlid: [guide emlid](https://docs.emlid.com/navio2/configuring-raspberry-pi/#configure-wi-fi-access)

    Pour mettre en marche le wifi, voici un exemple de marche à suivre:

    - Brancher le RPi à l'ordinateur par ethernet
    - Se connecter par ssh avec l'id `pi@navio.local` et le mot de passe `raspberry`.
    - En cas de problème, repérer l'adresse du RPi (avec `wireshark` par exemple).
    - Depuis la console ssh, se connecter au compte root avec la commande `sudo -i`.
    - Renseigner la commande suivante.

        ```sh
        wpa_passphrase SSID password >> /boot/wpa_supplicant.conf
        ```

    - Redémarrer le RPi `reboot`.

4. Mettre à jour le système

    ```sh
    sudo apt-get update && sudo apt-get dist-upgrade
    ```

5. Installer ardupilot

    Suivre les étapes du [guide](https://docs.emlid.com/navio2/ardupilot/installation-and-running#connecting-to-the-gcs) et lancer QGC.

    La connexion devrait s'établir automatiquement.

    *Veuillez bien à configurer les paramètres de télémétrie durant l'installation d'Ardupilot.*

6. Initialiser le dispositif sur QGC

    Une fois le drone connecté à QGC, suivre les étapes de configuration du véhicule. Pour y accéder, cliquer sur l'icône de QGC, puis sur vehicle setup.

## Installation de QGC

Pour installer QGC, suivre ce [tutoriel](https://github.com/Projet-CSU-Vecteur-nautique/QGroundControl).

## Associer le receveur X8R à la télécommande TX16S

Regarder cette [video](https://www.youtube.com/watch?v=1IYg5mQdLVI) pour la manipulation à suivre.

Par la suite, calibrer la télécommande sur QGC.

### Sortir la TX16S du mode secours

Si la télécommande reste bloquée dans un mode secours, cette [video](https://youtu.be/uIkk95Mpimo) pourrait aider à corriger le problème.
