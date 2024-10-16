import 'package:agrisystem/model/agri_asset_model.dart';
import 'package:agrisystem/model/agri_asset_type_model.dart';
import 'package:agrisystem/model/agriculteur_model.dart';
import 'package:agrisystem/model/champ_concession_agricole_model.dart';
import 'package:agrisystem/model/compagne_agricole_model.dart';
import 'package:agrisystem/model/culture_compagne_model.dart';
import 'package:agrisystem/model/ea_model.dart';
import 'package:agrisystem/model/ea_secular_model.dart';
import 'package:agrisystem/model/munciplaity_group_model.dart';
import 'package:agrisystem/model/op_model.dart';
import 'package:agrisystem/model/states_model.dart';
import 'package:agrisystem/model/town_territory_model.dart';
import 'package:agrisystem/model/user_model.dart';
import 'package:agrisystem/model/village_quarter_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "agriculture.db";
  static const _databaseVersion = 1;

  // Table names
  static const villageQuarterTbl = 'village_quarter_tbl';
  static const agriculteurTbl = 'agriculteur_tbl';
  static const agriAssetTbl = 'agri_asset_tbl';
  static const agriAssetTypeTbl = 'agri_asset_type_tbl';
  static const campagneAgricoleTbl = 'campagne_agricole_tbl';
  static const eaTbl = 'ea_tbl';
  static const champConcessionAgricoleTbl = 'champ_concession_agricole_tbl';
  static const cultureCampagneTbl = 'culture_campagne_tbl';
  static const eaSecteurTbl = 'ea_secteur_tbl';
  static const minicipalityGroupTbl = 'minicipality_group_tbl';
  static const opTbl = 'op_tbl';
  static const statesTbl = 'states_tbl';
  static const tblusers = 'tblusers';
  static const townTerritoryTbl = 'town_territory_tbl';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the tables
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $villageQuarterTbl (
        village_quarter_id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT DEFAULT '1',
        name1 TEXT,
        name2 TEXT,
        state_id TEXT,
        town_terr_id TEXT,
        collectiv TEXT,
        groupement TEXT,
        pcode TEXT,
        code_ins TEXT,
        rang_ins TEXT,
        longitude REAL,
        latitude REAL,
        created_by TEXT,
        create_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        update_by TEXT,
        update_date DATETIME,
        deleted_by TEXT,
        delete_date DATETIME,
        data_status TEXT DEFAULT 'active'
      )''');

    await db.execute('''
        CREATE TABLE $agriculteurTbl (
          farmer_id INTEGER PRIMARY KEY,
          First_name TEXT NOT NULL,
          Last_name TEXT NOT NULL,
          surname TEXT,
          NUI TEXT,
          gender CHAR(1),
          marital_status TEXT,
          birth_place TEXT,
          date_birth TEXT,
          age_range TEXT,
          Identity_doc_type TEXT,
          Id_doc_number TEXT,
          doc_picture TEXT,
          adress TEXT,
          latitude DECIMAL(9,6),
          longitude DECIMAL(9,6),
          state INTEGER NOT NULL,
          town_territory_id INTEGER NOT NULL,
          municipality_group TEXT,
          village_quarter_id TEXT,
          filere_principale TEXT NOT NULL,
          Phone_number TEXT,
          email TEXT,
          related_company INTEGER,
          op_id TEXT,
          ea_id TEXT,
          farmer_status TEXT,
          picture_loc TEXT,
          added_by TEXT,
          add_date TEXT,
          update_by TEXT,
          update_date TEXT,
          deleted_by TEXT,
          delete_date TEXT,
          Data_status TEXT DEFAULT '10'
        )
      ''');

    await db.execute('''
        CREATE TABLE $agriAssetTbl (
          agri_asset_id TEXT PRIMARY KEY,
          agriasset_designation TEXT NOT NULL,
          agri_asset_type TEXT,
          province_id TEXT,
          territoire_ville_id TEXT,
          groupement_id TEXT,
          superficie TEXT,
          longitude TEXT,
          latitude TEXT,
          agriasset_address TEXT,
          agriasset_manager_type TEXT,
          agriasset_manager_id TEXT,
          agri_asset_capacity TEXT,
          agri_asset_unit TEXT,
          agri_asset_registration_number TEXT,
          agri_asset_etat TEXT,
          agri_asset_utilisation TEXT,
          asset_partner TEXT NOT NULL,
          agri_asset_status INTEGER,
          added_by TEXT,
          add_date TEXT,
          update_by TEXT,
          update_date TEXT,
          deleted_by TEXT,
          delete_date TEXT,
          data_status INTEGER
        )
      ''');

    await db.execute('''
        CREATE TABLE $agriAssetTypeTbl (
          agri_asset_type_id TEXT PRIMARY KEY,
          agriasset_type_designation TEXT NOT NULL,
          added_by TEXT,
          add_date DATETIME,
          update_by TEXT,
          update_date DATETIME,
          deleted_by TEXT,
          delete_date DATETIME,
          data_status INTEGER NOT NULL
        )
      ''');

    await db.execute('''
            CREATE TABLE $campagneAgricoleTbl (
              id_campagne TEXT PRIMARY KEY,
              saison TEXT NOT NULL,
              annee INTEGER NOT NULL,
              date_debut TEXT NOT NULL,
              date_fin TEXT NOT NULL,
              added_by TEXT,
              add_date TEXT,
              update_by TEXT,
              update_date TEXT,
              deleted_by TEXT,
              delete_date TEXT,
              data_status INTEGER NOT NULL
            )
          ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $eaTbl (
        ea_id TEXT PRIMARY KEY,
        designation TEXT NOT NULL,
        sigle TEXT,
        date_creation TEXT,
        ea_NUI TEXT,
        ea_forme_juridique TEXT,
        doc_jurid TEXT,
        num_doc_juridi TEXT,
        fichier_doc_jurid TEXT,
        ea_filere_principale TEXT,
        ea_secteur TEXT,
        ea_sous_secteur TEXT,
        num_agrement TEXT,
        rayon_action TEXT,
        zone_activite TEXT,
        activites_cours TEXT,
        logo TEXT,
        address TEXT,
        province_id TEXT,
        territoire_id TEXT,
        groupement_id TEXT,
        village_quartier_id TEXT,
        latitude TEXT,
        longitude TEXT,
        source_financement_depart TEXT,
        structure_encadrement TEXT,
        manager_firstname TEXT,
        manager_surname TEXT,
        manager_lastname TEXT,
        telephone TEXT,
        email TEXT,
        fichier_roi TEXT,
        fichier_autorisation TEXT,
        ea_status INTEGER,
        added_by TEXT,
        add_date TEXT,
        update_by TEXT,
        update_date TEXT,
        deleted_by TEXT,
        delete_date TEXT,
        data_status TEXT
      )
    ''');

    await db.execute('''
  CREATE TABLE $champConcessionAgricoleTbl (
    id_champ TEXT PRIMARY KEY,
    nui_farmerland TEXT,
    type_planteur INTEGER NOT NULL,
    nui_farmer TEXT,
    farm_name TEXT NOT NULL,
    province_id TEXT,
    territoire_ville_id TEXT,
    groupement_id TEXT,
    localite_id TEXT,
    superficie INTEGER,
    longitude TEXT,
    latitude TEXT,
    farm_status TEXT,
    added_by TEXT,
    add_date TEXT,
    update_by TEXT,
    update_date TEXT,
    deleted_by TEXT,
    delete_date TEXT,
    data_status INTEGER
  )
''');

    await db.execute('''
  CREATE TABLE $cultureCampagneTbl (
    id_culture_campagne INTEGER PRIMARY KEY, -- Use INTEGER for autoincrementing IDs
    id_campagne TEXT NOT NULL,
    id_champ TEXT NOT NULL,
    mode_acces TEXT NOT NULL,
    proprietaire_champ TEXT NOT NULL,
    document_champ TEXT,
    type_planteur TEXT NOT NULL, -- (1 - EA; 2 - Ops; 3 - Agri)
    id_planteur TEXT NOT NULL,
    type_culture TEXT NOT NULL, -- (1 - Principale; 2 - Secondaire)
    culture TEXT NOT NULL,
    superficie_emblave INTEGER NOT NULL,
    source_semence TEXT NOT NULL,
    semence_certifie TEXT NOT NULL,
    source_engrais TEXT NOT NULL,
    qte_produite TEXT NOT NULL,
    type_labour TEXT NOT NULL, -- (1 - Manuel; 2 - Semi Mecanise; 3 - Mecanise)
    destination_recolte TEXT NOT NULL, -- (1 - Consommation; 2 - Commercialisation domestique; 3 - Partage; 4 - Commercialisation Exportation)
    service_financier_campagne INTEGER NOT NULL, -- (1 - Credit; 2 - Epargne; 3 - Paiement bancaire)
    entreprise_service_financier TEXT NOT NULL,
    Observation TEXT NOT NULL,
    Commentaire TEXT NOT NULL,
    added_by TEXT,
    add_date TEXT,
    update_by TEXT,
    update_date TEXT,
    deleted_by TEXT,
    delete_date TEXT,
    data_status INTEGER
  )
''');

    await db.execute('''
  CREATE TABLE $eaSecteurTbl (
    ea_secteur_id TEXT PRIMARY KEY,
    designation TEXT NOT NULL,
    added_by TEXT,
    add_date TEXT,
    update_by TEXT,
    update_date TEXT,
    deleted_by TEXT,
    delete_date TEXT,
    data_status INTEGER
  )
''');

    await db.execute('''
   CREATE TABLE $minicipalityGroupTbl (
      minicipality_group_id INTEGER PRIMARY KEY,
      town_terr_id INTEGER NOT NULL,
      min_terr_name TEXT NOT NULL,
      category TEXT DEFAULT '10', -- 10=Groupement, 20=Commune
      superficie_trt REAL,
      population_trt INTEGER,
      longitude REAL NOT NULL,
      latitude REAL NOT NULL,
      collectiv TEXT,
      surface TEXT,
      SCE_SEM TEXT,
      SCE_GEO TEXT,
      GENRE TEXT,
      NOM_RGC TEXT,
      CODE_GRPT TEXT,
      added_by TEXT,
      add_date TEXT,
      update_by TEXT,
      update_date TEXT,
      deleted_by TEXT,
      delete_date TEXT,
      Data_status TEXT DEFAULT '10' -- 10=active, 20=inactive, 30=deleted
    )
  ''');

    await db.execute('''
  CREATE TABLE $opTbl (
    op_id INTEGER PRIMARY KEY,
    uop_id INTEGER NOT NULL,
    ea_id INTEGER NOT NULL,
    op_designation TEXT NOT NULL,
    op_sigle TEXT NOT NULL,
    date_creation TEXT NOT NULL,
    op_filiere TEXT NOT NULL,
    address TEXT NOT NULL,
    province_id TEXT NOT NULL,
    territoire_ville_id TEXT NOT NULL,
    groupement_id TEXT NOT NULL,
    village_quartier_id TEXT NOT NULL,
    longitude TEXT NOT NULL,
    latitude TEXT NOT NULL,
    telephone TEXT NOT NULL,
    structure_encadrement TEXT NOT NULL,
    email TEXT NOT NULL,
    fichier_status TEXT NOT NULL,
    fichier_roi TEXT NOT NULL,
    fichier_autorisation TEXT NOT NULL,
    op_status INTEGER NOT NULL,
    added_by TEXT NOT NULL,
    add_date TEXT NOT NULL,
    update_by TEXT NOT NULL,
    update_date TEXT NOT NULL,
    deleted_by TEXT,
    delete_date TEXT,
    data_status TEXT NOT NULL
  )
''');

    await db.execute('''
    CREATE TABLE $statesTbl (
      state_id INTEGER PRIMARY KEY,
      state_name TEXT NOT NULL,
      state_area REAL,
      states_agri_area INTEGER NOT NULL,
      state_population INTEGER,
      state_code TEXT NOT NULL,
      added_by TEXT NOT NULL,
      add_date TEXT NOT NULL,
      update_by TEXT,
      update_date TEXT,
      deleted_by TEXT,
      delete_date TEXT,
      data_status TEXT NOT NULL
    )
  ''');

    await db.execute('''
    CREATE TABLE $tblusers (
      UserID INTEGER PRIMARY KEY,
      ParentID INTEGER NOT NULL,
      EmailAddress TEXT NOT NULL,
      FullName TEXT NOT NULL,
      Username TEXT NOT NULL,
      Password TEXT NOT NULL,
      Role INTEGER NOT NULL DEFAULT 3,
      level TEXT NOT NULL,
      restriction INTEGER NOT NULL,
      PicLoc TEXT NOT NULL,
      tokennumber TEXT NOT NULL DEFAULT 'none',
      tokenexpiration INTEGER NOT NULL DEFAULT 0
    )
  ''');

    await db.execute('''
    CREATE TABLE $townTerritoryTbl (
      town_terr_id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      country_code INTEGER NOT NULL,
      state_id INTEGER,
      category TEXT DEFAULT '1', -- 1=Territoire, 2=Ville ou cite
      Code_INS TEXT,
      code_ville INTEGER NOT NULL,
      longitude REAL,
      latitude REAL,
      area INTEGER,
      population INTEGER NOT NULL,
      added_by TEXT NOT NULL,
      add_date TEXT NOT NULL,
      update_by TEXT,
      update_date TEXT,
      deleted_by TEXT,
      delete_date TEXT,
      data_status TEXT DEFAULT '10' -- 10=active, 20=inactive, 30=deleted
    )
  ''');
  }

  Future<List<Map<String, dynamic>>> getAllVillageQuarters() async {
    final db = await database;
    return await db.query(villageQuarterTbl);
  }

  Future<List<Map<String, dynamic>>> getAllAgriculteur() async {
    final db = await database;
    return await db.query(agriculteurTbl);
  }

  Future<List<Map<String, dynamic>>> getAllOp() async {
    final db = await database;
    return await db.query(opTbl);
  }

  Future<List<Map<String, dynamic>>> getAllEA() async {
    final db = await database;
    return await db.query(eaTbl);
  }

  Future<List<Map<String, dynamic>>> getAllStattes() async {
    final db = await database;
    return await db.query(statesTbl);
  }

  Future<List<Map<String, dynamic>>> getAllMunicipality() async {
    final db = await database;
    return await db.query(minicipalityGroupTbl);
  }

  Future<List<Map<String, dynamic>>> getAllTerritory() async {
    final db = await database;
    return await db.query(townTerritoryTbl);
  }

  // Search village quarters by name or code
  Future<List<Map<String, dynamic>>> searchVillageQuarters(String query) async {
    final db = await database;
    return await db.query(
      villageQuarterTbl,
      where: 'name1 LIKE ?',
      whereArgs: [
        '%$query%',
      ],
      columns: ['name1'],
    );
  }

  Future<List<Map<String, dynamic>>> searchStateName(String query) async {
    final db = await database;
    return await db.query(
      statesTbl,
      where: 'state_name LIKE ?',
      whereArgs: ['%$query%'],
      columns: ['state_name'],
    );
  }

  Future<List<Map<String, dynamic>>> searchMicipalityName(String query) async {
    final db = await database;
    return await db.query(
      minicipalityGroupTbl,
      where: 'min_terr_name LIKE ?',
      whereArgs: ['%$query%'],
      columns: ['min_terr_name'],
    );
  }

  Future<List<Map<String, dynamic>>> searchTerritoryName(String query) async {
    final db = await database;
    return await db.query(
      townTerritoryTbl,
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
      columns: ['name'],
    );
  }

  getProvinceNameById(int provinceId) async {
    final db = await database;
    final result = await db
        .query(statesTbl, where: 'state_id = ?', whereArgs: [provinceId]);
    return result.first['state_name'];
  }

  Future<void> seedVillageQuarterData(
      List<Map<String, dynamic>> villageData) async {
    debugPrint('Village Quarter start seeded');

    final db = await DatabaseHelper.instance.database;

    // Create a batch
    var batch = db.batch();

    // Add each insert operation to the batch
    for (var villageJson in villageData) {
      VillageQuarterModel village = VillageQuarterModel.fromJson(villageJson);

      batch.insert(
        DatabaseHelper
            .villageQuarterTbl, // The static table name from your DatabaseHelper
        village.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // Replace on conflict
      );
    }

    debugPrint('Village Quarter data seeded successfully');

    // Commit the batch to execute all operations
    await batch.commit(noResult: true);
    // noResult:true is for performance improvement when you don’t need the result

    debugPrint('Village Quarter end seeded');
  }

  Future<void> seedAgriculteur(
      List<Map<String, dynamic>> agriculteurData) async {
    debugPrint('Agriculteur start seeded');

    final db = await DatabaseHelper.instance.database;

    // Create a batch
    var batch = db.batch();

    // Add each insert operation to the batch
    for (var item in agriculteurData) {
      AgriculteurModel agriculteurModel = AgriculteurModel.fromJson(item);

      batch.insert(
        DatabaseHelper
            .agriculteurTbl, // The static table name from your DatabaseHelper
        agriculteurModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // Replace on conflict
      );
    }

    debugPrint('Agriculteur data seeded successfully');

    // Commit the batch to execute all operations
    await batch.commit(noResult: true);
    // noResult:true is for performance improvement when you don’t need the result

    debugPrint('Agriculteur end seeded');
  }

// Seeding function to insert agri asset data into the local SQLite database
  Future<void> seedAgriAssets(List<Map<String, dynamic>> agriAssetData) async {
    debugPrint('AgriAsset start seeding');

    // Get the database instance
    final db = await DatabaseHelper.instance.database;

    // Create a batch operation for better performance
    var batch = db.batch();

    // Iterate over each item in the agriAssetData
    for (var item in agriAssetData) {
      // Convert each JSON item into an AgriAssetModel instance
      AgriAssetModel agriAssetModel = AgriAssetModel.fromJson(item);

      // Insert the converted item into the database within a batch operation
      batch.insert(
        DatabaseHelper.agriAssetTbl, // Your table name
        agriAssetModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // Replace if conflict
      );
    }

    // Commit the batch operations to execute them all at once
    await batch.commit(noResult: true); // noResult improves performance

    debugPrint('AgriAsset seeding completed');
  }

  Future<void> seedAgriAssetType(
      List<Map<String, dynamic>> agriAssetTypeData) async {
    final db = await DatabaseHelper.instance.database;

    // Create a batch to insert all data at once
    var batch = db.batch();

    for (var item in agriAssetTypeData) {
      AgriAssetTypeModel agriAssetType = AgriAssetTypeModel.fromJson(item);

      batch.insert(
        agriAssetTypeTbl,
        agriAssetType.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    // Commit the batch to execute all the insert operations
    await batch.commit(noResult: true);

    debugPrint('Agri Asset Type data seeded successfully');
  }

  Future<void> seedCampagneAgricole(
      List<Map<String, dynamic>> campagneAgricoleData) async {
    final db = await DatabaseHelper.instance.database;

    // Create a batch to insert all data at once
    var batch = db.batch();

    for (var item in campagneAgricoleData) {
      CampagneAgricoleModel campagneAgricoleModel =
          CampagneAgricoleModel.fromJson(item);

      batch.insert(
        campagneAgricoleTbl,
        campagneAgricoleModel.toMap(),
        conflictAlgorithm:
            ConflictAlgorithm.replace, // Replace if the record already exists
      );
    }

    // Commit the batch
    await batch.commit(noResult: true);
    print('Campagne Agricole data seeded successfully');
  }

  Future<void> seedEaData(List<Map<String, dynamic>> eaData) async {
    debugPrint('Seeding EA data start');

    final db = await DatabaseHelper.instance.database;

    // Create a batch to execute multiple operations at once
    var batch = db.batch();

    // Loop through the data and insert it into the table
    for (var item in eaData) {
      EaModel eaModel = EaModel.fromJson(item);

      batch.insert(
        DatabaseHelper.eaTbl, // The static table name from your DatabaseHelper
        eaModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // Replace on conflict
      );
    }

    // Commit the batch to execute all operations
    await batch.commit(
        noResult: true); // NoResult:true for performance improvement

    debugPrint('EA data seeded successfully');
  }

  Future<void> seedChampConcessionAgricoleData(
      List<Map<String, dynamic>> champData) async {
    final db = await DatabaseHelper.instance.database;

    var batch = db.batch();

    for (var item in champData) {
      ChampConcessionAgricoleModel champModel =
          ChampConcessionAgricoleModel.fromJson(item);

      batch.insert(
        DatabaseHelper.champConcessionAgricoleTbl,
        champModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // To replace if exists
      );
    }

    await batch.commit(noResult: true); // Commit batch
    debugPrint('Champ Concession Agricole data seeded successfully');
  }

  Future<void> seedCultureCampagneData(
      List<Map<String, dynamic>> cultureCampagneData) async {
    debugPrint('CultureCampagne start seeding');

    final db = await DatabaseHelper.instance.database;

    // Create a batch
    var batch = db.batch();

    // Add each insert operation to the batch
    for (var item in cultureCampagneData) {
      // Convert each JSON item into an AgriAssetModel instance
      CultureCampagneModel cultureCampagneModel =
          CultureCampagneModel.fromJson(item);

      batch.insert(
        DatabaseHelper
            .cultureCampagneTbl, // The static table name from your DatabaseHelper
        cultureCampagneModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // Replace on conflict
      );
    }

    debugPrint('CultureCampagne data seeding started');

    // Commit the batch to execute all operations
    await batch.commit(
        noResult: true); // noResult:true is for performance improvement

    debugPrint('CultureCampagne end seeding');
  }

  Future<void> seedEaSecteurData(
      List<Map<String, dynamic>> eaSecteurData) async {
    debugPrint('Seeding ea_secteur_tbl started');

    final db = await DatabaseHelper.instance.database;

    // Create a batch for faster insertion
    var batch = db.batch();

    // Insert each item into the table
    for (var item in eaSecteurData) {
      EaSecteurModel eaSecteurModel = EaSecteurModel.fromJson(item);

      batch.insert(
        DatabaseHelper.eaSecteurTbl, // Reference your table name
        eaSecteurModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace, // Replace on conflict
      );
    }

    // Commit the batch
    await batch.commit(noResult: true);

    debugPrint('Seeding ea_secteur_tbl completed successfully');
  }

  Future<void> seedMinicipalityGroupData(
      List<Map<String, dynamic>> minicipalityGroupData) async {
    debugPrint('Seeding minicipality_group_tbl started');

    final db = await DatabaseHelper.instance.database;

    var batch = db.batch();

    for (var item in minicipalityGroupData) {
      MinicipalityGroupModel minicipalityGroupModel =
          MinicipalityGroupModel.fromJson(item);
      batch.insert(
        DatabaseHelper.minicipalityGroupTbl,
        minicipalityGroupModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);

    debugPrint('Seeding minicipality_group_tbl completed successfully');
  }

  Future<void> seedOpData(List<Map<String, dynamic>> opData) async {
    final db = await DatabaseHelper.instance.database;
    var batch = db.batch();

    for (var item in opData) {
      OpModel opModel = OpModel.fromJson(item);
      batch.insert(
        DatabaseHelper.opTbl,
        opModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
    debugPrint("Op data seeded successfully.");
  }

  Future<void> seedStatesData(List<Map<String, dynamic>> statesData) async {
    debugPrint('Seeding states_tbl started');

    final db = await DatabaseHelper.instance.database;

    var batch = db.batch();

    for (var item in statesData) {
      StateModel statesModel = StateModel.fromJson(item);
      batch.insert(
        DatabaseHelper.statesTbl,
        statesModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);

    debugPrint('Seeding states_tbl completed successfully');
  }

  Future<void> seedUsersData(List<Map<String, dynamic>> usersData) async {
    debugPrint('Seeding tblusers started');

    final db = await DatabaseHelper.instance.database;

    var batch = db.batch();

    for (var item in usersData) {
      UserModel userModel = UserModel.fromJson(item);

      batch.insert(
        DatabaseHelper.tblusers,
        userModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);

    debugPrint('Seeding tblusers completed successfully');
  }

  Future<void> seedTownTerritoryData(List<Map<String, dynamic>> data) async {
    debugPrint('Seeding town_territory_tbl started');

    final db = await DatabaseHelper.instance.database;
    var batch = db.batch();

    for (var item in data) {
      TownTerritoryModel townTerritoryModel = TownTerritoryModel.fromJson(item);

      batch.insert(
        townTerritoryTbl,
        townTerritoryModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);

    debugPrint('Seeding town_territory_tbl completed successfully');
  }

  // CRUD operations:

  // Insert
}
