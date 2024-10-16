class AgriAssetModel {
  String agriAssetId;
  String agriAssetDesignation;
  String? agriAssetType;
  String? provinceId;
  String? territoireVilleId;
  String? groupementId;
  String? superficie;
  String? longitude;
  String? latitude;
  String? agriAssetAddress;
  String? agriAssetManagerType;
  String? agriAssetManagerId;
  String? agriAssetCapacity;
  String? agriAssetUnit;
  String? agriAssetRegistrationNumber;
  String? agriAssetEtat;
  String? agriAssetUtilisation;
  String assetPartner;
  int? agriAssetStatus;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  String? dataStatus;

  AgriAssetModel({
    required this.agriAssetId,
    required this.agriAssetDesignation,
    this.agriAssetType,
    this.provinceId,
    this.territoireVilleId,
    this.groupementId,
    this.superficie,
    this.longitude,
    this.latitude,
    this.agriAssetAddress,
    this.agriAssetManagerType,
    this.agriAssetManagerId,
    this.agriAssetCapacity,
    this.agriAssetUnit,
    this.agriAssetRegistrationNumber,
    this.agriAssetEtat,
    this.agriAssetUtilisation,
    required this.assetPartner,
    this.agriAssetStatus,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus,
  });

  // Convert AgriAssetModel to Map for SQLite database
  Map<String, dynamic> toMap() {
    return {
      'agri_asset_id': agriAssetId,
      'agriasset_designation': agriAssetDesignation,
      'agri_asset_type': agriAssetType,
      'province_id': provinceId,
      'territoire_ville_id': territoireVilleId,
      'groupement_id': groupementId,
      'superficie': superficie,
      'longitude': longitude,
      'latitude': latitude,
      'agriasset_address': agriAssetAddress,
      'agriasset_manager_type': agriAssetManagerType,
      'agriasset_manager_id': agriAssetManagerId,
      'agri_asset_capacity': agriAssetCapacity,
      'agri_asset_unit': agriAssetUnit,
      'agri_asset_registration_number': agriAssetRegistrationNumber,
      'agri_asset_etat': agriAssetEtat,
      'agri_asset_utilisation': agriAssetUtilisation,
      'asset_partner': assetPartner,
      'agri_asset_status': agriAssetStatus,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Factory method to create an AgriAssetModel from a Map (from SQLite database)
  factory AgriAssetModel.fromMap(Map<String, dynamic> map) {
    return AgriAssetModel(
      agriAssetId: map['agri_asset_id'],
      agriAssetDesignation: map['agriasset_designation'],
      agriAssetType: map['agri_asset_type'],
      provinceId: map['province_id'],
      territoireVilleId: map['territoire_ville_id'],
      groupementId: map['groupement_id'],
      superficie: map['superficie'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      agriAssetAddress: map['agriasset_address'],
      agriAssetManagerType: map['agriasset_manager_type'],
      agriAssetManagerId: map['agriasset_manager_id'],
      agriAssetCapacity: map['agri_asset_capacity'],
      agriAssetUnit: map['agri_asset_unit'],
      agriAssetRegistrationNumber: map['agri_asset_registration_number'],
      agriAssetEtat: map['agri_asset_etat'],
      agriAssetUtilisation: map['agri_asset_utilisation'],
      assetPartner: map['asset_partner'],
      agriAssetStatus: map['agri_asset_status'] is String
          ? int.tryParse(map['agri_asset_status']) ?? 0
          : map['agri_asset_status'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['data_status'],
    );
  }

  // Convert AgriAssetModel to JSON for API interaction
  Map<String, dynamic> toJson() {
    return {
      'agri_asset_id': agriAssetId,
      'agriasset_designation': agriAssetDesignation,
      'agri_asset_type': agriAssetType,
      'province_id': provinceId,
      'territoire_ville_id': territoireVilleId,
      'groupement_id': groupementId,
      'superficie': superficie,
      'longitude': longitude,
      'latitude': latitude,
      'agriasset_address': agriAssetAddress,
      'agriasset_manager_type': agriAssetManagerType,
      'agriasset_manager_id': agriAssetManagerId,
      'agri_asset_capacity': agriAssetCapacity,
      'agri_asset_unit': agriAssetUnit,
      'agri_asset_registration_number': agriAssetRegistrationNumber,
      'agri_asset_etat': agriAssetEtat,
      'agri_asset_utilisation': agriAssetUtilisation,
      'asset_partner': assetPartner,
      'agri_asset_status': agriAssetStatus,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'data_status': dataStatus,
    };
  }

  // Factory method to create an AgriAssetModel from JSON (for API interaction)
  factory AgriAssetModel.fromJson(Map<String, dynamic> json) {
    return AgriAssetModel(
      agriAssetId: json['agri_asset_id'],
      agriAssetDesignation: json['agriasset_designation'],
      agriAssetType: json['agri_asset_type'],
      provinceId: json['province_id'],
      territoireVilleId: json['territoire_ville_id'],
      groupementId: json['groupement_id'],
      superficie: json['superficie'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      agriAssetAddress: json['agriasset_address'],
      agriAssetManagerType: json['agriasset_manager_type'],
      agriAssetManagerId: json['agriasset_manager_id'],
      agriAssetCapacity: json['agri_asset_capacity'],
      agriAssetUnit: json['agri_asset_unit'],
      agriAssetRegistrationNumber: json['agri_asset_registration_number'],
      agriAssetEtat: json['agri_asset_etat'],
      agriAssetUtilisation: json['agri_asset_utilisation'],
      assetPartner: json['asset_partner'],
      agriAssetStatus: json['agri_asset_status'] is String
          ? int.tryParse(json['agri_asset_status']) ?? 0
          : json['agri_asset_status'],
      addedBy: json['added_by'],
      addDate: json['add_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      dataStatus: json['data_status'],
    );
  }
}
