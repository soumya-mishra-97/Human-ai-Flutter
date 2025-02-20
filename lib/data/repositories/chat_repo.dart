
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:human_ai/core/api/api_service.dart';
import 'package:human_ai/data/models/chat_model.dart';

class ChatNotifier extends StateNotifier<List<ChatModel>> {
  final ApiService apiService;

  ChatNotifier(this.apiService) : super([]);

  void addUserMessage(String msg) {
    state = [...state, ChatModel(msg: msg, chatIndex: 0)];
  }

  Future<void> sendMessage(String msg, String modelId) async {
    state = [...state, ChatModel(msg: '', chatIndex: 1)];

    try {
      final botResponse = await apiService.sendMessage(message: msg, modelId: modelId);
      state = [
        ...state.sublist(0, state.length - 1),
        ChatModel(msg: botResponse.first.msg, chatIndex: 1),
      ];
    } catch (e) {
      state = state.sublist(0, state.length - 1);
      throw Exception('Failed to send message: $e');
    }
  }
}