
import 'package:flutter/material.dart';
import 'package:poswell_app/constants/text_font_style.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to ",
              overflow: TextOverflow.ellipsis,
              style: TextFontStyle.headline28cFFFFFFStyleOpenSenseW700,
            ),
            Flexible(
              child: GradientText(
                'Sleep Safe',
                overflow: TextOverflow.ellipsis,
                style: TextFontStyle.headline28cFFFFFFStyleOpenSenseW700,
                colors: [
                  const Color(0xFF8B6443),
                  const Color(0xFF8B6443).withOpacity(0.6),
                  const Color(0xFFCBC1B4),
                ],
              ),
            ),
          ],
        ),
        Text(
          "Baby",
          style: TextFontStyle.headline28cFFFFFFStyleOpenSenseW700.copyWith(
            color: const Color(0xFF8B6443),
          ),
        ),
      ],
    );
  }
}
