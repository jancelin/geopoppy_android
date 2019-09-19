;<?php die(''); ?>
;for security reasons , don't remove or modify the first line


[modules]
wps.access=2

[wps]
wps_rootUrl=127.0.0.1:8081/wps/
ows_url=127.0.0.1:8080/ows/
wps_rootDirectories="/storage/internal/geopoppy/qgis"
redis_host=127.0.0.1
redis_port=6379
redis_db=1
redis_key_prefix=wpslizmap

[urlengine]
;checkHttpsOnParsing=
;forceProxyProtocol=
;domainName=
;basePath=
;backendBasePath=



[coordplugins]
lizmap=lizmapConfig.ini.php
