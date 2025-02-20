import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:human_ai/core/provider/models_provider.dart';

class ModelsDropDown extends ConsumerWidget {
  const ModelsDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelsAsync = ref.watch(modelsProvider);
    final selectedModel = ref.watch(selectedModelProvider);

    return modelsAsync.when(
      data: (models) => DropdownButton<String>(
        value: selectedModel,
        items: models
            .map((model) => DropdownMenuItem(
          value: model.id,
          child: Text(model.id),
        ))
            .toList(),
        onChanged: (newModel) {
          ref.read(selectedModelProvider.notifier).state = newModel!;
        },
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
