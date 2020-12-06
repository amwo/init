function switch(p, k, n) hs.hotkey.bind(p, k, function() hs.application.launchOrFocus(n) end) end
switch({"ctrl"}, "i", "Terminal")
switch({"ctrl"}, ";", "Brave Browser")
