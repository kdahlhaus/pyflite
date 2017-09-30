pyFlite (C) 2006, 2017 by Kevin Dahlhausen  kpd@powertwenty.com

See the file 'COPYING' for license information. (Same license as Flite, free for all uses)

This is a simple cython wrapper for the Flite voice library. 

It is minimal, not documented very well, and meets my current needs.  :)

The linux version is building.

The cygwin version worked in 2006, but I have not tried in recently.  If it does not work now, it's very likely that the linux version would work with a slight modificaiton.



Usage:

import flite

flite.init()

# speak the text via alsa
flite.say("Hey! I think our problems may just be solved. Ed McMahon. Think I just won a million bucks. Yeah, Irwin M. Fletcher you choose. Woo-wee! Oh, boy, I lost. Yeah. Sorry.")

# write the speech to 'test.wav' using the CMU 'slt' voice
flite.say("My advice to you is...", "test.wav", voice="slt")

# say the SSML data
flite.say_ssml("""
    <speak>
        We shall fight on the <emphasis level="strong">beaches</emphasis>
    </speak>
""") 
