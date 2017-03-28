#!/bin/bash

# Welcome to TweakSign, a new way to sign tweaks and verify their security. Built by nathanaccidentally.

echo "Signing tweak..."
cd ~/Desktop/OSRestoreX/

previousSig="DEBIAN/_TweakSignature/signature"
if [ -f "$previousSig" ]
then
	echo "Previous signature found."
	rm -f DEBIAN/_TweakSignature/signature
else
	echo "Previous tweak signature not found."
	mkdir DEBIAN/_TweakSignature
fi

echo "Writing MD5 to signature..."
controlMd5=$(md5 DEBIAN/control)
echo "$controlMd5"
echo "Control MD5: $controlMd5" >> DEBIAN/_TweakSignature/signature

echo "Finished writing MD5 signature of control file."

echo "Writing SHA1 to signature..."
controlSha1=$(openssl sha1 DEBIAN/control)
echo "$controlSha1"
echo "Control SHA1: $controlSha1" >> DEBIAN/_TweakSignature/signature

checkForPostinst="DEBIAN/postinst"
if [ -f "$checkForPostinst" ]
then
	echo "Postinst script found."
	postinstMD5=$(MD5 DEBIAN/postinst)
	echo "$postinstMD5"
	echo "Postinst MD5: $postinstMD5" >> DEBIAN/_TweakSignature/signature

	postinstSha1=$(openssl sha1 DEBIAN/postinst)
	echo "$postinstSha1"
	echo "Postinst SHA1: $postinstSha1" >> DEBIAN/_TweakSignature/signature
else
	echo "Postinst script not found."
fi

checkForPrerm="DEBIAN/prerm"
if [ -f "$checkForPrerm" ]
then
	echo "Prerm script found."
	prermMD5=$(MD5 DEBIAN/prerm)
	echo "$prermMD5"
	echo "Prerm MD5: $prermMD5" >> DEBIAN/_TweakSignature/signature

	prermSha1=$(openssl sha1 DEBIAN/prerm)
	echo "$prermSha1"
	echo "Prerm SHA1: $prermSha1" >> DEBIAN/_TweakSignature/signature
else
	echo "Prerm script not found."
fi

echo "" >> DEBIAN/_TweakSignature/signature
echo "<--- End of file hashes --->" >> DEBIAN/_TweakSignature/signature
echo "" >> DEBIAN/_TweakSignature/signature

echo "Getting Author name from control package..."

authorName=$(sed '8!d' DEBIAN/control)
echo "$authorName"
echo "$authorName" >> DEBIAN/_TweakSignature/signature

echo "" >> DEBIAN/_TweakSignature/signature
echo "<--- End of control stuff --->" >> DEBIAN/_TweakSignature/signature
echo "" >> DEBIAN/_TweakSignature/signature

echo "Generating secure key used to install package..."
superSafeAndSecureKey=$(cat /dev/random | LC_CTYPE=C tr -dc "[:alpha:]" | head -c 8)
echo "Your secure key = $superSafeAndSecureKey"
echo "Your secure key = $superSafeAndSecureKey" >> DEBIAN/_TweakSignature/signature

echo "Building package..."
dpkg -b ~/Desktop/OSRestoreX
echo "Done!"

exit