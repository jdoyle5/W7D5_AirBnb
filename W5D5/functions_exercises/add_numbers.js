const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers (sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close(); 
  } else {
    reader.question("Enter a number", function (answer) {
      let inputNumber = parseInt(answer);
      sum += inputNumber;
      console.log(sum);
      addNumbers(sum, (numsLeft - 1), completionCallback);
    });
  }
}
addNumbers(10, 5, sum => console.log(`Total Sum: ${sum}`));
