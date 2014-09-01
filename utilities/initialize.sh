#!/bin/sh +e

base=/opt/openldap/openldap-latest
mkdir -p /storage/configuration
$base/sbin/slaptest -d 256 -f $base/etc/openldap/slapd.conf -F /storage/configuration
