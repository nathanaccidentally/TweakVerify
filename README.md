# TweakSign

Welcome to TweakSign! A work-in-progress way to securley build and distribute tweaks.

I've laid groundwork for this project to become much more useful as I work on it more. You can use it on macOS and Linux with no current support for iOS.

The code "signature" file along with the key are inside `DEBIAN/signature` of your package and can be used however you'd like while checking or with other scripts.

See an example here: https://www.youtube.com/watch?v=LuWeDVS-T0c&feature=youtu.be

**Donations can be made by purchacing an Amazon card [here](https://www.amazon.com/gp/product/B0145WHYKC/ref=s9_acss_bw_cg_gclptcg_2a1_w?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=merchandised-search-1&pf_rd_r=B88M5PV4XQ4R3R8S26MF&pf_rd_t=101&pf_rd_p=2120cd97-b2d2-47db-9a65-1c678be2a6e7&pf_rd_i=2238192011) and sending it to nathanaccidentally@gmail.com. Thanks! :)**

## How do I use it?
Step 1: **Find a Terminal.**

Step 2: **Find a tweak to sign and compile.**

Step 3: **Run `cd /path/to/tweak/folder`**

Step 4: **Distribute however you'd like!**

## How can I verify the signature of deb files or extracted debs?
Step 1: **Create a new folder wherever you'd like and `cd` into the folder you made.**

Step 2: **Run `verify whatever.deb` and follow the prompts.**

## What does this do?
It creates a signature file within `DEBIAN/signature` of your tweaks before they're built so they can be checked against by users as an extra verification step.

It saves things like the MD5 and SHA1 of the control file, any postinst, prerm, extrainst, and any .dylib (holy glob that was hard to pull off) files and they're checked against the system when verification is started.

## What is the 'Secret Key'?
The secret key is a random 8 digit key created that is stored in the signature file. Devs can distribute this key however they'd like so that users checking the signature can be sure they're looking at the correct file.
