const [app, script, ...files] = process.argv;
const maxHeight = Math.max(...files.map(f => f.split("\n").length));
const columns = files.map(box);

paste(columns);

function box(text = "") {
    const textInLines = text.split("\n");
    const maxWidth = Math.max(...textInLines.map(l => l.length));
    const textBox = textInLines.map(l => l.padEnd(maxWidth, " "));
    const emptyBox = Array(maxHeight).fill(''.padEnd(maxWidth, ' '));
    const sizeBox = [...textBox, ...emptyBox];
    sizeBox.length = maxHeight;
    return sizeBox;
}

function paste(columns) {
    const [first, ...rest] = columns;
    const textInColumns = first.map((val, index) => {
        const arrayOfRows = [val, ...rest.map(item => item[index])]
        return arrayOfRows.join("\t");
    }).join("\n");
    console.log(textInColumns)
}
