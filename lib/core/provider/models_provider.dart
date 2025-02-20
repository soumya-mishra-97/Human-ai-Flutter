import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:human_ai/core/provider/chat_provider.dart';
import 'package:human_ai/data/models/models_model.dart';

final modelsProvider = FutureProvider<List<ModelsModel>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.fetchModels();
});

final selectedModelProvider = StateProvider<String>((ref) => 'babbage');
