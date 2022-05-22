# environment
EMOJI=false
VERSION=$(getprop ro.system.build.version.release)
SDK=$(getprop ro.system.build.version.sdk)
MANUFACTER=$(getprop ro.product.manufacturer)

# replace
ln -s $MODPATH/system/fonts/NotoSans-Regular.ttf $MODPATH/system/fonts/AndroidClock.ttf
ln -s $MODPATH/system/fonts/NotoSans-Regular.ttf $MODPATH/system/fonts/DroidSans.ttf
ln -s $MODPATH/system/fonts/NotoSans-Bold.ttf $MODPATH/system/fonts/DroidSans-Bold.ttf

ui_print "- You are currently running Android $VERSION"
if [ $SDK -ge 32 ]; then
	ui_print '  Your system already supports the latest version of emoji'
	# user input
	ui_print '- Do you want to replace system emoji with Noto Emoji?'
	ui_print '  Vol+ = yes, Vol- = no[recommended]'
	if chooseport 5; then
		EMOJI=true
	fi
else
	# user input
	ui_print '- Do you want to replace system emoji with Noto Emoji?'
	ui_print '  Vol+ = yes, Vol- = no'
	if chooseport 5; then
		EMOJI=true
	fi
fi

# replace emoji
if $EMOJI; then
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
else
	ui_print '  System emojis will not be replaced!'
fi