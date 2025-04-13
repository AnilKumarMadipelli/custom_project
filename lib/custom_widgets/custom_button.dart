import 'package:flutter/material.dart';
import 'package:custom_project/custom_widgets/custom_app_text.dart';

class CustomButton extends StatelessWidget {
  final String? text; // Button text (optional)
  final double? width; // Customizable width
  final double? height; // Customizable height
  final Color backgroundColor; // Button background color
  final Color textColor; // Text color
  final IconData? icon; // Optional icon
  final Color iconColor; // Icon color
  final double borderRadius; // Rounded corners
  final bool isLoading; // Show loader when true
  final VoidCallback onPressed; // Callback for button press

  const CustomButton({
    super.key,
    this.text, // Allow null to handle cases with only an icon
    required this.onPressed,
    this.width,
    this.height,
    this.backgroundColor = Colors.blue, // Default button color
    this.textColor = Colors.white, // Default text color
    this.icon, // Optional
    this.iconColor = Colors.white, // Default icon color
    this.borderRadius = 8.0, // Default corner radius
    this.isLoading = false, // Default loader is off
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // Default to full width
      height: height ?? 50.0, // Default height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
          ),
        ),
        onPressed: isLoading ? null : onPressed, // Disable button when loading
        child: isLoading
            ? const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white, // Loader color
                strokeWidth: 2.0, // Customize loader thickness
              ),
            ),
            SizedBox(width: 10), // Space between loader and text
            Text(
              'Loading...',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Make Row fit its content
          children: [
            if (icon != null) Icon(icon, color: iconColor), // Display icon if provided
            if (icon != null && text != null)
              const SizedBox(width: 8), // Space between icon and text
            if (text != null)
              Flexible(
                child: CustomText(
                  text: text!,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
