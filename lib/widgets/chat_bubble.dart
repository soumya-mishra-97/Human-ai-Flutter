import 'package:human_ai/core/export.dart';

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