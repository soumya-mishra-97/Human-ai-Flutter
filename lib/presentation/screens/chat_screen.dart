/*
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:human_ai/core/export.dart';
import 'package:human_ai/core/constants/string_const.dart';
import 'package:human_ai/widgets/app_bar/app_bar.dart';
import 'package:human_ai/widgets/app_bar/appbar_title.dart';
import 'package:human_ai/widgets/app_image_view.dart';
import 'package:human_ai/widgets/textfield.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _listScrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  final List<Map<String, dynamic>> _chatMessages = [
    {"msg": "Hello! How can I help you today?", "isUser": false},
    {"msg": "What is Flutter?", "isUser": true},
    {
      "msg": "Flutter is an open-source UI software development kit by Google.",
      "isUser": false
    },
  ];

  @override
  void dispose() {
    _textEditingController.dispose();
    _listScrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    String message = _textEditingController.text.trim();
    if (message.isEmpty) return;

    setState(() {
      _chatMessages.add({"msg": message, "isUser": true});
      _isTyping = true;
      _textEditingController.clear();
      _focusNode.unfocus();
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _chatMessages
            .add({"msg": "This is a dummy response.", "isUser": false});
        _isTyping = false;
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _listScrollController.animateTo(
      _listScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const Divider(
            color: Colors.white24,
            thickness: 1,
            indent: 2,
            endIndent: 2,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              controller: _listScrollController,
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                final message = _chatMessages.reversed.toList()[index];
                return ChatBubble(message: message);
              },
            ),
          ),
          if (_isTyping) const TypingIndicator(),
          MessageInputField(
            textEditingController: _textEditingController,
            focusNode: _focusNode,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      isDefaultStyle: false,
      height: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppImageView(
              imagePath: AppImageConstant.logo,
              height: 40,
              alignment: Alignment.topCenter),
          const SizedBox(width: 12),
          AppBarTitle(
              text1: APP_TITLE.toUpperCase(),
              text2: APP_SUB_TITLE.toUpperCase())
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Map<String, dynamic> message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isUser = message["isUser"];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Image.asset(
            isUser ? AppImageConstant.person : AppImageConstant.logo,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: isUser ? Colors.black12 : Colors.white10,
              border: Border.all(color: Colors.purple.withOpacity(0.5), width: 2),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  offset: const Offset(2, 1),
                  blurRadius: 4,
                ),
                BoxShadow(
                  color: Colors.purple.withOpacity(0.2),
                  offset: const Offset(1, -1),
                  blurRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.58),
            child: Text(
              message["msg"],
              style: GoogleFonts.manrope(
                fontSize: 12,
                color: isUser ? const Color(0xff16AB51) : Colors.white70,
                fontWeight: FontWeight.w500,
                shadows: [
                  const Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SpinKitThreeBounce(color: Colors.purpleAccent, size: 18),
    );
  }
}

class MessageInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final VoidCallback onSend;

  const MessageInputField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: MsgTextField(
              controller: textEditingController,
              focusNode: focusNode,
              hintText: 'Type your message...',
              onSubmitted: (_) => onSend(),
            ),
          ),
          const SizedBox(width: 10),
          NeumorphicButton(
            padding: const EdgeInsets.all(10),
            style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape: const NeumorphicBoxShape.circle(),
              color: Colors.black,
              shadowLightColor: Colors.purpleAccent.withOpacity(0.2),
              border: const NeumorphicBorder(color: Colors.purpleAccent),
            ),
            onPressed: onSend,
            child: const Icon(Icons.send, color: Colors.purpleAccent),
          ),
        ],
      ),
    );
  }
}
*/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:human_ai/core/export.dart';
import 'package:human_ai/core/constants/string_const.dart';
import 'package:human_ai/core/provider/chat_provider.dart';
import 'package:human_ai/core/provider/models_provider.dart';
import 'package:human_ai/widgets/app_bar/app_bar.dart';
import 'package:human_ai/widgets/app_bar/appbar_title.dart';
import 'package:human_ai/widgets/app_image_view.dart';
import 'package:human_ai/widgets/chat_bubble.dart';
import 'package:human_ai/widgets/msg_input_field.dart';
import 'package:human_ai/widgets/typing_indicator.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _listScrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _textEditingController.dispose();
    _listScrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    String message = _textEditingController.text.trim();
    if (message.isEmpty) return;

    ref.read(chatProvider.notifier).addUserMessage(message);

    _textEditingController.clear();
    _focusNode.unfocus();

    final selectedModel = ref.read(selectedModelProvider);

    await ref.read(chatProvider.notifier).sendMessage(message, selectedModel);

    _scrollToBottom();
  }

  void _scrollToBottom() {
    _listScrollController.animateTo(
      _listScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final chatMessages = ref.watch(chatProvider);
    final isTyping = ref
        .watch(chatProvider.notifier)
        .state
        .any((msg) => msg.chatIndex == 1 && msg.msg.isEmpty);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const Divider(
            color: Colors.white24,
            thickness: 1,
            indent: 2,
            endIndent: 2,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              controller: _listScrollController,
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message = chatMessages[index];
                return ChatBubble(
                  message: {
                    "msg": message.msg,
                    "isUser": message.chatIndex == 0,
                  },
                );
              },
            ),
          ),
          if (isTyping) const TypingIndicator(),
          MessageInputField(
            textEditingController: _textEditingController,
            focusNode: _focusNode,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      isDefaultStyle: false,
      height: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppImageView(
              imagePath: AppImageConstant.logo,
              height: 40,
              alignment: Alignment.topCenter),
          const SizedBox(width: 12),
          AppBarTitle(
              text1: APP_TITLE.toUpperCase(),
              text2: APP_SUB_TITLE.toUpperCase())
        ],
      ),
    );
  }
}
