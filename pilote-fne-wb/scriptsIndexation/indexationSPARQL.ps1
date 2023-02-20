

$containerWikibase = "pilote-fne-wikibase"
$containerWDQS = "pilote-fne-wdqs"
$containerWDQSUpdater = "pilote-fne-wdqs-updater"

Write-Output "Indexation WDQS / SPARQ"

$current = [System.DateTime]::Now

docker exec $containerWikibase bash -c 'php extensions/Wikibase/repo/maintenance/dumpRdf.php --server http://${WIKIBASE_HOST} | gzip > MyWiki.ttl.gz'
docker cp ${containerWikibase}:/var/www/html/MyWiki.ttl.gz .
docker cp MyWiki.ttl.gz ${containerWDQS}:/wdqs
docker exec $containerWDQS bash -c 'rm /wdqs/data/*'
docker stop $containerWDQSUpdater
docker restart $containerWDQS
docker exec $containerWDQS bash -c 'curl http://${WDQS_HOST}:${WDQS_PORT}/bigdata/namespace/wdq/sparql --data-urlencode """update=LOAD <file:///wdqs/MyWiki.ttl.gz>;"""'
docker start $containerWDQSUpdater

$end= [System.DateTime]::Now

$diff= $end.Subtract($current)

Write-Output "Le temps d'execution est : $diff"