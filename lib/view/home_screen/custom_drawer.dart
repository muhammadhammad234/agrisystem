import 'package:agrisystem/controller/theme_controller.dart';
import 'package:agrisystem/helper/shared_preferences_helper.dart';
import 'package:agrisystem/utils/app_images.dart';
import 'package:agrisystem/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  // final bool isDarkMode;
  // final ValueChanged<bool> onDarkModeChanged;

  const CustomDrawer({
    super.key,
    // required this.isDarkMode,
    // required this.onDarkModeChanged,
  });

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  ThemeController themmController = Get.put(ThemeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (controller) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Drawer Header with company logo
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .secondary, // Different colors for dark and light modes
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Replace with your company logo asset
                  Image.asset(
                    AppImages.logo,
                    height: 80, // Adjust the size accordingly
                  ),
                  const SizedBox(height: 10),
                  // Text(
                  //   'FAST',
                  //   style: Theme.of(context).textTheme.displayMedium,
                  // ),
                ],
              ),
            ),

            // Dark mode toggle button
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: themmController.isDarkMode.value,
              onChanged: (value) {
                // setState(() {
                themmController.toggleTheme();
                // themmController.isDarkMode.value = value;
                // themmController.update();
                // widget.onDarkModeChanged(value); // Trigger callback to update app's theme
                // });
              },
              secondary: Icon(
                themmController.isDarkMode.value
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            await SharedPreferencesHelper()
                                .setLoginStatus(false);
                            await SharedPreferencesHelper()
                                .removeUserId();
                            await SharedPreferencesHelper()
                                .removeUsername();
                            Future.delayed(Duration.zero, () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoutes.signInScreen, (route) => false);
                            });
                          },
                          child: const Text('Yes')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No')),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      );
    });
  }
}
