#!/bin/bash

containerWikibase="pilote-fne-wikibase"

echo "Indexation Elastic Search"

current=$(date +"%s")

sudo docker exec $containerWikibase bash -c 'php extensions/CirrusSearch/maintenance/ForceSearchIndex.php --skipLinks –indexOnSkip'
sudo docker exec $containerWikibase bash -c 'php extensions/CirrusSearch/maintenance/ForceSearchIndex.php –skipParse'
sudo docker exec $containerWikibase bash -c 'php maintenance/runJobs.php'

end=$(date +"%s")

diff=$((end-current))

echo "Le temps d'execution est : $diff"