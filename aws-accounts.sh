#!/bin/bash

# description: a helper to loop through the profiles that are available in ~/.aws/config.

#CONFIG_PATH=/home/justinwilson/.aws/config
CONFIG_PATH="${HOME}/.aws/config"

PROFILES=$(egrep "^\[.*\]$" ${CONFIG_PATH} | egrep "([[:alnum:]]|\-)*" -o)


ARGS=${*}

usage()
{
    echo "      USAGE: $(basename ${0})"
    echo 
    echo "      This script loops through the available profiles in ~/.aws/config and executes the awscli command for"
    echo "      profile."
    echo "      E.G:  if you wanted to get a list of each load-balancer for every profile you have in ~/.aws/config,
                      you could use the following:"
    echo "      $(basename ${0}) elbv2 describe-load-balancers"
    echo "        the above command would be executed for each profile using the \"--profile\" flag."
    echo "      $(basename ${0}) usage:"
    echo "      $(basename ${0}) --awscli-subcommand --parameter1 [--parameterN..]"
    echo
}

if [[ ${#} < 1 ]]; then
    echo "Here are the available profiles:";
    for i in $PROFILES; do
        echo $i;
    done;
elif [[ ${#} = 1 && ${1} = '--help' ]]; then
    usage;
else
    for p in $PROFILES; do
        echo "Results for profile:  ${p}";
        /usr/bin/aws ${*} --profile ${p};
    done;
fi
