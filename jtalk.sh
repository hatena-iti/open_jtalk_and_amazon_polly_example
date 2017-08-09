#!/bin/bash

# 辞書の指定
DIC=/var/lib/mecab/dic/open-jtalk/naist-jdic

# 音声データ（女性。通常）
VOICE=/usr/share/hts-voice/mei/mei_normal.htsvoice
# 音声データ（女性。うれしい）
#VOICE=/usr/share/hts-voice/mei/mei_happy.htsvoice
# 音声データ（女性。寡黙）
#VOICE=/usr/share/hts-voice/mei/mei_bashful.htsvoice
# 音声データ（女性。悲しい）
#VOICE=/usr/share/hts-voice/mei/mei_sad.htsvoice
# 音声データ（女性。怒り）
#VOICE=/usr/share/hts-voice/mei/mei_angry.htsvoice
# 音声データ（男性）
#VOICE=/usr/share/hts-voice/nitech-jp-atr503-m001/nitech_jp_atr503_m001.htsvoice

# 出力ファイル
OUTPUT=./output.wav

# パラメータ定義
# -s: サンプリング周波数[auto][1〜]約48000以上で高く、早くなる、約48000以下で低く、遅くなる
# -p: フレーム周波[auto][1〜]約240以上でゆっくり、約240以下で単純に速くなる
# -a: オールパス値[auto][0.0〜1.0]0以上で高い声、0以下で低い声
# -b: ポストフィルター係数[auto][0.0〜1.0]大きな値になればなるほど響いたような音になり、最大にすると拡声器で割れたような音になる
# -r: スピーチ速度係数（速度）[1.0][0.0〜]1.0以上で速く、1.0以下で遅くなる
# -fm: 追加ハーフトーン(声の高さ)[1.0]0以上で高い声になる、0以下で低い声になる
# -u: 音声/無声境界値[0.5][0.0〜1.0]0.5以上で少し途切れた感じ（あるいはガラガラ声のような感じ）、0.5以下で普通、あまりそれほどの差がないが1を指定するとガラガラになる
# -jm: スペクトラム系内変動の重み(大きさ)[1.0][0.0〜]1.0以上で大きな声、1.0以下で小さな声になる
# -jf: F0系列内変動の重み（抑揚）[1.0][0.0〜]1.0以上で抑揚が大きく、1.0以下で抑揚が小さくなる
# -x: 辞書ファイル
# -m: 音響モデル
# -ow: 出力するファイル名
OPTION="-m $VOICE \
-s 48000 \
-p 240 \
-a 0.5 \
-u 0.0 \
-r 0.5 \
-fm 1.0 \
-jm 1.0 \
-jf 1.5 \
-x $DIC \
-ow $OUTPUT"

# テキストを音声データに変換実行
open_jtalk $OPTION $1

# 音声データをスピーカーで鳴らす
aplay --quiet $OUTPUT

exit 0
