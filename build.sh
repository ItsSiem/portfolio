if ! command -v pandoc
then
    echo "pandoc could not be found, is it installed?"
    exit 1
fi

rm -rf build    # DEBUG
mkdir -p build
mkdir -p build/temp

cp src/*.css build/
cp src/template.html build/temp/

tac content/navbar | while read line; do
echo $line
header_line=$(grep -n "id=\"navbar\"" "build/temp/template.html" | cut -d: -f1)
html="<li><a href=\"$line.html\">$line</a></li>"
sed -i "$header_line a $html" "build/temp/template.html"
done

for filename in content/*; do
    # Get the base name
    name=$(basename -- "$filename" .md)

    # Check if it is a directory or a file
    if [[ -d $filename ]]; then
        > build/temp/pandoc_out.html
        # Let pandoc convert it to html
        find "$filename" -name '*.md' -printf '%T@ %p\n' | sort -r | cut -d' ' -f2- | while read -r file
    do
        echo "parsing $file..."
        echo "# $(basename -- "$file" .md)" > build/temp/blog_title.md
        pandoc build/temp/blog_title.md >> build/temp/pandoc_out.html
        date -r "$file" +"%Y_%m_%d %H:%M">> build/temp/pandoc_out.html
        pandoc "$file" >> build/temp/pandoc_out.html
    done
elif [[ $filename == *.md ]]; then
    echo "parsing $filename..."
    pandoc -o build/temp/pandoc_out.html $filename
else
    continue
    fi

    # Copy the pandoc html into the page template
    destination_file="build/$name.html"
    cp build/temp/template.html "$destination_file"
    content_line=$(grep -n "id=\"content\"" "$destination_file" | cut -d: -f1)
    sed -i "$content_line r build/temp/pandoc_out.html" "$destination_file" 
done
rm -rf build/temp
