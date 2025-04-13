import 'package:custom_project/custom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'custom_responsive_screen_size.dart'; // Import your constants

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  final bool showBackButton;
  final FloatingActionButton? floatingActionButton; // Customizable FAB
  final Drawer? drawer; // Customizable Drawer
  final CustomAppBar? customAppBar;


  const ResponsiveScaffold({
    required this.body,
    this.customAppBar,
    this.backgroundColor = Colors.white,
    this.showBackButton = false,
    this.floatingActionButton, // Default is null, so can be excluded
    this.drawer, // Default is null, so can be excluded
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: customAppBar ??
          CustomAppBar(
            customNavigation: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            customIcon: const Icon(Icons.home),
            customText: const Text(
              'Responsive Scaffold',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  print('Search pressed!');
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  print('Settings pressed!');
                },
              ),
            ],
          ),      body: SafeArea(
        child: SingleChildScrollView(
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton, // Optional FAB
      drawer: drawer ?? // Optional Drawer
          (MediaQuery.of(context).size.width < ResponsiveSizes.smallScreenWidth
              ? Drawer(
            child: ListView(
              children: const [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('Default Menu'),
                ),
                ListTile(
                  title: Text('Default Item 1'),
                ),
                ListTile(
                  title: Text('Default Item 2'),
                ),
              ],
            ),
          )
              : null),
    );
  }
}


