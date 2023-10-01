set -x

apt-get update
apt-get upgrade -y
apt-get install -y git ssh-client ssh-server

ls ~/.ssh/id_rsa.pub || ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""
rm -rf noria || true # rust does not track C++ ffi correctly and git submodule suck. just recompile everytime.
git clone git@github.com:MarisaKirisame/noria.git
meow
