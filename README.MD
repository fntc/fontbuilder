# About

Build a docker container with ready-to-run fontawesome-actions stack.
Create your own font using command line docker container!




# What it contains

The Project builds a docker container with https://github.com/fontforge/fontforge built with python support.
Using command line you can run https://github.com/nyon/fontawesome-actions inside the container or
mount a volume with a custom version of fontawesome-actions using

# How to use

Build fontawesome fonts yourself:

> docker run fntc/fontbuilder

Use fontawesome pro 

> docker run -v /home/user/fontawesome-pro:/fa-actions/fontawesome fntc/fontbuilder

Build your own font using your own script

- Create the main.py based on https://github.com/nyon/fontawesome-actions
- Place all assets in myfont and execute main.py

> docker run -v /home/user/src:/fa-actions/myfont fntc/fontbuilder /fa-actions/myfont/main.py

Build your own font using your own script, based on fontawesome pro

> docker run -v /home/user/src:/fa-actions/myfont -v /home/user/fontawesome-pro:/fa-actions/fontawesome fntc/fontbuilder /fa-actions/src/myfont.py
