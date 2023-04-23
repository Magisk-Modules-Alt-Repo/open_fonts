#!/bin/bash
MODULE_NAME=open-fonts.zip

echo "deleting old files..."
rm -rf $MODULE_NAME
echo -e "ok!\n\ncreating module zip..."
7z a -tzip -r $MODULE_NAME * -xr!.git* -xr!img -xr!common/tools/tools -xr!sources -x!*.md -x!create-module.sh >& /dev/null
