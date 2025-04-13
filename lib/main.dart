import 'package:flutter/material.dart';

import 'custom_widgets/custom_app_text.dart';
import 'custom_widgets/custom_appbar.dart';
import 'custom_widgets/custom_button.dart';
import 'custom_widgets/custom_theme.dart';
import 'custom_widgets/responsive_scafold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isTrue = false;


  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: AppTheme.lightTheme, // Apply the light theme
     darkTheme: AppTheme.darkTheme, // Apply the dark theme
     themeMode: ThemeMode.system, // Automatically switch based on system settings
      home: ResponsiveScaffold(
        customAppBar: CustomAppBar(
          customNavigation: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              print('Custom Navigation Back pressed!');
              // Custom navigation logic here
            },
          ),
          customIcon: const Icon(Icons.coffee),
          customText: const Text(
            'Custom Titliudgwufyqueyfoqwvdfqjhwvdquywfouqywfdquywuoqwyfeeouyqwyqweqyweoquwyeqlwhvdkqevuqlyfwoquyfoquwyefqueyge',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                print('Notifications pressed!');
              },
            ),
          ],
          backgroundColor: Colors.teal,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Title Heading',
              textType: TextType.heading,
            ),
            const SizedBox(height: 10), // Spacing
            const CustomText(
              text: 'This is the body text, which has its own default styling.',
              textType: TextType.body,
            ),
            const SizedBox(height: 10), // Spacing
            const CustomText(
              text: 'Custom Text with specific styles!',
              textType: TextType.custom,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.purple,
            ),
            const SizedBox(height: 10,),
            CustomButton(
              text: 'Submit',
              onPressed: () async{
                isTrue = true;

                Future.delayed(const Duration(seconds: 2),(){
                  isTrue = false;
                  setState(() {
                    print('Button Pressed! $isTrue');
                  });
                });
setState(() {

});
                print('Button Pressed! $isTrue');
              },
              width: 200.0, // Custom width
              height: 50.0, // Custom height
              backgroundColor: Colors.green, // Custom background color
              textColor: Colors.white, // Custom text color
              icon: Icons.send, // Optional icon
              iconColor: Colors.white, // Custom icon color
              borderRadius: 12.0, // Rounded corners
              isLoading: isTrue, // Set true to show the loader
            )

          ],
        )
        ,
        backgroundColor: Colors.grey[200],
        showBackButton: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Custom FAB pressed!');
          },
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text('Custom Menu'),
              ),
              ListTile(
                title: const Text('Custom Item 1'),
                onTap: () {
                  print('Custom Item 1 pressed!');
                },
              ),
              ListTile(
                title: const Text('Custom Item 2'),
                onTap: () {
                  print('Custom Item 2 pressed!');
                },
              ),
            ],
          ),
        ), // Custom Drawer for this screen
      ),
    );
  }
}
