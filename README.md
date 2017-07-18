# Docker support for Guild AI

This project is a preliminary implementation of Docker image/container
support for Guild AI. It is currently structured to build from Guild
source (see https://github.com/guildai/guild) and generates a local
Docker image. Operations are defined in `Makefile`.

## Preparation

Clone both the Guild source and this Docker project:

```
$ git clone https://github.com/guildai/guild.git
$ git clone https://github.com/guildai/guild-docker.git
```

## Creating Docker image

Change into the Docker project and run `make`:

```
$ cd guild-docker
$ make VERSION=XXX
```

where `XXX` is the version of Guild to generate. This value should
correspond to the current working code in the Guild source project. If
you are on an untagged commit in the Guild source, use a shortened
version of the git commit.

This command will create a release of Guild using the specified
version and then create the Docker image.

## Running Guild from the Docker image

In the Docker project, run:

```
$ make run
```

This will start the Docker container for Guild and attach your
console. From there you can run Guild commands.

For example, to train the MNIST example:

```
$ git clone https://github.com/guildai/guild-examples.git
$ cd guild-examples/mnist2
$ guild prepare
$ guild train
```

## Opening another bash session to the Docker container

To open another bash session in an running container, run:

```
$ make attach
```

From this session you can run other Guild commands such as `guild
view`.

## Stopping a container

Simply exit from all connected sessions to stop the container. Note
that this will not delete the container. To delete a stopped container
you must use `docker rm CONTAINER-ID`. Use `docker ps -a` to list all
containers along with their IDs.

## Starting a stopped container

To start a stopped container, run:

```
$ make start
```
