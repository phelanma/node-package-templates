#!/bin/bash

dir_name="$1";

mkdir -p "$dir_name";

cd "$dir_name";

if hash npm 2>/dev/null; then
  npm init -f & pid="$!"
  wait "$pid"
else
  "skipping npm step...y u, no have node! go get it!! #JS-FL"
fi

if hash readme 2>/dev/null; then
  readme;
else
  echo "skipping readme step, to run this run $npm i -g readme"
fi

templates_dir="$HOME/.node-package-templates"

if [ -d "$templates_dir" ]; then

    ls "$templates_dir/default"
    cp -r "$templates_dir/default/".[^.]* ./
else
  echo "checkout github.com/phelanma/node-package-templates"
fi


