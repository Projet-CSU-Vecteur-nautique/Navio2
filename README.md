# Navio2

*Ce répertoire sert de documentation pour le Navio2. Il relatera des diffrents tests effectués avec l'autopilote.*

## Installation

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

## Tests

Pour tester le lidar, Slamtec met a disposition un package ROS et les instructions associées pour tester le lidar: [lien](https://github.com/Slamtec/rplidar_ros/tree/master).

### Compiler la librairie

La marche à suivre pour faire tourner les exemples est la suivante:

> 1\) Clone this project to your catkin's workspace src folder

Créer un workspace catkin si ce n'est pas déjà fait, par exemple:

```sh
mkdir -p ~/workspace/src
cd ~/workspace
catkin_make
```

Cloner le répertoire github

```sh
#Dans le dossier ~/workspace/src
git clone https://github.com/slamtec/rplidar_ros.git
```

> 2\) Running catkin_make to build rplidarNode and rplidarNodeClient

```sh
cd ~/workspace
catkin_make
```

Bien penser à mettre à jour la liste des executables dans ROS lors de la première compilation notamment

```sh
. ~/workspace/devel/setup.bash
```

## Étude du lidar

### Mise en place du lidar dans ROS

Pour utiliser le lidar dans ROS avec RViz

```sh
roslaunch rplidar_ros rplidar.launch #(for RPLIDAR A1/A2)
```

### Représentation des données sur rviz

![rviz](img/lidar_rviz.png)

### Graphe ROS

![graph](img/ros_graph.png)

### Node `rplidarNode`

![node_info](img/node_info.png)

### Topic `scan`

![scan_topic](img/topic_info.png)

Ici, ce qui nous interesse, c'est le type de message renvoyé par le lidar.

### Message `sensor_msgs/LaserScan`

![msg_show](img/msg_show.png)

À partir de ce message, on peut connaître le temps de résolution du lidar, son angle de balayage, la position des obstacles dans le temps.

```sh
rostopic echo -n1 /scan #Pour obtenir 1 message du topic scan
```

```sh
#Output

header: 
  seq: 33895
  stamp: 
    secs: 1684160383
    nsecs: 405358847
  frame_id: "laser"
angle_min: -3.1415927410125732
angle_max: 3.1415927410125732
angle_increment: 0.008278241381049156
time_increment: 0.0001053173909895122
scan_time: 0.07993589341640472
range_min: 0.15000000596046448
range_max: 12.0
ranges: [inf, inf, 0.22699, 0.22699, 0.22699, inf, ..., inf]
intensities: [0.0, 0.0, 47.0, 47.0, ..., 0.0, 47.0]
---
```

On remarque ici que le lidar possède un angle de balayage de 360°, une portée de 0.15 à 12.0 mètres et un temps de résolution de 0.08 secondes.

### Informations électrique

Le rplidar fonctionne avec une tension opérationnelle de 5V et un courant maximum de 600mA.

*Un pic de 1500mA peut être observé au démarrage.*

*Pour plus d'informations, [consulter la fiche technique](docs/rplidar_manuel_utilisateur.pdf).*

## Liens

- [RPlidar A2M8](https://www.slamtec.ai/home/rplidar_a2/)
- [ros](http://wiki.ros.org/rplidar)
- [rplidar_ros](https://github.com/slamtec/rplidar_ros)
