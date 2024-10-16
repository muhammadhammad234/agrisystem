import 'package:agrisystem/utils/size_constants.dart';
import 'package:agrisystem/view/components/textformfield_template.dart';
import 'package:flutter/material.dart';
import 'package:agrisystem/helper/database_helper.dart';

class SearchStateFieldTemplate extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  // Add Validator
  final String? Function(String?)? validator;

  const SearchStateFieldTemplate(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.validator});

  @override
  _SearchStateFieldTemplateState createState() =>
      _SearchStateFieldTemplateState();
}

class _SearchStateFieldTemplateState extends State<SearchStateFieldTemplate> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> _stateNames = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _getAllStatesName();
  }

  // Fetch all state names
  Future<void> _getAllStatesName() async {
    final data = await dbHelper.getAllStattes();
    setState(() {
      _stateNames = data;
    });
  }

  // Search states based on the query
  Future<void> _searchStatesName(String query) async {
    if (query.isEmpty) {
      _getAllStatesName();
    } else {
      final data = await dbHelper.searchStateName(query);
      setState(() {
        _stateNames = data;
      });
    }
  }

  // Function to show the bottom sheet with state options
  void _showStateSelectionBottomSheet(BuildContext context) {
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
                        _searchStatesName(_searchQuery);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search by state name',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: _stateNames.isEmpty
                        ? const Center(child: Text('No data found.'))
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _stateNames.length,
                            itemBuilder: (context, index) {
                              final statesName = _stateNames[index];
                              return ListTile(
                                title:
                                    Text(statesName['state_name'] ?? 'No Name'),
                                onTap: () {
                                  // Set the selected state in the controller and close the sheet
                                  widget.controller.text =
                                      statesName['state_name'] ?? 'No Name';
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
      onTap: () => _showStateSelectionBottomSheet(context),
      child: AbsorbPointer(
        absorbing: true, // Prevents direct keyboard input
        child: TextFormFieldTemplate(
          validator: widget.validator ??
              (value) {
                return null;
              },
          labelText: widget.labelText,
          hintText: widget.hintText,
          controller: widget.controller,
          suffixIcon:
              const Icon(Icons.arrow_drop_down), // Optional dropdown icon
        ),
      ),
    );
  }
}
