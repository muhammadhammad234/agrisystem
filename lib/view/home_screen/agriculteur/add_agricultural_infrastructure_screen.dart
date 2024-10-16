import 'package:agrisystem/helper/location_handler.dart';
import 'package:agrisystem/view/components/commune_groupment_field_template.dart';
import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:geolocator/geolocator.dart';

class AddAgriculturalInfrastructureScreen extends StatefulWidget {
  const AddAgriculturalInfrastructureScreen({super.key});

  @override
  AddAgriculturalInfrastructureScreenState createState() =>
      AddAgriculturalInfrastructureScreenState();
}

class AddAgriculturalInfrastructureScreenState
    extends State<AddAgriculturalInfrastructureScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variables for radio button and dropdowns
  bool hasAgriculturalInfrastructure = false;
  String numberOfInfrastructures = '1';

  // Controllers
  final TextEditingController numberOfInfrastructuresController =
      TextEditingController(text: '1');
      final TextEditingController communeController = TextEditingController();
  final TextEditingController territoryController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();

  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController identificationController =
      TextEditingController();

  // Variables for dropdown selections
  String selectedInfrastructureType = 'Sélectionnez une Infrastructure';
  String selectedAccessMode = 'Propre Terre';
  String selectedProvince = 'Sélectionnez une Province';
  String selectedTerritory = 'Sélectionnez une Ville ou un Territoire';
  String selectedGroup = '';

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      // Handle form submission logic here
    }
  }

  @override
  void dispose() {
    numberOfInfrastructuresController.dispose();
    communeController.dispose();
    territoryController.dispose();
    provinceController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();
    identificationController.dispose();
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
              // Radio buttons for agricultural infrastructure ownership
              const Text(
                  'Avez-vous des infrastructures agricoles appartenant à votre entreprise?'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Oui'),
                      value: true,
                      groupValue: hasAgriculturalInfrastructure,
                      onChanged: (value) {
                        setState(() {
                          hasAgriculturalInfrastructure = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Non'),
                      value: false,
                      groupValue: hasAgriculturalInfrastructure,
                      onChanged: (value) {
                        setState(() {
                          hasAgriculturalInfrastructure = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Show the number of infrastructures if the answer is yes
              if (hasAgriculturalInfrastructure) ...[
                TextFormFieldTemplate(
                  controller: numberOfInfrastructuresController,
                  hintText: 'Si oui, combien d\'infrastructures ?',
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      numberOfInfrastructures = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
              ],

              // Dropdowns and inputs for infrastructure details
              DropdownButtonFormFieldTemplate(
                value: selectedInfrastructureType,
                items: const [
                  'Sélectionnez une Infrastructure',
                  'Infrastructure 1',
                  'Infrastructure 2',
                  'Infrastructure 3',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedInfrastructureType = value!;
                  });
                },
                hintText: 'Type',
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
                hintText: 'Mode d\'accès',
              ),
              const SizedBox(height: 10),
              SearchStateFieldTemplate(
                  controller: provinceController,
                  validator: (val){
                    if(val!.isEmpty){
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

 TextFormFieldTemplate(
                controller: identificationController,
                hintText: 'Identification Responsable',
              ),
              const SizedBox(height: 20),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        // Handle previous action
                      },
                      buttonText: 'Précédent',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppButton(
                      onTap: _saveForm,
                      buttonText: 'Enregistrer',
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
