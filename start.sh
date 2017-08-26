#! /bin/bash

usage () {
    cat <<EOF
Usage: $0 [options...]
Mainly runs a Docker container with Node.js 
  -h     print this help

 $0 jasmine [options]     runs jasmine [options]
 $0 bash [options]        runs bash [options]
 $0 node [options]        runs node [options]
 $0 [options]             runs node [options]

EOF
}

case "$1" in
    jasmine)
        shift
        exec /usr/local/lib/node_modules/.bin/jasmine "$@"
        ;;
    bash)
        shift
        export PATH=${PATH}:/usr/local/lib/node_modules/.bin
        export PS1='MoocJS> '
        exec bash "$@"
        ;;
    -h|--help)
        usage
        exit 1
        ;;
    node)
        shift
        exec "$@"
        ;;
    *)
        shift
        exec node "$@"
        ;;
esac

# end of start.sh
