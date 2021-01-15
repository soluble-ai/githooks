#!/bin/bash

dir="$(dirname ${0})"
catnoshebang() {
  catfile="${1}"
  while read -r line; do
    [[ "${line}" =~ ^#\!.*$ ]] && continue
    echo "${line}"
  done < "${catfile}"
}

# pre-push
file="${dir}/../iac/pre-push"
rm -f "${file}" || true
touch "${file}"
cat "${dir}/common/install.sh" >> "${file}"
catnoshebang "${dir}/common/secrets.sh" >> "${file}"
catnoshebang "${dir}/iac/iac-scan.sh" >> "${file}"
chmod +x "${file}"
