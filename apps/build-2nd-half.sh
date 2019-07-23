#!/bin/bash
set -e

for f in $(find . -name pom.xml | tail -4 );do
 pushd $(dirname $f);
 ./mvnw clean package -DskipTests=true
 popd
done
