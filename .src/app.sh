#!/bin/sh

dir="$(dirname ${0})"
catnoshebang() {
  file="${1}"
  while read -r line; do
    [[ "${line}" =~ ^#\!.*$ ]] && continue
    echo "${line}"
  done < "${file}"
}

# pre-commit
file="${dir}/../app/pre-commit"
rm -f "${file}" || true
touch "${file}"
cat "${dir}/common/install.sh" >> "${file}"
catnoshebang "${dir}/common/secrets.sh" >> "${file}"
chmod +x "${file}"


