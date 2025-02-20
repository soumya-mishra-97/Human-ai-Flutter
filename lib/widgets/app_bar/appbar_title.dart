import 'package:human_ai/core/export.dart';

class AppBarTitle extends StatelessWidget {
  final String text1;
  final String text2;
  final EdgeInsetsGeometry? margin;
  final Function()? onTap;

  const AppBarTitle(
      {super.key,
        required this.text1,
        required this.text2,
        this.margin,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1,
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  color: const Color(0xff16AB51),
                  fontWeight: FontWeight.w600,
                    shadows: [
                      const Shadow(
                          color: Colors.black, offset: Offset(2, 2), blurRadius: 2),
                    ]
                )),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(text2,
                  style: GoogleFonts.manrope(
                    fontSize: 11,
                      color:  Colors.purpleAccent.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                      shadows: [
                        const Shadow(
                            color: Colors.black, offset: Offset(2, 2), blurRadius: 2),
                      ]
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
