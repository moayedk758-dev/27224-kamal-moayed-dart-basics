// Student: Moayed Kamal
// Reg no: 27224
// Part E - Find and Fix

String grade(int mark) {
  // by MK
  if (mark >= 80) {
    return 'A';
  } else if (mark >= 70) {
    return 'B';
  } else if (mark >= 50) {
    return 'C';
  }
  return 'F';
}

bool isPalindrome(String word) {
  // by MK
  word = word.toLowerCase();

  int i = 0;
  while (i < word.length) {
    if (word[i] != word[word.length - 1 - i]) {
      return false;
    }
    i++;
  }
  return true;
}

void main() {
  // by MK
  print('Reg no: 27224 | D = 4 | T = 24');

  print('--- Grade Tests ---');
  print('85: ${grade(85)}');
  print('75: ${grade(75)}');
  print('55: ${grade(55)}');
  print('40: ${grade(40)}');

  print('--- Palindrome Tests ---');
  print('level: ${isPalindrome('level')}');
  print('Level: ${isPalindrome('Level')}');
  print('hello: ${isPalindrome('hello')}');
}
