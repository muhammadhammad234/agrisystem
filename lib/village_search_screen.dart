import 'package:agrisystem/helper/database_helper.dart';
import 'package:flutter/material.dart';

class VillageQuarterScreen extends StatefulWidget {
  @override
  _VillageQuarterScreenState createState() => _VillageQuarterScreenState();
}

class _VillageQuarterScreenState extends State<VillageQuarterScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> _villageQuarters = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchVillageQuarters();
  }

  // Fetch all village quarters
  Future<void> _fetchVillageQuarters() async {
    final data = await dbHelper.getAllVillageQuarters();
    setState(() {
      _villageQuarters = data;
    });
  }

  // Search village quarters based on the query
  Future<void> _searchVillageQuarters(String query) async {
    if (query.isEmpty) {
      _fetchVillageQuarters();
    } else {
      final data = await dbHelper.searchVillageQuarters(query);
      setState(() {
        _villageQuarters = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Village Quarters'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                  _searchVillageQuarters(_searchQuery);
                });
              },
              decoration: InputDecoration(
                hintText: 'Search by name or pcode',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: _villageQuarters.isEmpty
          ? Center(child: Text('No data found.'))
          : ListView.builder(
              itemCount: _villageQuarters.length,
              itemBuilder: (context, index) {
                final villageQuarter = _villageQuarters[index];
                return ListTile(
                  title: Text(villageQuarter['name1'] ?? 'No Name'),
                  subtitle: Text(villageQuarter['pcode'] ?? 'No Pcode'),
                  onTap: () {
                    // Handle on tap event, like navigating to details
                  },
                );
              },
            ),
    );
  }
}
