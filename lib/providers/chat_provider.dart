import 'package:flutter/foundation.dart';
import '../models/resume_model.dart';

class ChatProvider extends ChangeNotifier {
  final List<ChatMessage> _messages = [
    const ChatMessage(
      text: "您好！我是林小明 (Alex Lin) 的 AI 助手。有什麼關於他的經歷或技能是我可以幫您解答的嗎？",
      isUser: false,
    ),
  ];
  bool _isOpen = false;
  bool _isLoading = false;

  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get isOpen => _isOpen;
  bool get isLoading => _isLoading;

  void toggleChat() {
    _isOpen = !_isOpen;
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty || _isLoading) return;

    // Add user message
    _messages.add(ChatMessage(text: text, isUser: true));
    _isLoading = true;
    notifyListeners();

    try {
      // Mock API call
      await Future.delayed(const Duration(seconds: 1));
      
      // TODO: Implement actual Gemini Service call
      final response = "這是一個模擬的 AI 回覆。我目前還在開發階段，稍後將會串接真實的 Gemini API 來回答您的問題：\"$text\"";

      _messages.add(ChatMessage(text: response, isUser: false));
    } catch (e) {
      _messages.add(const ChatMessage(text: "抱歉，發生了一些錯誤，請稍後再試。", isUser: false));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
