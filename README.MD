# About

Build a docker container with ready-to-run fontawesome-actions stack.
Create your own font using command line docker container!

docker run fatools


# What it contains

The Project builds a docker container with https://github.com/fontforge/fontforge built with python support.
Using command line you can run https://github.com/nyon/fontawesome-actions inside the container or
mount a volume with a custom version of fontawesome-actions using


docker run fatools -v //c/DEV/TNT-FONT/src:/fa-actions

docker run fatools -v /home/user/src:/fa-actions

//c/Users/sebas/Desktop/fontawesome-actions:/fa-actions

docker run -v c:/Users/sebas/Desktop/fontawesome-actions:/fa-actions fntc/fonttool python /fa-actions/fatnt.py