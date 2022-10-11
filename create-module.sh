#!/bin/bash
MODULE_NAME=open-fonts.zip

rm -r $MODULE_NAME
zip -r $MODULE_NAME ./* -x ./git/\* ./.github/\* ./img/\* ./common/tools/tools/\* ./README.md\* ./CHANGELOG.md\* ./gitignore\*
