import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget customNavigation; // Custom navigation widget (e.g., Back button)
  final Widget customIcon; // Custom icon widget
  final Widget customText; // Custom text or title widget
  final List<Widget>? actions; // Additional action buttons (optional)
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.customNavigation,
    required this.customIcon,
    required this.customText,
    this.actions,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: customNavigation, // Custom navigation (e.g., back button, icon)
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align to the start
        children: [
          customIcon, // Custom icon beside the text
          const SizedBox(width: 8), // Space between icon and text
          Flexible(
            child: Container(
              child: customText is Text
                  ? Text(
                (customText as Text).data!,
                overflow: TextOverflow.ellipsis, // Prevent overflow
                maxLines: 1, // Limit to a single line
                style: (customText as Text).style,
              )
                  : customText, // Use custom widget as is
            ),
          ),
        ],
      ),
      actions: actions, // Optional actions (e.g., search, settings)
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
