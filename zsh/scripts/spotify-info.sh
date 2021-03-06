#!/usr/bin/env bash

function album() {
  echo "$(echo "$data" | grep -A 1 "\"xesam:album\"" | grep "variant" | grep -o '".*"' | tr -d '"')"
}

function artist() {
  echo "$(echo "$data" | grep -A 3 "\"xesam:artist\"" | grep string | awk NR==2 | grep -o '".*"' | tr -d '"')"
}

function title() {
  echo "$(echo "$data" | grep -A 1 "\"xesam:title\"" | grep "variant" | grep -o '".*"' | tr -d '"')"
}

function polybar-format() {
  newtitle=$(echo $(title) | sed 's/(Remastered)//' | cut -f1 -d"-")
  echo $newtitle - $(artist)
}

function all() {
  echo -e Album: $(album)"\n"Artist: $(artist)"\n"Title: $(title)
}

status=`pidof spotify | wc -l`
if [[ "$status" != 1 ]]; then
  echo ""
else
  data=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')
  "$@"
fi
