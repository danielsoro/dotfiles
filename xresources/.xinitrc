export LC_ALL=en_US.UTF-8

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec i3
