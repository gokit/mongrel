# Mongrel
Mongrel is a MongoDB docker image created for building containers running internal mysql servers with docker using the [Alpine](https://hub.docker.com/_/alpine/) image as the base. The [dockerfile](./dockerfile) is written in a format to be base dockerfile for 
another project. It does not execute mysql on start but lays the foundation for you to have a quick start for one.

## Binary

The dockerfile creates a binary file `bootmgo` in `/bin/` which starts mysql with relation to provided parameters.

## Build

To build just run the following:

```go
make build
```

## Push
To push just run the following after ensuring docker credentials for 
docker repository is set:

```go
make push
```

## Run

To run the docker image built using the docker file:

- To run as a non-deamon:

```bash
docker run -it ${image_name} bootmgo
```

- To run as a deamon:

```bash
docker run -it ${image_name} bootmgo --fork
```

## Configuration

See configuration file for customization in [Conf](./conf/mongodb.cnf)

## Parameters

The parameters below help define and indicate areas which can be set at lunch of 
mysql binary to provide user wanted values for the server.

- MongoDB Port (Default: `27017`)
	- Environment Variable: `MONGODB_PORT`

## Data Files

The database when started would attempt to store all data files within `/mnt/db/mongodb`, which 
allows you to customly mount the underline filesystem of the server wheere the container of this 
image would be executed to ensure files are stored within the host and not the container.

