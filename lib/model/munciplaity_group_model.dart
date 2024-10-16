class MinicipalityGroupModel {
  int? minicipalityGroupId;
  int? townTerrId;
  String? minTerrName;
  String? category;
  double? superficieTrt;
  int? populationTrt;
  double? longitude;
  double? latitude;
  String? collectiv;
  String? surface;
  String? SCESEM;
  String? SCEGEO;
  String? genre;
  String? NOMRGC;
  String? codeGRPT;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  String? dataStatus;

  MinicipalityGroupModel({
    this.minicipalityGroupId,
    this.townTerrId,
    this.minTerrName,
    this.category = '10',
    this.superficieTrt,
    this.populationTrt,
    this.longitude,
    this.latitude,
    this.collectiv,
    this.surface,
    this.SCESEM,
    this.SCEGEO,
    this.genre,
    this.NOMRGC,
    this.codeGRPT,
    this.addedBy,
    required this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus = '10',
  });

  // Convert from JSON (API response)
  factory MinicipalityGroupModel.fromJson(Map<String, dynamic> json) {
  return MinicipalityGroupModel(
    minicipalityGroupId: int.tryParse(json['minicipality_group_id']?.toString() ?? '') ?? null,
    townTerrId: int.tryParse(json['town_terr_id']?.toString() ?? '') ?? null,
    minTerrName: json['min_terr_name'],
    category: json['category'],
    superficieTrt: double.tryParse(json['superficie_trt']?.toString() ?? '') ?? null,
    populationTrt: int.tryParse(json['population_trt']?.toString() ?? '') ?? null,
    longitude: double.tryParse(json['longitude']?.toString() ?? '') ?? 0.0,
    latitude: double.tryParse(json['latitude']?.toString() ?? '') ?? 0.0,
    collectiv: json['collectiv'],
    surface: json['surface'],
    SCESEM: json['SCE_SEM'],
    SCEGEO: json['SCE_GEO'],
    genre: json['GENRE'],
    NOMRGC: json['NOM_RGC'],
    codeGRPT: json['CODE_GRPT'],
    addedBy: json['added_by'],
    addDate: json['add_date'],
    updateBy: json['update_by'],
    updateDate: json['update_date'],
    deletedBy: json['deleted_by'],
    deleteDate: json['delete_date'],
    dataStatus: json['Data_status'],
  );
}
  // Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'minicipality_group_id': minicipalityGroupId,
      'town_terr_id': townTerrId,
      'min_terr_name': minTerrName,
      'category': category,
      'superficie_trt': superficieTrt,
      'population_trt': populationTrt,
      'longitude': longitude,
      'latitude': latitude,
      'collectiv': collectiv,
      'surface': surface,
      'SCE_SEM': SCESEM,
      'SCE_GEO': SCEGEO,
      'GENRE': genre,
      'NOM_RGC': NOMRGC,
      'CODE_GRPT': codeGRPT,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'Data_status': dataStatus,
    };
  }

  // Convert from Map (database)
  factory MinicipalityGroupModel.fromMap(Map<String, dynamic> map) {
    return MinicipalityGroupModel(
      minicipalityGroupId: map['minicipality_group_id'],
      townTerrId: map['town_terr_id'],
      minTerrName: map['min_terr_name'],
      category: map['category'],
      superficieTrt: map['superficie_trt'],
      populationTrt: map['population_trt'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      collectiv: map['collectiv'],
      surface: map['surface'],
      SCESEM: map['SCE_SEM'],
      SCEGEO: map['SCE_GEO'],
      genre: map['GENRE'],
      NOMRGC: map['NOM_RGC'],
      codeGRPT: map['CODE_GRPT'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['Data_status'],
    );
  }

  // Convert to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'minicipality_group_id': minicipalityGroupId,
      'town_terr_id': townTerrId,
      'min_terr_name': minTerrName,
      'category': category,
      'superficie_trt': superficieTrt,
      'population_trt': populationTrt,
      'longitude': longitude,
      'latitude': latitude,
      'collectiv': collectiv,
      'surface': surface,
      'SCE_SEM': SCESEM,
      'SCE_GEO': SCEGEO,
      'GENRE': genre,
      'NOM_RGC': NOMRGC,
      'CODE_GRPT': codeGRPT,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'Data_status': dataStatus,
    };
  }
}
