class StateModel {
  int stateId;
  String stateName;
  double? stateArea;
  int statesAgriArea;
  int? statePopulation;
  String stateCode;
  String addedBy;
  String addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  String dataStatus;

  StateModel({
    required this.stateId,
    required this.stateName,
    this.stateArea,
    required this.statesAgriArea,
    this.statePopulation,
    required this.stateCode,
    required this.addedBy,
    required this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus = "10",
  });

  // Convert model from JSON (API response)
  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      stateId: int.parse(json['state_id']),
      stateName: json['state_name'],
      stateArea: json['state_area'] != null ? double.parse(json['state_area'].toString()) : null,
      statesAgriArea: int.parse(json['states_agri_area']),
      statePopulation: json['state_population'] != null ? int.parse(json['state_population']) : null,
      stateCode: json['state_code'],
      addedBy: json['added_by'],
      addDate: json['add_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      dataStatus: json['data_status'],
    );
  }

  // Convert model to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'state_id': stateId,
      'state_name': stateName,
      'state_area': stateArea,
      'states_agri_area': statesAgriArea,
      'state_population': statePopulation,
      'state_code': stateCode,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Convert model from Map (database)
  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      stateId: map['state_id'],
      stateName: map['state_name'],
      stateArea: map['state_area'] != null ? double.parse(map['state_area'].toString()) : null,
      statesAgriArea: map['states_agri_area'],
      statePopulation: map['state_population'],
      stateCode: map['state_code'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // Convert model to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'state_id': stateId,
      'state_name': stateName,
      'state_area': stateArea,
      'states_agri_area': statesAgriArea,
      'state_population': statePopulation,
      'state_code': stateCode,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }
}
