MODDIR=${0%/*}

MANUFACTER=$(getprop ro.product.manufacturer)

ln -s $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/AndroidClock.ttf
ln -s $MODDIR/system/fonts/NotoSansMono.ttf $MODDIR/system/fonts/DroidSansMono.ttf

if [ $MANUFACTER = "Samsung" ]; then
	ln -s $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/SamsungColorEmoji.ttf
elif [ $MANUFACTER = "LGE" ]; then
    ln -s $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/LGNotoColorEmoji.ttf
elif [ $MANUFACTER = "HTC" ]; then
	ln -s $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/HTC_ColorEmoji.ttf
fi