#!/bin/python3

import sys, json;

data = json.load(sys.stdin)

## For debug purposes, uncomment to pretty-dump the json data
## print(json.dumps(data,sort_keys=True, indent=4))

for d in data:

    if ( d == "uuid" or
         d == "name" or
         d == "username" or
         d == "created" ):

        print(d,":",data[d])
