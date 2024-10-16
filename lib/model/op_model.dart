class OpModel {
  int opId;
  int uopId;
  int eaId;
  String opDesignation;
  String opSigle;
  String dateCreation;
  String opFiliere;
  String address;
  String provinceId;
  String territoireVilleId;
  String groupementId;
  String villageQuartierId;
  String longitude;
  String latitude;
  String telephone;
  String structureEncadrement;
  String email;
  String fichierStatus;
  String fichierRoi;
  String fichierAutorisation;
  int opStatus;
  String addedBy;
  String addDate;
  String updateBy;
  String updateDate;
  String? deletedBy;
  String? deleteDate;
  String dataStatus;

  OpModel({
    required this.opId,
    required this.uopId,
    required this.eaId,
    required this.opDesignation,
    required this.opSigle,
    required this.dateCreation,
    required this.opFiliere,
    required this.address,
    required this.provinceId,
    required this.territoireVilleId,
    required this.groupementId,
    required this.villageQuartierId,
    required this.longitude,
    required this.latitude,
    required this.telephone,
    required this.structureEncadrement,
    required this.email,
    required this.fichierStatus,
    required this.fichierRoi,
    required this.fichierAutorisation,
    required this.opStatus,
    required this.addedBy,
    required this.addDate,
    required this.updateBy,
    required this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus="10",
  });

  // Factory method to create an OpModel from JSON (API response)
  // Factory method to create an OpModel from JSON (API response)
factory OpModel.fromJson(Map<String, dynamic> json) {
  return OpModel(
    opId: int.tryParse(json['op_id']) ?? 0, // Convert to int
    uopId: int.tryParse(json['uop_id']) ?? 0, // Convert to int
    eaId: int.tryParse(json['ea_id']) ?? 0, // Convert to int
    opDesignation: json['op_designation'],
    opSigle: json['op_sigle'],
    dateCreation: json['date_creation'],
    opFiliere: json['op_filiere'],
    address: json['address'],
    provinceId: json['province_id'],
    territoireVilleId: json['territoire_ville_id'],
    groupementId: json['groupement_id'],
    villageQuartierId: json['village_quartier_id'],
    longitude: json['longitude'],
    latitude: json['latitude'],
    telephone: json['telephone'],
    structureEncadrement: json['structure_encadrement'],
    email: json['email'],
    fichierStatus: json['fichier_status'],
    fichierRoi: json['fichier_roi'],
    fichierAutorisation: json['fichier_autorisation'],
    opStatus: int.tryParse(json['op_status']) ?? 0, // Convert to int
    addedBy: json['added_by'],
    addDate: json['add_date'],
    updateBy: json['update_by'],
    updateDate: json['update_date'],
    deletedBy: json['deleted_by'],
    deleteDate: json['delete_date'],
    dataStatus: json['data_status'],
  );
}

  // Convert OpModel to JSON (for API requests)
  Map<String, dynamic> toJson() {
    return {
      'op_id': opId,
      'uop_id': uopId,
      'ea_id': eaId,
      'op_designation': opDesignation,
      'op_sigle': opSigle,
      'date_creation': dateCreation,
      'op_filiere': opFiliere,
      'address': address,
      'province_id': provinceId,
      'territoire_ville_id': territoireVilleId,
      'groupement_id': groupementId,
      'village_quartier_id': villageQuartierId,
      'longitude': longitude,
      'latitude': latitude,
      'telephone': telephone,
      'structure_encadrement': structureEncadrement,
      'email': email,
      'fichier_status': fichierStatus,
      'fichier_roi': fichierRoi,
      'fichier_autorisation': fichierAutorisation,
      'op_status': opStatus,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Convert from Map (SQLite row)
  factory OpModel.fromMap(Map<String, dynamic> map) {
    return OpModel(
      opId: map['op_id'],
      uopId: map['uop_id'],
      eaId: map['ea_id'],
      opDesignation: map['op_designation'],
      opSigle: map['op_sigle'],
      dateCreation: map['date_creation'],
      opFiliere: map['op_filiere'],
      address: map['address'],
      provinceId: map['province_id'],
      territoireVilleId: map['territoire_ville_id'],
      groupementId: map['groupement_id'],
      villageQuartierId: map['village_quartier_id'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      telephone: map['telephone'],
      structureEncadrement: map['structure_encadrement'],
      email: map['email'],
      fichierStatus: map['fichier_status'],
      fichierRoi: map['fichier_roi'],
      fichierAutorisation: map['fichier_autorisation'],
      opStatus: map['op_status'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // Convert to Map for SQLite insertion
  Map<String, dynamic> toMap() {
    return {
      'op_id': opId,
      'uop_id': uopId,
      'ea_id': eaId,
      'op_designation': opDesignation,
      'op_sigle': opSigle,
      'date_creation': dateCreation,
      'op_filiere': opFiliere,
      'address': address,
      'province_id': provinceId,
      'territoire_ville_id': territoireVilleId,
      'groupement_id': groupementId,
      'village_quartier_id': villageQuartierId,
      'longitude': longitude,
      'latitude': latitude,
      'telephone': telephone,
      'structure_encadrement': structureEncadrement,
      'email': email,
      'fichier_status': fichierStatus,
      'fichier_roi': fichierRoi,
      'fichier_autorisation': fichierAutorisation,
      'op_status': opStatus,
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
