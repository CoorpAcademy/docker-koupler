#!/bin/bash

docker run --rm -it -v ~/.aws:/root/.aws koupler \
       ./koupler.sh -consumer -streamName bricklane-staging \
  | sed -n 's/^\[DEBUG\] [0-9:, -]* [A-Za-z. ]* - Received \(.*\)$/\1/p' \
  | jq -c '.[]'

