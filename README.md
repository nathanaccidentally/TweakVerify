# TweakSign

Welcome to TweakSign! A work-in-progress way to securley build and distribute tweaks.

I've laid groundwork for this project to become much more useful as I work on it more. How I will implement TweakSign into the install process is undecided yet and will be determined and built when I have time.

The code "signature" file along with the key are inside `DEBIAN/TweakSignature/signature` of your package and can be used however you'd like on install.

## How can I use it?
You can use the code from the verify script as an example of what to include in your postinst script. You can use it in the same way.
