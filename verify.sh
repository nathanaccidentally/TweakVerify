#!/bin/bash

# This is an example of how scipts will be checked against the signature.

echo "Verifying signature of package..."

doesSigExists="DEBIAN/_TweakSignature/signature"
if [ -f "$doesSigExists" ]
then
	echo "Signature found."
else
	echo "Signature not found."
	exit
fi

secureKeyLineTitle="Your secure key = "
secureKeyFromSig=$(grep "$secureKeyLineTitle" DEBIAN/_TweakSignature/signature)
grep "$secureKeyLineTitle" DEBIAN/_TweakSignature/signature

echo -n "This is the key I got from the signature: $secureKeyFromSig. Would you like to continue? "
read answer
if echo "$answer" | grep -iq "^y" ;then
    echo "OK. Will keep doing verification."
else
    echo "Quitting."
    exit
fi

controlMD5LineTitle="Control MD5: "
controlmd5FromSig=$(grep "$controlMD5LineTitle" DEBIAN/_TweakSignature/signature)
currentControlMd5FromSystem=$(md5 DEBIAN/control)
grep "$controlMD5LineTitle" DEBIAN/_TweakSignature/signature

if [[ "$controlmd5FromSig" =~ "$currentControlMd5FromSystem" ]]; then
	echo "Valid Control MD5..."
else
	echo "⚠️ Invalid Control MD5.⚠️ "
	exit
fi

controlSHA1LineTitle="Control SHA1: "
controlSHA1FromSig=$(grep "$controlSHA1LineTitle" DEBIAN/_TweakSignature/signature)
currentControlSHA1FromSystem=$(openssl sha1 DEBIAN/control)
grep "$controlSHA1LineTitle" DEBIAN/_TweakSignature/signature

if [[ "$controlSHA1FromSig" =~ "$currentControlSHA1FromSystem" ]]; then
	echo "Valid Control SHA1..."
else
	echo "⚠️ Invalid Control SHA1.⚠️ "
	exit
fi

    checkForPostinst="DEBIAN/postinst"
    if [ -f "$checkForPostinst" ]
    then

    postinstMD5LineTitle="Postinst MD5: "
    postinstmd5FromSig=$(grep "$postinstMD5LineTitle" DEBIAN/_TweakSignature/signature)
    currentPostinstMd5FromSystem=$(md5 DEBIAN/postinst)
    grep "$postinstMD5LineTitle" DEBIAN/_TweakSignature/signature
    
    if [[ "$postinstmd5FromSig" =~ "$currentPostinstMd5FromSystem" ]]; then
    	echo "Valid Postinst MD5..."
    else
    	echo "⚠️ Invalid Postinst MD5.⚠️ "
    	exit
    fi


    postinstSHA1LineTitle="Postinst SHA1: "
    postinstSHA1FromSig=$(grep "$postinstSHA1LineTitle" DEBIAN/_TweakSignature/signature)
    currentPostinstSHA1FromSystem=$(openssl sha1 DEBIAN/postinst)
    grep "$postinstSHA1LineTitle" DEBIAN/_TweakSignature/signature
    
    if [[ "$postinstSHA1FromSig" =~ "$currentPostinstSHA1FromSystem" ]]; then
    	echo "Valid Postinst SHA1..."
    else
    	echo "⚠️ Invalid Postinst SHA1.⚠️ "
    	exit
    fi
else
	echo "Postinst script not found."
fi