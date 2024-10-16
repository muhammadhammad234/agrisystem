class CampagneAgricoleModel {
  String idCampagne;
  String saison;
  int annee;
  String dateDebut;
  String dateFin;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  int dataStatus;

  CampagneAgricoleModel({
    required this.idCampagne,
    required this.saison,
    required this.annee,
    required this.dateDebut,
    required this.dateFin,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    required this.dataStatus,
  });

  // Convert CampagneAgricoleModel object to Map for SQLite insertion
  Map<String, dynamic> toMap() {
    return {
      'id_campagne': idCampagne,
      'saison': saison,
      'annee': annee,
      'date_debut': dateDebut,
      'date_fin': dateFin,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Factory method to create a CampagneAgricoleModel from a Map (SQLite to object)
  factory CampagneAgricoleModel.fromMap(Map<String, dynamic> map) {
    return CampagneAgricoleModel(
      idCampagne: map['id_campagne'],
      saison: map['saison'],
      annee: map['annee'],
      dateDebut: map['date_debut'],
      dateFin: map['date_fin'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // JSON serialization for API interaction
  factory CampagneAgricoleModel.fromJson(Map<String, dynamic> json) {
    return CampagneAgricoleModel(
      idCampagne: json['id_campagne'],
      saison: json['saison'],
      annee: int.tryParse(json['annee'].toString()) ?? 0, // Handling string to int conversion
      dateDebut: json['date_debut'],
      dateFin: json['date_fin'],
      addedBy: json['added_by'],
      addDate: json['add_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      dataStatus: int.tryParse(json['data_status'].toString()) ?? 0, // Handling string to int conversion
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_campagne': idCampagne,
      'saison': saison,
      'annee': annee,
      'date_debut': dateDebut,
      'date_fin': dateFin,
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
