#!/bin/bash

set -eu

bosh create-env bosh-deployment/bosh.yml \
    --state=./creds/state.json \
    --vars-store=./creds/creds.yml \
    -o bosh-deployment/openstack/cpi.yml \
    -v director_name=bosh-director \
    -v internal_cidr=192.168.100.0/22 \
    -v internal_gw=192.168.100.1 \
    -v internal_ip=192.168.100.6 \
    -v auth_url=$OS_AUTH_URL \
    -v az=nova \
    -v default_key_name=pcf \
    -v default_security_groups=[opsmanager] \
    -v net_id=fddf4012-e26e-4512-8d80-319681948582 \
    -v openstack_password=$OS_PASSWORD \
    -v openstack_username=$OS_USERNAME \
    -v openstack_domain=$OS_USER_DOMAIN_NAME \
    -v openstack_project=$OS_PROJECT_NAME \
    -v private_key=../creds/pcf.pem \
    -v region=$OS_REGION_NAME