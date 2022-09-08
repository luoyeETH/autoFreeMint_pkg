#! /bin/sh
kill -9 `lsof autofreemint-linux |grep auto |awk '{print $2}'`
