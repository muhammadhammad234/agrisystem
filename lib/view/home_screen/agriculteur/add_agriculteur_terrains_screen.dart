import 'dart:io';
import 'package:agrisystem/helper/location_handler.dart';
import 'package:agrisystem/view/components/commune_groupment_field_template.dart';
import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:agrisystem/view/home_screen/agriculteur/add_agrriculteur_practice_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:geolocator/geolocator.dart';

class AddAgriculteurTerrainsScreen extends StatefulWidget {
  const AddAgriculteurTerrainsScreen({super.key});

  @override
  AddAgriculteurTerrainsScreenState createState() =>
      AddAgriculteurTerrainsScreenState();
}

class AddAgriculteurTerrainsScreenState
    extends State<AddAgriculteurTerrainsScreen> {
  final _formKey = GlobalKey<FormState>();

  bool hasAgriculturalLand = false;
  String numberOfFields = '1';

  // Controllers
  final TextEditingController numberOfFieldsController =
      TextEditingController(text: '1');
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController territoryController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  // Variables for dropdown values
  // String selectedProvince = 'Sélectionnez une Province';
  // String selectedTerritory = 'Sélectionnez un Territoire';
  // String selectedGroup = 'Sélectionnez un Groupement';

  // File upload handler
  String? selectedFile;

  // Save form
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const AddAgriculturalPracticeScreen())));
      // Handle form submission logic here
    }
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    numberOfFieldsController.dispose();
    farmNameController.dispose();
    provinceController.dispose();
    territoryController.dispose();
    groupController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ajouter un agriculteur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Radio button for agricultural land ownership
              const Text(
                  'Avez-vous des terres agricoles appartenant à votre entreprise?'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Oui'),
                      value: true,
                      groupValue: hasAgriculturalLand,
                      onChanged: (value) {
                        setState(() {
                          hasAgriculturalLand = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Non'),
                      value: false,
                      groupValue: hasAgriculturalLand,
                      onChanged: (value) {
                        setState(() {
                          hasAgriculturalLand = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // If the user owns land, ask for the number of fields
              if (hasAgriculturalLand) ...[
                // const Text('Si oui, combien de champs'),
                TextFormFieldTemplate(
                  controller: numberOfFieldsController,
                  hintText: 'Nombre de champs',
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      numberOfFields = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
              ],

              // Farm name input
              // const Text('Nom de la ferme'),
              TextFormFieldTemplate(
                controller: farmNameController,
                hintText: 'Nom de la ferme',
              ),
              const SizedBox(height: 20),

              // File picker for legitimacy document
              const Text(
                  'Avez-vous un document attestant votre légitimité sur le champ'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        selectedFile = file.path.split('/').last;
                        setState(() {});
                      } else {
                        // User canceled the picker
                      }
                      // Logic to pick a file
                    },
                    child: const Text('Choisir un fichier'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(selectedFile ?? 'Aucun fichier choisi')),
                ],
              ),
              const SizedBox(height: 20),

              // Dropdowns for province, territory, and group
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

              // Village field

              const SizedBox(height: 20),

              // Longitude and Latitude inputs
              // const Text('Longitude'),
              Row(children: [
                Expanded(
                child: TextFormFieldTemplate(
                  controller: longitudeController,
                  hintText: 'Longitude',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 20),
              // const Text('Latitude'),
              Expanded(
                child: TextFormFieldTemplate(
                  controller: latitudeController,
                  hintText: 'Latitude',
                  keyboardType: TextInputType.number,
                ),
              ),
              ]),
              
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
              const SizedBox(height: 20),


              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        Navigator.pop(context);
                        // Handle previous action
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
