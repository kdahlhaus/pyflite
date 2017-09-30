import flite

flite.init()

ssml="""
<speak>
<p><emphasis level="strong">1!</emphasis>.</p>
<p><emphasis level="strong">2!</emphasis>.</p>
<p>3.</p>
<p>4.</p>

<emphasis level="strong">1!</emphasis>.
<emphasis level="strong">2!</emphasis>.
3.
<break/>4.<break/>

</speak>
"""

sssml="""
<speak>
    I already told you I
    <emphasis level="strong">really like</emphasis>
    that person.
</speak>

"""
flite.say_ssml(ssml, voice="slt")
