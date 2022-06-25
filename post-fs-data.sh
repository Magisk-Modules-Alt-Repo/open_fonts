#!/system/bin/sh
# environment
SDK=$(getprop ro.build.version.sdk)
MANUFACTER=$(getprop ro.product.manufacturer)

# function
replace_roboto() {
    sed -i 's@Roboto-.*.ttf@Roboto-Regular.ttf@g' $1
    sed -i 's@RobotoCondensed-.*.ttf@Roboto-Regular.ttf@g' $1
}

mkdir $MODPATH/system/etc
cp -a /system/etc/fonts.xml $MODPATH/system/etc

if [ $SDK -lt 31 ]; then
    replace_roboto $MODPATH/system/etc/fonts.xml
fi

if [ $MANUFACTER = "Samsung" ]; then
    cp -a /system/etc/fonts_additional.xml $MODPATH/system/etc
    replace_roboto $MODPATH/system/etc/fonts_additional.xml
fi