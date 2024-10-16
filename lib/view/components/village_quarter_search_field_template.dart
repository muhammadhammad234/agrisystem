import 'package:flutter/material.dart';
import 'package:agrisystem/utils/size_constants.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:agrisystem/helper/database_helper.dart';

class VillageQuarterFieldTemplate extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  //Add Validator
  final String? Function(String?)? validator;


  const VillageQuarterFieldTemplate({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator
  });

  @override
  // ignore: library_private_types_in_public_api
  _VillageQuarterFieldTemplateState createState() =>
      _VillageQuarterFieldTemplateState();
}

class _VillageQuarterFieldTemplateState
    extends State<VillageQuarterFieldTemplate> {
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

  // Function to show the bottom sheet with village quarter options
  void _showVillageQuarterSelectionBottomSheet(BuildContext context) {
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
                        _searchVillageQuarters(_searchQuery);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search by village name',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _villageQuarters.isEmpty
                        ? const Center(child: Text('No data found.'))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _villageQuarters.length,
                            itemBuilder: (context, index) {
                              final villageQuarter = _villageQuarters[index];
                              return ListTile(
                                title: Text("${villageQuarter['name1']}"),
                                // subtitle:
                                //     Text(villageQuarter['pcode'] ?? 'No Pcode'),
                                onTap: () {
                                  // Set the selected village quarter in the controller and close the sheet
                                  widget.controller.text =
                                      "${villageQuarter['name1']}";
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
      onTap: () => _showVillageQuarterSelectionBottomSheet(context),
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
