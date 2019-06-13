

* Vérifier que ton smartphone est en 64 bits : app droidinfo

* [Téléchager ce dépot sur le smartphone](https://github.com/jancelin/geopoppy_android/archive/master.zip) et le décompresser dans un dossier geopoppy à la racine de l'utilisateur (à créer avant).

* [télécharger l'image](https://github.com/jancelin/geopoppy_android/releases/download/geopoppy_android_0.2/geopoppy0_2-debian-rootfs.tar.gz)

* installer app connectBot

* installer app userland et ouvrir

* aller dans l'onglet systèmes de fichiers et compléter (adapter en fonction de la version téléchargée)

![adapter1](https://github.com/jancelin/geopoppy_android/blob/master/image/Screenshot_20190522-132931.png)

* aller dans sessions et compléter

![adapter2](https://github.com/jancelin/geopoppy_android/blob/master/image/Screenshot_20190522-132959.png)

* cliquer sur la session créée

* userland propose d'ouvrir connectbot, valider

* saisir le mot de passe session: 12345678

* Lancer le script de démarrage :

```sh /sdcard/geopoppy/conf/start.sh```

* attendre que ngninx, PHP, postgres et qgis server soit démarrés ( qgis reste en log debug), Ne Pas fermer la session !

* ouvrir firefox et adresse:

http://localhost:2080/lizmap
