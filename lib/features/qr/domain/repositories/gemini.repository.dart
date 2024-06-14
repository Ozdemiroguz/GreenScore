import 'dart:typed_data';

import 'package:flutter_gemini/flutter_gemini.dart';

abstract interface class GeminiRepository {
  Stream<String> getMessages(String prompt, Uint8List? image);

  Future<void> textOnlyChat(String prompt);
  Future<Candidates> textAndImageChat(String prompt, Uint8List image);
}
