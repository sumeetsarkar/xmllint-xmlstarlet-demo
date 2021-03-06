#!/bin/bash

function main() {
  # check if file is food.xml
  if [ $1 == 'data/books.xml' ]; then
    processBookstore $1
  fi
}

function processBookstore() {
  echo $'usage of --path /bookstore/book[@category="cooking"]/author/text()\n'
  xmllint --xpath '/bookstore/book[@category="cooking"]/author/text()' $1

  echo $'\n\nPrint attribute - category'
  xmllint --xpath 'string(/bookstore/book/@category)' $1

  echo $'\n\nRepeat 100 times'
  xmllint --repeat --xpath '/bookstore/book[@category="children"]/title/text()' $1

  echo $'\n\nTiming'
  xmllint --timing --xpath '/bookstore/book[@category="children"]/title/text()' $1
}

echo 'File being read -' $1
echo $'Output...\n'

main $1

echo $'\n\n.........'