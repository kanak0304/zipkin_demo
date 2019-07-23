#!/bin/bash
set -e


#for f in $(find . -name pom.xml);do
# pushd $(dirname $f);
# ./mvnw clean package -DskipTests=true
# popd
#done

for f in $(find . -name manifest.yml| tail -4);do
 pushd $(dirname $f);
 cf push -f $f;
 popd
done
