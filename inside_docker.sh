set -x
set -e

apt-get update
apt-get upgrade -y
apt-get install -y git ssh-client build-essential pkg-config libssl-dev clang libclang-dev python3-pip

pip install dominate

cat ~/.ssh/id_rsa.pub || ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""

rm -rf noria || true # rust does not track C++ ffi correctly and git submodule suck. just recompile everytime.
git clone https://github.com/MarisaKirisame/noria.git

cd noria
git clone --recursive https://github.com/WtzLAS/zombie-sys.git
cargo || (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y)
source "$HOME/.cargo/env"
cargo check

python3 eval.py
python3 report.py
