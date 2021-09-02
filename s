#!/bin/sh
#
# s -- simple searching script
#
# Usage:
# s [ENGINE] [QUERY]...
# 
# Script will still proceed without query 
#
# If you haven't set $BROWSER globally you can do it here like this:
# BROWSER=firefox


# Removing first word (engine) from query and replacing spaces with +
[[ -n $2 ]] && QUERY=$(echo $@ | cut -d ' ' -f2- | tr ' ' '+')

case "$1" in
ddg)	URL="https://duckduckgo.com/?q=$QUERY" ;;				# DuckDuckGo
yt)	URL="https://www.youtube.com/results?search_query=$QUERY" ;;		# Youtube
qw)	URL="https://qwant.com/?q=$QUERY" ;;					# Qwant
qmaps)	URL="https://qwant.com/maps/?q=$QUERY" ;;				# Qwant Maps
plen)	URL="https://translate.google.com/?sl=pl&tl=en&text=$QUERY" ;;		# Google Translate (polish to english)
enpl)	URL="https://translate.google.com/?sl=en&tl=pl&text=$QUERY" ;;		# Google Translate (english to polish )
wpl)	URL="https://pl.wikipedia.org/w/index.php?search=$QUERY" ;;		# Wikipedia (polish)
wen)	URL="https://en.wikipedia.org/w/index.php?search=$QUERY" ;;		# Wikipedia (english)
ffa)	URL="https://addons.mozilla.org/en-US/firefox/search/?q=$QUERY" ;;	# Firefox addons
wn8)	URL="https://wot-life.com/eu/player/$QUERY/" ;;				# Wot-life
'') echo "Error: No engine specified" 1>&2 ;;
*) echo "Error: Unknown engine" 1>&2 ;;
esac

# Don't open browser if the engine isn't found
[[ -n $URL ]] && echo "$URL" && $BROWSER $URL
