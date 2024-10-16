import 'package:agrisystem/helper/database_helper.dart';
import 'package:agrisystem/model/op_model.dart';
import 'package:agrisystem/view/home_screen/entreprise_agricole/renseignements_entreprises_agricoles.dart';
import 'package:flutter/material.dart';

class OrganizationPaysaneListScreen extends StatefulWidget {
  const OrganizationPaysaneListScreen({super.key});

  @override
  State<OrganizationPaysaneListScreen> createState() =>
      _OrganizationPaysaneListScreenState();
}

class _OrganizationPaysaneListScreenState
    extends State<OrganizationPaysaneListScreen> {


      Future<List<OpModel>> fetchOpDetails() async {
    final db = DatabaseHelper.instance;
    List<Map<String, dynamic>> maps = await db.getAllOp();

    if (maps.isNotEmpty) {
      return maps.map((map) => OpModel.fromMap(map)).toList();
    } else {
      return [];
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entreprises et cooperatives agricoles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add New Enterprise Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RenseignementsEntreprisesAgricolesScreen()));
                  // Navigate to Add Enterprise Screen
                },
                icon: const Icon(Icons.add),
                label: const Text(
                    'Ajouter une nouvelle entreprise ou cooperative agricole'),
              ),
              const SizedBox(height: 20),
               FutureBuilder<List<OpModel>>(
          future: fetchOpDetails(),
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
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
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
                      DataCell(Text(org.fichierAutorisation.toString())),
                      DataCell(Text(org.opSigle)),
                      DataCell(Text(org.dateCreation.toString())),
                      DataCell(Text(org.groupementId.toString())),
                      DataCell(Text(org.provinceId.toString())),
                      DataCell(Text(org.territoireVilleId.toString())),
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
      
           
              // DataTable for displaying the enterprises

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(onPressed: () {}, child: const Text('Previous')),
              //     TextButton(onPressed: () {}, child: const Text('Next')),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Sample data for rows
}
