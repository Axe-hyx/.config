if [ -d "/run/media/switch/FC60DE9F60DE6046" ]
then
    echo 'driver C: already mounted'
else
    echo 'mounting driver C:'
    sudo mkdir -p /run/media/switch/FC60DE9F60DE6046
    sudo mount /dev/nvme0n1p3 /run/media/switch/FC60DE9F60DE6046
fi

echo 'updating emacs.d'
cd ~/.emacs.d
proxychains -q git pull

echo 'updating vim config'
cd ~/.vim_runtime
proxychains -q git pull

echo 'updating ccls'
cd ~/reference/API/ccls
proxychains -q git pull

echo 'updating zeno'
cd /run/media/switch/FC60DE9F60DE6046/code/Simulation/zeno
proxychains -q git pull

echo 'updating firmware driver'
fwupdmgr refresh
fwupdmgr upgrade

echo 'updating conda packages'
conda update --update-all

echo 'omzsh'
export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
_omz::update
unset https_proxy
unset http_proxy
