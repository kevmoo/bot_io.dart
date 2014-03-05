library harness_console;

import 'package:unittest/unittest.dart';

import 'entity_populater_tests.dart' as entity_populater;
import 'sha_file_tests.dart' as sha;
import 'temp_dir_tests.dart' as temp_dir;
import 'update_directory_tests.dart' as update_directory;

void main() {
  groupSep = ' - ';

  group('temp dir and validate', temp_dir.main);

  group('sha1 file tests', sha.main);

  group('EntityPopulator', () {
    entity_populater.main();
    update_directory.main();
  });
}
