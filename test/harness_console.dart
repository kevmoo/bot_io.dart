library harness_console;

import 'package:unittest/unittest.dart';

import 'bot_io/_bot_io.dart' as bot_io;

void main() {
  groupSep = ' - ';

  bot_io.main();
}
