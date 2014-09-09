## Misc code etc


## Slackware installation script

slackware.install.sh

Helps install slackware to the desired partition under proot, on host or
device. as simple as
	./slackware.install.sh a 
to install series a alone etc. This is only a preliminary checkin. Only some options are tested.
see proot.sh for installation under qemu.


## Android-Terminal-Emulator-master patch

Android-Terminal-Emulator-master.patch.gz

patch used to build [Android-Terminal-Emulator](https://github.com/jackpal/Android-Terminal-Emulator) 

Without the patch, libjackpal-androidterm4 was not getting added to the the apk, and Terminal Emulator not functioning.
	
Applying the patch:

	cd Android-Terminal-Emulator-master
	gunzip Android-Terminal-Emulator-master.patch.gz
	patch -p1 < Android-Terminal-Emulator-master.patch


Changes:

Update ant.properties:

	# key.alias=jackpal.keystore
	# key.store=../../Documents/workspace/keystore/jackpal.keystore

   TODO: *add key related lines here as project.properties is not the right place*


Update project.properties:

	key.store=../gv.keystore
	key.alias=gv_ks
	ndk.dir=/opt/local/android/android-ndk-r9d

Update local.properties:

	sdk.dir=/opt/local/android/adt-bundle-linux-x86-20140321/sdk

Addition:

	custom_rules.xml	

Generate build.xml:

	android update project -p . --subprojects --target 1
	( cd libraries/emulatorview; \
	android update project -p . --subprojects --target 1 )

Once the patch is applied and build.xml is generated do:

	ant release 
	or
	ant release install

Built with:

	adt-bundle-linux-x86-20140321
	android-ndk-r9d
	apache-ant
