import 'package:agrisystem/view/home_screen/entreprise_agricole/add_entreprises_or_cooperatives_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class RenseignementsEntreprisesAgricolesScreen extends StatefulWidget {
  const RenseignementsEntreprisesAgricolesScreen({super.key});

  @override
  RenseignementsEntreprisesAgricolesScreenState createState() =>
      RenseignementsEntreprisesAgricolesScreenState();
}

class RenseignementsEntreprisesAgricolesScreenState
    extends State<RenseignementsEntreprisesAgricolesScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController denominationController = TextEditingController();
  final TextEditingController sigleController = TextEditingController();
  final TextEditingController dateCreationController = TextEditingController();
  final TextEditingController documentNumberController =
      TextEditingController();
  final TextEditingController rayonActionController = TextEditingController();
  final TextEditingController zoneActivitiesController =
      TextEditingController();

  // Variables for dropdown selections
  String selectedFormeJuridique = 'ASBL';
  String selectedDocumentType = 'RCEN';
  String selectedSecteurActivite = 'Sélectionnez un secteur';

  File? _selectedFile;

  ///
  /// Shows the file picker dialog to the user and allows them to select a file.
  /// The selected file is stored in the [_selectedFile] variable.
  ///
  /// This function is asynchronous and returns a Future that resolves to void.
  ///
  Future<void> _pickFile() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.files.single.path!);
      });
    }
  }

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const AddEnterpriseOrCooperativeScreen())));

      // Handle form submission logic here
    }
  }

  @override
  void dispose() {
    denominationController.dispose();
    sigleController.dispose();
    dateCreationController.dispose();
    documentNumberController.dispose();
    rayonActionController.dispose();
    zoneActivitiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ajouter une entreprise ou cooperative agricole'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title Section
              const Text(
                'Renseignements Entreprises Agricoles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Dénomination
              TextFormFieldTemplate(
                controller: denominationController,
                hintText: 'Dénomination',
              ),
              const SizedBox(height: 10),

              // Sigle
              TextFormFieldTemplate(
                controller: sigleController,
                hintText: 'Sigle',
              ),
              const SizedBox(height: 10),

              // Date de création
              TextFormField(
                controller: dateCreationController,
                readOnly: true, // Make the field read-only
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    dateCreationController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                  setState(() {});
                },
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
                decoration: InputDecoration(
                  enabled: true,
                  hintText: 'jj/mm/aaaa',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black.withOpacity(.4)),
                  suffixIcon: const Icon(Icons.calendar_today),
                  filled: true,
                  fillColor: const Color(0xFFF5FCF9),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5, vertical: 16.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                validator: (val) {
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Forme Juridique Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedFormeJuridique,
                items: const ['ASBL', 'SARL', 'SPRL', 'Autre'],
                onChanged: (value) {
                  setState(() {
                    selectedFormeJuridique = value!;
                  });
                },
                hintText: 'Forme juridique',
              ),
              const SizedBox(height: 10),

              // Document juridique présente Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedDocumentType,
                items: const ['RCEN', 'Autre'],
                onChanged: (value) {
                  setState(() {
                    selectedDocumentType = value!;
                  });
                },
                hintText: 'Document juridique présente',
              ),
              const SizedBox(height: 10),

              // Numéro de document
              TextFormFieldTemplate(
                controller: documentNumberController,
                hintText: 'Numéro de document',
              ),
              const SizedBox(height: 10),

              // Attacher le scan du document
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Attacher le scan du document'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _pickFile,
                        child: const Text('Choisir un fichier'),
                      ),
                      const SizedBox(width: 20),
                      Text(_selectedFile != null
                          ? 'Fichier sélectionné'
                          : 'Aucun fichier choisi'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Rayon d'action
              TextFormFieldTemplate(
                controller: rayonActionController,
                hintText: 'Rayon d\'action',
              ),
              const SizedBox(height: 10),

              // Secteur d'activité Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedSecteurActivite,
                items: const [
                  'Sélectionnez un secteur',
                  'Agriculture',
                  'Commerce',
                  'Industrie',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedSecteurActivite = value!;
                  });
                },
                hintText: 'Secteur d\'activité',
              ),
              const SizedBox(height: 10),

              // Zone d'activités
              TextFormFieldTemplate(
                controller: zoneActivitiesController,
                hintText: 'Zone d\'activités',
              ),
              const SizedBox(height: 20),

              // Action Button
              AppButton(
                onTap: _saveForm,
                buttonText: 'Suivant',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
