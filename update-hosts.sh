#!/bin/bash
source config.rc
URL="https://raw.githubusercontent.com/$_USERNAME/$_PROJECT/master/cached"
EXTERNAL_ADDRESS=$(curl -s $URL -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,zh-CN;q=0.6,zh-TW;q=0.4' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' --compressed)
if [[ "xNot Found" != "x$EXTERNAL_ADDRESS" && "x" != "x$EXTERNAL_ADDRESS" ]]; then
  echo -e "$(grep -v $_DOMAIN /etc/hosts)\n$EXTERNAL_ADDRESS\t$_DOMAIN" > /tmp/hosts
  sudo mv /tmp/hosts /etc/hosts
fi
