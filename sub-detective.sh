#/bin/bash

## Save path of how this script was invoked
MYDIRNAME=$( dirname $0 )

echo "## Details from subscription manager:"
subscription-manager identity
echo ""

echo "## Details from configs and certs:"

    echo -n "RHSM Config (Server ID): "
    SERVERID=$( grep '^\s*hostname' /etc/rhsm/rhsm.conf | awk '{print $3}' )
    echo "${SERVERID}"

    echo -n "RH Release Version: "
    RELEASE=$( grep -i version_id /etc/os-release | sed -e 's/.*"\(.*\)".*/\1/' )
    echo "${RELEASE}"

    echo -n "Cert Info (Host ID): "
    HOSTID=$( openssl x509 -noout -subject -in /etc/pki/consumer/cert.pem -nameopt multiline | awk -F' = ' '/commonName/ {print $2}' )
    echo "${HOSTID}"

    echo -n "Cert Info (Start Date): "
    STARTDATE=$( openssl x509 -noout -startdate -in /etc/pki/consumer/cert.pem | sed -e 's/^.*=\s*//' )
    echo "${STARTDATE}"

    echo -n "Cert Info (End Date): "
    ENDDATE=$( openssl x509 -noout -enddate -in /etc/pki/consumer/cert.pem | sed -e 's/^.*=\s*//' )
    echo "${ENDDATE}"

echo ""



if [[ ${SERVERID} == *"rhsm.redhat.com"* ]]; then

    echo "## Details from redhat.com:"

    if [[ ${RELEASE} =~ 7.* ]]; then
        curl -s \
             --key /etc/pki/consumer/key.pem \
             --cert /etc/pki/consumer/cert.pem \
             --cacert /etc/rhsm/ca/redhat-uep.pem \
             https://${SERVERID}/subscription/consumers/${HOSTID} | /bin/python2 ${MYDIRNAME}/sub-detective-jfilter.py

    else
        curl -s \
             --key /etc/pki/consumer/key.pem \
             --cert /etc/pki/consumer/cert.pem \
             --cacert /etc/rhsm/ca/redhat-uep.pem \
             https://${SERVERID}/subscription/consumers/${HOSTID} | ${MYDIRNAME}/sub-detective-jfilter.py
    fi

else
    echo "## TBD - probably registered to a satellite"
fi
