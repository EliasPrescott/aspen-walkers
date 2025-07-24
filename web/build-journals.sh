#! /bin/bash

rm -rf "./public/editions"
mkdir "./public/editions"

for typ_path in ../editions/*/journal.typ; do
  edition_path=$(dirname "$typ_path")
  edition=$(basename "$edition_path")
  output_folder="./public/editions/$edition"
  mkdir "$output_folder"
  typst compile "$typ_path" "$output_folder/journal.pdf"
  typst compile --ppi 72 --pages 1 "$typ_path" "$output_folder/cover.png"
done
