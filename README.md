# MoocJS

`moocjs` is a Docker container that runs node.js, it contains the npm
modules needed by the exercises proposed in the "Diffuse JavaScript"
MOOC.

## Building MoocJS

If you want to rebuild that container, the sources are held on
[GitHub](https://github.com/paracamplus/moocjs). The container itself
is stored on Docker Hub under name `paracamplus/moocjs`.

## Running MoocJS

There is more than one way to run the `moocjs` Docker container. The
next command will run the container in the current directory where it
starts an interactive Read-Eval-Print loop:

``` sh
docker run --rm -it -v $(pwd):/usr/src/app paracamplus/moocjs -p -i
```

The `--rm` flag will remove the container after exit.
The `-it` flag tells Docker to run interactively.
The `-v $(pwd):/usr/src/app` mounts the current directory in the current
directory of the container where node will be run. 

Options `-p` and `-i` are for Node.js, `-i` starts the REP loop, `-p`
prints the results.

Here are some example using other options:

``` sh
docker run --rm -v $(pwd):/usr/src/app paracamplus/moocjs jasmine
docker run --rm -v $(pwd):/usr/src/app paracamplus/moocjs jasmine spec/test1-spec.js

```

This command will run jasmine on all tests of the current `spec/`
sub-directory. The second command run jasmine on a single test file.

``` sh
docker run --rm paracamplus/moocjs bash
```

This command will start a bash interpreter in the `/usr/src/app/`
empty directory within the container. It allows to explore the content
of the Docker container.

And finally 

``` sh
docker run --rm paracamplus/moocjs -h
```

To print the usage documentation of the container.

