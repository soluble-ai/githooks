#!/bin/bash

dir="$(dirname ${0})"
catnoshebang() {
  catfile="${1}"
  while read -r line; do
    [[ "${line}" =~ ^#\!.*$ ]] && continue
    echo "${line}"
  done < "${catfile}"
}

# pre-commit
file="${dir}/../app/pre-commit"
rm -f "${file}" || true
touch "${file}"
cat "${dir}/common/install.sh" >> "${file}"
catnoshebang "${dir}/common/secrets.sh" >> "${file}"
catnoshebang "${dir}/app/dep-scan.sh" >> "${file}"
catnoshebang "${dir}/app/image-scan.sh" >> "${file}"
chmod +x "${file}"


