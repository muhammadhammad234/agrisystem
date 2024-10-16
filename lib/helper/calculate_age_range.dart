import 'package:intl/intl.dart';

String calculateAgeRange(String date) {
  try {
    // Assuming the date format is 'dd/MM/yyyy', parse it
    DateTime birthDate = DateFormat('dd/MM/yyyy').parse(date);
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    int monthDifference = today.month - birthDate.month;

    if (monthDifference < 0 || (monthDifference == 0 && today.day < birthDate.day)) {
      age--;
    }

    String ageRange;
    if (age >= 18 && age <= 25) {
      ageRange = "18-25";
    } else if (age >= 26 && age <= 50) {
      ageRange = "26-50";
    } else if (age >= 51 && age <= 75) {
      ageRange = "51-75";
    } else if (age >= 76 && age <= 100) {
      ageRange = "76-100";
    } else {
      ageRange = "Out of range";
    }

    return ageRange;
  } catch (e) {
    return "Invalid date";
  }
}