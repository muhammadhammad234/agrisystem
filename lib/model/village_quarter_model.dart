class VillageQuarterModel {
  final int villageQuarterId;
  final String category;
  final String name1;
  final String? name2;
  final String stateId;
  final String? townTerrId;
  final String? collectiv;
  final String? groupement;
  final String? pcode;
  final String? codeIns;
  final String? rangIns;
  final double longitude;
  final double latitude;
  final String? createdBy;
  final String createDate;
  final String? updateBy;
  final String? updateDate;
  final String? deletedBy;
  final String? deleteDate;
  final String dataStatus;

  VillageQuarterModel({
    required this.villageQuarterId,
    required this.category,
    required this.name1,
    this.name2,
    required this.stateId,
    this.townTerrId,
    this.collectiv,
    this.groupement,
    this.pcode,
    this.codeIns,
    this.rangIns,
    required this.longitude,
    required this.latitude,
    this.createdBy,
    required this.createDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    required this.dataStatus,
  });

  // Factory to create object from JSON
  factory VillageQuarterModel.fromJson(Map<String, dynamic> json) {
    return VillageQuarterModel(
      villageQuarterId: json['village_quarter_id'],
      category: json['category'],
      name1: json['name1'],
      name2: json['name2'],
      stateId: json['state_id'],
      townTerrId: json['town_terr_id'],
      collectiv: json['collectiv'],
      groupement: json['groupement'],
      pcode: json['pcode'],
      codeIns: json['code_ins'],
      rangIns: json['rang_ins'],
      longitude: double.parse(json['longitude']),
      latitude: double.parse(json['latitude']),
      createdBy: json['created_by'],
      createDate: json['create_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      dataStatus: json['data_status'],
    );
  }

  // Convert the object to a Map for insertion into SQLite
  Map<String, dynamic> toMap() {
    return {
      'village_quarter_id': villageQuarterId,
      'category': category,
      'name1': name1,
      'name2': name2,
      'state_id': stateId,
      'town_terr_id': townTerrId,
      'collectiv': collectiv,
      'groupement': groupement,
      'pcode': pcode,
      'code_ins': codeIns,
      'rang_ins': rangIns,
      'longitude': longitude,
      'latitude': latitude,
      'created_by': createdBy,
      'create_date': createDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }
}
