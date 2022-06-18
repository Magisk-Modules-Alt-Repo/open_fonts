# environment
SDK=$(getprop ro.system.build.version.sdk)
MANUFACTER=$(getprop ro.product.manufacturer)
EMOJI=false

# replace
ln -s $MODPATH/system/fonts/NotoSans.ttf $MODPATH/system/fonts/AndroidClock.ttf
if [ $MANUFACTER = "Samsung" ]; then
	ln -s $MODPATH/system/fonts/NotoSans.ttf $MODPATH/system/fonts/Clock2019L-RM.ttf
	ln -s $MODPATH/system/fonts/NotoSans.ttf $MODPATH/system/fonts/Clock2021.ttf
	ln -s $MODPATH/system/fonts/NotoSans.ttf $MODPATH/system/fonts/Clock2021_Fixed.ttf
fi
ln -s $MODPATH/system/fonts/NotoSans.ttf $MODPATH/system/fonts/DroidSans.ttf
ln -s $MODPATH/system/fonts/NotoSans.ttf $MODPATH/system/fonts/DroidSans-Bold.ttf

if [ $SDK -ge 31 ]; then
	ui_print '  !!!'
	ui_print '- Your system already supports the latest version of emoji'
	ui_print '  !!!'
fi

# user input
ui_print '- Do you want to replace system emoji with Noto Emoji?'

if [ $SDK -ge 31 ]; then
	ui_print '  Vol+ = yes, Vol- = no[recommended]'
else
	ui_print '  Vol+ = yes, Vol- = no'
fi

if chooseport 5; then
	EMOJI=true
fi

# replace emoji
if $EMOJI; then
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