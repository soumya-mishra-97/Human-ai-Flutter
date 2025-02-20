import 'package:human_ai/core/export.dart';

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