#!/usr/bin/env bash

chmod +x ~/.vnc/xstartup

openssl req \
	-x509 \
	-newkey rsa:4096 \
	-keyout ~/.vnc/key.pem \
	-out ~/.vnc/cert.pem \
	-days 900 \
	-nodes \
	-subj '/C=US/ST=Nowhere/L=Somewhere/O=Global Security/OU=IT Department/CN=example.com'

emacs --daemon

vncserver &

sleep 300000000000000
