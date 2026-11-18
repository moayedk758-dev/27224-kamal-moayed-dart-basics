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
String getInitials(String fullName) {
  // by MK
  List<String> words = fullName.trim().split(RegExp(r'\s+'));
  String initials = '';
  int i = 0;

  while (i < words.length) {
    if (words[i].isNotEmpty) {
      initials += words[i][0].toUpperCase();
    }
    i++;
  }

  return initials;
}

void main() {
  // by MK
  print('Reg no: $regNo | D = $d | T = $t');

  String name = 'Moayed Kamal';

  print('--- Part B2: Count Vowels ---');
  print('$name has ${countVowels(name)} vowels');

  print('--- Part B3: Get Initials ---');
  print('Initials: ${getInitials(name)}');
}
