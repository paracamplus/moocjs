#! /bin/bash

usage () {
    local PRG='docker run paracamplus/moocjs'
    cat <<EOF
Usage: $PRG [options...]
Mainly runs a Docker container with Node.js 
  -h     print this help

 $PRG jasmine [options]   runs jasmine [options]
 $PRG bash [options]      runs bash [options]
 $PRG npm [options]       runs npm [options] #within /usr/local/lib/node_modules
 $PRG node [options]      runs node [options]
 $PRG [options]           runs node [options]

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
    npm)
        shift
        cd /usr/local/lib/node_modules/
        exec npm "$@"
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
