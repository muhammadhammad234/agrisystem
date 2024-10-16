import 'package:agrisystem/helper/database_helper.dart';
import 'package:agrisystem/model/agriculteur_model.dart';
// import 'package:agrisystem/model/agriculteur_models/agriculture_details_model.dart';
import 'package:agrisystem/utils/size_constants.dart';
import 'package:agrisystem/view/components/app_button.dart';
import 'package:agrisystem/view/home_screen/agriculteur/add_agriculteur_screen.dart';
import 'package:flutter/material.dart';

class ViewAllAgriculteurScreen extends StatelessWidget {
  const ViewAllAgriculteurScreen({super.key});

  Future<List<AgriculteurModel>> fetchAgriculteurDetails() async {
    final db = DatabaseHelper.instance;
    List<Map<String, dynamic>> maps = await db.getAllAgriculteur();

    if (maps.isNotEmpty) {
      return maps.map((map) => AgriculteurModel.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppButton(
              width: getWidth(context) * .3,
              buttonText: "Ajouter un nouvel agriculteur",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const AddAgriculteurScreen();
                })));
              })
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<AgriculteurModel>>(
          future: fetchAgriculteurDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            } else {
              final agriculteurs = snapshot.data!;
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
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                  // headingRowColor: Theme.of(context).colorScheme.primary!,
                  columns: const [
                    // DataColumn(label: Text('Logo')),
                    DataColumn(label: Text('Nom')),
                    DataColumn(label: Text('Postnom')),
                    DataColumn(label: Text('Sexe')),
                    // DataColumn(label: Text('Secteur')),
                    DataColumn(label: Text('Province')),
                    DataColumn(label: Text('Ville/Territoire')),
                    DataColumn(label: Text('Localite/Quartier')),
                    DataColumn(label: Text('Filiere')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: agriculteurs.map((org) {
                    // String province =
                    //     DatabaseHelper.instance.getProvinceNameById(org.state);
                    // String townTerritory = DatabaseHelper.instance.getTownTerritoryNameById(org.townTerritoryId!);
                    return DataRow(cells: [
                      // DataCell(
                      // Image.asset(org.pictureLoc!)), // Assuming logos are stored locally
                      DataCell(Text(org.firstName)),
                      DataCell(Text(org.lastName)),
                      DataCell(Text(org.gender.toString())),
                      DataCell(Text(org.state.toString())),
                      DataCell(Text(org.townTerritoryId.toString())),
                      DataCell(Text(org.villageQuarterId.toString())),
                      DataCell(Text(org.filerePrincipale.toString())),
                      // DataCell(Text(org..toString())),
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
      ),
    );
  }
}
