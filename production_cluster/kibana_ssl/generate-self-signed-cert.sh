#!/bin/bash

set -euo pipefail

readonly _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly PRIVATE_KEY='key.pem'
readonly CERTIFICATE='cert.pem'
readonly DAYS=365

cd "${_dir}"

if [[ -s "${PRIVATE_KEY}" ]] && [[ -s "${CERTIFICATE}" ]]; then
    printf "Certificate already exists\n"
    exit
else
    openssl req \
        -x509 \
        -batch \
        -nodes \
        -days "${DAYS}" \
        -newkey rsa:4096 \
        -sha512 \
        -keyout "${PRIVATE_KEY}" \
        -out "${CERTIFICATE}"
fi
