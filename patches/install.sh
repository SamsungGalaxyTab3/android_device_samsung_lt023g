echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="frameworks/native hardware/libhardware_legacy"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/samsung/lt023g/patches/$dir/*.patch
	###if you want to commit the patches at the very time they are applied, uncomment the below lines
	#git add *
	#git commit -m "Patch for lt023g"
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
