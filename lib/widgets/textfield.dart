import 'package:flutter/material.dart';
import 'package:human_ai/theme/theme_helper.dart';

class MsgTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function? onSubmitted;
  final FocusNode? focusNode;

  const MsgTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.focusNode,
    required this.onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            offset: const Offset(2, 1),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, -1),
            blurRadius: 2,
          ),
        ],
      ),
      child:  TextField(
        controller: controller,
        focusNode: focusNode,
        style: AppTextStyles.regularFonts20,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText.toUpperCase(),
          hintStyle: AppTextStyles.hintRegularFonts14,
          border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide:  BorderSide(
                  color: Colors.purple.withOpacity(0.2),
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.purple.withOpacity(0.2),
                  width: 2,
                ),
              ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
    );
  }
}
