import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';

class AddAgriculturalPracticeFarmLandScreen extends StatefulWidget {
  const AddAgriculturalPracticeFarmLandScreen({super.key});

  @override
  AddAgriculturalPracticeFarmLandScreenState createState() =>
      AddAgriculturalPracticeFarmLandScreenState();
}

class AddAgriculturalPracticeFarmLandScreenState
    extends State<AddAgriculturalPracticeFarmLandScreen> {
  final _formKey = GlobalKey<FormState>();

  // Dropdown values
  String selectedFieldName = "Sélectionner";
  String selectedAccessMode = "Propre Terre";
  String selectedCropType = "Principal";
  String selectedAgriculturalCrop = "Sélectionner une";
  String selectedSeedSource = "Sélectionner source de se";
  String selectedFertilizerSource = "Sélectionner une Source";
  String selectedLaborType = "Manuel";
  String selectedService = "Financier";

  // Controllers for text fields
  final TextEditingController totalProductionController =
      TextEditingController();

  @override
  void dispose() {
    totalProductionController.dispose();
    super.dispose();
  }

  // Function to save the form
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic
      print("Form saved successfully!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Field Name Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedFieldName,
                    hintText: 'Nom du champs',
                    items: const ['Sélectionner', 'Champ 1', 'Champ 2'],
                    onChanged: (newValue) {
                      setState(() {
                        selectedFieldName = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Access Mode Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedAccessMode,
                    hintText: 'Mode d\'accès (voir liste admin)',
                    items: const ['Propre Terre', 'Location', 'Achat'],
                    onChanged: (newValue) {
                      setState(() {
                        selectedAccessMode = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Crop Type Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedCropType,
                    hintText: 'Type de culture',
                    items: const ['Principal', 'Secondaire'],
                    onChanged: (newValue) {
                      setState(() {
                        selectedCropType = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Agricultural Crop Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedAgriculturalCrop,
                    hintText: 'Culture Agricole (voir liste)',
                    items: ['Sélectionner une', 'Culture 1', 'Culture 2'],
                    onChanged: (newValue) {
                      setState(() {
                        selectedAgriculturalCrop = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Seed Source Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedSeedSource,
                    hintText: 'Principale source de semence',
                    items: [
                      'Sélectionner source de se',
                      'Source 1',
                      'Source 2',
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        selectedSeedSource = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Fertilizer Source Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedFertilizerSource,
                    hintText: 'Principale source d\'engrais',
                    items: [
                      'Sélectionner une Source',
                      'Engrais 1',
                      'Engrais 2',
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        selectedFertilizerSource = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Labor Type Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedLaborType,
                    hintText: 'Type de labour',
                    items: ['Manuel', 'Mécanisé'],
                    onChanged: (newValue) {
                      setState(() {
                        selectedLaborType = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),

                  // Total Production Input
                  TextFormFieldTemplate(
                    controller: totalProductionController,
                    hintText: 'Total Production (en Kg)',
                    validator: (value) => value == null || value.isEmpty
                        ? 'Veuillez entrer la production'
                        : null,
                  ),
                  const SizedBox(height: 20),

                  // Financial Service Dropdown
                  DropdownButtonFormFieldTemplate(
                    value: selectedService,
                    hintText: 'Service Financier',
                    items: ['Financier', 'Non Financier'],
                    onChanged: (newValue) {
                      setState(() {
                        selectedService = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 30),

                  // Buttons (Précédent and Suivant)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppButton(
                          onTap: () {
                            // Logic for "Précédent"
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
        ),
      ),
    );
  }
}
