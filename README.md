# Carefully tested props tweaks for clean, immersive, correctly positioned audio and extras.
# It would fix cheap DACs sounding harsh. Or grainy vocal you usually find from your phone speakers.
# Also bring bluetooth audio very closed to wired bit-perfect audio. Fixed issues with the AAC sounding worse than SBC. Also with much less latency now.
# This mod gain me trust with the Harman target. Turn out the shoutiness was never from the target itself.
# That said it doesn't come without one bug is that changing codec or connecting bluetooth while a track is playing causes the audio to leak to the phone speaker for some reason.
# Inspired by Audio Misc Settings and Audio Resamplerate Magisk modules. This mod is easy to control and with using Android's factory's flags, it's pretty much compatible with any devices.
# For details on how this mod works, it's recommend that you read my test reports carefully before making any changes. Be responsible.

# The result is finalize with AB testing with a group of 4 audiophile friends of mine. Proven with tremendous impression and enjoyments! They do feel like in the luxury!
# I've experiences with audio devices at 500$ grade, broke quite a lot of IEMs and speakers while modding and tinkering for credits haha. That amount of money cannot brings this kind of experience.
# I've spent 20 total hours to exhaustive test these flags. However I couldn't test all of the combinations and cases. However, this's a very stable implementation of it.
# Words are just words until you try this out for yourself!

# Guide
# Gain root access with \"su\" then paste the entire script in Termux after installing the MagiskHidePropsConf module
# In case of wanting to fallback, use \"props -r\"
