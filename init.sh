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

#exec cat /etc/nginx/sites-enabled/default
exec nginx;
