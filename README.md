
Based on the port from Thinky Head Software which can be located here:
http://www.thinkyhead.com/fortune/download/bsd-fortune-14l

## INSTALLATION:

```
make
```

This installation defaults to /usr/local/bin for the fortune script and
installs the fortune cookies (fortunes) to /usr/local/var/fortunes. If you wish
to change these locations open the Makefile and they're located on lines 27,
28, 29. The only caveat is that if you change the DATAPATH, make sure
you change the TRUEDATAPATH as well, leaving the /fortunes on the end of it.
