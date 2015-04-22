#!/bin/bash
#echo "Nginx replace ENV ..."

for env in $(printenv); do
    IFS== read KEY VALUE <<< "$env"
    sed "s,\${${KEY}},${VALUE},g" -i /etc/nginx/sites-enabled/default
    #echo "${KEY} => ${VALUE}";
done;

# replace value with variable
for env in $(printenv); do
    IFS== read KEY VALUE <<< "$env"
    sed "s,\${${KEY}},${VALUE},g" -i /etc/nginx/sites-enabled/default
    #echo "${KEY} => ${VALUE}";
done;

# http://symfony.com/doc/current/cookbook/configuration/external_parameters.html
for env in $(printenv); do
    IFS== read KEY VALUE <<< "$env"
    if [[ "${KEY}" == SYMFONY__* ]]; then
        export ${KEY}=$(eval echo '$'${VALUE})
    fi
done;

#exec cat /etc/nginx/sites-enabled/default
exec nginx;
