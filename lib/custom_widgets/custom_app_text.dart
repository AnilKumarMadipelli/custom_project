import 'package:flutter/material.dart';

enum TextType { heading, body, custom } // Add types for text

class CustomText extends StatelessWidget {
  final String text;
  final TextType textType; // Specify the type of text
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.textType = TextType.body, // Default to body text
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign = TextAlign.start, // Default text alignment
  });

  @override
  Widget build(BuildContext context) {
    // Define default styles for heading and body
    switch (textType) {
      case TextType.heading:
        return Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 24.0, // Default heading size
            fontWeight: fontWeight ?? FontWeight.bold, // Default heading weight
            color: color ?? Colors.blue, // Default heading color
          ),
          textAlign: textAlign,
        );
      case TextType.body:
        return Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 16.0, // Default body size
            fontWeight: fontWeight ?? FontWeight.normal, // Default body weight
            color: color ?? Colors.black, // Default body color
          ),
          textAlign: textAlign,
        );
      case TextType.custom:
        return Text(
          text,
          style: TextStyle(
            fontSize: fontSize, // Custom size
            fontWeight: fontWeight, // Custom weight
            color: color, // Custom color
          ),
          textAlign: textAlign,
        );
    }
  }
}
