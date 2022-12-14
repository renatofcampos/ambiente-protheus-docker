#!/usr/bin/env bash

set -e
set -x

# Configurando DBAccess
export DBACCESS_SERVER=${DBACCESS_SERVER:-${DBACCESS_PORT_7890_TCP_ADDR}}
export DBACCESS_ALIAS=${DBACCESS_ALIAS:-protheus}
export DBACCESS_PORT=${DBACCESS_PORT:-7890}

/bin/sed 's/{{DBACCESS_SERVER}}/'"${DBACCESS_SERVER}"'/'      -i /protheus/bin/appserver.ini
/bin/sed 's/{{DBACCESS_ALIAS}}/'"${DBACCESS_ALIAS}"'/'        -i /protheus/bin/appserver.ini
/bin/sed 's/{{DBACCESS_PORT}}/'"${DBACCESS_PORT}"'/'        -i /protheus/bin/appserver.ini

# Aguardando conectividade com o dbaccess
until echo -n > /dev/tcp/${DBACCESS_SERVER}/${DBACCESS_PORT}
do
    echo "Esperando serviço do dbaccess..."
    sleep 0.5
done

exec "/protheus/bin/appsrvlinux"
