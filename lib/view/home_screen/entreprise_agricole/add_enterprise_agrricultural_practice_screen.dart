import 'package:agrisystem/view/home_screen/entreprise_agricole/add_enterise_agricultural_infrastructure_screen.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';

class AddEnterpriseAgrriculturalPracticeScreen extends StatefulWidget {
  const AddEnterpriseAgrriculturalPracticeScreen({super.key});

  @override
  AddEnterpriseAgrriculturalPracticeScreenState createState() =>
      AddEnterpriseAgrriculturalPracticeScreenState();
}

class AddEnterpriseAgrriculturalPracticeScreenState
    extends State<AddEnterpriseAgrriculturalPracticeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Dropdown selections
  String selectedFieldName = "Sélectionner";
  String selectedAccessMode = "Propre Terre";
  String selectedCultureType = "Principal";
  String selectedAgricultureCulture = "Sélectionner";
  String selectedSeedSource = "Sélectionner une Source";
  String selectedFertilizerSource = "Sélectionner une Source";
  String selectedLabourType = "Manuel";
  String selectedFinancialService = "Financier";

  // Controllers
  final TextEditingController totalProductionController =
      TextEditingController();

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: ((context) => const AddEnterpriseAgriculturalInfrastructureScreen())));
      // Handle form submission logic here
    }
  }

  @override
  void dispose() {
    totalProductionController.dispose();
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
              // Field Name Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedFieldName,
                items: const [
                  'Sélectionner',
                  'Champs 1',
                  'Champs 2',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedFieldName = value!;
                  });
                },
                hintText: 'Nom du champs',
                validator: (value) =>
                    value == null ? 'Veuillez sélectionner un champ' : null,
              ),
              const SizedBox(height: 10),

              // Access Mode Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedAccessMode,
                items: const [
                  'Propre Terre',
                  'Location',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedAccessMode = value!;
                  });
                },
                hintText: 'Mode d\'accès',
                validator: (value) => value == null
                    ? 'Veuillez sélectionner un mode d\'accès'
                    : null,
              ),
              const SizedBox(height: 10),

              // Type of Culture Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedCultureType,
                items: const [
                  'Principal',
                  'Secondaire',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCultureType = value!;
                  });
                },
                hintText: 'Type de culture',
                validator: (value) =>
                    value == null ? 'Veuillez sélectionner un type' : null,
              ),
              const SizedBox(height: 10),

              // Agricultural Culture Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedAgricultureCulture,
                items: const [
                  'Sélectionner',
                  'Culture 1',
                  'Culture 2',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedAgricultureCulture = value!;
                  });
                },
                hintText: 'Culture Agricole',
                validator: (value) => value == null
                    ? 'Veuillez sélectionner une culture agricole'
                    : null,
              ),
              const SizedBox(height: 10),

              // Seed Source Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedSeedSource,
                items: const [
                  'Sélectionner une Source',
                  'Source 1',
                  'Source 2',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedSeedSource = value!;
                  });
                },
                hintText: 'Principale source de semence',
                validator: (value) => value == null
                    ? 'Veuillez sélectionner une source de semence'
                    : null,
              ),
              const SizedBox(height: 10),

              // Fertilizer Source Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedFertilizerSource,
                items: const [
                  'Sélectionner une Source',
                  'Source 1',
                  'Source 2',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedFertilizerSource = value!;
                  });
                },
                hintText: 'Principale source d\'engrais',
                validator: (value) => value == null
                    ? 'Veuillez sélectionner une source d\'engrais'
                    : null,
              ),
              const SizedBox(height: 10),

              // Labour Type Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedLabourType,
                items: const [
                  'Manuel',
                  'Mécanisé',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedLabourType = value!;
                  });
                },
                hintText: 'Type de labour',
                validator: (value) =>
                    value == null ? 'Veuillez sélectionner un type' : null,
              ),
              const SizedBox(height: 10),

              // Total Production Input
              TextFormFieldTemplate(
                controller: totalProductionController,
                hintText: 'Total Production (en Kg)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),

              // Financial Service Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedFinancialService,
                items: const [
                  'Financier',
                  'Non-Financier',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedFinancialService = value!;
                  });
                },
                hintText: 'Service Financier',
                validator: (value) => value == null
                    ? 'Veuillez sélectionner un service financier'
                    : null,
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        // Implement previous logic
                      },
                      buttonText: 'Précédent',
                    ),
                  ),
                  const SizedBox(width: 20,),
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
