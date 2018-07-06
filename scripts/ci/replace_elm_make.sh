#!/usr/bin/env bash
# replace normal elm-make with sysconfcpus-prefixed elm-make
# epic build time improvement - see https://github.com/elm-lang/elm-compiler/issues/1473#issuecomment-245704142
set -euo pipefail
ncore=${1:-1}
if ! grep "sysconfcpus -n ${ncore}" "$(npm bin)/elm-make"; then
  if [ ! -f "$(npm bin)/elm-make-old" ]; then
    mv "$(npm bin)/elm-make" "$(npm bin)/elm-make-old"
  fi
  cat << EOF > "$(npm bin)/elm-make"
#!/usr/bin/env bash
set -eu
echo "Running elm-make with sysconfcpus -n ${ncore}"
$(pwd)/sysconfcpus/bin/sysconfcpus -n ${ncore} "$(npm bin)/elm-make-old" "\$@"
EOF
  chmod +x "$(npm bin)/elm-make"
fi
