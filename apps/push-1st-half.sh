#!/bin/bash
set -e

for f in $(find . -name manifest.yml| head -5);do
 pushd $(dirname $f);
 cf push -f $f;
 popd
done
