class ChampConcessionAgricoleModel {
  String idChamp;
  String? nuiFarmerland;
  int typePlanteur; // Kept as int
  String? nuiFarmer;
  String farmName;
  String? provinceId;
  String? territoireVilleId;
  String? groupementId;
  String? localiteId;
  int? superficie;
  String? longitude;
  String? latitude;
  String? farmStatus;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  int? dataStatus;

  ChampConcessionAgricoleModel({
    required this.idChamp,
    this.nuiFarmerland,
    required this.typePlanteur,
    this.nuiFarmer,
    required this.farmName,
    this.provinceId,
    this.territoireVilleId,
    this.groupementId,
    this.localiteId,
    this.superficie,
    this.longitude,
    this.latitude,
    this.farmStatus,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus,
  });

  // From Map (for use with database)
  factory ChampConcessionAgricoleModel.fromMap(Map<String, dynamic> map) {
    return ChampConcessionAgricoleModel(
      idChamp: map['id_champ'],
      nuiFarmerland: map['nui_farmerland'],
      typePlanteur: int.tryParse(map['type_planteur'].toString()) ?? 0, // Parse to int
      nuiFarmer: map['nui_farmer'],
      farmName: map['farm_name'],
      provinceId: map['province_id'],
      territoireVilleId: map['territoire_ville_id'],
      groupementId: map['groupement_id'],
      localiteId: map['localite_id'],
      superficie: map['superficie'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      farmStatus: map['farm_status'],
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
      'id_champ': idChamp,
      'nui_farmerland': nuiFarmerland,
      'type_planteur': typePlanteur,
      'nui_farmer': nuiFarmer,
      'farm_name': farmName,
      'province_id': provinceId,
      'territoire_ville_id': territoireVilleId,
      'groupement_id': groupementId,
      'localite_id': localiteId,
      'superficie': superficie,
      'longitude': longitude,
      'latitude': latitude,
      'farm_status': farmStatus,
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
  factory ChampConcessionAgricoleModel.fromJson(Map<String, dynamic> json) {
    return ChampConcessionAgricoleModel(
      idChamp: json['id_champ'],
      nuiFarmerland: json['nui_farmerland'],
      typePlanteur: int.tryParse(json['type_planteur'].toString()) ?? 0, // Ensure parsing is done
      nuiFarmer: json['nui_farmer'],
      farmName: json['farm_name'],
      provinceId: json['province_id'],
      territoireVilleId: json['territoire_ville_id'],
      groupementId: json['groupement_id'],
      localiteId: json['localite_id'],
      superficie: json['superficie'] != null ? int.tryParse(json['superficie'].toString()) : null, // Parse to int
      longitude: json['longitude'],
      latitude: json['latitude'],
      farmStatus: json['farm_status'],
      addedBy: json['added_by'],
      addDate: json['add_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      dataStatus: json['data_status'] != null ? int.tryParse(json['data_status'].toString()) : null, // Parse to int
    );
  }

  // Convert to JSON (for API request)
  Map<String, dynamic> toJson() {
    return {
      'id_champ': idChamp,
      'nui_farmerland': nuiFarmerland,
      'type_planteur': typePlanteur,
      'nui_farmer': nuiFarmer,
      'farm_name': farmName,
      'province_id': provinceId,
      'territoire_ville_id': territoireVilleId,
      'groupement_id': groupementId,
      'localite_id': localiteId,
      'superficie': superficie,
      'longitude': longitude,
      'latitude': latitude,
      'farm_status': farmStatus,
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
