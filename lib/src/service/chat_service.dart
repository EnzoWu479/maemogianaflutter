import 'package:maemogianaflutter/src/service/ai/interface.dart';

class ChatService {
  Aichat? _model;
  String? _initialPrompt;
  ChatService(Aichat model, String initialPrompt) {
    _model = model;
    _initialPrompt = initialPrompt;
  }

  Future<String> getReply(String message) async {
    if (_model == null) {
      throw Exception("Model is not initialized");
    }
    return _model!.getReply("$_initialPrompt $message");
  }
}
