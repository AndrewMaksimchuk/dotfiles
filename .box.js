const readline = require('node:readline');
const { stdin: input } = require('node:process');

const rl = readline.createInterface({ input });
const inputLines = [];

rl.on('line', (line) => {
    inputLines.push(line);
});

rl.once('close', () => {
    const maxLength = Math.max(...inputLines.map(l => l.length));
    const box = inputLines.map(l => l.padEnd(maxLength, " ")).join("\n");
    console.log(box);
 });
