<p>Ce répertoire doit permettre de suivre la personnalisation de Wikibase docker depuis la configuration initiale  wdme9 </p>
<pre><code>MediaWiki 1.37 
Databases: mariadb:10.9
</code></pre>

<p>basée sur les images <a href="https://hub.docker.com/r/wikibase/wikibase-bundle/tags" title="Docker Hub">https://hub.docker.com/r/wikibase/wikibase-bundle/tags</a></p>
<pre><code>wikibase-bundle:1.37.6-wmde.9
</code></pre>

<p>et <a href="https://hub.docker.com/_/mariadb/tags" title="mariadb">https://hub.docker.com/_/mariadb/tags</a></p>
<pre><code>mariadb:10.9
</code></pre>

<p>Voir l'allocateur de mémoire :</p>
<pre><code>MariaDB [(none)]&gt; SHOW VARIABLES LIKE 'version_malloc_library';
+------------------------+------------------------------------------------------------+
| Variable_name          | Value                                                      |
+------------------------+------------------------------------------------------------+
| version_malloc_library | jemalloc 5.2.1-0-gea6b3e973b477b8061e0076bb257dbd7f3faa756 |
+------------------------+------------------------------------------------------------+
1 row in set (0.001 sec)
</code></pre>

Environnement : 

VM Ubuntu Server 22.04 LTS
 
8 vcores, 6 GB RAM

Docker Version 20.10.21

Docker Compose Version V2.14.0

Modifications de /etc/sysctl.conf (999 = groupid de mysql)

    vm.swappiness=1
	vm.hugetlb_shm_group=999
	vm.nr_hugepages=393
	fs.aio-max-nr=524288


Attention à bien modifier les valeurs du .env :  
WIKIBASE_URL_PUBLIQUE=www.fichier-entites.fr  
WIKIBASE_SCHEME=https  


Pour lancer Wikibase :  
sudo docker-compose -f docker-compose.yml -f docker-compose.extra.yml up -d  

Pour l’arrêter (avec WDQS) et supprimer les données de MariaDB :    
sudo docker-compose -f docker-compose.yml -f docker-compose.extra.yml down --volumes --remove-orphans    
sudo rm -fr volume_mysql/*  


[![](https://docs.google.com/drawings/d/e/2PACX-1vTMQu7OBaHg4f860AuCXSrhflxtFj5QXPD6nHWosEYLcVyILpyDS3hMcXZZgXWPj2z7gAutHRUHWz2n/pub?w=859&h=554)](https://docs.google.com/drawings/d/13AarshJKrtwH6Os5OPT__RXS_cfp4SKtkzeWBlA6nhY/edit?usp=sharing)


