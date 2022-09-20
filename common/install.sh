#!/system/bin/sh
# environment
SDK=$(getprop ro.build.version.sdk)
MANUFACTER=$(getprop ro.product.manufacturer)

# replace
ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/AndroidClock.ttf
if [ $SDK -ge 31 ]; then
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoStatic-Regular.ttf
else
	# regular
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Roboto-Thin.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Roboto-Light.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Roboto-Medium.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Roboto-Bold.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Roboto-Black.ttf
	# italic
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/Roboto-ThinItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/Roboto-LightItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/Roboto-MediumItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/Roboto-BoldItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/Roboto-BlackItalic.ttf
	# condensed regular
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoCondensed-Thin.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoCondensed-Light.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoCondensed-Medium.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoCondensed-Bold.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoCondensed-Black.ttf
	# condensed italic
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/RobotoCondensed-ThinItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/RobotoCondensed-LightItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/RobotoCondensed-MediumItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/RobotoCondensed-BoldItalic.ttf
	ln -s ./Roboto-Italic.ttf $MODPATH/system/fonts/RobotoCondensed-BlackItalic.ttf
fi

if [ $MANUFACTER = "Samsung" ]; then
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/SECNum-3L.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/SECNum-3R.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Clock2019L-RM.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Clock2021.ttf
	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Clock2021_Fixed.ttf
	if [ $SDK -lt 31 ]; then
	    ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Clock2016.ttf
    	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Clock2017L.ttf
    	ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Clock2017R.ttf
		ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/Clock2019L.ttf
		ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoNum-3L.ttf
		ln -s ./Roboto-Regular.ttf $MODPATH/system/fonts/RobotoNum-3R.ttf
	fi
fi

if [ $SDK -ge 31 ]; then
	ui_print ''
	ui_print '  !!! ATTENTION !!!'
	ui_print '  Your system already supports the latest emojis'
	ui_print ''
fi

# user input
ui_print '- Do you want to replace system emoji with Noto Emoji?'

if [ $SDK -ge 31 ]; then
	ui_print '  Vol+ = yes, Vol- = no[recommended]'
else
	ui_print '  Vol+ = yes, Vol- = no'
fi

# replace emoji
if chooseport; then
	ui_print '  Downloading NotoColorEmoji...'
	curl -OLs --output-dir "$MODPATH/system/fonts" https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
	ui_print '  NotoColorEmoji downloaded!'
	ui_print ''
	ui_print '  Replacing system emojis...'
	ln -s ./NotoColorEmoji.ttf $MODPATH/system/fonts/NotoColorEmoji.ttf
	sed -i 's@NotoColorEmojiFlags@NotoColorEmoji@g' $MODPATH/system/etc/fonts.xml
	if [ $MANUFACTER = "Samsung" ]; then
		ln -s ./NotoColorEmoji.ttf $MODPATH/system/fonts/SamsungColorEmoji.ttf
	elif [ $MANUFACTER = "LGE" ]; then
		ln -s ./NotoColorEmoji.ttf $MODPATH/system/fonts/LGNotoColorEmoji.ttf
	elif [ $MANUFACTER = "HTC" ]; then
		ln -s ./NotoColorEmoji.ttf $MODPATH/system/fonts/HTC_ColorEmoji.ttf
	fi
	ui_print '  System emojis replaced!'
else
	ui_print '  System emojis will not be replaced!'
fi