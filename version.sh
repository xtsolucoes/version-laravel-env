#!/bin/bash

# Loja do local (desenvolvimento) .env arquivo no ambiente de desenvolvimento
LOCAL=.env

# obter o valor de hash git
CURRENT_GIT_HASH=$(git rev-parse --short HEAD)

# obter o novo número da versão da linha de comando
NEW_VERSION="$1"

# obter o número versão antiga do arquivo .env produção
OLD_VERSION=$(grep -P "^APP_VERSION=[0-9]+\.[0-9]+\.[0-9]+$" "$LOCAL" | grep -Po "([0-9]+\.[0-9]+\.[0-9]+)")

echo "Versao atual = $OLD_VERSION"

# verifica se o número da versão é válido
CHECK=$(echo "$NEW_VERSION" | grep -P "^[0-9]+\.[0-9]+\.[0-9]+$")

# temos um novo número da versão? em caso afirmativo, verificar para ver se ele mudou
if [ -n "$NEW_VERSION" ]; then

    # nós temos um número de versão válida? se não, que o usuário saiba
    if [ -z "$CHECK" ]; then
        echo "Número de versao  inválida: $NEW_VERSION"
    else

        echo "Efetuando deploy para versão: $NEW_VERSION ($CURRENT_GIT_HASH)"
        # atualizar o número da versão
        git fetch && git checkout -f $NEW_VERSION

        #atualizar a versao no .env
        sed -ri "s/APP_VERSION=[0-9]+\.[0-9]+\.[0-9]+/APP_VERSION=$NEW_VERSION/" "$LOCAL"

        # atualizar o número da hash no .env
        sed -ri "s/APP_HASH=[0-9a-f]+/APP_HASH=$CURRENT_GIT_HASH/" "$LOCAL"
    fi
fi

