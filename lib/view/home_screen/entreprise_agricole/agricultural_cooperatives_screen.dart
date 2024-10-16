import 'package:agrisystem/helper/database_helper.dart';
import 'package:agrisystem/model/ea_model.dart';
import 'package:agrisystem/model/op_model.dart';
import 'package:agrisystem/utils/size_constants.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/renseignements_entreprises_agricoles.dart';
import 'package:flutter/material.dart';

class AgriculturalCooperativesScreen extends StatefulWidget {
  const AgriculturalCooperativesScreen({super.key});

  @override
  AgriculturalCooperativesScreenState createState() =>
      AgriculturalCooperativesScreenState();
}

class AgriculturalCooperativesScreenState
    extends State<AgriculturalCooperativesScreen> {
  // Sample data
  final List<Map<String, dynamic>> companies = [
    {
      // 'logo': 'Logo URL 1', // Use a placeholder for logo or network image
      'name': 'The new eddy boma',
      'sigle': 'NOB SARL',
      'creationDate': '0000-00-00',
      'filiere': 'Manioc',
      'secteur': 'Exploitant Agricole',
      'province': 'Kinshasa',
      'villeTerritoire': 'Tshangu',
      'phone': '8476348348347837',
      'email': '',
    },
    {
      // 'logo': 'Logo URL 2',
      'name': 'Tshikula',
      'sigle': 'TCHIKULALONGO',
      'creationDate': '0000-00-00',
      'filiere': 'Manioc',
      'secteur': 'Exploitant Agricole',
      'province': 'Kinshasa',
      'villeTerritoire': 'Tshangu',
      'phone': '8477348347837',
      'email': '',
    },
    {
      // 'logo': 'Logo URL 3',
      'name': 'Synergie pour l\'amelioration...',
      'sigle': 'SAEP/CDC',
      'creationDate': '0000-00-00',
      'filiere': 'Manioc',
      'secteur': 'Exploitant Agricole',
      'province': 'Kinshasa',
      'villeTerritoire': 'Tshangu',
      'phone': '840176899',
      'email': '',
    },
    {
      // 'logo': 'Logo URL 4',
      'name': 'Synergie pour l\'amelioration...',
      'sigle': 'SAEP/CDC',
      'creationDate': '0000-00-00',
      'filiere': 'Manioc',
      'secteur': 'Exploitant Agricole',
      'province': 'Kinshasa',
      'villeTerritoire': 'Tshangu',
      'phone': '840176899',
      'email': '',
    },
    {
      // 'logo': 'Logo URL 5',
      'name': 'COCAGRI SARL',
      'sigle': 'COCAGRI SARL',
      'creationDate': '2020-03-20',
      'filiere': 'Café Arabica',
      'secteur': 'Exploitant Agricole',
      'province': 'Nord-Kivu',
      'villeTerritoire': 'Goma',
      'phone': '+243972934538',
      'email': 'david305@gmail.com',
    },
  ];


Future<List<EaModel>> fetchEADetails() async {
    final db = DatabaseHelper.instance;
    List<Map<String, dynamic>> maps = await db.getAllEA();

    if (maps.isNotEmpty) {
      return maps.map((map) => EaModel.fromMap(map)).toList();
    } else {
      return [];
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entreprises et cooperatives agricoles'),
        actions: [IconButton(onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: ((context) => const RenseignementsEntreprisesAgricolesScreen())));

        }, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              // ElevatedButton(
              //   onPressed: () {
              //     // Add logic to add a new enterprise or cooperative
              //   },
              //   child: const Text('Ajouter une nouvelle entreprise'),
              // ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: getWidth(context),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Add search functionality here
                  },
                ),
              ),
              //   ],
              // ),
              const SizedBox(height: 20),
                 FutureBuilder<List<EaModel>>(
                future: fetchEADetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No data available');
                  } else {
                    final op = snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingTextStyle: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.tertiary),
                        dataTextStyle: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: Theme.of(context).colorScheme.tertiary),
                        // headingRowColor: Theme.of(context).colorScheme.primary!,
                        columns: const [
                          // DataColumn(label: Text('Logo')),
                          DataColumn(label: Text('Nom')),
                          DataColumn(label: Text('Sigle')),
                          DataColumn(label: Text('Date de Creation')),
                          DataColumn(label: Text('Secteur')),
                          DataColumn(label: Text('Province')),
                          DataColumn(label: Text('Ville/Territoire')),
                          DataColumn(label: Text('Localite/Quartier')),
                          DataColumn(label: Text('Phone')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: op.map((org) {
                          // String province =
                          //     DatabaseHelper.instance.getProvinceNameById(org.state);
                          // String townTerritory = DatabaseHelper.instance.getTownTerritoryNameById(org.townTerritoryId!);
                          return DataRow(cells: [
                            // DataCell(
                            // Image.asset(org.pictureLoc!)), // Assuming logos are stored locally
                            DataCell(Text(org.managerFirstname.toString())),
                            DataCell(Text(org.sigle.toString())),
                            DataCell(Text(org.dateCreation.toString())),
                            DataCell(Text(org.groupementId.toString())),
                            DataCell(Text(org.provinceId.toString())),
                            DataCell(Text(org.territoireId.toString())),
                            DataCell(Text(org.villageQuartierId.toString())),
                            DataCell(Text(org.email.toString())),
                            DataCell(Text(org.telephone.toString())),
                            // DataCell(Text(org.)),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    // Logic to edit organization
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    // Logic to delete organization
                                  },
                                ),
                              ],
                            )),
                          ]);
                        }).toList(),
                      ),
                    );

                    // ListView.builder(
                    //   itemCount: agriculteurs.length,
                    //   itemBuilder: (context, index) {
                    //     final agriculteur = agriculteurs[index];
                    //     return ListTile(
                    //       leading: agriculteur.photo != null
                    //           ? Image.network(agriculteur.photo!) // Replace with your image handling
                    //           : Icon(Icons.person),
                    //       title: Text('${agriculteur.nom} ${agriculteur.postnom}'),
                    //       subtitle: Text('Sexe: ${agriculteur.sexe}, Filiere: ${agriculteur.filiere}'),
                    //     );
                    //   },
                    // );
                  }
                },
              ),

             
              // Expanded(
              //   child: 
                
                
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: DataTable(
                //     columns: const [
                //       // DataColumn(label: Text('Logo')),
                //       DataColumn(label: Text('Nom')),
                //       DataColumn(label: Text('Sigle')),
                //       DataColumn(label: Text('Date de création')),
                //       DataColumn(label: Text('Filière')),
                //       DataColumn(label: Text('Secteur')),
                //       DataColumn(label: Text('Province')),
                //       DataColumn(label: Text('Ville/Territoire')),
                //       DataColumn(label: Text('Numéro de Téléphone')),
                //       DataColumn(label: Text('Email')),
                //       DataColumn(label: Text('Action')),
                //     ],
                //     rows: companies.map((company) {
                //       return DataRow(cells: [
                //         // DataCell(Image.network(
                //         //   company['logo'],
                //         //   width: 50,
                //         //   height: 50,
                //         //   errorBuilder: (context, error, stackTrace) =>
                //         //       const Icon(Icons.image_not_supported),
                //         // )),
                //         DataCell(Text(company['name'])),
                //         DataCell(Text(company['sigle'])),
                //         DataCell(Text(company['creationDate'])),
                //         DataCell(Text(company['filiere'])),
                //         DataCell(Text(company['secteur'])),
                //         DataCell(Text(company['province'])),
                //         DataCell(Text(company['villeTerritoire'])),
                //         DataCell(Text(company['phone'])),
                //         DataCell(Text(company['email'])),
                //         DataCell(Row(
                //           children: [
                //             IconButton(
                //               icon: const Icon(Icons.edit),
                //               onPressed: () {
                //                 // Edit action
                //               },
                //             ),
                //             IconButton(
                //               icon: const Icon(Icons.visibility),
                //               onPressed: () {
                //                 // View action
                //               },
                //             ),
                //             IconButton(
                //               icon: const Icon(Icons.delete),
                //               onPressed: () {
                //                 // Delete action
                //               },
                //             ),
                //           ],
                //         )),
                //       ]);
                //     }).toList(),
                //   ),
                // ),
            
            
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
