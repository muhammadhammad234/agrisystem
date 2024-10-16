import 'package:agrisystem/controller/database_controller.dart';
import 'package:agrisystem/controller/theme_controller.dart';
import 'package:agrisystem/helper/database_helper.dart';
import 'package:agrisystem/utils/app_routes.dart';
import 'package:agrisystem/utils/app_themes.dart';
import 'package:agrisystem/view/auth_screen/sync_data_screen.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/add_terres_agricole_screen.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/initial_funding_source_screen.dart';
import 'package:agrisystem/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  Get.put(ThemeController());
  Get.put(DatabaseController());
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure the binding is initialized before calling database
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  await databaseHelper.database;
  // seedDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Agri System',
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode:
          // ThemeMode.dark,
          Get.find<ThemeController>().isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
      // home: SyncDataScreen(),
      // AddAgriculteurForm(),
      // const HomeScreen(),
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
