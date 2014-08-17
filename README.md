## Misc code etc

Android-Terminal-Emulator-master.patch.gz
patch used to build [Android-Terminal-Emulator](https://github.com/jackpal/Android-Terminal-Emulator) 

Without the patch, libjackpal-androidterm4 was not getting added to the the apk, and Terminal Emulator not functioning.
	
Applying the patch:

	cd Android-Terminal-Emulator-master
	gunzip Android-Terminal-Emulator-master.patch.gz
	patch -p1 < Android-Terminal-Emulator-master.patch

Changes:

ant.properties:

	# key.alias=jackpal.keystore
	# key.store=../../Documents/workspace/keystore/jackpal.keystore


project.properties:

	key.store=../gv.keystore
	key.alias=gv_ks
	ndk.dir=/opt/local/android/android-ndk-r9d

local.properties:

	sdk.dir=/opt/local/android/adt-bundle-linux-x86-20140321/sdk

addition:

	custom_rules.xml	


Once the patch is applied, do:

	ant release 
	or
	ant release install

Built with:

	adt-bundle-linux-x86-20140321
	android-ndk-r9d
	apache-ant
