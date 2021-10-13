FROM clojure:openjdk-18-tools-deps-alpine

# Cache apk deps.
RUN apk --no-cache add \
# bb installer expects curl
    curl \
# install nbb
    npm \
# run cljs
    nodejs \
# clj alias requires rlwrap but alpine 3.14 doesn't have it.
#    rlwrap \
# cljs needs ws
  && true

# Get latest bb.
RUN curl -s https://raw.githubusercontent.com/babashka/babashka/master/install | bash

# Get latest nbb and ws for cljs.
RUN npm i -g ws nbb

ENV NODE_PATH=/usr/local/lib/node_modules
