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
## Updated: Time-stamp: <2017-10-31 16:37:55>
##-------------------------------------------------------------------
# set -e
function log() {
    local msg=$*
    date_timestamp=$(date +['%Y-%m-%d %H:%M:%S'])
    echo -ne "$date_timestamp $msg\n"
    
    if [ -n "$LOG_FILE" ]; then
        echo -ne "$date_timestamp $msg\n" >> "$LOG_FILE"
    fi
}

# ./delete_aws.sh "my.domain.test." "./delete1.txt" "ZEFB94UUWPTCB"
dns_value=${1?}
cname_file=${2?}
host_zone_id=${3?}
json_file="aws_dns.json"
for cname in $(cat "$cname_file"); do
    log "Generate json for $cname, and delete the route53 CNAME record"
    python route53_geneate_json.py --cname "$cname" --value "$dns_value" --json_file "$json_file"
    # cat "$json_file"
    echo "aws route53 change-resource-record-sets --hosted-zone-id $host_zone_id --change-batch file://./$json_file"
    aws route53 change-resource-record-sets --hosted-zone-id "$host_zone_id" --change-batch file://./$json_file
done
## File: hello ends
