import 'dart:io';

void main() async {
  print('=== 🛡️ Dart Live Security Scanner ===');
  var file = File('my_blocked_database.txt');

  if (!await file.exists()) {
    print('[-] Error: Database file missing!');
    return;
  }

  while (true) {
    stdout.write('\nEnter domain to check (or type \'exit\'): ');
    String? input = stdin.readLineSync();
    
    if (input == null) continue;
    input = input.trim().toLowerCase();

    if (input == 'exit') {
      print('[👋] Exiting Dart Engine. Secure and Safe!');
      break;
    }

    if (input.isEmpty) {
      print('[-] Please enter a valid domain.');
      continue;
    }

    print('[+] Dart is scanning 80,810+ sites...');
    bool found = false;

    List<String> lines = await file.readAsLines();
    for (var line in lines) {
      if (line.toLowerCase().contains(input) && !line.startsWith('#')) {
        print('[⚠️] DART ALERT: Blocked site found -> ${line.trim()}');
        found = true;
      }
    }

    if (!found) {
      print('[✓] Clean! Safe to browse through Dart Shield.');
    }
  }
}
