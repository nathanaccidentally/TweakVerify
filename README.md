# TweakSign

Welcome to TweakSign! An easy way to securley build and distribute tweaks.

The code "signature" file along with the key are inside `DEBIAN/signature` of your package and can be used however you'd like while checking or with other scripts. A simplified signing template is avalible for modificaiton and redistribution inside `master/templates`.

## How do I use it?
Step 1: **Open Terminal.**

Step 2: **Drag TweakSign into the Terminal followed by the folder for your project and hit enter.**

## How can I verify the signature of deb files or extracted debs?
Step 1: **Drag the TweakSign verify fine into Terminal followed by the deb file you want to check and hit enter.**

## What does this do?
It creates a signature file within `DEBIAN/signature` of your tweaks before they're built so they can be checked by users as an extra verification step.

It saves things like the MD5 and SHA1 of the control file, any postinst, prerm, extrainst, and any .dylib files and they're checked against the system when verification is started.

## What is the 'Secret Key'?
The secret key is a random 8 digit key created that is stored in the signature file. Devs can distribute this key however they'd like so that users checking the signature can be sure they're looking at the correct file.
