class AgriAssetTypeModel {
  String agriAssetTypeId;
  String agriassetTypeDesignation;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  int dataStatus;

  AgriAssetTypeModel({
    required this.agriAssetTypeId,
    required this.agriassetTypeDesignation,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    required this.dataStatus,
  });

  // Convert AgriAssetTypeModel object to Map for inserting into SQLite
  Map<String, dynamic> toMap() {
    return {
      'agri_asset_type_id': agriAssetTypeId,
      'agriasset_type_designation': agriassetTypeDesignation,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Convert AgriAssetTypeModel object to JSON for API interaction
  Map<String, dynamic> toJson() {
    return {
      'agri_asset_type_id': agriAssetTypeId,
      'agriasset_type_designation': agriassetTypeDesignation,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Factory method to create AgriAssetTypeModel from a Map (e.g., from SQLite)
  factory AgriAssetTypeModel.fromMap(Map<String, dynamic> map) {
    return AgriAssetTypeModel(
      agriAssetTypeId: map['agri_asset_type_id'],
      agriassetTypeDesignation: map['agriasset_type_designation'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      // Ensure dataStatus is always an int, even if stored as a string
      dataStatus: map['data_status'] is int
          ? map['data_status']
          : int.tryParse(map['data_status'].toString()) ?? 0,
    );
  }

  // Factory method to create AgriAssetTypeModel from a JSON response
  factory AgriAssetTypeModel.fromJson(Map<String, dynamic> json) {
    return AgriAssetTypeModel(
      agriAssetTypeId: json['agri_asset_type_id'],
      agriassetTypeDesignation: json['agriasset_type_designation'],
      addedBy: json['added_by'],
      addDate: json['add_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      // Handle the dataStatus type conversion from String to int
      dataStatus: json['data_status'] is int
          ? json['data_status']
          : int.tryParse(json['data_status'].toString()) ?? 0,
    );
  }
}
