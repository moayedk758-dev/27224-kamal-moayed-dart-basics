// Student: Moayed Kamal
// Reg no: 27224

const String regNo = '27224';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// Part B2 - Count Vowels
int countVowels(String text) {
  // by MK
  String lower = text.toLowerCase();
  int count = 0;
  int i = 0;

  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) {
      count++;
    }
    i++;
  }

  return count;
}

// Part B3 - Get Initials
String initials(String fullName) {
  // by MK
  String result = '';
  List<String> words = fullName.trim().split(RegExp(r'\s+'));
  int i = 0;

  while (i < words.length) {
    if (words[i].isNotEmpty) {
      result += '${words[i][0].toUpperCase()}.';
    }
    i++;
  }

  return result;
}

// Part C5 - Right-Aligned Triangle
void drawTriangle(int height) {
  // by MK
  int row = 1;

  while (row <= height) {
    String spaces = ' ' * (height - row);
    String symbol = row.isOdd ? '*' : '#';
    String symbols = symbol * row;

    print(spaces + symbols);
    row++;
  }
}

// Main Function
void main() {
  // by MK
  print('Reg no: $regNo | D = $d | T = $t');

  String name = 'Moayed Kamal';

  print('--- Part B2: Count Vowels ---');
  print('$name has ${countVowels(name)} vowels');

  print('--- Part B3: Get Initials ---');
  print('Initials: ${initials(name)}');
  print("Extra spaces: ${initials(' ana uwase ')}");
  print('Empty input: "${initials('   ')}"');

  print('--- Part C5: Triangle ---');
  drawTriangle(d + 3);

  // These calls must print nothing.
  drawTriangle(0);
  drawTriangle(-2);
}
