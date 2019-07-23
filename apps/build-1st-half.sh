#!/bin/bash
set -e

for f in $(find . -name pom.xml | head -5);do
 pushd $(dirname $f);
 ./mvnw clean package -DskipTests=true
 popd
done
