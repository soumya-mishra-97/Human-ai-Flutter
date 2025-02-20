import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:human_ai/widgets/textfield.dart';

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