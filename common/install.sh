#!/system/bin/sh
MANUFACTER=$(getprop ro.product.manufacturer)
STANDARD_FOLDER="$MODPATH"/system/fonts
STATUS=0
SKIP_INSTALLATION=0
NEXT_SELECTION=1

noto_sans() {
	FONT_NAME="NotoSans"
	FONT_URL=https://github.com/notofonts/noto-fonts/raw/main/unhinted/variable-ttf/NotoSans-VF.ttf
	FONT_NAME_ITALIC="NotoSans-Italic"
	FONT_URL_ITALIC=https://github.com/notofonts/noto-fonts/raw/main/unhinted/variable-ttf/NotoSans-Italic-VF.ttf
}
open_sans() {
	FONT_NAME="OpenSans"
	FONT_URL=https://github.com/googlefonts/opensans/raw/main/fonts/noto-set/variable/OpenSans%5Bwdth%2Cwght%5D.ttf
	FONT_NAME_ITALIC="OpenSans-Italic"
	FONT_URL_ITALIC=https://github.com/googlefonts/opensans/raw/main/fonts/noto-set/variable/OpenSans-Italic%5Bwdth%2Cwght%5D.ttf
}
robot_flex() {
	FONT_NAME="Roboto-Flex"
	FONT_URL=https://github.com/googlefonts/roboto-flex/raw/main/fonts/RobotoFlex%5BGRAD%2CXOPQ%2CXTRA%2CYOPQ%2CYTAS%2CYTDE%2CYTFI%2CYTLC%2CYTUC%2Copsz%2Cslnt%2Cwdth%2Cwght%5D.ttf
	FONT_NAME_ITALIC=""
}
noto_sans_mono() {
	FONT_NAME="NotoSansMono"
	FONT_URL=https://github.com/notofonts/noto-fonts/raw/main/unhinted/variable-ttf/NotoSansMono-VF.ttf
}
jetbrains_mono() {
	FONT_NAME="JetBrainsMono"
	FONT_URL=https://github.com/JetBrains/JetBrainsMono/raw/master/fonts/variable/JetBrainsMono%5Bwght%5D.ttf
}
noto_color_emoji() {
	FONT_NAME="NotoColorEmoji"
	FONT_URL=https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
}
twemoji() {
	FONT_NAME="Twemoji"
	FONT_URL=https://github.com/Magisk-Modules-Alt-Repo/open_fonts/raw/develop/sources/twemoji/Twemoji.ttf
}
download_file() {
	STATUS = 0
	ui_print "    Downloading ${1}..."

	curl -kLo "$TMPDIR"/"${1}.ttf" $2

	if [[ ! -f "$TMPDIR"/"${1}.ttf" ]]; then
		STATUS=0
	else
		STATUS=1
	fi
}
install_font() {
	STANDARD_FONT_NAME="Roboto-Regular.ttf"
	ui_print "    Replacing..."
	cp_ch "$TMPDIR"/"${FONT_NAME}.ttf" $STANDARD_FOLDER/"$STANDARD_FONT_NAME"

	if [ $API -ge 31 ]; then
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoStatic-Regular.ttf
	else
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-Thin.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-Light.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-Medium.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-Bold.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-Black.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-Thin.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-Light.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-Medium.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-Bold.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-Black.ttf
		STANDARD_FONT_NAME="Roboto-Italic.ttf"
		cp_ch "$TMPDIR"/"${FONT_NAME_ITALIC}.ttf" $STANDARD_FOLDER/"$STANDARD_FONT_NAME"
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-ThinItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-LightItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-MediumItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-BoldItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Roboto-BlackItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-ThinItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-LightItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-MediumItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-BoldItalic.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoCondensed-BlackItalic.ttf
	fi
}
install_clock_font() {
	ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/AndroidClock.ttf

	if [ $MANUFACTER = "Samsung" ]; then
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/SECNum-3L.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/SECNum-3R.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Clock2019L-RM.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Clock2021.ttf
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Clock2021_Fixed.ttf
		if [ $API -lt 31 ]; then
			ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Clock2016.ttf
			ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Clock2017L.ttf
			ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Clock2017R.ttf
			ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/Clock2019L.ttf
			ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoNum-3L.ttf
			ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/RobotoNum-3R.ttf
		fi
	fi
	ui_print "    Android clock font replaced!"
}
install_mono_font() {
	STANDARD_FONT_NAME="DroidSansMono.ttf"
	ui_print "    Replacing..."
	cp_ch "$TMPDIR"/"${FONT_NAME}.ttf" $STANDARD_FOLDER/"$STANDARD_FONT_NAME"

	ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/CutiveMono.ttf
	ui_print "  Fonts replaced!"
}
install_emoji_font() {
	STANDARD_FONT_NAME="NotoColorEmoji.ttf"
	ui_print "    Replacing..."
	cp_ch "$TMPDIR"/"${FONT_NAME}.ttf" $STANDARD_FOLDER/"$STANDARD_FONT_NAME"

	if [ $API -ge 31 ]; then
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/NotoColorEmojiFlags.ttf
	fi

	if [ $MANUFACTER = "Samsung" ]; then
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/SamsungColorEmoji.ttf
	elif [ $MANUFACTER = "LGE" ]; then
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/LGNotoColorEmoji.ttf
	elif [ $MANUFACTER = "HTC" ]; then
		ln -s ./"$STANDARD_FONT_NAME" $STANDARD_FOLDER/HTC_ColorEmoji.ttf
	fi
	ui_print "  Fonts replaced!"
}
check_status() {
	if [ "${STATUS}" -eq 0 ]; then
		ui_print ""
		ui_print "  !!! Dowload failed !!!"
		ui_print ""
		exit 1
	fi
}
reset_variable() {
	SKIP_INSTALLATION=0
	NEXT_SELECTION=1
}
clean_up() {
	rm -rf $STANDARD_FOLDER/placeholder
}

ui_print "- Do you want to replace system font?"
ui_print "  [Vol+ = yes, Vol- = no]"
if chooseport 30; then
	ui_print "    Choose between:"
	ui_print "      NotoSans, OpenSans, Roboto-Flex"
	sleep 3
	ui_print ""
	ui_print "    Select:"
	ui_print "    -> NotoSans [Vol+ = yes, Vol- = no]"
	if chooseport 3; then
		noto_sans
		NEXT_SELECTION=0
	fi
	if [ "${NEXT_SELECTION}" -eq 1 ]; then
		ui_print "    -> OpenSans [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			open_sans
			NEXT_SELECTION=0
		fi
	fi
	if [ "${NEXT_SELECTION}" -eq 1 ]; then
		ui_print "    -> Roboto-Flex [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			robot_flex
		else
			SKIP_INSTALLATION=1
		fi
	fi

	if [ "${SKIP_INSTALLATION}" -eq 0 ]; then
		download_file $FONT_NAME $FONT_URL
		if [ $API -lt 31 ]; then
			if [[ ! -z "${FONT_NAME_ITALIC}" ]]; then
				download_file $FONT_NAME_ITALIC $FONT_URL_ITALIC
			fi
		fi

		check_status
		install_font

		ui_print ""
		ui_print " !! Experimental feature, may not works !!"
		ui_print "    Do you want to replace android clock font?"
		ui_print "    [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			install_clock_font
		else
    		ui_print "  Android clock font not replaced."
  		fi
		ui_print "  Fonts replaced!"
	else
		ui_print "  Fonts will not be replaced!"
	fi
fi

# replace monospaced font
reset_variable
ui_print "- Do you want to replace monospaced font?"
ui_print "  [Vol+ = yes, Vol- = no]"
if chooseport 30; then
	ui_print "    Choose between:"
	ui_print "      NotoSans Mono, JetBrains Mono"
	sleep 3
	ui_print ""
	ui_print "    Select:"
	ui_print "    -> NotoSans Mono [Vol+ = yes, Vol- = no]"
	if chooseport 3; then
		noto_sans_mono
		NEXT_SELECTION=0
	fi
	if [ "${NEXT_SELECTION}" -eq 1 ]; then
		ui_print "    -> JetBrainsMono [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			jetbrains_mono
		else
			SKIP_INSTALLATION=1
		fi
	fi

	if [ "${SKIP_INSTALLATION}" -eq 0 ]; then
		download_file $FONT_NAME $FONT_URL
		check_status

		install_mono_font
	else
		ui_print "  Fonts will not be replaced!"
	fi
else
	ui_print "  Fonts will not be replaced!"
fi

# replace emoji
reset_variable
ui_print "- Do you want to replace system emoji?"
ui_print "  [Vol+ = yes, Vol- = no]"
if chooseport 30; then
	ui_print "    Choose between:"
	ui_print "      NotoColorEmoji, Twemoji"
	sleep 3
	ui_print ""
	ui_print "    Select:"
	ui_print "    -> NotoColorEmoji [Vol+ = yes, Vol- = no]"
	if chooseport 3; then
		noto_color_emoji
		NEXT_SELECTION=0
	fi
	if [ "${NEXT_SELECTION}" -eq 1 ]; then
		ui_print "    -> Twemoji [Vol+ = yes, Vol- = no]"
		if chooseport 3; then
			twemoji
		else
			SKIP_INSTALLATION=1
		fi
	fi

	if [ "${SKIP_INSTALLATION}" -eq 0 ]; then
		download_file $FONT_NAME $FONT_URL
		check_status

		install_emoji_font
	else
		ui_print "  Fonts will not be replaced!"
	fi
else
	ui_print "  Fonts will not be replaced!"
fi
clean_up
