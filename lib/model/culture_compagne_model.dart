class CultureCampagneModel {
  int idCultureCampagne;
  String idCampagne;
  String idChamp;
  String modeAcces;
  String proprietaireChamp;
  String? documentChamp;
  String typePlanteur;
  String idPlanteur;
  String typeCulture;
  String culture;
  int superficieEmblave;
  String sourceSemence;
  String semenceCertifie;
  String sourceEngrais;
  String qteProduite;
  String typeLabour;
  String destinationRecolte;
  int serviceFinancierCampagne;
  String entrepriseServiceFinancier;
  String observation;
  String commentaire;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  int? dataStatus;

  CultureCampagneModel({
    required this.idCultureCampagne,
    required this.idCampagne,
    required this.idChamp,
    required this.modeAcces,
    required this.proprietaireChamp,
    this.documentChamp,
    required this.typePlanteur,
    required this.idPlanteur,
    required this.typeCulture,
    required this.culture,
    required this.superficieEmblave,
    required this.sourceSemence,
    required this.semenceCertifie,
    required this.sourceEngrais,
    required this.qteProduite,
    required this.typeLabour,
    required this.destinationRecolte,
    required this.serviceFinancierCampagne,
    required this.entrepriseServiceFinancier,
    required this.observation,
    required this.commentaire,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus,
  });

  // From Map (for use with database)
  factory CultureCampagneModel.fromMap(Map<String, dynamic> map) {
    return CultureCampagneModel(
      idCultureCampagne: map['id_culture_campagne'],
      idCampagne: map['id_campagne'],
      idChamp: map['id_champ'],
      modeAcces: map['mode_acces'],
      proprietaireChamp: map['proprietaire_champ'],
      documentChamp: map['document_champ'],
      typePlanteur: map['type_planteur'],
      idPlanteur: map['id_planteur'],
      typeCulture: map['type_culture'],
      culture: map['culture'],
      superficieEmblave: map['superficie_emblave'],
      sourceSemence: map['source_semence'],
      semenceCertifie: map['semence_certifie'],
      sourceEngrais: map['source_engrais'],
      qteProduite: map['qte_produite'],
      typeLabour: map['type_labour'],
      destinationRecolte: map['destination_recolte'],
      serviceFinancierCampagne: map['service_financier_campagne'],
      entrepriseServiceFinancier: map['entreprise_service_financier'],
      observation: map['Observation'],
      commentaire: map['Commentaire'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // Convert to Map (for database insertion)
  Map<String, dynamic> toMap() {
    return {
      'id_culture_campagne': idCultureCampagne,
      'id_campagne': idCampagne,
      'id_champ': idChamp,
      'mode_acces': modeAcces,
      'proprietaire_champ': proprietaireChamp,
      'document_champ': documentChamp,
      'type_planteur': typePlanteur,
      'id_planteur': idPlanteur,
      'type_culture': typeCulture,
      'culture': culture,
      'superficie_emblave': superficieEmblave,
      'source_semence': sourceSemence,
      'semence_certifie': semenceCertifie,
      'source_engrais': sourceEngrais,
      'qte_produite': qteProduite,
      'type_labour': typeLabour,
      'destination_recolte': destinationRecolte,
      'service_financier_campagne': serviceFinancierCampagne,
      'entreprise_service_financier': entrepriseServiceFinancier,
      'Observation': observation,
      'Commentaire': commentaire,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // From JSON (for API response)
  factory CultureCampagneModel.fromJson(Map<String, dynamic> json) {
  return CultureCampagneModel(
    idCultureCampagne: int.tryParse(json['id_culture_campagne'].toString()) ?? 0,
    idCampagne: json['id_campagne'],
    idChamp: json['id_champ'],
    modeAcces: json['mode_acces'],
    proprietaireChamp: json['proprietaire_champ'],
    documentChamp: json['document_champ'],
    typePlanteur: json['type_planteur'],
    idPlanteur: json['id_planteur'],
    typeCulture: json['type_culture'],
    culture: json['culture'],
    superficieEmblave: int.tryParse(json['superficie_emblave'].toString()) ?? 0,
    sourceSemence: json['source_semence'],
    semenceCertifie: json['semence_certifie'],
    sourceEngrais: json['source_engrais'],
    qteProduite: json['qte_produite'],
    typeLabour: json['type_labour'],
    destinationRecolte: json['destination_recolte'],
    serviceFinancierCampagne: int.tryParse(json['service_financier_campagne'].toString()) ?? 0,
    entrepriseServiceFinancier: json['entreprise_service_financier'],
    observation: json['Observation'],
    commentaire: json['Commentaire'],
    addedBy: json['added_by'],
    addDate: json['add_date'],
    updateBy: json['update_by'],
    updateDate: json['update_date'],
    deletedBy: json['deleted_by'],
    deleteDate: json['delete_date'],
    dataStatus: json['data_status'] != null ? int.tryParse(json['data_status'].toString()) : null,
  );
}

  // Convert to JSON (for API request)
  Map<String, dynamic> toJson() {
    return {
      'id_culture_campagne': idCultureCampagne,
      'id_campagne': idCampagne,
      'id_champ': idChamp,
      'mode_acces': modeAcces,
      'proprietaire_champ': proprietaireChamp,
      'document_champ': documentChamp,
      'type_planteur': typePlanteur,
      'id_planteur': idPlanteur,
      'type_culture': typeCulture,
      'culture': culture,
      'superficie_emblave': superficieEmblave,
      'source_semence': sourceSemence,
      'semence_certifie': semenceCertifie,
      'source_engrais': sourceEngrais,
      'qte_produite': qteProduite,
      'type_labour': typeLabour,
      'destination_recolte': destinationRecolte,
      'service_financier_campagne': serviceFinancierCampagne,
      'entreprise_service_financier': entrepriseServiceFinancier,
      'Observation': observation,
      'Commentaire': commentaire,
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