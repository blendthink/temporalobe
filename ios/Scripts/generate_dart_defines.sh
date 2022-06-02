#!/usr/bin/env bash

# DART_DEFINES のデコード処理
function decode() { echo "${*}" | base64 --decode; }

# DART_DEFINES をカンマ区切りで分けて変数に格納
IFS=',' read -r -a dart_defines <<< "$DART_DEFINES"

# デコード処理を行い、変数に再格納
for index in "${!dart_defines[@]}"
do
  dart_define=$(decode "${dart_defines[$index]}")

  # 接頭辞が 'APP_ID_SUFFIX=' の場合は値に "." を付与
  if [[ $dart_define =~ ^APP_ID_SUFFIX= ]]; then
      dart_define=${dart_define//=/=.}
  fi

  dart_defines[$index]=$dart_define
done

# 接頭辞が 'APP_' の場合だけ DartDefines.xcconfig に出力
printf "%s\n" "${dart_defines[@]}"|grep '^APP_' > "${SRCROOT}/Flutter/DartDefines.xcconfig"
