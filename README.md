## Misc code etc


## Slackware installation script

slackware.install.sh

Helps install slackware to the desired partition under proot, on host or
device. as simple as
	./slackware.install.sh a 
to install series a alone etc. This is only a preliminary checkin. Only some options are tested.

See proot.sh for installation under qemu.

Partition where slackware is to be installed is mounted at /mnt
Slackware packges under slackware-14.1
procedure: 

   sh proot.sh

inside proot:

   sh ./slackware.install.sh a

see 

[screenshot](https://github.com/gv1/misc/screeshot.txt)


## Android-Terminal-Emulator-master patch

Android-Terminal-Emulator-master.patch.gz

Patch used to build [Android-Terminal-Emulator](https://github.com/jackpal/Android-Terminal-Emulator) 

Without the patch, libjackpal-androidterm4 was not getting added to the the apk, and Terminal Emulator not functioning.
	
Applying the patch:

	cd Android-Terminal-Emulator-master
	patch -p1 < Android-Terminal-Emulator-master.patch


Changes:

Update ant.properties:

	# key.alias=jackpal.keystore
	# key.store=../../Documents/workspace/keystore/jackpal.keystore
	key.store=../gv.keystore
	key.alias=gv_ks
	ndk.dir=/opt/local/android/android-ndk-r9d
	sdk.dir=/opt/local/android/adt-bundle-linux-x86-20140321/sdk

   TODO: *add key related lines here as project.properties is not the right place*


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

sqlitestudio-2.1.5, slackware 14.0
	sqlitestudio-2.1.5.patch
	works with ActiveTcl-8.6 + tkdnd2.6	

