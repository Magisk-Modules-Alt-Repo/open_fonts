# Open Fonts - [XDA Thread](https://forum.xda-developers.com/t/magisk-module-font-open-fonts.4446663/)

![Open Font](https://raw.githubusercontent.com/F3FFO/Open-Fonts/master/img/logo.png)

This module helps you to replace your system fonts though Magisk.

**ATTENTION!** After several attempts I decided to replace only the main Android font: Roboto. This choice is the one I think is more correct as it is left to the user the possibility to choose other fonts without having to uninstall the module.

### About Twemoji

I extracted the font from the arch linux user repository because it is already in the [CBDT](https://learn.microsoft.com/en-us/typography/opentype/spec/cbdt)/[CBLC](https://learn.microsoft.com/en-us/typography/opentype/spec/cblc) standard.

## Compatibility

- Android 10+
- Magisk 20.4+

## Tested Device

- Many devices with [LOS 18.1 and 19](https://lineageos.org/)
- Some devices with OneUI 3.0, 3.1, 4.0 and 4.1

## DISCLAIMER

**I am not responsible for any damage that may occur to your device, so it is your own choice to attempt this module.**

## Support

If you found this helpful, please consider supporting development with a [coffe](https://www.paypal.me/f3ff0). Alternatively, you can contribute to the project by reporting bugs and doing PR. All support is appreciated!

## Features

- Works on any device running Android 10.0+ and Magisk 20.4+
- Support latest unicode version ([Unicode 14.0](https://emojipedia.org/unicode-14.0/))
- Replace Samsung, LG and HTC custom emoji
- You can choose to replace system fonts with:
  1. [Noto Sans](https://github.com/googlefonts/noto-fonts)
  2. [OpenSans](https://github.com/googlefonts/opensans)
  3. [Roboto-Flex](https://github.com/googlefonts/roboto-flex)
  4. [NotoSans Mono](https://github.com/googlefonts/noto-fonts)
  5. [JetBrains Mono](https://github.com/googlefonts/noto-fonts)
  6. [Noto Emoji](https://github.com/googlefonts/noto-emoji)
  7. [Twemoji](https://github.com/twitter/twemoji)

## Credits

- [MMT-Extended](https://github.com/Zackptg5/MMT-Extended) by [Zackptg5](https://github.com/Zackptg5)
- [Keycheck](https://github.com/Zackptg5/Keycheck) by [Zackptg5](https://github.com/Zackptg5)
- [cUrl](https://github.com/curl/curl)
- [cUrl binary](https://github.com/F3FFO/compile_zlib_openssl_curl_android)
- [Noto Sans/NotoSans Mono](https://github.com/googlefonts/noto-fonts)
- [OpenSans](https://github.com/googlefonts/opensans)
- [Roboto-Flex](https://github.com/googlefonts/roboto-flex)
- [JetBrains Mono](https://github.com/googlefonts/noto-fonts)
- [Noto Emoji](https://github.com/googlefonts/noto-emoji)
- [Twemoji](https://github.com/twitter/twemoji)

## License

Copyright 2022 F3FFO

The source code is available under [GPL-3.0](https://github.com/Magisk-Modules-Alt-Repo/open_fonts/blob/master/LICENSE)

- Noto Sans/NotoSans Mono are available under the [SIL Open Font License v1.1](https://github.com/notofonts/noto-fonts/blob/main/LICENSE)
- Roboto-Flex is available under the [SIL Open Font License v1.1](https://github.com/googlefonts/roboto-flex/blob/main/OFL.txt)
- JetBrainsMono is available under the [SIL Open Font License v1.1](https://github.com/JetBrains/JetBrainsMono/blob/master/OFL.txt)
- Noto Emoji is available under the [SIL Open Font License v1.1](https://github.com/googlefonts/noto-emoji/blob/main/fonts/LICENSE)
- Twemoji is available under the [CC-BY 4.0](https://github.com/twitter/twemoji/blob/master/LICENSE-GRAPHICS)

## Change logs

# v3.1.1

- Update link for noto sans fonts

# v3.1.0

- Rewrite installation script
- Bug fix

# v3.0.1

- Add curl binary
- Bug fix

# v3.0.0

- Added two new system fonts: OpenSans and Roboto-Flex
- Added two new monospaced system fonts: NotoSans Mono and JetBrains Mono
- Added a new emoji font: Twemoji
- Decreased module size
- Bug fix

# v2.0.1

- Bug fix

# v2.0.0

- Increased boot speed
- Updated compatibility with Samsung devices
- Fully compatible with Safety Net Fix
- Update addon
- Bug fix

# v1.1.3

- Optimizated installation script
- Bug fix

# v1.1.2

- Decreased module size
- Bug fix

# v1.1.1

- Added ability to choose whether to change the emoji font
- Bug fix

# v1.1.0

- Bug fix

# v1.0.9

- Update to magisk 24 standard
- Renamed Roboto to NotoSans
- Bug fix

# v1.0.8

- Add support for sans monospace font
- Add support for condensed fonts
- Update NotoSans from source
- Bug fix

# v1.0.7

- Decrease module size
- Replaced OpenSans font with a more complete one: NotoSans
- Add support for Thin font
- Add support for Medium font
- Add support for Black font
- Changed Samsung, LG, HTC emoji with Noto Emoji

# v1.0.6

- Add bold font

# v1.0.5

- Update fonts to Android 12
- Add fonts.xml from Android 12

# v1.0.4

- Changed monospace font

# v1.0.3

- Update to last version some Noto fonts
- Changed Rubik font
- Changed Lato font

# v1.0.2

- Change SourceSansPro fonts

# v1.0.1

- Change secondary system fonts
- Create AndroidClock font from Open Sans
- Add NotoColorEmoji (unicode 14)

# v1.0.0

- Initial release
