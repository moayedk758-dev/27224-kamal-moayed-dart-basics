// Student: Moayed Kamal
// Registration Number: 27224
// Part F - MoMo USSD Simulator

const String regNo = '27224';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// MoMo fee from Part D2
int momoFee(int amount) {
  // by MK
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// F1 - Format RWF
String formatRwf(int amount) {
  // by MK
  bool negative = amount < 0;
  String digits = amount.abs().toString();
  String formatted = '';
  int i = digits.length - 1;
  int count = 0;

  while (i >= 0) {
    formatted = digits[i] + formatted;
    count++;

    if (count % 3 == 0 && i > 0) {
      formatted = ',$formatted';
    }
    i--;
  }

  return '${negative ? '-' : ''}$formatted RWF';
}

// F2 - Validate PIN
bool isValidPin(String pin) {
  // by MK
  if (pin.length != 5) return false;
  if (pin == '12345') return false;

  int i = 0;
  bool allSame = true;

  while (i < pin.length) {
    int digit = pin.codeUnitAt(i);
    if (digit < 48 || digit > 57) {
      return false;
    }

    if (pin[i] != pin[0]) {
      allSame = false;
    }
    i++;
  }

  return !allSame;
}

// F3 - Send Money
int sendMoney(int balance, int amount) {
  // by MK
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} '
    '(fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// F4 - Buy Airtime
int buyAirtime(int balance, int amount) {
  // by MK
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime purchased: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Main Function
void main() {
  // by MK
  print('Reg no: $regNo | D = $d | T = $t');

  print('--- PIN Validation ---');
  print('12345: ${isValidPin('12345')}');
  print('77777: ${isValidPin('77777')}');
  print('4821: ${isValidPin('4821')}');
  print('48a21: ${isValidPin('48a21')}');
  print('4821$d: ${isValidPin('4821$d')}');

  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int sendAmount = (d + 1) * 3000;

  print('--- Transactions ---');

  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);
  balance = sendMoney(balance, sendAmount);

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print('--- Additional Tests ---');

  print(formatRwf(0));       // Expected: 0 RWF
  print(formatRwf(999));     // Expected: 999 RWF
  print(formatRwf(1000));    // Expected: 1,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF
  print(formatRwf(-5000));   // Expected: -5,000 RWF

  print(isValidPin('48214')); // Expected: true
  print(isValidPin('00000')); // Expected: false
  print(isValidPin('12 45')); // Expected: false
}
