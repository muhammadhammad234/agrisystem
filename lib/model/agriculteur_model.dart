class AgriculteurModel {
  String? farmerId;
  String firstName;
  String lastName;
  String? surname;
  String? nui;
  String? gender;
  String? maritalStatus;
  String? birthPlace;
  String? dateBirth;
  String? ageRange;
  String? identityDocType;
  String? idDocNumber;
  String? docPicture;
  String? address;
  double? latitude;
  double? longitude;
  String? state;
  String? townTerritoryId;
  String? municipalityGroup;
  String? villageQuarterId;
  String filerePrincipale;
  String? phoneNumber;
  String? email;
  String? relatedCompany; // Change this to String
  String? opId;
  String? eaId;
  String? farmerStatus;
  String? pictureLoc;
  String? addedBy;
  String? addDate;
  String? updateBy;
  String? updateDate;
  String? deletedBy;
  String? deleteDate;
  String dataStatus;

  AgriculteurModel({
    this.farmerId,
    required this.firstName,
    required this.lastName,
    this.surname,
    this.nui,
    this.gender,
    this.maritalStatus,
    this.birthPlace,
    this.dateBirth,
    this.ageRange,
    this.identityDocType,
    this.idDocNumber,
    this.docPicture,
    this.address,
    this.latitude,
    this.longitude,
    required this.state,
    required this.townTerritoryId,
    this.municipalityGroup,
    this.villageQuarterId,
    required this.filerePrincipale,
    this.phoneNumber,
    this.email,
    this.relatedCompany,
    this.opId,
    this.eaId,
    this.farmerStatus,
    this.pictureLoc,
    this.addedBy,
    this.addDate,
    this.updateBy,
    this.updateDate,
    this.deletedBy,
    this.deleteDate,
    this.dataStatus = '10',
  });

  // Factory method to create a Farmer instance from a Map (for use with database)
  factory AgriculteurModel.fromMap(Map<String, dynamic> map) {
    return AgriculteurModel(
      farmerId: map['farmer_id']?.toString(), // Convert int to String if necessary
      firstName: map['First_name'],
      lastName: map['Last_name'],
      surname: map['surname'],
      nui: map['NUI'],
      gender: map['gender'],
      maritalStatus: map['marital_status'],
      birthPlace: map['birth_place'],
      dateBirth: map['date_birth'],
      ageRange: map['age_range'],
      identityDocType: map['Identity_doc_type'],
      idDocNumber: map['Id_doc_number'],
      docPicture: map['doc_picture'],
      address: map['adress'],
      latitude: map['latitude'] != null ? map['latitude'].toDouble() : null,
      longitude: map['longitude'] != null ? map['longitude'].toDouble() : null,
      state: map['state'].toString(), // Ensure it's a string
      townTerritoryId: map['town_territory_id'].toString(), // Ensure it's a string
      municipalityGroup: map['municipality_group'],
      villageQuarterId: map['village_quarter_id'].toString(), // Ensure it's a string
      filerePrincipale: map['filere_principale'].toString(), // Ensure it's a string
      phoneNumber: map['Phone_number'],
      email: map['email'],
      relatedCompany: map['related_company']?.toString(), // Convert to String if necessary
      opId: map['op_id']?.toString(), // Convert to String if necessary
      eaId: map['ea_id']?.toString(), // Convert to String if necessary
      farmerStatus: map['farmer_status']?.toString(), // Convert to String if necessary
      pictureLoc: map['picture_loc'],
      addedBy: map['added_by'],
      addDate: map['add_date'],
      updateBy: map['update_by'],
      updateDate: map['update_date'],
      deletedBy: map['deleted_by'],
      deleteDate: map['delete_date'],
      dataStatus: map['Data_status']!.toString(), // Convert to String if necessary
    );
  }

  // Convert Farmer object into a Map for insertion into the database
  Map<String, dynamic> toMap() {
    return {
      'farmer_id': farmerId,
      'First_name': firstName,
      'Last_name': lastName,
      'surname': surname,
      'NUI': nui,
      'gender': gender,
      'marital_status': maritalStatus,
      'birth_place': birthPlace,
      'date_birth': dateBirth,
      'age_range': ageRange,
      'Identity_doc_type': identityDocType,
      'Id_doc_number': idDocNumber,
      'doc_picture': docPicture,
      'adress': address,
      'latitude': latitude,
      'longitude': longitude,
      'state': state,
      'town_territory_id': townTerritoryId,
      'municipality_group': municipalityGroup,
      'village_quarter_id': villageQuarterId,
      'filere_principale': filerePrincipale,
      'Phone_number': phoneNumber,
      'email': email,
      'related_company': relatedCompany,
      'op_id': opId,
      'ea_id': eaId,
      'farmer_status': farmerStatus,
      'picture_loc': pictureLoc,
      'added_by': addedBy,
      'add_date': addDate,
      'update_by': updateBy,
      'update_date': updateDate,
      'deleted_by': deletedBy,
      'delete_date': deleteDate,
      'Data_status': dataStatus,
    };
  }

  // Factory method to create a Farmer instance from JSON
  factory AgriculteurModel.fromJson(Map<String, dynamic> json) {
    return AgriculteurModel(
      farmerId: json['farmer_id'].toString(), // Convert int to String if necessary
      firstName: json['First_name'],
      lastName: json['Last_name'],
      surname: json['surname'],
      nui: json['NUI'],
      gender: json['gender'],
      maritalStatus: json['marital_status'],
      birthPlace: json['birth_place'],
      dateBirth: json['date_birth'],
      ageRange: json['age_range'],
      identityDocType: json['Identity_doc_type'],
      idDocNumber: json['Id_doc_number'],
      docPicture: json['doc_picture'],
      address: json['adress'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      state: json['state'].toString(), // Ensure it's a string
      townTerritoryId: json['town_territory_id'].toString(), // Ensure it's a string
      municipalityGroup: json['municipality_group'],
      villageQuarterId: json['village_quarter_id'].toString(), // Ensure it's a string
      filerePrincipale: json['filere_principale'].toString(), // Ensure it's a string
      phoneNumber: json['Phone_number'],
      email: json['email'],
      relatedCompany: json['related_company'].toString(), // Convert to String if necessary
      opId: json['op_id'].toString(), // Convert to String if necessary
      eaId: json['ea_id'].toString(), // Convert to String if necessary
      farmerStatus: json['farmer_status']?.toString(), // Convert to String if necessary
      pictureLoc: json['picture_loc'],
      addedBy: json['added_by'],
      addDate: json['add_date'],
      updateBy: json['update_by'],
      updateDate: json['update_date'],
      deletedBy: json['deleted_by'],
      deleteDate: json['delete_date'],
      dataStatus: json['Data_status']!.toString(), // Convert to String if necessary
    );
  }

  // Convert Farmer object into JSON
  Map<String, dynamic> toJson() {
    return {
      'farmer_id': farmerId,
      'First_name': firstName,
      'Last_name': lastName,
      'surname': surname,
      'NUI': nui,
      'gender': gender,
      'marital_status': maritalStatus,
      'birth_place': birthPlace,
      'date_birth': dateBirth,
      'age_range': ageRange,
      'Identity_doc_type': identityDocType,
      'Id_doc_number': idDocNumber,
      'doc_picture': docPicture,
      'adress': address,
      'latitude': latitude,
      'longitude': longitude,
      'state': state,
      'town_territory_id': townTerritoryId,
      'municipality_group': municipalityGroup,
      'village_quarter_id': villageQuarterId,
      'filere_principale': filerePrincipale,
      'Phone_number': phoneNumber,
      'email': email,
      'related_company': relatedCompany,
      'op_id': opId,
      'ea_id': eaId,
      'farmer_status': farmerStatus,
      'picture_loc': pictureLoc,
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