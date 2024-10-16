import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {
  // Get the directory to store the file
  Future<String> _getFilePath(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final listingsDirectory = Directory('${directory.path}/listings');

    // Ensure that the Listings directory exists
    if (!(await listingsDirectory.exists())) {
      await listingsDirectory.create(recursive: true);  // Create the directory if it doesn't exist
    }

    return '${listingsDirectory.path}/$fileName';
  }

  // Save JSON data to a file
  Future<void> saveJsonToFile(
      Map<String, dynamic> jsonData, String fileName) async {
    final filePath = await _getFilePath(fileName);
    final file = File(filePath);

    // Convert the Map to a JSON string
    String jsonString = jsonEncode(jsonData);

    // Write the JSON string to the file
    await file.writeAsString(jsonString);
  }

  // Read the JSON data from the file
  Future<Map<String, dynamic>?> readJsonFromFile(String fileName) async {
    try {
      final filePath = await _getFilePath(fileName);
      final file = File(filePath);

      // Check if file exists
      if (await file.exists()) {
        // Read the file contents as a string
        String jsonString = await file.readAsString();
        debugPrint("JSON String: $jsonString");

        // Decode the JSON string to a Map
        return jsonDecode(jsonString);
      }
      return null;
    } catch (e) {
      debugPrint('Error reading JSON file: $e');
      return null;
    }
  }

  Future<bool> deleteFile(String fileName) async {
  try {
    final filePath = await _getFilePath(fileName);
    final file = File(filePath);

    if (await file.exists()) {
      await file.delete();
      return true;
    }
    return false;
  } catch (e) {
    debugPrint('Error deleting file: $e');
    return false;
  }
}

  Future<List<String>?> listFilesInDirectory() async {
    try {
      final applicationDirectory = await getApplicationDocumentsDirectory();
      final directory = Directory('${applicationDirectory.path}/listings');
      
      if (!(await directory.exists())) {
        return null;  // Return null if the directory doesn't exist
      }

      final List<FileSystemEntity> entities =
          directory.listSync(); // List all files and directories

      // Filter out only the files
      final List<String> fileNames = entities
          .whereType<File>()
          .map((file) =>
              file.path.split('/').last) // Extract the file name from the path
          .toList();

      return fileNames;
    } catch (e) {
      debugPrint('Error listing files: $e');
      rethrow;
    }
  }

   // Function to update the existing JSON listing
  Future<void> updateJsonInFile(
      Map<String, dynamic> updatedData, String fileName) async {
    try {
      // Read existing data from the file
      final existingData = await readJsonFromFile(fileName);

      if (existingData != null) {
        // Merge the updated data with the existing data
        // final mergedData = {...updatedData};

        // Save the merged data back to the file
        await saveJsonToFile(updatedData, fileName);
      } else {
        // If no existing data, just save the updated data as new
        await saveJsonToFile(updatedData, fileName);
      }
    } catch (e) {
      debugPrint('Error updating JSON file: $e');
    }
  }
}
