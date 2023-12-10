# pidvbip

DVB-over-IP set-top box software for the Raspberry Pi 1b, 2, and 3.

It requires:

+ Tvheadend running on a server (or on same pi)
+ MPEG-2 Hardware decoding 

https://github.com/tvheadend/

![](http://i.imgur.com/REHGLaBm.jpg "Info display")

![](http://i.imgur.com/Upa7Jahm.jpg "Channel Display")

## Operating system

This specific repository was modified to work in Raspbian / Raspberry Pi OS - Buster and Raspberry Pi 1b. (It will work in PI 2 and 3)

Use this link to download and put in your Pi SD card: 

[LINK](https://downloads.raspberrypi.com/raspios_lite_armhf/images/raspios_lite_armhf-2021-05-28/2021-05-07-raspios-buster-armhf-lite.zip)

## Memory

GPU memory should be a minimum of 128MB in config.txt

    gpu_mem=128
    
## MPEG-2 decoding

pidvbip requires that the MPEG-2 hardware codec is enabled (by
purchase of the license). 

To activate (forgotten) mpeg2 and VC codec licenses on raspberry pi follow this:

[LINK](https://github.com/suuhm/raspi_mpeg_license_patch.sh)

## Install 

Use the following code to download and execute the install script, in a terminal type:
```
wget https://raw.githubusercontent.com/aosucas499/pidvbip/master/install.sh -qO- | bash -s chmod +x install.sh && ./install.sh

```

Modify the service to load at boot with your Tvheadend 'server ip', 'user', 'password' and 'initial channel'.

```
sudo nano /etc/systemd/system/pidvbip.service

```

## Usage

The install script do everything you need to load pidvbip in each boot, but this is the way to use this program.

There are three ways for pidvbip to locate the tvheadend server:

1) Via the command line - e.g. ./pidvbip -h <tvheadend ip> -p 'tvh port' -U 'tvh user' -P 'tvh password'

2) Via the config file pidvbip.conf.  See pidvbip.conf.example for 
   the list of possibe configuration values.

3) If no host and port are configured via the command-line or the
   config file, pidvbip will use avahi.  To do this you need to ensure
   that tvheadend is compiled with avahi support and avahi-daemon is
   running on both the machine running tvheadend and the Pi running
   pidvbip.


As soon as pidvbip starts it will connect to tvheadend, download the
channel list and all EPG data, and then tune to the first channel in
your channel list and start playing.

You can optionally specify a channel number as a third parameter to
skip directly to that channel (only when also specifying the host and
port on the command-line).

### Remote

![](https://www.mythtv.org/w/images/thumb/c/c1/MCE-Remote-2.jpg/110px-MCE-Remote-2.jpg)

This repo contain and load code to use Microsoft MCE RC 6 remote, you can find ways to load other remotes finding tutorials about using ir-keytable.

Once running, the following keys (and remote buttons) are mapped to actions: 

    'q' - quit
    '0' to '9' - direct channel number entry
    'n' - next channel (numerically)
    'p' - previous channel (numerically)
    'y' - switch to the previously viewed channel
    'i' - show/hide current event information
    'h' - toggle auto-switching to HD versions of programmes from an SD channel
    ' ' - pause/resume playback
    'c' - display list of channels and current events to the console
        - Also shows basic onscreen channel listing, whilst onscreen use
        - d for down a screen of channels, or u for up a screen of channels in listing
    'o' - To toggle subscribe/unsubscribe (idle) on current channel
    'a' - Cycle through available audio streams
    'z' - Force 4:3 (pillarbox) or 16:9 (fullscreen) display
    's' - Take a screenshot (filename is ~/pidvbip-NNNNNNNNNNN.ppm)
    'w' - Crop video to remove BT Sport Europe HD "L" graphics (a hack!)

pidvbip currently supports hardware decoding of H264 and MPEG-2 video
streams, and software decoding of MPEG, AAC and A/52 (AC-3) audio
streams.  Multi-channel audio streams are downmixed to Stereo.


Copyright
---------

(C) Dave Chapman 2012-2013

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

