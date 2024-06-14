import 'dart:typed_data';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/gemini.repository.dart';

@LazySingleton(as: GeminiRepository)
class GeminiRepositoryImpl implements GeminiRepository {
  final Gemini _gemini;

  GeminiRepositoryImpl(this._gemini);

  @override
  Stream<String> getMessages(String prompt, Uint8List? image) {
    return _gemini
        .streamGenerateContent(prompt, images: [image!]).map((candidates) {
      // 'candidates' değerini 'String' tipine dönüştürme işlemini burada yapabilirsiniz.
      // Örneğin, 'candidates' bir liste ise, listeyi birleştirebilirsiniz:

      return candidates.content?.parts
              ?.map((part) => part.text ?? '')
              .join(' ') ??
          '';
    });
  }

  @override
  Future<void> textOnlyChat(String prompt) {
    // TODO: implement textOnlyChat
    throw UnimplementedError();
  }

  @override
  Future<Candidates> textAndImageChat(String prompt, Uint8List image) async {
    try {
      final response =
          await _gemini.textAndImage(text: prompt, images: [image]);
      print(response);
      // 'candidates' değerini 'Candidates' tipine dönüştürme işlemini burada yapabilirsiniz.
      return Candidates();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
