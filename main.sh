#!/bin/bash

folder=""

if [ "$1" = "-h" ] || [ "$1" = "--help" ] ; then
	echo "Usage 'mkm3u [folder] [playlist_name]'"
	echo ""
	exit 0
fi

if [ $# -eq 0 ]; then
    folder="`pwd`"
else
    if [ "$1" = "." ]; then
        folder="`pwd`"
    else
        folder="$1"
    fi
fi

nome_file="$folder"/playlist.m3u

if ! [ -z "$2" ]; then
    nome_file="$folder"/"$2".m3u
    if [ -e "$(dirname "$2")" ]; then
        nome_file="$2".m3u
    else
        nome_file="$folder"/"$2".m3u
    fi
fi

if ! [ -e "$(dirname "$nome_file")" ]; then
    echo "Path non esistente, riprova con un altra destinazione"
    exit 1
fi



echo "#EXTM3U" > "$nome_file"
find "$folder" -type f -iname '*\.[ma][vpk][iv4]' -print | ruby -n -e 's = $_.chomp ; puts "#EXTINF:0,#{s.split("/").last}\nfile://#{s}"' >> "$nome_file"


exit 0
