import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pravo_client/assets/constants.dart' as constants;

class TextLogo extends StatelessWidget {
  const TextLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Pravo",
              style: GoogleFonts.sen(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: constants.kPrimaryColor),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              "와 함께",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: constants.kPrimaryColor,
              ),
            )
          ],
        ),
        const Text(
          "약속을 지키는 재미를 느껴보세요!",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: constants.kPrimaryColor,
          ),
        )
      ],
    );
  }
}
