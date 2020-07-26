#!/usr/bin/env fish

# for windows linux subsystem
if string match -q "*-microsoft-standard" (uname -r)
    set -x DISPLAY (awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
    set -x LIBGL_ALWAYS_INDIRECT 1
    set -x GDK_SCALE 2
    set -x QT_SCALE_FACTOR 2
    # set -x GDK_DPI_SCALE 2
    echo "Enable GUI Application Support..."
end

if test "$TERM" = "dumb"
  function fish_prompt
    echo "\$ "
  end

  function fish_right_prompt; end
  function fish_greeting; end
  function fish_title; end
end
