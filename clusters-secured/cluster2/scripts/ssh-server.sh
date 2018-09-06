#!/bin/bash
HOSTNAME=$(hostname -f)
ALIAS=$HOSTNAME
KEYSTORE=hdp2key.jks
TRUSTSTORE=hdp2trust.jks
CERTIFICATE=hdp2cert.cer
PASSWORD=password
STORE_PASSWORD=password
KEY_PASSWORD=$STORE_PASSWORD

mkdir /etc/security/serverKeys /etc/security/clientKeys
cd /etc/security/serverKeys

keytool -genkey -keyalg RSA -alias $ALIAS -keystore $KEYSTORE -storepass $STORE_PASSWORD -validity 360 -dname "CN=$HOSTNAME,OU=Engineering,O=Cloudera,L=PaloAlto,ST=California,C=US" -keysize 2048 -keypass $KEY_PASSWORD
keytool -export -keystore $KEYSTORE -alias $ALIAS -file $CERTIFICATE -storepass $STORE_PASSWORD
keytool -import -file $CERTIFICATE -alias $ALIAS -keystore $TRUSTSTORE -storepass $STORE_PASSWORD -noprompt