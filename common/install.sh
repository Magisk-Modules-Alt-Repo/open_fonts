#!/system/bin/sh
# environment
SDK=$(getprop ro.build.version.sdk)
MANUFACTER=$(getprop ro.product.manufacturer)

# replace
ln -s $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/AndroidClock.ttf
if [ $SDK -ge 31 ]; then
	ln -s $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/RobotoStatic-Regular.ttf
fi

if [ $MANUFACTER = "Samsung" ]; then
	ln -s $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/Clock2019L-RM.ttf
	ln -s $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/Clock2021.ttf
	ln -s $MODPATH/system/fonts/Roboto-Regular.ttf $MODPATH/system/fonts/Clock2021_Fixed.ttf
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
	ln -s $MODPATH/system/fonts/NotoColorEmoji.ttf $MODPATH/system/fonts/NotoColorEmoji.ttf
	sed -i 's@NotoColorEmojiFlags@NotoColorEmoji@g' $MODPATH/system/etc/fonts.xml
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