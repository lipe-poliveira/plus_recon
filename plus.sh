#!/bin/bash

# Verifica se o número de argumentos está correto
if [ "$#" -ne 2 ]; then
  echo "Uso: $0 -d target.com"
  exit 1
fi

# Obtenha o domínio alvo
while getopts "d:" flag; do
  case "${flag}" in
    d) target_domain=${OPTARG};;
  esac
done

# Verifica se o diretório de trabalho existe e se não, cria-o
worklist="worklist"
if [ ! -d "$worklist" ]; then
  mkdir -p "$worklist"
fi

# Lista de arquivos de palavra
wordlist_files=("partaa" "partab" "partac" "partad" "partae" "partaf" "partag" "partah" "partai" "partaj" "partak" "partal" "partam" "partan" "partao" "partap" "partaq")

# Loop para executar o ffuf com cada lista de palavras
for wordlist in "${wordlist_files[@]}"; do
  ffuf_command="ffuf -u 'https://FUZZ.$target_domain' -w $worklist/$wordlist | anew recon_domain"
  eval "$ffuf_command"
done

# Extrai o primeiro campo (nome do host) e cria o arquivo "clean"
grep -oE "^\w+" recon_domain | sed "s/^/&.$target_domain/" > clean

echo "Reconhecimento concluído e os resultados estão em 'clean'."

