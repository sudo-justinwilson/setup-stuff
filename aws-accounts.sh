#!/bin/bash

# author: Justin Wilson justin.wilson@melbourneit.com.au
# description: a helper to loop through the profiles that are available in ~/.aws/config.

CONFIG_PATH="${HOME}/.aws/config"

PROFILES=$(egrep "^\[.*\]$" ${CONFIG_PATH} | egrep "([[:alnum:]]|\-)*" -o)


ARGS=${*}

usage()
{
    echo "This script loops through the available profiles in ~/.aws/config and executes the awscli command for"
    echo "profile."
    echo "E.G:  if you wanted to get a list of each load-balancer for every profile you have in ~/.aws/config,
                you could use the following:"
    echo "$(basename ${0}) elbv2 describe-load-balancers"
    echo "  the above command would be executed for each profile using the \"--profile\" flag."
    echo "$(basename ${0}) usage:"
    echo "$(basename ${0}) --awscli-subcommand --parameter1 [--parameterN..]"
    echo
}

if [[ ${#} < 1 ]]; then
    usage;
fi

# execute command for each AWS profile:
for p in $PROFILES; do
    /usr/bin/aws ${*} --profile ${p};
done
