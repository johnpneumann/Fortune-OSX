
BSD FORTUNE FOR MACOS X
-----------------------
Created when Unix was young, Fortune is the venerable BSD program that
prints a random fortune to the standard output (usually the Terminal).
Fortune is typically added to a shell login script (such as .tcshrc or
.bashrc) so every time a Terminal window opens a new random fortune
appears. The fortunes themselves come from an endless library of quotes,
quips, sayings, anecdotes, and jokes from a wide variety of sources.
Once installed simply enter the Terminal and type 'fortune' to receive a
random quote. Includes tools and man pages to help you make your own
fortunes.

By default the fortune binary goes into the /usr/local/bin directory
(because this is already in your default path) and the fortunes data goes
into /usr/local/var/fortunes.  To change this you will need to edit the
GAMEPATH and DATAPATH definitions in the included Makefile.


INSTALLATION
------------
1. If necessary, open the disk image and copy its contents to your hard drive.


2. Start Terminal


3. Enter the directory of this distribution. For example:

  > cd ~/Desktop/fortune


4. Type the following commands to build and install fortune:

  > make
  > sudo make install


5. Using the TCSH shell? Then refresh the shell command cache:

  > rehash


6. Test fortune...

  > fortune


7. You can add fortune to your login shell like this:

  > echo "fortune" >>.profile
or
  > echo "fortune" >>.login


Scott Lahteine <scott@thinkyhead.com>
Northampton, MA
November 24, 2009
