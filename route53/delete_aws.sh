#!/usr/bin/env bash
##-------------------------------------------------------------------
## @copyright 2017 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: hello
## Author : Denny <contact@dennyzhang.com>
## Description :
## --
## Created : <2017-10-31>
## Updated: Time-stamp: <2017-10-31 16:15:40>
##-------------------------------------------------------------------
set -e

python route53_geneate_json.py --cname "tenant888510delete83092.carol.ai." --value "bematech.carol.ai"
## File: hello ends
