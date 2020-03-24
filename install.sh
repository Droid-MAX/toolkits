#!/usr/bin/sh
TMP=`pwd`/tmp
URL="https://github.com/Droid-MAX/toolkits/raw/master/dns2tcp-aarch64-backup.tgz"

apt update && apt install -y curl wget sed tar openssh autossh tsocks

sed -i "s/server\ \=\ 192\.168\.0\.1/server\ \=\ 127\.0\.0\.1/g" $PREFIX/etc/tsocks.conf

if [ ! -d $TMP ]; then
    mkdir -p $TMP
else
    rm -rf $TMP/*
fi

wget -q -O- $URL > $TMP/dns2tcp-aarch64-backup.tgz && tar -xzf $TMP/dns2tcp-aarch64-backup.tgz -C $TMP

if [ ! -d $HOME/.ssh/ ]; then
    mkdir -p $HOME/.ssh/
    cp $TMP/config $TMP/*.key $HOME/.ssh/
elif [ -d $HOME/.ssh/ ] && [ ! -e $HOME/.ssh/config ] && [ ! -e $HOME/.ssh/config.bak ]; then
    cp $TMP/config $TMP/*.key $HOME/.ssh/
elif [ -d $HOME/.ssh/ ] && [ -e $HOME/.ssh/config ] && [ ! -e $HOME/.ssh/config.bak ]; then
    cp $HOME/.ssh/config $HOME/.ssh/config.bak
    cp $TMP/*.key $HOME/.ssh/
    cat $TMP/config >> $HOME/.ssh/config
else
    mkdir -p $HOME/.ssh/ > /dev/null 2>&1
    cp $TMP/*.key $HOME/.ssh/
    cat $TMP/config >> $HOME/.ssh/config
fi

chmod 600 $HOME/.ssh/config* $HOME/.ssh/*key

install -m 700 $TMP/dns2tcpc $TMP/restart-autossh $TMP/restart-dns2tcpc $TMP/start-autossh $TMP/start-dns2tcpc $TMP/stop-autossh $TMP/stop-dns2tcpc $PREFIX/bin/

cp $TMP/dns2tcpc.rc $EXTERNAL_STORAGE

rm -rf $TMP/*

