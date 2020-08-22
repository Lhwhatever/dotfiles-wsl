export BAT_THEME="Monokai Extended Origin"

pathadd() {
    PATHADD=$(IFS=: echo "$*")
    export PATH="$PATH:$PATHADD"
}

if [ -d /usr/local/go ]; then
    pathadd /usr/local/go/bin
fi
