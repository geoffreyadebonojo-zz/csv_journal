# csv_journal

This is a bare-bones working prototype of a note taking app I have been using
for my personal notes for quite some time. It is a CLI with an interaction pattern
as follows:


	1. It searches current dir for a csv file with the day’s date
	2. if it finds it, it opens it
	2. if it doesn’t, it writes a new one using today’s date and opens that.
	3. It displays the contents of the file, displaying the timestamp for each line
  of code beside the line.
	4. While the file is open the user is able to write lines in the command line
  and write them to the csv file named for today’s date.
	5. The user can enter as many lines as they want. As soon as you hit enter, that line is written to the file. It also immediately reopens the file so that you can see that line. When you’re done, just enter quit to exit back to the main menu.

The early iterations of this project used .txt. But for the data structure I was
creating, CSV was better. This is because I not only wanted to write to files,
I wanted to read from them. I found that using CSV to store each element of the
date and time the note was written made it easy to compare those notes to one another.
One potential flaw I foresee is that I haven't implemented any limits on the length
of a single line. I have, however, included a line of asterisks which the user can
set to any width and use as a guide post.




# Planned expansions:
1. Implement search and sorting algorithms for notes.
1. Expand the tag system.
1. Create a review system

# Other versions
1. A workout tracker
1. Nanowrimode
1. Typewriter
1. Scheduler
