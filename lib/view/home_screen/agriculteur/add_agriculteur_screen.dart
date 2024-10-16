import 'dart:io';

import 'package:agrisystem/helper/calculate_age_range.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/components/date_from_text_field.dart';
import 'package:agrisystem/view/components/dropdown_button_formfield_template.dart';
import 'package:agrisystem/view/components/phone_field_template.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/view/home_screen/agriculteur/add_agriculteur_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAgriculteurScreen extends StatefulWidget {
  const AddAgriculteurScreen({super.key});

  @override
  AddAgriculteurScreenState createState() => AddAgriculteurScreenState();
}

class AddAgriculteurScreenState extends State<AddAgriculteurScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form field variables
  String gender = 'Masculin';
  String maritalStatus = 'Marie';
  XFile? profileImage;

  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController postNameController = TextEditingController();
  final TextEditingController placeOfBirthController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController ageGroupController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Pick image using image picker
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      profileImage = pickedFile;
    });
  }

  // Save form
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const AddAgriculteurLocationScreen())));
      // Handle form submission logic here
    }
  }

  @override
  void dispose() {
    // Dispose of controllers when no longer needed
    firstNameController.dispose();
    lastNameController.dispose();
    postNameController.dispose();
    placeOfBirthController.dispose();
    dateOfBirthController.dispose();
    ageGroupController.dispose();
    phoneController.dispose();
    emailController.dispose();
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
            children: [
              TextFormFieldTemplate(
                controller: firstNameController,
                hintText: 'Prénom',
                validator: (value) {
                  if (value!.isEmpty) return 'Veuillez entrer le prénom';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormFieldTemplate(
                controller: lastNameController,
                hintText: 'Nom',
                validator: (value) {
                  if (value!.isEmpty) return 'Veuillez entrer le nom';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormFieldTemplate(
                controller: postNameController,
                hintText: 'Postnom',
                validator: (value) {
                  if (value!.isEmpty) return 'Veuillez entrer le postnom';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormFieldTemplate(
                value: gender,
                items: const ["Masculin", "Féminin"],
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                hintText: 'Sexe',
              ),
              const SizedBox(height: 20),
              DropdownButtonFormFieldTemplate(
                value: maritalStatus,
                items: const ["Marie", "Célibataire", "Divorce", "Veuf(ve)"],
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value!;
                  });
                },
                hintText: 'Statut matrimonial',
              ),
              const SizedBox(height: 20),
              TextFormFieldTemplate(
                controller: placeOfBirthController,
                hintText: 'Lieu de naissance',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer le lieu de naissance';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
      controller: dateOfBirthController,
      readOnly: true, // Make the field read-only
      onTap: () async{
        final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateOfBirthController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      ageGroupController.text = calculateAgeRange(dateOfBirthController.text);
    }
    setState(() {
      
    });
      },
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),
      decoration: InputDecoration(
        enabled: true,
        hintText: 'jj/mm/aaaa',
        hintStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.black.withOpacity(.4)),
        suffixIcon: const Icon(Icons.calendar_today),
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator:  
          (val) {
            return null;
          },
    ),
  
              const SizedBox(height: 20),
              TextFormFieldTemplate(
                controller: ageGroupController,
                hintText: 'Tranche d\'âge',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer la tranche d\'âge';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              PhoneFieldTemplate(
                hintText: 'Numéro de téléphone',
                onChanged: (value) {
                  phoneController.text = value.completeNumber;
                },
                validator: (value) {
                  if (value!.completeNumber.isEmpty) {
                    return 'Veuillez entrer le numéro de téléphone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormFieldTemplate(
                controller: emailController,
                hintText: 'Adresse E-mail',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Veuillez entrer une adresse E-mail valide';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: profileImage == null
                        ? const Text('Aperçu de la photo')
                        : Image.file(
                            File(profileImage!.path),
                            height: 100,
                          ),
                  ),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Ajouter photo'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
