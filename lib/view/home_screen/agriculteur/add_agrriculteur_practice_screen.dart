import 'package:agrisystem/view/home_screen/agriculteur/add_agricultural_infrastructure_screen.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';

class AddAgriculturalPracticeScreen extends StatefulWidget {
  const AddAgriculturalPracticeScreen({super.key});

  @override
  AddAgriculturalPracticeScreenState createState() =>
      AddAgriculturalPracticeScreenState();
}

class AddAgriculturalPracticeScreenState
    extends State<AddAgriculturalPracticeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController totalProductionController =
      TextEditingController();

  // Dropdown selection variables
  String selectedField = 'Sélectionner';
  String selectedAccessMode = 'Propre Terre';
  String selectedCultureType = 'Principal';
  String selectedAgriculturalCulture = 'Sélectionner un';
  String selectedSeedSource = 'Sélectionner source de semence';
  String selectedFertilizerSource = 'Sélectionner une Source';
  String selectedLabourType = 'Manuel';
  String selectedFinancialService = 'Financier1';

  // Save form
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  const AddAgriculturalInfrastructureScreen())));

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
        title: const Text('Ajouter un agriculteur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Dropdowns for various fields
              DropdownButtonFormFieldTemplate(
                value: selectedField,
                items: const [
                  'Sélectionner',
                  'Champ 1',
                  'Champ 2',
                  'Champ 3',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedField = value!;
                  });
                },
                hintText: 'Nom du champ',
              ),
              const SizedBox(height: 10),
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
                hintText: 'Mode d\'accès (Voir liste admin)',
              ),
              const SizedBox(height: 10),
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
              ),
              const SizedBox(height: 10),
              DropdownButtonFormFieldTemplate(
                value: selectedAgriculturalCulture,
                items: const [
                  'Sélectionner un',
                  'Maïs',
                  'Riz',
                  'Blé',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedAgriculturalCulture = value!;
                  });
                },
                hintText: 'Culture Agricole (Voir liste)',
              ),
              const SizedBox(height: 10),
              DropdownButtonFormFieldTemplate(
                value: selectedSeedSource,
                items: const [
                  'Sélectionner source de semence',
                  'Marché local',
                  'Partenaire',
                  'Autre',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedSeedSource = value!;
                  });
                },
                hintText: 'Principale source de semence',
              ),
              const SizedBox(height: 10),
              DropdownButtonFormFieldTemplate(
                value: selectedFertilizerSource,
                items: const [
                  'Sélectionner une Source',
                  'Engrais local',
                  'Fertilizer Partner',
                  'Autre',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedFertilizerSource = value!;
                  });
                },
                hintText: 'Principale source d\'engrais',
              ),
              const SizedBox(height: 10),
              DropdownButtonFormFieldTemplate(
                value: selectedLabourType,
                items: const [
                  'Manuel',
                  'Machinisation',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedLabourType = value!;
                  });
                },
                hintText: 'Type de labour',
              ),
              const SizedBox(height: 10),
              TextFormFieldTemplate(
                controller: totalProductionController,
                hintText: 'Total Production (en Kg) culture principale',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormFieldTemplate(
                value: selectedFinancialService,
                items: const [
                  'Financier1',
                  'Financier2',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedFinancialService = value!;
                  });
                },
                hintText: 'Service Financier',
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
