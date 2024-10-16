class EaModel {
  String eaId;
  String designation;
  String? sigle;
  String? dateCreation;
  String? eaNui;
  String? eaFormeJuridique;
  String? docJurid;
  int? numDocJuridi;  // Update to int?
  String? fichierDocJurid;
  int? eaFilerePrincipale;  // Update to int?
  int? eaSecteur;  // Update to int?
  String? eaSousSecteur;
  String? numAgrement;
  String? rayonAction;
  String? zoneActivite;
  String? activitesCours;
  String? logo;
  String? address;
  int? provinceId;  // Update to int?
  int? territoireId;  // Update to int?
  String? groupementId;
  int? villageQuartierId;  // Update to int?
  String? latitude;
  String? longitude;
  String? sourceFinancementDepart;
  String? structureEncadrement;
  String? managerFirstname;
  String? managerSurname;
  String? managerLastname;
  String? telephone;
  String? email;
  String? fichierRoi;
  String? fichierAutorisation;
  int? eaStatus;  // Update to int?
  int? addedBy;  // Update to int?
  String? addDate;
  int? updateBy;  // Update to int?
  String? updateDate;
  int? deletedBy;  // Update to int?
  String? deleteDate;
  String dataStatus;

  EaModel({
    required this.eaId,
    required this.designation,
    this.sigle,
    this.dateCreation,
    this.eaNui,
    this.eaFormeJuridique,
    this.docJurid,
    this.numDocJuridi,
    this.fichierDocJurid,
    this.eaFilerePrincipale,
    this.eaSecteur,
    this.eaSousSecteur,
    this.numAgrement,
    this.rayonAction,
    this.zoneActivite,
    this.activitesCours,
    this.logo,
    this.address,
    this.provinceId,
    this.territoireId,
    this.groupementId,
    this.villageQuartierId,
    this.latitude,
    this.longitude,
    this.sourceFinancementDepart,
    this.structureEncadrement,
    this.managerFirstname,
    this.managerSurname,
    this.managerLastname,
    this.telephone,
    this.email,
    this.fichierRoi,
    this.fichierAutorisation,
    this.eaStatus,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus = "10",
  });

  // Convert EaModel object to Map for SQLite insertion
  Map<String, dynamic> toMap() {
    return {
      'ea_id': eaId,
      'designation': designation,
      'sigle': sigle,
      'date_creation': dateCreation,
      'ea_NUI': eaNui,
      'ea_forme_juridique': eaFormeJuridique,
      'doc_jurid': docJurid,
      'num_doc_juridi': numDocJuridi,
      'fichier_doc_jurid': fichierDocJurid,
      'ea_filere_principale': eaFilerePrincipale,
      'ea_secteur': eaSecteur,
      'ea_sous_secteur': eaSousSecteur,
      'num_agrement': numAgrement,
      'rayon_action': rayonAction,
      'zone_activite': zoneActivite,
      'activites_cours': activitesCours,
      'logo': logo,
      'address': address,
      'province_id': provinceId,
      'territoire_id': territoireId,
      'groupement_id': groupementId,
      'village_quartier_id': villageQuartierId,
      'latitude': latitude,
      'longitude': longitude,
      'source_financement_depart': sourceFinancementDepart,
      'structure_encadrement': structureEncadrement,
      'manager_firstname': managerFirstname,
      'manager_surname': managerSurname,
      'manager_lastname': managerLastname,
      'telephone': telephone,
      'email': email,
      'fichier_roi': fichierRoi,
      'fichier_autorisation': fichierAutorisation,
      'ea_status': eaStatus,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Factory method to create a EaModel from a Map (SQLite to object)
  factory EaModel.fromMap(Map<String, dynamic> map) {
    return EaModel(
      eaId: map['ea_id'],
      designation: map['designation'],
      sigle: map['sigle'],
      dateCreation: map['date_creation'],
      eaNui: map['ea_NUI'],
      eaFormeJuridique: map['ea_forme_juridique'],
      docJurid: map['doc_jurid'],
      numDocJuridi: map['num_doc_juridi'] is String
          ? int.tryParse(map['num_doc_juridi'])
          : map['num_doc_juridi'],
      fichierDocJurid: map['fichier_doc_jurid'],
      eaFilerePrincipale: map['ea_filere_principale'] is String
          ? int.tryParse(map['ea_filere_principale'])
          : map['ea_filere_principale'],
      eaSecteur: map['ea_secteur'] is String
          ? int.tryParse(map['ea_secteur'])
          : map['ea_secteur'],
      eaSousSecteur: map['ea_sous_secteur'],
      numAgrement: map['num_agrement'],
      rayonAction: map['rayon_action'],
      zoneActivite: map['zone_activite'],
      activitesCours: map['activites_cours'],
      logo: map['logo'],
      address: map['address'],
      provinceId: map['province_id'] is String
          ? int.tryParse(map['province_id'])
          : map['province_id'],
      territoireId: map['territoire_id'] is String
          ? int.tryParse(map['territoire_id'])
          : map['territoire_id'],
      groupementId: map['groupement_id'],
      villageQuartierId: map['village_quartier_id'] is String
          ? int.tryParse(map['village_quartier_id'])
          : map['village_quartier_id'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      sourceFinancementDepart: map['source_financement_depart'],
      structureEncadrement: map['structure_encadrement'],
      managerFirstname: map['manager_firstname'],
      managerSurname: map['manager_surname'],
      managerLastname: map['manager_lastname'],
      telephone: map['telephone'],
      email: map['email'],
      fichierRoi: map['fichier_roi'],
      fichierAutorisation: map['fichier_autorisation'],
      eaStatus: map['ea_status'] is String
          ? int.tryParse(map['ea_status'])
          : map['ea_status'],
      addedBy: map['added_by'] is String
          ? int.tryParse(map['added_by'])
          : map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'] is String
          ? int.tryParse(map['update_by'])
          : map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'] is String
          ? int.tryParse(map['deleted_by'])
          : map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // JSON serialization for API interaction
  factory EaModel.fromJson(Map<String, dynamic> json) {
  return EaModel(
    eaId: json['ea_id'],
    designation: json['designation'],
    sigle: json['sigle'],
    dateCreation: json['date_creation'],
    eaNui: json['ea_NUI'],
    eaFormeJuridique: json['ea_forme_juridique'],
    docJurid: json['doc_jurid'],
    numDocJuridi: json['num_doc_juridi'] is String
        ? int.tryParse(json['num_doc_juridi'])
        : json['num_doc_juridi'] as int?,
    fichierDocJurid: json['fichier_doc_jurid'],
    eaFilerePrincipale: json['ea_filere_principale'] is String
        ? int.tryParse(json['ea_filere_principale'])
        : json['ea_filere_principale'] as int?,
    eaSecteur: json['ea_secteur'] is String
        ? int.tryParse(json['ea_secteur'])
        : json['ea_secteur'] as int?,
    eaSousSecteur: json['ea_sous_secteur'],
    numAgrement: json['num_agrement'],
    rayonAction: json['rayon_action'],
    zoneActivite: json['zone_activite'],
    activitesCours: json['activites_cours'],
    logo: json['logo'],
    address: json['address'],
    provinceId: json['province_id'] is String
        ? int.tryParse(json['province_id'])
        : json['province_id'] as int?,
    territoireId: json['territoire_id'] is String
        ? int.tryParse(json['territoire_id'])
        : json['territoire_id'] as int?,
    groupementId: json['groupement_id'],
    villageQuartierId: json['village_quartier_id'] is String
        ? int.tryParse(json['village_quartier_id'])
        : json['village_quartier_id'] as int?,
    latitude: json['latitude'],
    longitude: json['longitude'],
    sourceFinancementDepart: json['source_financement_depart'],
    structureEncadrement: json['structure_encadrement'],
    managerFirstname: json['manager_firstname'],
    managerSurname: json['manager_surname'],
    managerLastname: json['manager_lastname'],
    telephone: json['telephone'],
    email: json['email'],
    fichierRoi: json['fichier_roi'],
    fichierAutorisation: json['fichier_autorisation'],
    eaStatus: json['ea_status'] is String
        ? int.tryParse(json['ea_status'])
        : json['ea_status'] as int?,
    addedBy: json['added_by'] is String
        ? int.tryParse(json['added_by'])
        : json['added_by'] as int?,
    addDate: json['add_date'],
    updateBy: json['update_by'] is String
        ? int.tryParse(json['update_by'])
        : json['update_by'] as int?,
    updateDate: json['update_date'],
    deletedBy: json['deleted_by'] is String
        ? int.tryParse(json['deleted_by'])
        : json['deleted_by'] as int?,
    deleteDate: json['delete_date'],
    dataStatus: json['data_status'],
  );
}

  Map<String, dynamic> toJson() {
    return {
      'ea_id': eaId,
      'designation': designation,
      'sigle': sigle,
      'date_creation': dateCreation,
      'ea_NUI': eaNui,
      'ea_forme_juridique': eaFormeJuridique,
      'doc_jurid': docJurid,
      'num_doc_juridi': numDocJuridi,
      'fichier_doc_jurid': fichierDocJurid,
      'ea_filere_principale': eaFilerePrincipale,
      'ea_secteur': eaSecteur,
      'ea_sous_secteur': eaSousSecteur,
      'num_agrement': numAgrement,
      'rayon_action': rayonAction,
      'zone_activite': zoneActivite,
      'activites_cours': activitesCours,
      'logo': logo,
      'address': address,
      'province_id': provinceId,
      'territoire_id': territoireId,
      'groupement_id': groupementId,
      'village_quartier_id': villageQuartierId,
      'latitude': latitude,
      'longitude': longitude,
      'source_financement_depart': sourceFinancementDepart,
      'structure_encadrement': structureEncadrement,
      'manager_firstname': managerFirstname,
      'manager_surname': managerSurname,
      'manager_lastname': managerLastname,
      'telephone': telephone,
      'email': email,
      'fichier_roi': fichierRoi,
      'fichier_autorisation': fichierAutorisation,
      'ea_status': eaStatus,
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
