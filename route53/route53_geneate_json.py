#!/usr/bin/env python
##-------------------------------------------------------------------
## @copyright 2017 DennyZhang.com
## Licensed under MIT
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: route53_geneate_json.py
## Author : Denny <contact@dennyzhang.com>
## Description :
## --
## Created : <2017-10-31>
## Updated: Time-stamp: <2017-10-31 16:36:41>
##-------------------------------------------------------------------
import argparse

def generate_new_file(json_tmpl_file, target_file, cname, value):
    target_f = open(target_file, 'w')
    with open(json_tmpl_file,'r') as f:
        for row in f:
            if "\"Name\":" in row:
                row = "                \"Name\": \"%s\",\n" % (cname)
            if "\"Value\":" in row:
                row = "                      \"Value\": \"%s\"\n" % (value)
            target_f.write(row)
        target_f.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--cname', required=True, help="DNS CNAME to delete", type=str)
    parser.add_argument('--value', required=True, help="DNS value", type=str)
    parser.add_argument('--json_file', required=True, help="json file", type=str)
    l = parser.parse_args()
    generate_new_file("aws_dns_tmpl.json", l.json_file, l.cname, l.value)
## File: route53_geneate_json.py ends
