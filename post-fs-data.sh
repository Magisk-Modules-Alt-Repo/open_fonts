MODDIR=${0%/*}

ln -s $MODDIR/system/fonts/Roboto-Regular.ttf $MODDIR/system/fonts/AndroidClock.ttf

if getprop ro.product.manufacturer | grep -qE -e "^samsung";
then
	cp $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/SamsungColorEmoji.ttf
elif getprop ro.product.manufacturer | grep -qE -e "^LGE";
then
    cp $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/LGNotoColorEmoji.ttf
elif getprop ro.product.manufacturer | grep -qE -e "^HTC";
then
	cp $MODDIR/system/fonts/NotoColorEmoji.ttf $MODDIR/system/fonts/HTC_ColorEmoji.ttf
fi