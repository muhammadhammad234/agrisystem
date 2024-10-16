class TownTerritoryModel {
  int townTerrId;
  String name;
  int countryCode;
  int? stateId;
  String category;
  String? codeIns;
  int codeVille;
  double? longitude;
  double? latitude;
  int? area;
  int population;
  String addedBy;
  String addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  String dataStatus;

  TownTerritoryModel({
    required this.townTerrId,
    required this.name,
    required this.countryCode,
    this.stateId,
    this.category = '1',
    this.codeIns,
    required this.codeVille,
    this.longitude,
    this.latitude,
    this.area,
    required this.population,
    required this.addedBy,
    required this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus = '10',
  });

  // Convert from JSON (API response)
  factory TownTerritoryModel.fromJson(Map<String, dynamic> json) {
  return TownTerritoryModel(
    townTerrId: int.parse(json['town_terr_id']),
    name: json['name'],
    countryCode: int.parse(json['country_code']),
    stateId: json['state_id'] != null ? int.parse(json['state_id']) : null,
    category: json['category'],
    codeIns: json['Code_INS'],
    codeVille: int.parse(json['code_ville']),
    longitude: json['longitude']?.toDouble(),
    latitude: json['latitude']?.toDouble(),
    area: json['area'] != null ? int.parse(json['area']) : null,
    population: int.parse(json['population']),
    addedBy: json['added_by'],
    addDate: json['add_date'],
    updateBy: json['update_by'],
    updateDate: json['update_date'],
    deletedBy: json['deleted_by'],
    deleteDate: json['delete_date'],
    dataStatus: json['data_status'],
  );
}

  // Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'town_terr_id': townTerrId,
      'name': name,
      'country_code': countryCode,
      'state_id': stateId,
      'category': category,
      'Code_INS': codeIns,
      'code_ville': codeVille,
      'longitude': longitude,
      'latitude': latitude,
      'area': area,
      'population': population,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Convert from Map (database)
  factory TownTerritoryModel.fromMap(Map<String, dynamic> map) {
    return TownTerritoryModel(
      townTerrId: map['town_terr_id'],
      name: map['name'],
      countryCode: map['country_code'],
      stateId: map['state_id'],
      category: map['category'],
      codeIns: map['Code_INS'],
      codeVille: map['code_ville'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      area: map['area'],
      population: map['population'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // Convert to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'town_terr_id': townTerrId,
      'name': name,
      'country_code': countryCode,
      'state_id': stateId,
      'category': category,
      'Code_INS': codeIns,
      'code_ville': codeVille,
      'longitude': longitude,
      'latitude': latitude,
      'area': area,
      'population': population,
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
