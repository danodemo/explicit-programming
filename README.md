#Example of building smaller things

Our plugin displays real estate listings for agents to show on their websites, however these listings are dependent on the agent getting approval from the Multiple Listing Service (MLS).  This approval can sometimes take weeks, during which time the plugin is useless to the agents and they can't style it or test it or anything.

SHAM MLS solves that problem by creating dummy listings of fake, randomized data that are functionally the same as the listings we would get directly from the MLS.

To do this, I created a worker which handles the logic of actually tracking the listing, locations of listings, and unique ids (to avoid collisions).  I then broke the listings themselves into their own class, with yet another class to handle the complex "features" document.

The code example above highlights my desire to keep things small and simple.  I am inspired by Sandy Metz' 2014 Railsconf talk "All the Little Things", where she talks about the problems with a lot of codebases which are these massive classes with thousands of lines of code that are convoluted and hard to follow.

I watched this talk while going through the Iron Yard's rails program, and the lessons from it have stuck with me particularly because the methods she describes for writing code produce work that is easy to follow for someone like me, who is new to programming.

I write my code exactly as I would hope to read my code: explicit, with as little "magic" as possible.  Someone new coming to work on code behind me should have little trouble translating my thoughts; the code order should be clear, easy to follow, with methods grouped accordingly to their order in the program, with comments used appropriately to explain magic or tricky parts, or to leave reminders on what could be improved in the future.

As you hopefully can see in the code above, I have broken up as much of the "work" as possible into smaller methods, but not too small: while I do agree with Sandy Metz that "more, smaller things" is a good philosophy, I also believe that any given "thing" should be as self contained as possible.  That was the impetus for creating the "Shamfeatures" class to handle the listing features and what we call "standard features", which are reliant on certain values to already exist.

Lastly, you'll notice that I don't hesitate to mix a little of the silly into my work when it won't have any negative effects.  I hate the image of a bored, miserable programmer sitting in a dark room somewhere trying to guess what symbols are what variables, so I like to leave little "easter eggs" in my code when possible.  Just to brighten the day for whichever poor shmo ends up working on my code in the future.
