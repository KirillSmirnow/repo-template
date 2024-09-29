#!/usr/bin/env bash

TEMPLATE_SUFFIX=".template"

from="$1"
to="$2"

mkdir -p "$(dirname "$to")"

if [[ "$from" = *"${TEMPLATE_SUFFIX}" ]]; then
  to="$(dirname "$to")/$(basename "$to" "${TEMPLATE_SUFFIX}")"
  eval "echo \"$(cat "$from" | sed -r 's/"/\\"/g')\"" >"$to"
else
  cp "$from" "$to"
fi
