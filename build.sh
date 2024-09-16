#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd -P)
BUILD_PATH="$SCRIPT_PATH/build"
BUNDLE_PATH="$BUILD_PATH/app/outputs/bundle/release/app-release.aab"
APK_PATH="$BUILD_PATH/app/outputs/apk/release/app-release.apk"
SYMBOLS_PATH="$BUILD_PATH/app/intermediates/merged_native_libs/release/out/lib/"

# Pega o pubspec.yaml e extrai a versão do app
APP_VERSION=$(grep 'version:' $SCRIPT_PATH/pubspec.yaml | awk '{print $2}')
APP_VERSION_NAME=$(echo $APP_VERSION | awk -F '+' '{print $1}')
APP_VERSION_CODE=$(echo $APP_VERSION | awk -F '+' '{print $2}')


ENV_FILE="$SCRIPT_PATH/env.prod.json"

# Verifica se o arquivo 'env.json' existe
if [ ! -f $ENV_FILE ]; then
    echo "Arquivo ${ENV_FILE} não encontrado."
    exit 1
fi

# Executa o comando flutter para criar o appbundle
flutter build appbundle --release --dart-define-from-file=${ENV_FILE}
flutter build apk --release --dart-define-from-file=${ENV_FILE}

# Verifica se o appbundle foi criado com sucesso
if [ $? -eq 0 ]; then
    echo "Appbundle criado com sucesso!"

    # copia os binários para a pasta raiz de 'build'
    cp $BUNDLE_PATH $BUILD_PATH
    cp $APK_PATH $BUILD_PATH

    # Zipa o conteúdo de './build/app/intermediates/merged_native_libs/release/out/lib/'
    # e gera 'symbols.zip'
    (cd $SYMBOLS_PATH && zip -r $BUILD_PATH/symbols.zip ./*)

    echo "Operações concluídas!"
    echo "Arquivos gerados:"
    echo "  - app-release.aab"
    echo "  - app-release.apk"
    echo "  - symbols.zip"
    echo "Versão do app: $APP_VERSION_NAME ($APP_VERSION_CODE)"
    exit 0
else
    echo "Falha ao criar o appbundle."
    exit 1
fi
