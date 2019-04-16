#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/stakework.png
ICON_DST=../../src/qt/res/icons/stakework.ico
convert ${ICON_SRC} -resize 16x16 stakework-16.png
convert ${ICON_SRC} -resize 32x32 stakework-32.png
convert ${ICON_SRC} -resize 48x48 stakework-48.png
convert stakework-16.png stakework-32.png stakework-48.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/stakework_testnet.png
ICON_DST=../../src/qt/res/icons/stakework_testnet.ico
convert ${ICON_SRC} -resize 16x16 stakework-16.png
convert ${ICON_SRC} -resize 32x32 stakework-32.png
convert ${ICON_SRC} -resize 48x48 stakework-48.png
convert stakework-16.png stakework-32.png stakework-48.png ${ICON_DST}
rm stakework-16.png stakework-32.png stakework-48.png
#regtest
ICON_SRC=../../src/qt/res/icons/stakework_regtest.png
ICON_DST=../../src/qt/res/icons/stakework_regtest.ico
convert ${ICON_SRC} -resize 16x16 stakework-16.png
convert ${ICON_SRC} -resize 32x32 stakework-32.png
convert ${ICON_SRC} -resize 48x48 stakework-48.png
convert stakework-16.png stakework-32.png stakework-48.png ${ICON_DST}
rm stakework-16.png stakework-32.png stakework-48.png
#unittest
ICON_SRC=../../src/qt/res/icons/stakework_unittest.png
ICON_DST=../../src/qt/res/icons/stakework_unittest.ico
convert ${ICON_SRC} -resize 16x16 stakework-16.png
convert ${ICON_SRC} -resize 32x32 stakework-32.png
convert ${ICON_SRC} -resize 48x48 stakework-48.png
convert stakework-16.png stakework-32.png stakework-48.png ${ICON_DST}
rm stakework-16.png stakework-32.png stakework-48.png