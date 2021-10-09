FROM haskell:9.0.1-stretch

ENV dir /usr/src/app
WORKDIR ${dir}

COPY src ${dir}/src
