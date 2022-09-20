#!/system/bin/sh
MANUFACTER=$(getprop ro.product.manufacturer)
STANDARD_FONT_NAME_REGULAR="Roboto-Regular.ttf"
STANDARD_FONT_NAME_ITALIC="Roboto-Italic.ttf"
ui_print "- Choose a font between:"
ui_print "  -) NotoSans"
ui_print "  -) OpenSans"
ui_print "  -) Roboto-Flex"
ui_print ""
sleep 2
ui_print "  Select:"
ui_print "  -> NotoSans [Vol+ = yes, Vol- = no]"
if chooseport 3; then
	SYSTEM_FONT="NotoSans"
	FONT_URL_REGULAR=https://github.com/notofonts/noto-fonts/raw/main/unhinted/variable-ttf/NotoSans-VF.ttf
	FONT_URL_ITALIC=https://github.com/notofonts/noto-fonts/raw/main/unhinted/variable-ttf/NotoSans-Italic-VF.ttf
else
	ui_print "  -> OpenSans [Vol+ = yes, Vol- = no]"
	if chooseport 3; then
		SYSTEM_FONT="OpenSans"
		FONT_URL_REGULAR=https://github.com/googlefonts/opensans/raw/main/fonts/noto-set/variable/OpenSans%5Bwdth%2Cwght%5D.ttf
		FONT_URL_ITALIC=https://github.com/googlefonts/opensans/raw/main/fonts/noto-set/variable/OpenSans-Italic%5Bwdth%2Cwght%5D.ttf
	else
		ui_print "  -> Roboto-Flex [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			SYSTEM_FONT="Roboto-Flex"
			FONT_URL_REGULAR=https://github.com/googlefonts/roboto-flex/raw/main/fonts/RobotoFlex%5BGRAD%2CXOPQ%2CXTRA%2CYOPQ%2CYTAS%2CYTDE%2CYTFI%2CYTLC%2CYTUC%2Copsz%2Cslnt%2Cwdth%2Cwght%5D.ttf
			FONT_URL_ITALIC=none
		else
			ui_print "  System font will not be replaced!"
			exit 1
		fi
	fi
fi

IS_ERROR=true
ui_print "  Downloading ${SYSTEM_FONT}..."
for i in 1 2 3
do
	if [[ "$IS_ERROR" = true ]]; then
		if [[ ! -f "${SYSTEM_FONT}.ttf" ]]; then
			curl -Lso "${SYSTEM_FONT}.ttf" "${FONT_URL_REGULAR}"
		fi

		if [[ $FONT_URL_ITALIC != "none" && ! -f "${SYSTEM_FONT}-Italic.ttf" ]]; then
			curl -Lso "${SYSTEM_FONT}-Italic.ttf" "${FONT_URL_ITALIC}"
		fi

		if [[ ! -f "${SYSTEM_FONT}.ttf" ]]; then
			IS_ERROR=true
		elif [[ $FONT_URL_ITALIC != "none" && ! -f "${SYSTEM_FONT}-Italic.ttf" ]]; then
			IS_ERROR=true
		else
			IS_ERROR=false
		fi
	fi
done

if [[ "$IS_ERROR" = true ]]; then
	ui_print ""
	ui_print "  !!! Dowload failed !!!"
	ui_print "  Check your connection and try again."
	ui_print ""
	exit 1
fi

ui_print "  Replacing..."
rm -rf "$MODPATH"/system/fonts/placeholder
mv -f ./"${SYSTEM_FONT}.ttf" "$MODPATH"/system/fonts/$STANDARD_FONT_NAME_REGULAR
if [[ $FONT_URL_ITALIC != "none" ]]; then
	mv -f ./"${SYSTEM_FONT}-Italic.ttf" "$MODPATH"/system/fonts/$STANDARD_FONT_NAME_ITALIC
fi
ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/AndroidClock.ttf
if [ $API -ge 31 ]; then
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoStatic-Regular.ttf
else
	# regular
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Roboto-Thin.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Roboto-Light.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Roboto-Medium.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Roboto-Bold.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Roboto-Black.ttf
	# italic
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/Roboto-ThinItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/Roboto-LightItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/Roboto-MediumItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/Roboto-BoldItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/Roboto-BlackItalic.ttf
	# condensed regular
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoCondensed-Thin.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoCondensed-Light.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoCondensed-Medium.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoCondensed-Bold.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoCondensed-Black.ttf
	# condensed italic
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/RobotoCondensed-ThinItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/RobotoCondensed-LightItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/RobotoCondensed-MediumItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/RobotoCondensed-BoldItalic.ttf
	ln -s ./$STANDARD_FONT_NAME_ITALIC "$MODPATH"/system/fonts/RobotoCondensed-BlackItalic.ttf
fi

if [ $MANUFACTER = "Samsung" ]; then
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/SECNum-3L.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/SECNum-3R.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Clock2019L-RM.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Clock2021.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Clock2021_Fixed.ttf
	if [ $API -lt 31 ]; then
	    ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Clock2016.ttf
    	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Clock2017L.ttf
    	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Clock2017R.ttf
		ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/Clock2019L.ttf
		ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoNum-3L.ttf
		ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/RobotoNum-3R.ttf
	fi
fi
ui_print "  System font replaced!"

# replace monospaced font
ui_print ""
ui_print "- Do you want to replace monospaced font?"
ui_print "  [Vol+ = yes, Vol- = no]"
if chooseport; then
	ui_print "- Choose a font between:"
	ui_print "  -) NotoSans Mono"
	ui_print "  -) JetBrains Mono"
	ui_print ""
	sleep 2
	ui_print "  Select:"
	ui_print "  -> NotoSans Mono [Vol+ = yes, Vol- = no]"

	if chooseport 3; then
		SYSTEM_FONT="NotoSansMono"
		FONT_URL_REGULAR=https://github.com/notofonts/noto-fonts/raw/main/unhinted/variable-ttf/NotoSansMono-VF.ttf
	else
		ui_print "  -> JetBrainsMono [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			SYSTEM_FONT="JetBrains"
			FONT_URL_REGULAR=https://github.com/JetBrains/JetBrainsMono/raw/master/fonts/variable/JetBrainsMono%5Bwght%5D.ttf
		fi
	fi

	IS_ERROR=true
	ui_print "  Downloading ${SYSTEM_FONT}..."
	for i in 1 2 3
	do
		if [[ "$IS_ERROR" = true ]]; then
			curl -Lso "${SYSTEM_FONT}.ttf" "${FONT_URL_REGULAR}"

			if [[ ! -f "${SYSTEM_FONT}.ttf" ]]; then
				IS_ERROR=true
			else
				IS_ERROR=false
			fi
		fi
	done

	if [[ "$IS_ERROR" = true ]]; then
		ui_print ""
		ui_print "  !!! Dowload failed !!!"
		ui_print "  Check your connection and try again."
		ui_print ""
		exit 1
	fi

	ui_print "  Replacing..."
	STANDARD_FONT_NAME_REGULAR="DroidSansMono.ttf"
	mv -f "$TMPDIR"/"${SYSTEM_FONT}.ttf" "$MODPATH"/system/fonts/$STANDARD_FONT_NAME_REGULAR

	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/DroidSansMono.ttf
	ln -s ./$STANDARD_FONT_NAME_REGULAR "$MODPATH"/system/fonts/CutiveMono.ttf
	ui_print "  System font replaced!"
else
	ui_print "  Monospace font will not be replaced!"
fi

# replace emoji
ui_print ""
ui_print "- Do you want to replace system emoji?"
ui_print "  [Vol+ = yes, Vol- = no]"
if chooseport; then
	STANDARD_EMOJI_NAME="NotoColorEmoji.ttf"
	ui_print "- Choose one emoji font between:"
	ui_print "  -) NotoColorEmoji"
	ui_print "  -) Twemoji"
	ui_print ""
	sleep 2
	ui_print "  Select:"
	ui_print "  -> NotoColorEmoji [Vol+ = yes, Vol- = no]"
	if chooseport 3; then
		EMOJI_FONT="NotoColorEmoji"
		EMOJI_URL=https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
	else
		ui_print "  -> Twemoji [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			EMOJI_FONT="Twemoji"
			EMOJI_URL=https://github.com/Magisk-Modules-Alt-Repo/open_fonts/raw/develop/sources/twemoji/Twemoji.ttf
		else
			ui_print "  System emoji will not be replaced!"
			exit 1
		fi
	fi

	ui_print "  Downloading ${EMOJI_FONT}..."
	curl -Lso "${EMOJI_FONT}.ttf" "${EMOJI_URL}"
	if [ -f "${EMOJI_FONT}.ttf" ]; then
		ui_print "  ${EMOJI_FONT} downloaded!"
	else
		curl -Lso "${EMOJI_FONT}.ttf" "${EMOJI_URL}"
		if [ -f "${EMOJI_FONT}.ttf" ]; then
			ui_print "  ${EMOJI_FONT} downloaded!"
		fi
	fi

	if [ ! -f "${EMOJI_FONT}.ttf" ]; then
		ui_print ""
		ui_print "  !!! Dowload failed !!!"
		ui_print "  Check your connection and try again."
		ui_print ""
		exit 1
	fi

	ui_print "  Replacing..."
	mv -f ./"${EMOJI_FONT}.ttf" "$MODPATH"/system/fonts/$STANDARD_EMOJI_NAME
	ln -s ./$STANDARD_EMOJI_NAME "$MODPATH"/system/fonts/NotoColorEmojiFlags.ttf
	if [ $MANUFACTER = "Samsung" ]; then
		ln -s ./$STANDARD_EMOJI_NAME "$MODPATH"/system/fonts/SamsungColorEmoji.ttf
	elif [ $MANUFACTER = "LGE" ]; then
		ln -s ./$STANDARD_EMOJI_NAME "$MODPATH"/system/fonts/LGNotoColorEmoji.ttf
	elif [ $MANUFACTER = "HTC" ]; then
		ln -s ./$STANDARD_EMOJI_NAME "$MODPATH"/system/fonts/HTC_ColorEmoji.ttf
	fi
	ui_print "  System emojis replaced!"
else
	ui_print "  System emojis will not be replaced!"
fi