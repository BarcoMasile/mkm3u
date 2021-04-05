# MKM3U

Simple utility to build m3u files from a folder containing video files.

Just put a link to the bash script in your executables folder.
For example, in my case:
```bash
ln -s main.sh /usr/local/bin/mkm3u
```

Usage 'mkm3u [folder] [playlist_name]'

where:
  folder: the folder containing the video files (nested folders no problem)
  playlist_name: the filename without extension


### Requirements

Decent version of Ruby and Bash
