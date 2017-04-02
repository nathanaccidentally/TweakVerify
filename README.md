# TweakSign

Welcome to TweakSign! A work-in-progress way to securley build and distribute tweaks.

I've laid groundwork for this project to become much more useful as I work on it more. You can use it on macOS and Linux with no current support for iOS.

The code "signature" file along with the key are inside `DEBIAN/signature` of your package and can be used however you'd like while checking or with other scripts.

## How do I use it?
Step 1: **Find a Terminal.**

Step 2: **Find a tweak to sign and compile.**

Step 3: **Run `cd /path/to/tweak/folder`**

Step 4: **Distribute however you'd like!**

## How can I verify the signature of deb files or extracted debs?
Step 1: **Create a new folder wherever you'd like and `cd` into the folder you made.**

Step 2: **Run `verify whatever.deb` and follow the prompts.**
