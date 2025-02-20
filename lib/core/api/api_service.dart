import 'package:dio/dio.dart';
import 'package:human_ai/core/constants/api_const.dart';
import 'package:human_ai/data/models/chat_model.dart';
import 'package:human_ai/data/models/models_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: OPEN_AI_BASE_URL,
      headers: {
        'Authorization': 'Bearer $OPEN_AI_API_KEY',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<List<ModelsModel>> fetchModels() async {
    try {
      final response = await _dio.get('/models');
      final List models = response.data['data'];
      return models.map((e) => ModelsModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch models: $e');
    }
  }

  Future<List<ChatModel>> sendMessage({
    required String message,
    required String modelId,
  }) async {
    try {
      final response = await _dio.post(
        '/chat/completions',
        data: {
          "model": 'gpt-3.5-turbo',
          "prompt": message,
          "max_tokens": 100,
        },
      );

      final List choices = response.data['choices'];
      return choices.map((e) => ChatModel(msg: e['text'], chatIndex: 1)).toList();
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}
