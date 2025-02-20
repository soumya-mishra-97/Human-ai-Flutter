import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:human_ai/core/constants/string_const.dart';
import 'package:human_ai/presentation/screens/chat_screen.dart';
import 'package:human_ai/theme/theme_helper.dart';

void main() async {
  runApp(const ProviderScope(child: HumanAIApp()));
}

class HumanAIApp extends StatelessWidget {
  const HumanAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: theme,
      home: const ChatScreen(),
    );
  }
}
