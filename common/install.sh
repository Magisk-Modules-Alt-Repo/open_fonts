# replace
ln -s $MODPATH/system/fonts/NotoSans-Regular.ttf $MODPATH/system/fonts/AndroidClock.ttf
ln -s $MODPATH/system/fonts/NotoSans-Regular.ttf $MODPATH/system/fonts/DroidSans.ttf
ln -s $MODPATH/system/fonts/NotoSans-Bold.ttf $MODPATH/system/fonts/DroidSans-Bold.ttf

# user input
ui_print '- Do you want to replace system emoji with Noto Emoji?'
ui_print "  Vol+ = yes, Vol- = no"
if chooseport 5; then
	# replace emoji
	MANUFACTER=$(getprop ro.product.manufacturer)
	ui_print '  Downloading NotoColorEmoji...'
	curl --output-dir "$MODPATH/system/fonts" -OL https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
	ui_print '  NotoColorEmoji downloaded!'
	
	ui_print '  Replacing system emojis...'
	ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/NotoColorEmoji.ttf
	if [ $MANUFACTER = "Samsung" ]; then
		ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/SamsungColorEmoji.ttf
	elif [ $MANUFACTER = "LGE" ]; then
		ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/LGNotoColorEmoji.ttf
	elif [ $MANUFACTER = "HTC" ]; then
		ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/HTC_ColorEmoji.ttf
	fi
	ui_print '  System emojis replaced!'
fi