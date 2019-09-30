#ubuntu
sudo apt-get update 
sudo apt-get install -y golang-go automake gcc git libglib2.0-dev libseccomp-dev libcap-dev build-essential systemd uidmap iptables curl
go get github.com/docker/cli/cmd/docker
go get -u -d github.com/docker/docker/cmd/dockerd

rm -vf ~/go/src/github.com/docker/docker/daemon/graphdriver/register/register_btrfs.go
rm -vf ~/go/src/github.com/docker/docker/daemon/graphdriver/register/register_devicemapper.go
cd ~/go/src/github.com/docker/docker/cmd/dockerd
go install

go get -u -d github.com/containerd/containerd/cmd/containerd
rm -vf ~/go/src/github.com/containerd/containerd/cmd/containerd/builtins_btrfs_linux.go
cd ~/go/src/github.com/containerd/containerd/cmd/containerd
go install
#---
go get github.com/rootless-containers/rootlesskit/cmd/rootlesskit
cd ~/go/src/github.com/rootless-containers/rootlesskit/cmd/rootlesskit
go install
go get github.com/rootless-containers/rootlesskit/cmd/rootlessctl
cd ~/go/src/github.com/rootless-containers/rootlesskit/cmd/rootlessctl
go install

git clone https://github.com/rootless-containers/slirp4netns
cd slirp4netns
./autogen.sh
./configure --prefix=/usr
make
make install
cd

~/go/src/github.com/docker/docker/contrib/dockerd-rootless.sh --experimental


#---------------------------
curl -sSL https://get.docker.com/rootless | SKIP_IPTABLES=1 sh

export XDG_RUNTIME_DIR=/tmp/docker-2000
export PATH=/home/moby/bin:$PATH
export DOCKER_HOST=unix:///tmp/docker-2000/docker.sock

/home/moby/bin/dockerd-rootless.sh --experimental --iptables=false --storage-driver vfs



#-----------
sudo apt-get install golang-go
