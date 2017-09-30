pyFlite (C) 2006, 2017 by Kevin Dahlhausen  kpd@powertwenty.com

See the file 'COPYING' for license information. (Same license as Flite, free for all uses)

This is a simple cython wrapper for the Flite voice library. 

It is minimal, not documented very well, and meets my current needs.  :)



Usage:

import flite
flite.init()
flite.say("Hey! I think our problems may just be solved. Ed McMahon. Think I just won a million bucks. Yeah, Irwin M. Fletcher you choose. Woo-wee! Oh, boy, I lost. Yeah. Sorry.")
flite.say("My advice to you is...", "test.wav")
flite.say_ssml("""
    <speak>
        We shall fight on the <emphasis level="strong">beaches</emphasis>
    </speak>
""") 
