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