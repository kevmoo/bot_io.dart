library bot_io.sha_and_comparison;

import 'dart:async';
import 'dart:io';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/**
 * Returns a [Future] that evaluates to true if the contents of [file1] and
 * [file2] are the same.
 *
 * Equality is determined by comparing the result of [fileSha1Hex] for each
 * file.
 */
Future<bool> fileContentsMatch(File file1, File file2) {
  return Future
      .wait([fileSha1Hex(file1), fileSha1Hex(file2)]).then((List<String> shas) {
    assert(shas.length == 2);
    return shas[0] == shas[1];
  });
}

Future<String> fileSha1Hex(File source) async {
  var sink = new AccumulatorSink<Digest>();

  var digestSync = sha1.startChunkedConversion(sink);

  await source.openRead().forEach(digestSync.add);

  digestSync.close();

  return sink.events.single.toString();
}
