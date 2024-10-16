import 'dart:convert';

import 'package:agrisystem/helper/database_helper.dart';
import 'package:agrisystem/network/api_client.dart';
import 'package:agrisystem/network/app_url.dart';
import 'package:agrisystem/utils/app_routes.dart';
import 'package:agrisystem/utils/toast_utils.dart';
import 'package:agrisystem/view/auth_screen/sync_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DatabaseController extends GetxController {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  List<String> tablesName = [
    DatabaseHelper.villageQuarterTbl,
    DatabaseHelper.agriculteurTbl,
    DatabaseHelper.agriAssetTbl,
    DatabaseHelper.agriAssetTypeTbl,
    DatabaseHelper.campagneAgricoleTbl,
    DatabaseHelper.eaTbl,
    DatabaseHelper.champConcessionAgricoleTbl,
    DatabaseHelper.eaSecteurTbl,
    DatabaseHelper.cultureCampagneTbl,
    DatabaseHelper.minicipalityGroupTbl,
    DatabaseHelper.opTbl,
    DatabaseHelper.statesTbl,
    DatabaseHelper.tblusers,
    DatabaseHelper.townTerritoryTbl,
  ];

  RxDouble progress = 0.0.obs;

  seedVillageQuartersFromApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.villageQuarterTbl}');
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        debugPrint("seedVillageQuarters response.body: ${response.body}");
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        await databaseHelper.seedVillageQuarterData(data);
      } else {
        debugPrint("seedVillageQuarters response.body: ${response.body}");
        debugPrint(
            "seedVillageQuarters response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("seedVillageQuarters error: ${e.toString()}");
    }
    // await DatabaseHelper.seedVillageQuarterData();
  }

  seedAgriculteursFromApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.agriculteurTbl}');
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        debugPrint("seedAgriculteur response.body: ${response.body}");
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        await databaseHelper.seedAgriculteur(data);
      } else {
        debugPrint("seedAgriculteur response.body: ${response.body}");
        debugPrint(
            "seedAgriculteur response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("seedAgriculteur error: ${e.toString()}");
    }
    // await DatabaseHelper.seedVillageQuarterData();
  }

  seedAgriAssetsFromApi() async {
    try {
      // Make the GET request to the API
      http.Response response = await ApiClient().getWithoutBearer(
        url: '${AppUrl.syncToSqlite}=${DatabaseHelper.agriAssetTbl}',
      );

      // Check if the response status code is successful (200 OK)
      if (response.statusCode == 200) {
        // Decode the response body into a List of Maps
        final body = jsonDecode(response.body);
        debugPrint("API Response Body: ${response.body}");

        // Convert the body to List<Map<String, dynamic>> for seeding
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Call the function to seed the data into SQLite
        await DatabaseHelper.instance.seedAgriAssets(data);
      } else {
        debugPrint("Error: ${response.statusCode}");
        debugPrint("Response Body: ${response.body}");
      }
    } catch (e) {
      // Show error in case of exceptions
      debugPrint("API Error: ${e.toString()}");
    }
  }

  seedAgriAssetTypesFromApi() async {
    try {
      // Make the GET request to the API
      http.Response response = await ApiClient().getWithoutBearer(
        url: '${AppUrl.syncToSqlite}=${DatabaseHelper.agriAssetTypeTbl}',
      );

      // Check if the response status code is successful (200 OK)
      if (response.statusCode == 200) {
        // Decode the response body into a List of Maps
        final body = jsonDecode(response.body);
        debugPrint("API Response Body: ${response.body}");

        // Convert the body to List<Map<String, dynamic>> for seeding
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Call the function to seed the data into SQLite
        await DatabaseHelper.instance.seedAgriAssetType(data);
      } else {
        debugPrint("Error: ${response.statusCode}");
        debugPrint("Response Body: ${response.body}");
      }
    } catch (e) {
      // Show error in case of exceptions
      debugPrint("API Error: ${e.toString()}");
    }
  }

  seedCampagneAgricoleFromApi() async {
    try {
      // Make the GET request to the API
      http.Response response = await ApiClient().getWithoutBearer(
        url: '${AppUrl.syncToSqlite}=${DatabaseHelper.campagneAgricoleTbl}',
      );

      // Check if the response status code is 200 (successful)
      if (response.statusCode == 200) {
        // Decode the response body into a List of Maps
        final body = jsonDecode(response.body);
        debugPrint("API Response Body: ${response.body}");

        // Convert the body to List<Map<String, dynamic>> for seeding
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Seed the data into the database
        await DatabaseHelper.instance.seedCampagneAgricole(data);
      } else {
        debugPrint("Error: ${response.statusCode}");
        debugPrint("Response Body: ${response.body}");
      }
    } catch (e) {
      // Handle exceptions
      debugPrint("API Error: ${e.toString()}");
    }
  }

  seedEaFromApi() async {
    try {
      // Make API request to fetch EA data
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.eaTbl}');

      // If request is successful, proceed
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        debugPrint("seedEaFromApi response.body: ${response.body}");

        // Convert response body into a List of Maps
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Call the seeding function to insert data into SQLite
        await databaseHelper.seedEaData(data);
      } else {
        // Log error message in case of failed response
        debugPrint("seedEaFromApi failed: ${response.body}");
        debugPrint("Response status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exceptions and errors
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("seedEaFromApi error: ${e.toString()}");
    }
  }

  seedChampConcessionAgricoleApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url:
              '${AppUrl.syncToSqlite}=${DatabaseHelper.champConcessionAgricoleTbl}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        await databaseHelper.seedChampConcessionAgricoleData(data);
        debugPrint("Champ Concession Agricole data seeded successfully.");
      } else {
        debugPrint("Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error in seeding Champ Concession Agricole: ${e.toString()}");
    }
  }

  seedCultureCampagneApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url:
              '${AppUrl.syncToSqlite}=${DatabaseHelper.cultureCampagneTbl}'); // Corrected variable name
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        debugPrint("seedCultureCampagne response.body: ${response.body}");

        // Convert the response into a list of CultureCampagneModel
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        await databaseHelper.seedCultureCampagneData(
            data); // Call the database seeding function
      } else {
        debugPrint("seedCultureCampagne response.body: ${response.body}");
        debugPrint(
            "seedCultureCampagne response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("seedCultureCampagne error: ${e.toString()}");
    }
  }

  seedEaSecteur() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.eaSecteurTbl}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        debugPrint("seedEaSecteur response.body: ${response.body}");

        // Convert the response into a list of EaSecteurModel
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        await databaseHelper
            .seedEaSecteurData(data); // Call the database seeding function
        debugPrint("EA Secteur data seeded successfully.");
      } else {
        debugPrint("seedEaSecteur response.body: ${response.body}");
        debugPrint("seedEaSecteur response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("Error in seeding EA Secteur: ${e.toString()}");
    }
  }

  Future<void> seedMinicipalityGroup() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.minicipalityGroupTbl}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        debugPrint("seedMinicipalityGroup response.body: ${response.body}");

        // Convert each item in the response to MinicipalityGroupModel using fromJson
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Insert into the database
        await databaseHelper.seedMinicipalityGroupData(data);

        debugPrint("Minicipality Group data seeded successfully.");
      } else {
        debugPrint("seedMinicipalityGroup response.body: ${response.body}");
        debugPrint(
            "seedMinicipalityGroup response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("Error in seeding Minicipality Group: ${e.toString()}");
    }
  }

  Future<void> seedOpFromApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.opTbl}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        debugPrint("seedOpFromApi response.body: ${response.body}");

        // Convert each item in the response to OpModel using fromJson
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Insert into the database
        await databaseHelper.seedOpData(data);
        debugPrint("Op data seeded successfully.");
      } else {
        debugPrint("seedOpFromApi response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("Error in seeding Op: ${e.toString()}");
    }
  }

  Future<void> seedStatesFromApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.statesTbl}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        debugPrint("seedStatesFromApi response.body: ${response.body}");

        // Convert each item in the response to StateModel using fromJson
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Insert into the database
        await DatabaseHelper.instance.seedStatesData(data);

        debugPrint("States data seeded successfully.");
      } else {
        debugPrint(
            "seedStatesFromApi response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("Error in seeding States: ${e.toString()}");
    }
  }

  Future<void> seedUsersFromApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.tblusers}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        debugPrint("seedUsersFromApi response.body: ${response.body}");

        // Convert each item in the response to UserModel using fromJson
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Insert into the database
        await DatabaseHelper.instance.seedUsersData(data);

        debugPrint("Users data seeded successfully.");
      } else {
        debugPrint(
            "seedUsersFromApi response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      ToastUtils.showErrorToast(message: e.toString());
      debugPrint("Error in seeding Users: ${e.toString()}");
    }
  }

  Future<void> seedTownTerritoryFromApi() async {
    try {
      http.Response response = await ApiClient().getWithoutBearer(
          url: '${AppUrl.syncToSqlite}=${DatabaseHelper.townTerritoryTbl}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        debugPrint("seedTownTerritoryFromApi response.body: ${response.body}");

        // Convert each item in the response to TownTerritoryModel using fromJson
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(body);

        // Insert into the database
        await DatabaseHelper.instance.seedTownTerritoryData(data);

        debugPrint("Town territory data seeded successfully.");
      } else {
        debugPrint(
            "seedTownTerritoryFromApi response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error in seeding town territory data: ${e.toString()}");
    }
  }

  syncData(BuildContext context) async {
    showSyncDialog(context);

    await seedVillageQuartersFromApi();
    progress(10);
    await seedAgriculteursFromApi();
    progress(15);

    await seedAgriAssetsFromApi();
    progress(20);

    await seedAgriAssetTypesFromApi();
    progress(25);

    await seedCampagneAgricoleFromApi();

    progress(30);

    await seedEaFromApi();
    progress(35);

    await seedChampConcessionAgricoleApi();
    progress(40);

    await seedEaSecteur();
    progress(45);

    await seedCultureCampagneApi();
    progress(50);

    await seedMinicipalityGroup();
    progress(60);

    await seedOpFromApi();
    progress(70);

    await seedStatesFromApi();
    progress(80);

    await seedUsersFromApi();
    progress(90);

    await seedTownTerritoryFromApi();
    progress(100);

    ToastUtils.showSuccessToast(message: "Data seeded successfully");
    Future.delayed(Duration.zero, () {
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    });
  }
}
