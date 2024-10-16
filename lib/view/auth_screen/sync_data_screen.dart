import 'package:agrisystem/controller/database_controller.dart';
import 'package:agrisystem/utils/app_routes.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SyncDataScreen extends StatelessWidget {
  SyncDataScreen({super.key});

  DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              onTap: ()async {
                await databaseController.syncData(context);
                // Implement sync data functionality here
                print('Sync Data Pressed');
              },
              // style: ElevatedButton.styleFrom(
              //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              //   textStyle: TextStyle(fontSize: 18),
              // ),
              buttonText: 'Sync Data',
            ),
            const SizedBox(height: 20),
            AppButton(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.homeScreen);
                // Continue without sync functionality here
                print('Continue without Sync Pressed');
              },
              buttonText: 'Continue without Sync',
              
            ),
          ],
        ),
      ),
    );
  }

}


  void showSyncDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Syncing Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Please wait, data is being synced...'),
              const SizedBox(height: 20),
              Obx(() =>LinearProgressIndicator(value: Get.find<DatabaseController>().progress.value,),),
            ],
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop(); // Close the dialog
          //     },
          //     child: Text('Cancel'),
          //   ),
          // ],
       
        );
      },
    );

    // Simulate a delay for syncing
  
  }
