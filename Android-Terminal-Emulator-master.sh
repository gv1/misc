cd tmp
rm -rf  ./Android-Terminal-Emulator-master.compiled 
cp -r ../Android-Terminal-Emulator-master.compiled .
cd Android-Terminal-Emulator-master.compiled
android update project -p . --target 1 --subprojects
cd libraries/emulatorview
android update project -p . --target 1 --subprojects
cd ../..
ant clean
ant release install
cd ..
diff -uNr  Android-Terminal-Emulator-master Android-Terminal-Emulator-master.compiled > Android-Terminal-Emulator-master.patch
cd tmp
rm -rf  ./Android-Terminal-Emulator-master.compiled
cp -r ../Android-Terminal-Emulator-master Android-Terminal-Emulator-master.compiled
cd Android-Terminal-Emulator-master.compiled
patch -p1 < ../../Android-Terminal-Emulator-master.patch
android update project -p . --target 1 --subprojects
cd libraries/emulatorview
android update project -p . --target 1 --subprojects
cd ../..
ant clean
ant release install
                             
