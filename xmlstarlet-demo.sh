#!/bin/bash

function main() {
  # check if file is food.xml
  if [ $1 == 'data/books.xml' ]; then
    processBookstore $1
  fi
}

function processBookstore() {
  xmlstarlet ed -d '/bookstore/book[@category="cooking"]' $1 > output/books-d.xml
  xmlstarlet ed -u '/bookstore/book[@category="cooking"]/@category' -v 'baking' $1 > output/books-u.xml
  xmlstarlet ed -u '/bookstore/book[@category="cooking"]/title' -v 'Everyday baking' $1 > output/books-uv.xml
  xmlstarlet ed -u '/bookstore/book[@category="cooking"]/title[@lang="en"]/@lang' -v 'es' $1 > output/books-uv1.xml
  xmlstarlet ed -u '/bookstore/book/@category' -v 'food' $1 > output/books-uv2.xml
}

# create output DIR if not presetn
mkdir -p output
echo 'File being read -' $1
main $1