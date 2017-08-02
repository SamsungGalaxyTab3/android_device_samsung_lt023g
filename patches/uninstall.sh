echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="frameworks/native hardware/libhardware_legacy"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Reverting $dir patches..."
	git apply --reverse $rootdirectory/device/samsung/lt023g/patches/$dir/*.patch
	git reset --hard
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
