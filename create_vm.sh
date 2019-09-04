#!/bin/bash

#image centosbased 7.3

#Argumentos
# -n [nome da vm]
# -i [imagem]
# -g [grupo de recurso]
# -l [localização]
# -size [tamanho padrao D2_v2_Promo]
# -storage [STANDARD_LRS padrao]
# -auth-type [tipo de autenticação]
# -os-type []
# -admin user [admin]
# -admin passwd [senha]


if [[ $# == 0 ]]; then
    echo "Informe os argumentos"
    exit 1
fi

while [[ $# -ne 0 ]]; do

    arg=$1
    shift
    
    case "$1" in

        --n)
            VM_NAME=$1
            ;;

        --i)
            IMAGE=$1
            if [ -z ${IMAGE} ]; then
                IMAGE="Cent0S"
            else
                IMAGE=$1
            fi
            ;;

        --g)
            GROUP=$1
            ;;

        --l)
            LOCATION=$1
            if [ -z ${LOCATION} ]; then
                LOCATION="brazilsouth"
            else
                LOCATION=$1
            fi
            ;;

        --size)
            SIZE=$1
            if [ -z ${SIZE} ]; then
                SIZE="Standard_D2_v2_PROMO"
            else
                SIZE=$1
            fi
            ;;

        --storage)
            STORAGE=$1
            if [ -z ${STORAGE} ]; then
                STORAGE="Standard_LRS"
            else
                STORAGE=$1
            fi
            ;;

        --auth-type)
            AUTHENTICATION=$1
            if [ -z ${AUTHENTICATION} ]; then
                AUTHENTICATION="password"
                echo "Informe a senha:"
                read -s ADMIN_PASSWORD
            else
                AHTHENTICATION=$1
                echo "Informe a senha:"
                read -s ADMIN_PASSWORD
            fi
            ;;

        --os-type)
            OS=$1
            ;;

        --admin-name)
            ADM_NAME=$1
            if [ -z ${ADM_USER} ]; then
                ADM_NAME="user"
            else
                ADM_NAME=$1
            fi
    esac

done


az vm create --name ${VM_NAME} --resource-group ${GROUP} --i ${IMAGE} --location ${LOCATION} --size ${SIZE} --storage-sku ${STORAGE} --os-type ${OS} --admin-name ${ADMIN_NAME} --authentication-type ${AUTHENTICATION} --admin-password ${ADMIN_PASSWORD}
