if ! command -v pandoc
then
    echo "pandoc could not be found, is it installed?"
    exit 1
fi

rm -rf build    # DEBUG
mkdir -p build

cp src/*.css build/
cp src/template.html build/

tac content/navbar | while read line; do
    echo $line
    header_line=$(grep -n "id=\"navbar\"" "build/template.html" | cut -d: -f1)
    html="<li><a href=\"$line.html\">$line</a></li>"
    sed -i "$header_line a $html" "build/template.html"
done

for filename in content/*.md; do
    name=$(basename -- "$filename" .md)
    echo "parsing $name..."
    pandoc -o tmp.html $filename
    destination_file="build/$name.html"
    cp build/template.html build/$name.html
    content_line=$(grep -n "id=\"content\"" "$destination_file" | cut -d: -f1)
    sed -i "$content_line r tmp.html" "$destination_file"
    rm tmp.html build/template.html
done
