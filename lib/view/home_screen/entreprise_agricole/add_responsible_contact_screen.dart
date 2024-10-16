import 'package:agrisystem/view/components/phone_field_template.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/components/app_button.dart';

class AddResponsibleContactScreen extends StatefulWidget {
  const AddResponsibleContactScreen({super.key});

  @override
  AddResponsibleContactScreenState createState() => AddResponsibleContactScreenState();
}

class AddResponsibleContactScreenState extends State<AddResponsibleContactScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Gender selection
  String selectedGender = 'M';

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
        Navigator.pop(context);
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
    lastNameController.dispose();
    middleNameController.dispose();
    firstNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
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
              const Text('Renseignements Contact du Responsable'),
              const SizedBox(height: 10),

              // Name fields (Last Name, Middle Name, First Name)
              // Row(
              //   children: [
                  TextFormFieldTemplate(
                    controller: lastNameController,
                    hintText: 'Nom',
                    validator: (value) => value == null || value.isEmpty
                        ? 'Veuillez entrer un nom'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldTemplate(
                    controller: middleNameController,
                    hintText: 'Postnom',
                  ),
                    const SizedBox(height: 20),
                TextFormFieldTemplate(
                  controller: firstNameController,
                  hintText: 'Prenom',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Veuillez entrer un prénom'
                      : null,
                ),
              const SizedBox(height: 20),

              // Gender Radio Buttons
              Row(
                children: [
                  const Text('Sexe :'),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'M',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                      const Text('M'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'F',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                      const Text('F'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Phone Number Input
              PhoneFieldTemplate(
                controller: phoneNumberController,
                hintText: 'Numéro de téléphone:',
                validator: (value) => value == null || value.completeNumber.isEmpty
                    ? 'Veuillez entrer un numéro de téléphone'
                    : null,
              ),
              const SizedBox(height: 10),

              // Email Input
              TextFormFieldTemplate(
                controller: emailController,
                hintText: 'Adresse E-mail:',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty
                    ? 'Veuillez entrer une adresse e-mail'
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
