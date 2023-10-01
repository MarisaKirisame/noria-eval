set -x
set -e

apt-get update
apt-get upgrade -y
apt-get install -y git ssh-client

cat ~/.ssh/id_rsa.pub || ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""

rm -rf noria || true # rust does not track C++ ffi correctly and git submodule suck. just recompile everytime.
git clone https://github.com/MarisaKirisame/noria.git

cd noria
cargo || (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y)
cargo check

meow
