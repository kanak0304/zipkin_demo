# How deploy Zipkin on Cloud Foundry

```
export SPACE_NAME=CHANGEME
export APP_NAME=CHANGEME
export APPS_DOMAIN=apps.pas-g.kanlab.jp
export APP_PORT=9411

cf create-route ${SPACE_NAME} ${APPS_DOMAIN} --hostname ${APP_NAME}
cf push ${APP_NAME} --docker-image openzipkin/zipkin --no-route --no-start -m 512m

export APP_GUID=$(cf app ${APP_NAME} --guid)
export HTTP_ROUTE_GUID=$(cf curl /v2/routes?q=host:${APP_NAME} | jq -r .resources[0].metadata.guid)
cf curl /v2/apps/${APP_GUID} -X PUT -d "{\"ports\": [${APP_PORT}]}"
cf curl /v2/route_mappings -X POST -d "{\"app_guid\": \"${APP_GUID}\", \"route_guid\": \"${HTTP_ROUTE_GUID}\", \"app_port\": ${APP_PORT}}"

cf start ${APP_NAME}
```
