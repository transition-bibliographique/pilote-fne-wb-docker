<p>Ce répertoire doit permettre de suivre la personnalisation de Wikibase docker depuis la configuration initiale wmde9 </p>
<pre><code>MediaWiki 1.37
</code></pre>

<p>basée sur les images <a href="https://hub.docker.com/r/wikibase/wikibase-bundle/tags" title="Docker Hub">https://hub.docker.com/r/wikibase/wikibase-bundle/tags</a></p>
<pre><code>wikibase-bundle:1.37.6-wmde.9
</code></pre>

<p>et <a href="https://hub.docker.com/r/mysql/mysql-server/tags" title="mariadb">https://hub.docker.com/r/mysql/mysql-server/</a></p>
<pre><code>mysql/mysql-server:8.0.32-amd64
</code></pre>


Environnement : 

VM Ubuntu Server 22.04 LTS
 
8 vcores, 6 GB RAM

Docker Version 20.10.21

Docker Compose Version V2.14.0

Modifications de /etc/sysctl.conf

    vm.swappiness=1
	fs.aio-max-nr=524288


Attention à bien modifier les valeurs du .env :  
<pre><code>
WIKIBASE_URL_PUBLIQUE=www.fichier-entites.fr  
WIKIBASE_SCHEME=https
</code></pre>

Modifier les droits des fichiers suivants une fois le dépôt cloné : 
<pre><code>
sudo chmod -R 755 conf.d
sudo chmod 0444 conf.d/my.cnf  
sudo chmod 777 LocalSettings.php 
</code></pre>

Pour lancer Wikibase :
<pre><code>
sudo docker-compose -f docker-compose.yml -f docker-compose.extra.yml up -d  
</code></pre>

Pour l’arrêter (avec WDQS) et supprimer les données de MySQL :  
<pre><code>
sudo docker-compose -f docker-compose.yml -f docker-compose.extra.yml down --volumes    
sudo rm -fr volume_mysql/*  
</code></pre>


Pour dumper les données :
<pre><code>
sudo docker exec pilote-fne-mysql sh -c 'exec mysqldump -u sqluser -pchange-this-sqlpassword my_wiki' > backup.sql
</code></pre>

Pour restorer un dump :
<pre><code>
sudo docker exec -i pilote-fne-mysql sh -c 'exec mysql -u sqluser -pchange-this-sqlpassword my_wiki' < backup.sql
</code></pre>

[![](https://docs.google.com/drawings/d/e/2PACX-1vTMQu7OBaHg4f860AuCXSrhflxtFj5QXPD6nHWosEYLcVyILpyDS3hMcXZZgXWPj2z7gAutHRUHWz2n/pub?w=859&h=554)](https://docs.google.com/drawings/d/13AarshJKrtwH6Os5OPT__RXS_cfp4SKtkzeWBlA6nhY/edit?usp=sharing)


