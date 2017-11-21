#!/bin/bash

function main() {
  # check if file is food.xml
  if [ $1 == 'data/books.xml' ]; then
    processBookstore $1
  fi
  otherUtils
}

function otherUtils() {
  echo $'\n\nList directory as xml'
  xmlstarlet ls
}

function processBookstore() {
  echo $'\n\nPrints XPath expression which indicates a path to elements in XML document'
  xmlstarlet el $1

  echo $'\n\nPrints XPath expression with attributes in XML document'
  xmlstarlet el -a $1

  echo $'\n\nPrints XPath expression with attributes and its values in XML document'
  xmlstarlet el -v $1

  echo $'\n\nEdits XML document in Delete mode'
  xmlstarlet ed -d '/bookstore/book[@category="cooking"]' $1 > output/books-d.xml

  echo $'\n\nEdits XML document in Update mode, here updating attribute with value cooking in element book'
  xmlstarlet ed -u '/bookstore/book[@category="cooking"]/@category' -v 'baking' $1 > output/books-u.xml

  echo $'\n\nEdits XML document in Update mode, here title in element book with attribute category as cooking'
  xmlstarlet ed -u '/bookstore/book[@category="cooking"]/title' -v 'Everyday baking' $1 > output/books-uv.xml

  echo $'\n\nEdits XML document in Update mode, here lang attribute in title element in book element with category atttribute as cooking'
  xmlstarlet ed -u '/bookstore/book[@category="cooking"]/title[@lang="en"]/@lang' -v 'es' $1 > output/books-uv1.xml

  echo $'\n\nEdits XML document in Update mode, here every category attribute in book element'
  xmlstarlet ed -u '/bookstore/book/@category' -v 'food' $1 > output/books-uv2.xml
}

# create output DIR if not presetn
mkdir -p output
echo 'File being read -' $1
main $1