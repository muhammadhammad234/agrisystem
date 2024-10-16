import 'package:agrisystem/helper/location_handler.dart';
import 'package:agrisystem/view/components/commune_groupment_field_template.dart';
import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/add_responsible_contact_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:geolocator/geolocator.dart';

class AddEnterpriseAgriculturalInfrastructureScreen extends StatefulWidget {
  const AddEnterpriseAgriculturalInfrastructureScreen({super.key});

  @override
  _AddEnterpriseAgriculturalInfrastructureScreenState createState() =>
      _AddEnterpriseAgriculturalInfrastructureScreenState();
}

class _AddEnterpriseAgriculturalInfrastructureScreenState
    extends State<AddEnterpriseAgriculturalInfrastructureScreen> {
  final _formKey = GlobalKey<FormState>();

  // Radio button selection
  bool hasInfrastructure = true;

  // Dropdown selections
  String selectedInfrastructureType = "Sélectionnez une Infrastructure";
  String selectedAccessMode = "Propre Terre";
  // String selectedProvince = "Sélectionnez une Province";
  // String selectedTerritory = "Sélectionnez une Ville ou un Territoire";
  // String selectedGroup = "Sélectionnez un Groupement";

  // Controllers
  final TextEditingController numberOfInfrastructuresController =
      TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController territoryController = TextEditingController();
  final TextEditingController groupController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController responsibleIdentificationController =
      TextEditingController();

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: ((context) => const AddResponsibleContactScreen())));
      // Handle form submission logic here
    }
  }

  @override
  void dispose() {
    numberOfInfrastructuresController.dispose();
    provinceController.dispose();
    territoryController.dispose();
    groupController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();
    responsibleIdentificationController.dispose();
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
              // Infrastructure Radio Buttons
              const Text(
                  'Avez-vous des infrastructures agricoles appartenant à votre entreprise?'),

              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: hasInfrastructure,
                    onChanged: (value) {
                      setState(() {
                        hasInfrastructure = value!;
                      });
                    },
                  ),
                  const Text('Oui'),
                  const SizedBox(width: 20),
                  Radio<bool>(
                    value: false,
                    groupValue: hasInfrastructure,
                    onChanged: (value) {
                      setState(() {
                        hasInfrastructure = value!;
                      });
                    },
                  ),
                  const Text('Non'),
                ],
              ),
              const SizedBox(height: 10),

              // Show number of infrastructures only if 'Oui' is selected
              if (hasInfrastructure)
                Column(
                  children: [
                    TextFormFieldTemplate(
                      controller: numberOfInfrastructuresController,
                      hintText: 'Si oui, combien d\'infrastructures ?',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),

              // Infrastructure Type Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedInfrastructureType,
                items: const [
                  'Sélectionnez une Infrastructure',
                  'Infrastructure 1',
                  'Infrastructure 2',
                ],
                onChanged: (value) {
                  setState(() {
                    selectedInfrastructureType = value!;
                  });
                },
                hintText: 'Type',
                validator: (value) => value == null
                    ? 'Veuillez sélectionner un type d\'infrastructure'
                    : null,
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


             
              // Responsible Identification Input
              TextFormFieldTemplate(
                controller: responsibleIdentificationController,
                hintText: 'Identification Responsable',
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
