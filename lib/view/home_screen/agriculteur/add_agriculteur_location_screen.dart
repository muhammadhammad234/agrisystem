import 'dart:io';
import 'package:agrisystem/helper/location_handler.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/commune_groupment_field_template.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/village_quarter_search_field_template.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:agrisystem/view/home_screen/agriculteur/add_agriculteur_financement_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class AddAgriculteurLocationScreen extends StatefulWidget {
  const AddAgriculteurLocationScreen({super.key});

  @override
  AddAgriculteurLocationScreenState createState() =>
      AddAgriculteurLocationScreenState();
}

class AddAgriculteurLocationScreenState
    extends State<AddAgriculteurLocationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variables for dropdown selections
  // String selectedProvince = 'Sélectionnez une Province';
  String selectedDocumentType = 'Carte d’électeur';

  // Controllers for text fields
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController communeController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController documentNumberController =
      TextEditingController();

  // Image picker
  XFile? documentImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickDocumentImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      documentImage = pickedFile;
    });
  }

  // Save form
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const AddAgriculteurFinancementScreen())));

      // Handle form submission
    }
  }

  @override
  void dispose() {
    // Dispose of controllers
    cityController.dispose();
    provinceController.dispose();
    communeController.dispose();
    villageController.dispose();
    addressController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();
    documentNumberController.dispose();
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
                controller: cityController,
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
                controller: communeController,
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
              VillageQuarterFieldTemplate(
                controller: villageController,
                hintText: 'Village/Quartier',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un village/quartier';
                  }
                  return null;
                },
                labelText: '',
              ),
              const SizedBox(height: 20),

              // Address field
              TextFormFieldTemplate(
                controller: addressController,
                hintText: 'Adresse',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer une adresse';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Longitude field (disabled)
              Row(
                children: [
                  Expanded(
                    child: TextFormFieldTemplate(
                      controller: longitudeController,
                      hintText: 'Longitude',
                      validator: (value) => null,
                      enabled: true,
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Latitude field (disabled)
                  Expanded(
                    child: TextFormFieldTemplate(
                      controller: latitudeController,
                      hintText: 'Latitude',
                      validator: (value) => null,
                      onChanged: (value) {
                        longitudeController.text = value;
                      },
                      // enabled: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // GPS coordinates button
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

              // Document type dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedDocumentType,
                items: const [
                  "Carte d’électeur",
                  "Passeport",
                  "Permis de conduire",
                  "Carte d’identité"
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDocumentType = value!;
                  });
                },
                hintText: 'Document d’identification',
              ),
              const SizedBox(height: 20),

              // Document number field
              TextFormFieldTemplate(
                controller: documentNumberController,
                hintText: 'Numéro de document d\'identité',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer le numéro de document';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Document photo upload
              Row(
                children: [
                  Expanded(
                    child: documentImage == null
                        ? const Text('Photo du document')
                        : Image.file(
                            File(documentImage!.path),
                            height: 100,
                          ),
                  ),
                  ElevatedButton(
                    onPressed: _pickDocumentImage,
                    child: const Text('Choisir un fichier'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Action buttons
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      // width: getWidth(context) * .45,
                      onTap: () {
                        // Handle previous action
                      },
                      buttonText: 'Précédent',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: AppButton(
                      // width: getWidth(context) * .45,
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
