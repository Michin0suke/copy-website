#!/bin/sh

# 引数で指定された名前のディレクトリを作成します。
# hogeという名前のディレクトリを作成する場合:  ./set.sh hoge

if [ $# -eq 0 ]; then
  echo "名前を引数として設定してください。"
  echo "例) ./set.sh hoge"
  exit 1
fi

if [ -e $1 ]; then
  echo "${1}という名前のファイルはすでに存在します。"
  echo "違う名前を設定してください。"
  exit 1
fi

mkdir -p docs/$1
cp -r setup-template/* docs/$1/
echo "succeed!!"

code docs/$1/pug/index.pug
gulp --base $1

exit 0