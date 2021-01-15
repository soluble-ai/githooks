#!/bin/sh

dir="$(dirname ${0})"

# pre-commit
file="${dir}/../iac/pre-commit"
rm -f "${file}" || true
touch "${file}"
cat "${dir}/common/install.sh" >> "${file}"
chmod +x "${file}"
