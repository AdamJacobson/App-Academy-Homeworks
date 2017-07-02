function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}!`
}

console.log(madLib("make", "best", "guac"));

function isSubstring(searchString, subString) {
  words = searchString.split(' ')

  for (let i = 0; i < words.length; i++) {
    if (words[i] === subString) {
      return true
    }
  }
  return false
}

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(numbers) {
  filtered = []

  let div_by_n = function(num, div) {
    if (num % div === 0) {
      return true
    }
    return false
  }

  for (let i = 0; i < numbers.length; i++) {
    n = numbers[i]
    if (div_by_n(n, 5) !== div_by_n(n, 3)) {
      filtered.push(numbers[i])
    }
  }

  return filtered
}

console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]));

function isPrime(num) {
  if (num === 1) {
    return false;
  }
  if (num === 2) {
    return true
  }

  for (let i = 2; i <= Math.sqrt(num); i++) {
    if (num % i === 0) {
      return false
    }
  }

  return true
}

console.log(isPrime(2));
console.log(isPrime(7));
console.log(isPrime(17));
console.log(isPrime(10));
console.log(isPrime(8));
console.log(isPrime(100));

function sumOfNPrimes(n) {
  let sum = 0;
  let i = 0;
  let num_found = 0
  while (num_found < n) {
    if (isPrime(i)) {
      sum += i;
      num_found++;
    }
    i++;
  }
  return sum
}

console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(2));
console.log(sumOfNPrimes(3));
console.log(sumOfNPrimes(4));
console.log(sumOfNPrimes(5));
