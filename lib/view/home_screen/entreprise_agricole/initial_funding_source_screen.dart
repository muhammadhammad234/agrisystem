import 'package:agrisystem/view/home_screen/entreprise_agricole/add_terres_agricole_screen.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';

class InitialFundingSourceScreen extends StatefulWidget {
  const InitialFundingSourceScreen({super.key});

  @override
  InitialFundingSourceScreenState createState() =>
      InitialFundingSourceScreenState();
}

class InitialFundingSourceScreenState
    extends State<InitialFundingSourceScreen> {
  final _formKey = GlobalKey<FormState>();

  // Dropdown selection
  String selectedFundingSource='Sélectionnez la source';
  String selectedAlreadyFinancingSource='Sélectionnez la source';


  // Radio button selections
  bool hasReceivedFunding = false;
  bool isPartOfStructure = false;

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: ((context) => const AddTerrisAgricoleScreen())));
      // Handle form submission logic here
    }
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
                'Source de financement initial',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Source de financement initial Dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedFundingSource,
                 items: const [
                  'Sélectionnez la source',
                  'Fonds propres du promoteur',
                  'Investisseurs Privés',
                  'Fonds d’investissements',
                  'Partenariat Public – Privé',
                  'Projets de développement',
                ],
              
                onChanged: (value) {
                  setState(() {
                    selectedFundingSource = value!;
                  });
                },
                hintText: 'Sélectionnez la source',
              ),
              const SizedBox(height: 20),

              // Avez-vous déjà reçu un financement? (Radio buttons)
              const Text('Avez-vous déjà reçu un financement (Subvention ou prêt) après le début de vos activités?'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: hasReceivedFunding,
                    onChanged: (value) {
                      setState(() {
                        hasReceivedFunding = value!;
                      });
                    },
                  ),
                  const Text('Oui'),
                  Radio<bool>(
                    value: false,
                    groupValue: hasReceivedFunding,
                    onChanged: (value) {
                      setState(() {
                        hasReceivedFunding = value!;
                      });
                    },
                  ),
                  const Text('Non'),
                ],
              ),
              const SizedBox(height: 20),

              // Êtes-vous membre d'une structure d'encadrement? (Radio buttons)
              const Text('Êtes-vous membre d\'une structure d\'encadrement?'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isPartOfStructure,
                    onChanged: (value) {
                      setState(() {
                        isPartOfStructure = value!;
                      });
                    },
                  ),
                  const Text('Oui'),
                  Radio<bool>(
                    value: false,
                    groupValue: isPartOfStructure,
                    onChanged: (value) {
                      setState(() {
                        isPartOfStructure = value!;
                      });
                    },
                  ),
                  const Text('Non'),
                ],
              ),

               if (hasReceivedFunding)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Si oui avez-vous déjà recu financement'),
                    const SizedBox(height: 20),
                    DropdownButtonFormFieldTemplate(
                      value: selectedAlreadyFinancingSource,
                      items: const [
                        'Sélectionnez la source',
                        'Public (Gouvernement)',
                        'Public (ONG-Projet Partenaire)',
                        'Fonds d’investissements',
                        'Privé (Banque / IMF)',
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedAlreadyFinancingSource = value!;
                        });
                      },
                      hintText: 'Source de financement initial',
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
             
              const SizedBox(height: 20),

              // Action Buttons (Précédent, Suivant)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        // Handle "Précédent" logic here
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
