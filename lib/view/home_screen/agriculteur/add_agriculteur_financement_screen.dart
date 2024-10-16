import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/home_screen/agriculteur/add_agriculteur_terrains_screen.dart';
import 'package:flutter/material.dart';

class AddAgriculteurFinancementScreen extends StatefulWidget {
  const AddAgriculteurFinancementScreen({super.key});

  @override
  AddAgriculteurFinancementScreenState createState() =>
      AddAgriculteurFinancementScreenState();
}

class AddAgriculteurFinancementScreenState
    extends State<AddAgriculteurFinancementScreen> {
  final _formKey = GlobalKey<FormState>();

  // Variables for dropdown and radio buttons
  String selectedFinancingSource = 'Sélectionnez la source';
  String selectedAlreadyFinancingSource = 'Sélectionnez la source';
  bool hasReceivedFunding = false;
  bool isMemberOfStructure = false;

  // Save form
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const AddAgriculteurTerrainsScreen())));

      // Handle form submission logic here
    }
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
              // Financing source dropdown
              DropdownButtonFormFieldTemplate(
                value: selectedFinancingSource,
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
                    selectedFinancingSource = value!;
                  });
                },
                hintText: 'Source de financement initial',
              ),
              const SizedBox(height: 20),
              // DropdownButtonFormFieldTemplate(
              //   value: selectedFinancingSource,
              //   items: const [
              //     'Sélectionnez la source',
              //     'Fonds propres du promoteur',
              //     'Investisseurs Privés',
              //     'Fonds d’investissements',
              //     'Partenariat Public – Privé',
              //     'Projets de développement',
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       selectedFinancingSource = value!;
              //     });
              //   },
              //   hintText: 'Source de financement initial',
              // ),
              // const SizedBox(height: 20),

              // Radio button for received funding
              const Text(
                  'Avez-vous déjà reçu un financement (Subvention ou prêt) après le début de vos activités ?'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Oui'),
                      value: true,
                      groupValue: hasReceivedFunding,
                      onChanged: (value) {
                        setState(() {
                          hasReceivedFunding = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Non'),
                      value: false,
                      groupValue: hasReceivedFunding,
                      onChanged: (value) {
                        setState(() {
                          hasReceivedFunding = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Radio button for membership
              const Text('Êtes-vous membre d\'une structure d\'encadrement ?'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Oui'),
                      value: true,
                      groupValue: isMemberOfStructure,
                      onChanged: (value) {
                        setState(() {
                          isMemberOfStructure = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text('Non'),
                      value: false,
                      groupValue: isMemberOfStructure,
                      onChanged: (value) {
                        setState(() {
                          isMemberOfStructure = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

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
              // Radio button for membership

//               Si oui avez-vous déjà recu
// financement :  Public (Gouvernement)
//  Public (ONG-ProjetPartenaire)
//  Privé (Banque /
// IMF)</option>

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
