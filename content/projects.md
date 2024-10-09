Here is a quick list of projects I have done, some were for school and some 
just for fun.

## People Party
A fun frantic web based party game where players compete in rounds of 
minigames. 

This project was a great technical challenge and really forced us 
to think ahead and design our architechture very well. We got to use a lot of 
cool different technologies like C++, WebSockets, Flatbuffers and ofcourse some 
crazy TypeScript shananigans.

You can play People Party [here](https://peopleparty.nl) or take a look at the 
source code on [github](https://github.com/kraanter/peopleparty).

Read my full blog post about People Party ~~[here](blog#people-party)~~.

---

## This website
When I decided to make this website I originally wanted to just use some run 
of the mill javascript framework with some pretty template and call it a day. 
However when trying to use one of these frameworks I came to the realization 
that I really did not need any of it's cool features. So I decided to try to 
make my own simple static site generator for this website.

The goal was simple: I want to be able to write the pages in MarkDown and it 
shouldn't be too much work to add new pages. With this goal in mind I wrote a 
simple bash script and whipped up some basic HTML and CSS, the result? You are 
looking at it right now.

In actuallity my "static site generator" turned into more of a build process 
that creates simple html pages based on some folder structure and markdown files.

---

## Powerlabel
An application for printing labels and registering computer systems. 

One of my first real programming projects, it's not pretty but it works (mostly).
Powerlabel was conceived at my job where we manually wrote down all the components 
in a computer and printed a label for the computer. My first improvement to this 
process was a powershell script that automated this process. It would scan the 
system components and send a print job to the label printer. Eventually it 
evolved into an application with a GUI and database so all our systems and 
components can be tracked.

I leared many things during this project, it was my first experience with C# and 
interfacing with Windows APIs.
