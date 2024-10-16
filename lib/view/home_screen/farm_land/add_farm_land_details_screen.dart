import 'package:agrisystem/helper/location_handler.dart';
import 'package:agrisystem/view/components/commune_groupment_field_template.dart';
import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:agrisystem/view/home_screen/farm_land/add_agricultural_practice_farm_land_screen.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:geolocator/geolocator.dart';

class AddFarmDetailsScreen extends StatefulWidget {
  const AddFarmDetailsScreen({super.key});

  @override
  _AddFarmDetailsScreenState createState() => _AddFarmDetailsScreenState();
}

class _AddFarmDetailsScreenState extends State<AddFarmDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields

  final TextEditingController  provinceController= TextEditingController();
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController territoryController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  // Dropdown values
 
 
 
 
  // File picker variable
  String? selectedFileName;

  @override
  void dispose() {
    farmNameController.dispose();
    provinceController.dispose();
    territoryController.dispose();
    groupController.dispose();
    areaController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();
    super.dispose();
  }

  // Function to pick a file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  // Function to save the form
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: ((context) => const AddAgriculturalPracticeFarmLandScreen())));
      // Handle form submission logic
      print("Form saved successfully!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Farm Name Input
              TextFormFieldTemplate(
                controller: farmNameController,
                hintText: 'Nom de la ferme',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Veuillez entrer le nom de la ferme' : null,
              ),
              const SizedBox(height: 20),

              // File Picker Button and File Name Display
              Row(
                children: [
                  TextButton.icon(
                    onPressed: _pickFile,
                    icon: const Icon(Icons.attach_file),
                    label: const Text('Choisir un fichier'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      selectedFileName ?? 'Aucun fichier choisi',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Area Input
              TextFormFieldTemplate(
                controller: areaController,
                hintText: 'Superficie',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Veuillez entrer la superficie' : null,
              ),
              const SizedBox(height: 20),

              // Province Dropdown
                             SearchStateFieldTemplate(
                  controller: provinceController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Veuillez entrer une province';
                    }
                    return null;
                  },
                  labelText: "Province",
                  hintText: 'Province'),

              const SizedBox(height: 20),

              // City field
              VilleTerritoireFieldTemplate(
                controller: territoryController,
                hintText: 'Ville/Territoire',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une ville/territoire';
                  }
                  return null;
                },
                labelText: '',
              ),
              const SizedBox(height: 20),

              // Commune field
              CommuneGroupmentFieldTemplate(
                controller: groupController,
                hintText: 'Commune/Groupe',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une commune/groupe';
                  }
                  return null;
                },
                labelText: '',
              ),
              const SizedBox(height: 20),

              // Longitude and Latitude Inputs
              Row(
                children: [
                  Expanded(
                    child: TextFormFieldTemplate(
                      controller: longitudeController,
                      hintText: 'Longitude',
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Veuillez entrer la longitude' : null,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormFieldTemplate(
                      controller: latitudeController,
                      hintText: 'Latitude',
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Veuillez entrer la latitude' : null,
                    ),
                  ),
                ],
              ),
               const SizedBox(height: 20),
                 

                          ElevatedButton(
                onPressed: () async {
                  Position? position =
                      await LocationHandler().getCurrentPosition(context);
                  debugPrint("position ${position.toString()}");
                  if (position != null) {
                    longitudeController.text = position.longitude.toString();
                    latitudeController.text = position.latitude.toString();
                    setState(() {});
                  }

                  // Logic to obtain GPS coordinates goes here
                },
                child: const Text('Obtenir les coordonnées GPS'),
              ),
  
              const SizedBox(height: 30),

              // Previous and Next Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        // Logic for "Précédent" button
                      },
                      buttonText: 'Précédent',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppButton(
                      onTap: _saveForm,
                      buttonText: 'Suivant',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
