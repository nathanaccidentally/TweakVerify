#!/bin/bash

# This is an example of how scipts will be checked against the signature.

echo "Verifying signature of package."

controlMD5LineTitle="Control MD5: "
controlmd5FromSig=$(grep "$controlMD5LineTitle" DEBIAN/_TweakSignature/signature)
currentControlMd5FromSystem=$(md5 DEBIAN/control)
grep "$controlMD5LineTitle" DEBIAN/_TweakSignature/signature

if [[ "$controlmd5FromSig" =~ "$currentControlMd5FromSystem" ]]; then
	echo "Valid Control MD5..."
else
	echo "Invalid Control MD5."
	exit
fi

controlSHA1LineTitle="Control SHA1: "
controlSHA1FromSig=$(grep "$controlSHA1LineTitle" DEBIAN/_TweakSignature/signature)
currentControlSHA1FromSystem=$(openssl sha1 DEBIAN/control)
grep "$controlSHA1LineTitle" DEBIAN/_TweakSignature/signature

if [[ "$controlSHA1FromSig" =~ "$currentControlSHA1FromSystem" ]]; then
	echo "Valid Control SHA1..."
else
	echo "Invalid Control SHA1."
	exit
fi