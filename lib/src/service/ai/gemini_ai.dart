import 'package:maemogianaflutter/src/service/ai/interface.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:maemogianaflutter/src/config.dart';

class GeminiAi implements Aichat {
  @override
  Future<String> getReply(String message) async {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: GEMINI_API_KEY);
    final response = await model.generateContent([Content.text(message)]);
    final chatResponse = response.text;
    return chatResponse!;
  }
}