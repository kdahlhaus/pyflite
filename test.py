import flite

flite.init()

flite.say("This is an inital cut of a Flite Festival Light python wrapper. It will speak arbritary text passed to it. Some strings cause the library to lock up. I am not sure why. Enjoy!", "sample.wav")

print(flite.say("Jack! Come here!  Good dog Jack!", "test.wav"))


