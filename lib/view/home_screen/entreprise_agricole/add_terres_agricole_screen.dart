import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/add_enterprise_agrricultural_practice_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:agrisystem/helper/location_handler.dart';

class AddTerrisAgricoleScreen extends StatefulWidget {
  const AddTerrisAgricoleScreen({super.key});

  @override
  AddTerrisAgricoleScreenState createState() => AddTerrisAgricoleScreenState();
}

class AddTerrisAgricoleScreenState extends State<AddTerrisAgricoleScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController fieldCountController =
      TextEditingController(text: "1");
  final TextEditingController farmNameController = TextEditingController();
  final TextEditingController documentController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final TextEditingController surfaceAreaController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  bool hasLand = false; // Toggle for land ownership

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) =>
                  const AddEnterpriseAgrriculturalPracticeScreen()));
      // Form submission logic here
      // Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      //   // Handle navigation to the next screen
      //   return const InitialFundingSourceScreen();
      // }));
    }
  }

  @override
  void dispose() {
    fieldCountController.dispose();
    farmNameController.dispose();
    documentController.dispose();
    provinceController.dispose();
    cityController.dispose();
    surfaceAreaController.dispose();
    longitudeController.dispose();
    latitudeController.dispose();
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
              const Text(
                'Terre(s) agricole(s)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Land ownership radio buttons
              const Text(
                  'Avez-vous des terres agricoles appartenant à votre entreprise?'),

              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: hasLand,
                    onChanged: (value) {
                      setState(() {
                        hasLand = value as bool;
                      });
                    },
                  ),
                  const Text('Oui'),
                  Radio(
                    value: false,
                    groupValue: hasLand,
                    onChanged: (value) {
                      setState(() {
                        hasLand = value as bool;
                      });
                    },
                  ),
                  const Text('Non'),
                ],
              ),
              const SizedBox(height: 10),

              // Field count input if land is owned
              if (hasLand)
                TextFormFieldTemplate(
                  controller: fieldCountController,
                  hintText: 'Si oui, combien de champs?',
                  keyboardType: TextInputType.number,
                ),
              const SizedBox(height: 10),

              // Farm Name
              TextFormFieldTemplate(
                controller: farmNameController,
                hintText: 'Nom de la ferme',
              ),
              const SizedBox(height: 10),

              // Document upload (not a real upload but input for demo)
              TextFormFieldTemplate(
                controller: documentController,
                hintText:
                    'Avez-vous un document attestant votre légitimité sur le champ?',
              ),
              const SizedBox(height: 10),

              // Surface area
              TextFormFieldTemplate(
                controller: surfaceAreaController,
                hintText: 'Superficie',
                keyboardType: TextInputType.number,
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

              // Longitude
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
