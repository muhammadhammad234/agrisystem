class EaSecteurModel {
  String eaSecteurId;
  String designation;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  int? dataStatus;

  EaSecteurModel({
    required this.eaSecteurId,
    required this.designation,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus,
  });

  // Factory method to create EaSecteurModel from a Map (e.g., database row or API response)
  factory EaSecteurModel.fromJson(Map<String, dynamic> json) {
    return EaSecteurModel(
      eaSecteurId: json['ea_secteur_id'],
      designation: json['designation'],
      addedBy: json['added_by'],
      addDate: json['add_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      dataStatus: json['data_status'],
    );
  }

  // Factory method to create EaSecteurModel from a Map for database retrieval
  factory EaSecteurModel.fromMap(Map<String, dynamic> map) {
    return EaSecteurModel(
      eaSecteurId: map['ea_secteur_id'],
      designation: map['designation'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // Convert model to a Map for insertion into the database
  Map<String, dynamic> toMap() {
    return {
      'ea_secteur_id': eaSecteurId,
      'designation': designation,
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
