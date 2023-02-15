<?php

# Obligé de mettre cette variable pour l'autocompletion
#$wgServer = 'https://www.fichier-entites.fr';
$wgServer = getenv('WIKIBASE_SCHEME') . "://" . getenv('WIKIBASE_URL_PUBLIQUE');

# Tentative pour modificer le conceptBaseUri qui fait planter wdqs_updater :
# Ne fonctionne pas car surpassé par  wgServer :
# https://phabricator.wikimedia.org/T244637
#$wgWBRepoSettings['conceptBaseUri'] = "http://www.fichier-entites.fr/entity/";


// disable language selection
#$wgHiddenPrefs[] = 'language';

// if you want to disable variants as well
$wgHiddenPrefs[] = 'variant';
$wgHiddenPrefs[] = 'noconvertlink';

#Pb avec le paramètre ci-dessous, ça bloque le pilote-fne-wb_pilote-fne-wdqs-updater_1 car ça donne des urls avec Spécial: au lieu de Special attendu...
#$wgLanguageCode = 'fr';

# Sert pour l'ordre d'affichage des statements
$wgWBRepoSettings['propertyOrderUrl'] = $wgServer . $wgScriptPath . "/index.php?title=MediaWiki:Wikibase-SortedProperties&action=raw&sp_ver=1";

# Sert pour afficher les exceptions de wikibase
$wgShowExceptionDetails = true;