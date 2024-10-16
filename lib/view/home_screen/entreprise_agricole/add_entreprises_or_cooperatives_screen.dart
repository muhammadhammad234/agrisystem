import 'package:agrisystem/helper/location_handler.dart';
import 'package:agrisystem/view/components/commune_groupment_field_template.dart';
import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/village_quarter_search_field_template.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/initial_funding_source_screen.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:geolocator/geolocator.dart';

class AddEnterpriseOrCooperativeScreen extends StatefulWidget {
  const AddEnterpriseOrCooperativeScreen({super.key});

  @override
  AddEnterpriseOrCooperativeScreenState createState() =>
      AddEnterpriseOrCooperativeScreenState();
}

class AddEnterpriseOrCooperativeScreenState
    extends State<AddEnterpriseOrCooperativeScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController communeController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  

  final TextEditingController addressController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();

  // Dropdown selections with initial null values
  // String selectedProvince="Province 1";
  // String selectedVille="Ville 1";
  // String selectedCommune="Commune 1";
  // String selectedVillage="Village 1";

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (ctx) => const InitialFundingSourceScreen()));
      // Handle form submission logic here
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    provinceController.dispose();
    communeController.dispose();
    villageController.dispose();
    addressController.dispose();
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
              // Province Dropdown
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

              // Address (Avenue et Numéro)
              TextFormFieldTemplate(
                controller: addressController,
                hintText: 'Adresse (avenue et numéro)',
              ),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: TextFormFieldTemplate(
                  controller: longitudeController,
                  hintText: 'Longitude',
                  keyboardType: TextInputType.number,
                                ),
                ),
              const SizedBox(width: 20),

              // Latitude
              Expanded(
                child: TextFormFieldTemplate(
                  controller: latitudeController,
                  hintText: 'Latitude',
                  keyboardType: TextInputType.number,
                ),
              ),
              
              ],),

              const SizedBox(height: 10,),
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
             

              // Longitude
              const SizedBox(height: 20),

              // Obtain GPS Coordinates Button
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
