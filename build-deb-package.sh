#!/bin/sh
timestamp=$( date +%s);
comment=$(git log -1)
version=$(mvn help:evaluate -Dexpression=project.version|grep -Ev '(^\[|Download\w+:)')
newVersion="$version$timestamp";
newVersion=$(echo $newVersion | sed s/-SNAPSHOT/+SNAPSHOT/g)
dch --force-distribution --package geolift -D ldstack-nightly -v $newVersion "$comment"
comment="$(echo "$comment"|tr -d '\n')"
sed -i "1s/^/ * $comment\n/" debian/CHANGES.txt
mvn versions:set -DnewVersion=$newVersion 
mvn clean install -DskipTests -Pdebpackage
mvn versions:set -DnewVersion=$version 
