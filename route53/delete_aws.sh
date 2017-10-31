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
## Updated: Time-stamp: <2017-10-31 16:23:26>
##-------------------------------------------------------------------
set -e

cname="mytest.abc.com."
dns_value="fake.test.ai"
python route53_geneate_json.py --cname "$cname" --value "$dns_value"
## File: hello ends
