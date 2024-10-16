import 'package:flutter/material.dart';
import 'package:agrisystem/utils/size_constants.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/helper/database_helper.dart';

class CommuneGroupmentFieldTemplate extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  //Add Validator
  final String? Function(String?)? validator;

  const CommuneGroupmentFieldTemplate({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CommuneGroupmentFieldTemplateState createState() =>
      _CommuneGroupmentFieldTemplateState();
}

class _CommuneGroupmentFieldTemplateState
    extends State<CommuneGroupmentFieldTemplate> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> _municipalities = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchMunicipalities();
  }

  // Fetch all municipalities
  Future<void> _fetchMunicipalities() async {
    final data = await dbHelper.getAllMunicipality();
    setState(() {
      _municipalities = data;
    });
  }

  // Search municipalities based on the query
  Future<void> _searchMunicipalities(String query) async {
    if (query.isEmpty) {
      _fetchMunicipalities();
    } else {
      final data = await dbHelper.searchMicipalityName(query);
      setState(() {
        _municipalities = data;
      });
    }
  }

  // Function to show the bottom sheet with municipality options
  void _showMunicipalitySelectionBottomSheet(BuildContext context) {
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
                        _searchMunicipalities(_searchQuery);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search by municipality name',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _municipalities.isEmpty
                        ? const Center(child: Text('No data found.'))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _municipalities.length,
                            itemBuilder: (context, index) {
                              final municipality = _municipalities[index];
                              return ListTile(
                                title: Text(municipality['min_terr_name'] ??
                                    'No Name'),
                                onTap: () {
                                  // Set the selected municipality in the controller and close the sheet
                                  widget.controller.text =
                                      municipality['min_terr_name'] ??
                                          'No Name';
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
      onTap: () => _showMunicipalitySelectionBottomSheet(context),
      child: AbsorbPointer(
        absorbing: true, // Prevents direct keyboard input
        child: TextFormFieldTemplate(
          labelText: widget.labelText,
          hintText: widget.hintText,
          controller: widget.controller,
          validator: widget.validator??(_)=>null,
          suffixIcon:
              const Icon(Icons.arrow_drop_down), // Optional dropdown icon
        ),
      ),
    );
  }
}
