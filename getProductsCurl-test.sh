#! /bin/bash
curl --header "Host: test.store.com" --header "\$WSSP: 80" -K /opt/IBM/WC/wcbd/deploy/server/$1 -o "/opt/IBM/WC/wcbd/deploy/server/$2" >/dev/null 2>&1