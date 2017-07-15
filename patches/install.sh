echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="frameworks/native hardware/libhardware_legacy"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/samsung/lt023g/patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
