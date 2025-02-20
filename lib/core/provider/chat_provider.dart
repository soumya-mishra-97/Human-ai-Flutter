import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:human_ai/core/api/api_service.dart';
import 'package:human_ai/data/models/chat_model.dart';

// Provider for API service
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

// StateNotifier for chat messages
class ChatNotifier extends StateNotifier<List<ChatModel>> {
  final ApiService apiService;

  ChatNotifier(this.apiService) : super([]);

  void addUserMessage(String msg) {
    state = [...state, ChatModel(msg: msg, chatIndex: 0)];
  }

  Future<void> sendMessage(String msg, String modelId) async {
    final botResponse = await apiService.sendMessage(message: msg, modelId: modelId);
    state = [...state, ...botResponse];
  }
}

// Riverpod Provider for Chat State
final chatProvider = StateNotifierProvider<ChatNotifier, List<ChatModel>>(
      (ref) => ChatNotifier(ref.watch(apiServiceProvider)),
);
