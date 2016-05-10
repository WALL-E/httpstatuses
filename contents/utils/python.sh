#!/bin/sh

root="/home/vagrant/httpstatuses"
files=`python -c 'import httplib; print " ".join([str(i) for i in httplib.responses.keys()])'`

for i in $files
do
    filename=${root}"/contents/codes/"$i".md"
    echo ${filename}
    sed -i 's/Python/Python2/g' ${filename}
    sed -i -rn 'p;/Python2/,/Python2/H;/Python2/{g;s/^\n//;s/Python2/Python3+/;s/httplib/http.client/p}' ${filename}
    sed -i -rn 'p;/Python3+/,/Python3+/H;/Python3+/{g;s/^\n//;s/Python3/Python3.5/;s/http.client/http.HTTPStatus/p}' ${filename}
done
