#!/usr/bin/env bash
set -eu
cwd=$(pwd)
if [ ! -d sysconfcpus/bin ]; then
  git clone https://github.com/obmarg/libsysconfcpus.git
  pushd libsysconfcpus
    ./configure --prefix="${cwd}/sysconfcpus"
    make && make install
  popd
fi
