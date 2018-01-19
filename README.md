# zclassiccore-docker
Docker Repo for Zclassic

## Usage Instructions

**Mandatory Requirement**: Must use a local mount volume and config file.

Example:

```
sudo docker run --name=zclassic-docker-container --rm -it -v /Users/ajay/projects/zclassic:/opt/zclassiccore -p 127.0.0.1:16332:8023 zclassic
```

**Config file is read from**: `/opt/zclassiccore/zclassic.conf`, i.e., `/path/to/local/zclassiccore/dir/zclassic.conf`

##Storing of Data

You can store data within `/opt/zclassiccore/data` or any directory within `/opt/zclassiccore`.

This will inturn store your data within `/path/to/local/zclassiccore/dir` described above.

Hence, to store within a different local dir, create a hard symlink for any other directory inside `/path/to/local/zclassiccore/dir` and then use that directory as `datadir` in `zclassic.conf`

###Example

If your host directory is `/usr/local/zclassiccore` and want to store data in `/var/zclassiccore`, do the following:

```
mkdir -p /usr/local/zclassiccore
mkdir -p /var/zclassiccore
ln -s /var/zclassiccore /usr/local/zclassiccore/data
```

and use `/opt/zclassiccore/data` as your data dir inside `zclassic.conf`

```
#zclassic.conf
datadir=/opt/zclassiccore/data
```
##Based on:
https://github.com/kp666/dashcore-docker
