#!/bin/bash

q=/Users/j/Lib/q/m64/q
dash=/Users/j/Lib/dash

SYM=sym
TP_PORT=5010
RDB_PORT=5011
RTS_PORT=5012
DSH_PORT=10001

start_processes() {

    echo "Starting TP..."
    $q tick.q $SYM . -p $TP_PORT &
    tp_pid=$!
    sleep 1
    
    echo "Starting RDB..."
    $q tick/r.q :$TP_PORT -p $RDB_PORT &
    rdb_pid=$!
    sleep 1

    echo "Starting FH..."
    $q feed.q :$TP_PORT &
    fh_pid=$!
    sleep 1

    echo "Starting DASH..."
    cd $dash
    $q dash.q -p $DSH_PORT -u 1 &
    dsh_pid=$!
    sleep 1
    cd -

    echo "Starting RTS..."
    $q tick/rts.q :$TP_PORT -p $RTS_PORT &
    rts_pid=$!
    
    trap 'kill_processes' EXIT
}

kill_processes() {
    echo "Stopping all components..."
    kill $tp_pid $rdb_pid $fh_pid $dsh_pid $rts_pid
    echo "Processes stopped."
}

echo "Starting tick system..."
start_processes

while true; do
    sleep 1
done

