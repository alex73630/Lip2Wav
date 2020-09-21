#!/bin/bash
FILES=$1/videos/*
DST_DIR=$1/intervals
mkdir -p $DST_DIR

for f in $FILES
do
	echo $f
	fname=$(basename $f)
	fname="${fname%.*}"
	mkdir "$DST_DIR/$fname"
	/usr/bin/ffmpeg -loglevel panic -i $f -acodec copy -f segment -vcodec copy \
			-reset_timestamps 1 -map 0 -segment_time 30 "$DST_DIR/$fname/cut-%d.mp4"
done