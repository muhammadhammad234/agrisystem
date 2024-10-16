import 'package:flutter/material.dart';
import 'package:agrisystem/utils/size_constants.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/helper/database_helper.dart';

class VilleTerritoireFieldTemplate extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  //Add Validator
  final String? Function(String?)? validator;

  const VilleTerritoireFieldTemplate({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  @override
  _VilleTerritoireFieldTemplateState createState() =>
      _VilleTerritoireFieldTemplateState();
}

class _VilleTerritoireFieldTemplateState
    extends State<VilleTerritoireFieldTemplate> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> _territories = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchTerritories();
  }

  // Fetch all territories
  Future<void> _fetchTerritories() async {
    final data = await dbHelper.getAllTerritory();
    setState(() {
      _territories = data;
    });
  }

  // Search territories based on the query
  Future<void> _searchTerritories(String query) async {
    if (query.isEmpty) {
      _fetchTerritories();
    } else {
      final data = await dbHelper.searchTerritoryName(query);
      setState(() {
        _territories = data;
      });
    }
  }

  // Function to show the bottom sheet with territory options
  void _showTerritorySelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: getHeight(context) * 0.6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                        _searchTerritories(_searchQuery);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search by territory name',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _territories.isEmpty
                        ? const Center(child: Text('No data found.'))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _territories.length,
                            itemBuilder: (context, index) {
                              final territory = _territories[index];
                              return ListTile(
                                title: Text(territory['name'] ?? 'No Name'),
                                onTap: () {
                                  // Set the selected territory in the controller and close the sheet
                                  widget.controller.text =
                                      territory['name'] ?? 'No Name';
                                  Navigator.pop(
                                      context); // Close the bottom sheet
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        });
      },
      isScrollControlled: true, // Allows the bottom sheet to expand
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTerritorySelectionBottomSheet(context),
      child: AbsorbPointer(
        absorbing: true, // Prevents direct keyboard input
        child: TextFormFieldTemplate(
          labelText: widget.labelText,
          hintText: widget.hintText,
          controller: widget.controller,
          validator: widget.validator ??
              (value) {
                return null;
              },
          suffixIcon:
              const Icon(Icons.arrow_drop_down), // Optional dropdown icon
        ),
      ),
    );
  }
}
