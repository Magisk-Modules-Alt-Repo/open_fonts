SDK=$(getprop ro.system.build.version.sdk)
MANUFACTER=$(getprop ro.product.manufacturer)

mkdir $MODPATH/system/etc
cp -a /system/etc/fonts.xml $MODPATH/system/etc

# function to replace Roboto font
replace_roboto() {
    # normal
    sed -i 's@style="normal">Roboto-Regular.ttf@style="normal">NotoSans.ttf@g' $1
    # italic
    sed -i 's@style="italic">Roboto-Regular.ttf@style="italic">NotoSans-Italic.ttf@g' $1
}

# goodbye Roboto
if [ $SDK -lt 31 ] ; then
    sed -i 's@Roboto-.*@NotoSans@g' $MODPATH/system/etc/fonts.xml
    sed -i 's@RobotoCondensed-.*@NotoSans@g' $MODPATH/system/etc/fonts.xml
else
    replace_roboto $MODPATH/system/etc/fonts.xml
fi

if [ $MANUFACTER = "Samsung" ]; then
    cp -a /system/etc/fonts_additional.xml $MODPATH/system/etc
    replace_roboto $MODPATH/system/etc/fonts_additional.xml
fi