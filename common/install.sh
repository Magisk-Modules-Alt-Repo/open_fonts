MANUFACTER=$(getprop ro.product.manufacturer)

ln -s $MODPATH/system/fonts/NotoSans-Regular.ttf $MODPATH/system/fonts/AndroidClock.ttf
ln -s $MODPATH/system/fonts/NotoSansMono.ttf $MODPATH/system/fonts/DroidSansMono.ttf

if [ $MANUFACTER = "Samsung" ]; then
	ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/SamsungColorEmoji.ttf
elif [ $MANUFACTER = "LGE" ]; then
    ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/LGNotoColorEmoji.ttf
elif [ $MANUFACTER = "HTC" ]; then
	ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/HTC_ColorEmoji.ttf
fi