#!/bin/bash

EXTERNAL_ADDRESS = $(curl http://ipecho.net/plain)

if [ -e "cached" ]; then
  CACHED_ADDRESS = $(cat cached)
else
  CACHED_ADDRESS = "UNCACHED"
fi

if [[ "x$EXTERNAL_ADDRESS" != "x$CACHED_ADDRESS" ]]; then
  echo -n $EXTERNAL_ADDRESS > cached
fi

git commit -a -m "update external ip address from $CACHED_ADDRESS to $EXTERNAL_ADDRESS"
git push origin master
