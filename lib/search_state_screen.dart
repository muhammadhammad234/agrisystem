// import 'package:agrisystem/helper/database_helper.dart';
// import 'package:flutter/material.dart';

// class SearchStateScreen extends StatefulWidget {
//   @override
//   _SearchStateScreenState createState() => _SearchStateScreenState();
// }

// class _SearchStateScreenState extends State<SearchStateScreen> {
//   final DatabaseHelper dbHelper = DatabaseHelper.instance;
//   List<Map<String, dynamic>> _stateNames = [];
//   String _searchQuery = '';

//   @override
//   void initState() {
//     super.initState();
//     _getAllStatesName();
//   }

//   // Fetch all village quarters
//   Future<void> _getAllStatesName() async {
//     final data = await dbHelper.getAllStattes();
//     setState(() {
//       _stateNames = data;
//     });
//   }

//   // Search village quarters based on the query
//   Future<void> _searchStatesName(String query) async {
//     if (query.isEmpty) {
//       _getAllStatesName();
//     } else {
//       final data = await dbHelper.searchStateName(query);
//       setState(() {
//         _stateNames = data;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('State Name'),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(60.0),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                   _searchStatesName(_searchQuery);
//                 });
//               },
//               decoration: const InputDecoration(
//                 hintText: 'Search by name',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: _stateNames.isEmpty
//           ? const Center(child: Text('No data found.'))
//           : ListView.builder(
//               itemCount: _stateNames.length,
//               itemBuilder: (context, index) {
//                 final statesName = _stateNames[index];
//                 return ListTile(
//                   title: Text(statesName['state_name'] ?? 'No Name'),
//                   // subtitle: Text(statesName['pcode'] ?? 'No Pcode'),
//                   onTap: () {
//                     // Handle on tap event, like navigating to details
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }


import 'package:agrisystem/view/components/commune_groupment_field_template.dart';
import 'package:agrisystem/view/components/search_state_field_template.dart';
import 'package:agrisystem/view/components/village_quarter_search_field_template.dart';
import 'package:agrisystem/view/components/ville_territory_field_template.dart';
import 'package:flutter/material.dart';

class SearchStateScreen extends StatefulWidget {
  @override
  _SearchStateScreenState createState() => _SearchStateScreenState();
}

class _SearchStateScreenState extends State<SearchStateScreen> {
  final TextEditingController _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            VilleTerritoireFieldTemplate(
              controller: _stateController,
              labelText: 'Village Name',
              hintText: 'Quarter State',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_stateController.text.isNotEmpty) {
                  // Handle the selected state (e.g., submit or navigate)
                  debugPrint('Selected State: ${_stateController.text}');
                } else {
                  debugPrint('No state selected');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
