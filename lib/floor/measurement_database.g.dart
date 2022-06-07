// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorMeasurementDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MeasurementDatabaseBuilder databaseBuilder(String name) =>
      _$MeasurementDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MeasurementDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MeasurementDatabaseBuilder(null);
}

class _$MeasurementDatabaseBuilder {
  _$MeasurementDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$MeasurementDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MeasurementDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MeasurementDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$MeasurementDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MeasurementDatabase extends MeasurementDatabase {
  _$MeasurementDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MeasurementDao _measurementDaoInstance;

  RawMeasurementDataDao _rawMeasurementDataDaoInstance;

  CogvDataDao _cogvDataDaoInstance;

  WomDao _womDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `measurements` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `token` TEXT, `creation_date` INTEGER NOT NULL, `invalid` INTEGER, `initCondition` INTEGER, `sent` INTEGER, `eyes_open` INTEGER NOT NULL, `note` TEXT NOT NULL, `has_features` INTEGER NOT NULL, `sway_path` REAL, `mean_displacement` REAL, `std_displacement` REAL, `range_min` REAL, `range_max` REAL, `mean_frequency_ap` REAL, `mean_frequency_ml` REAL, `frequency_peak_ap` REAL, `frequency_peak_ml` REAL, `f80_ap` REAL, `f80_ml` REAL, `num_max` REAL, `mean_time` REAL, `std_time` REAL, `mean_distance` REAL, `std_distance` REAL, `mean_peaks` REAL, `std_peaks` REAL, `gr_x` REAL, `gr_y` REAL, `gr_z` REAL, `gm_x` REAL, `gm_y` REAL, `gm_z` REAL, `gv_x` REAL, `gv_y` REAL, `gv_z` REAL, `gk_x` REAL, `gk_y` REAL, `gk_z` REAL, `gs_x` REAL, `gs_y` REAL, `gs_z` REAL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `raw_measurements_data` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `token` TEXT, `measurement_id` INTEGER NOT NULL, `timestamp` INTEGER, `accuracy` INTEGER, `accelerometer_x` REAL, `accelerometer_y` REAL, `accelerometer_z` REAL, `gyroscope_x` REAL, `gyroscope_y` REAL, `gyroscope_z` REAL, FOREIGN KEY (`measurement_id`) REFERENCES `measurements` (`id`) ON UPDATE CASCADE ON DELETE CASCADE)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cogv_data` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `measurement_id` INTEGER NOT NULL, `ap` REAL, `ml` REAL, FOREIGN KEY (`measurement_id`) REFERENCES `measurements` (`id`) ON UPDATE CASCADE ON DELETE CASCADE)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `wom_vouchers` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `token` TEXT NOT NULL, `test` INTEGER NOT NULL, `otc` TEXT, `password` TEXT)');

        await database.execute(
            '''CREATE VIEW IF NOT EXISTS `tests` AS SELECT id, creation_date, eyes_open, invalid, sent, note, initCondition FROM measurements''');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  MeasurementDao get measurementDao {
    return _measurementDaoInstance ??=
        _$MeasurementDao(database, changeListener);
  }

  @override
  RawMeasurementDataDao get rawMeasurementDataDao {
    return _rawMeasurementDataDaoInstance ??=
        _$RawMeasurementDataDao(database, changeListener);
  }

  @override
  CogvDataDao get cogvDataDao {
    return _cogvDataDaoInstance ??= _$CogvDataDao(database, changeListener);
  }

  @override
  WomDao get womDao {
    return _womDaoInstance ??= _$WomDao(database, changeListener);
  }
}

class _$MeasurementDao extends MeasurementDao {
  _$MeasurementDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _measurementInsertionAdapter = InsertionAdapter(
            database,
            'measurements',
            (Measurement item) => <String, dynamic>{
                  'id': item.id,
                  'token': item.token,
                  'creation_date': item.creationDate,
                  'invalid': item.invalid ? 1 : 0,
                  'initCondition': item.initCondition,
                  'sent': item.sent ? 1 : 0,
                  'eyes_open': item.eyesOpen ? 1 : 0,
                  'note': item.note,
                  'has_features': item.hasFeatures ? 1 : 0,
                  'sway_path': item.swayPath,
                  'mean_displacement': item.meanDisplacement,
                  'std_displacement': item.stdDisplacement,
                  'range_min': item.minDist,
                  'range_max': item.maxDist,
                  'mean_frequency_ap': item.meanFrequencyAP,
                  'mean_frequency_ml': item.meanFrequencyML,
                  'frequency_peak_ap': item.frequencyPeakAP,
                  'frequency_peak_ml': item.frequencyPeakML,
                  'f80_ap': item.f80AP,
                  'f80_ml': item.f80ML,
                  'num_max': item.numMax,
                  'mean_time': item.meanTime,
                  'std_time': item.stdTime,
                  'mean_distance': item.meanDistance,
                  'std_distance': item.stdDistance,
                  'mean_peaks': item.meanPeaks,
                  'std_peaks': item.stdPeaks,
                  'gr_x': item.grX,
                  'gr_y': item.grY,
                  'gr_z': item.grZ,
                  'gm_x': item.gmX,
                  'gm_y': item.gmY,
                  'gm_z': item.gmZ,
                  'gv_x': item.gvX,
                  'gv_y': item.gvY,
                  'gv_z': item.gvZ,
                  'gk_x': item.gkX,
                  'gk_y': item.gkY,
                  'gk_z': item.gkZ,
                  'gs_x': item.gsX,
                  'gs_y': item.gsY,
                  'gs_z': item.gsZ
                }),
        _measurementUpdateAdapter = UpdateAdapter(
            database,
            'measurements',
            ['id'],
            (Measurement item) => <String, dynamic>{
                  'id': item.id,
                  'token': item.token,
                  'creation_date': item.creationDate,
                  'invalid': item.invalid ? 1 : 0,
                  'initCondition': item.initCondition,
                  'sent': item.sent ? 1 : 0,
                  'eyes_open': item.eyesOpen ? 1 : 0,
                  'note': item.note,
                  'has_features': item.hasFeatures ? 1 : 0,
                  'sway_path': item.swayPath,
                  'mean_displacement': item.meanDisplacement,
                  'std_displacement': item.stdDisplacement,
                  'range_min': item.minDist,
                  'range_max': item.maxDist,
                  'mean_frequency_ap': item.meanFrequencyAP,
                  'mean_frequency_ml': item.meanFrequencyML,
                  'frequency_peak_ap': item.frequencyPeakAP,
                  'frequency_peak_ml': item.frequencyPeakML,
                  'f80_ap': item.f80AP,
                  'f80_ml': item.f80ML,
                  'num_max': item.numMax,
                  'mean_time': item.meanTime,
                  'std_time': item.stdTime,
                  'mean_distance': item.meanDistance,
                  'std_distance': item.stdDistance,
                  'mean_peaks': item.meanPeaks,
                  'std_peaks': item.stdPeaks,
                  'gr_x': item.grX,
                  'gr_y': item.grY,
                  'gr_z': item.grZ,
                  'gm_x': item.gmX,
                  'gm_y': item.gmY,
                  'gm_z': item.gmZ,
                  'gv_x': item.gvX,
                  'gv_y': item.gvY,
                  'gv_z': item.gvZ,
                  'gk_x': item.gkX,
                  'gk_y': item.gkY,
                  'gk_z': item.gkZ,
                  'gs_x': item.gsX,
                  'gs_y': item.gsY,
                  'gs_z': item.gsZ
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _measurementsMapper = (Map<String, dynamic> row) => Measurement(
      id: row['id'] as int,
      token: row['token'] as String,
      invalid: (row['invalid'] as int) != 0,
      initCondition: row['initCondition'] as int,
      sent: (row['sent'] as int) != 0,
      note: row['note'] as String,
      creationDate: row['creation_date'] as int,
      eyesOpen: (row['eyes_open'] as int) != 0,
      hasFeatures: (row['has_features'] as int) != 0,
      swayPath: row['sway_path'] as double,
      meanDisplacement: row['mean_displacement'] as double,
      stdDisplacement: row['std_displacement'] as double,
      minDist: row['range_min'] as double,
      maxDist: row['range_max'] as double,
      frequencyPeakAP: row['frequency_peak_ap'] as double,
      frequencyPeakML: row['frequency_peak_ml'] as double,
      meanFrequencyML: row['mean_frequency_ml'] as double,
      meanFrequencyAP: row['mean_frequency_ap'] as double,
      f80ML: row['f80_ml'] as double,
      f80AP: row['f80_ap'] as double,
      numMax: row['num_max'] as double,
      meanTime: row['mean_time'] as double,
      stdTime: row['std_time'] as double,
      meanDistance: row['mean_distance'] as double,
      stdDistance: row['std_distance'] as double,
      meanPeaks: row['mean_peaks'] as double,
      stdPeaks: row['std_peaks'] as double,
      gsX: row['gs_x'] as double,
      gsY: row['gs_y'] as double,
      gsZ: row['gs_z'] as double,
      gkX: row['gk_x'] as double,
      gkY: row['gk_y'] as double,
      gkZ: row['gk_z'] as double,
      gmX: row['gm_x'] as double,
      gmY: row['gm_y'] as double,
      gmZ: row['gm_z'] as double,
      gvX: row['gv_x'] as double,
      gvY: row['gv_y'] as double,
      gvZ: row['gv_z'] as double,
      grX: row['gr_x'] as double,
      grY: row['gr_y'] as double,
      grZ: row['gr_z'] as double);

  static final _testsMapper = (Map<String, dynamic> row) => Test(
      id: row['id'] as int,
      creationDate: row['creation_date'] as int,
      eyesOpen: (row['eyes_open'] as int) != 0,
      invalid: (row['invalid'] as int) != 0,
      sent: (row['sent'] as int) != 0,
      note: row['note'] as String,
      initialCondition: row['initCondition'] as int);

  final InsertionAdapter<Measurement> _measurementInsertionAdapter;

  final UpdateAdapter<Measurement> _measurementUpdateAdapter;

  @override
  Future<List<Measurement>> getAllMeasurements() async {
    return _queryAdapter.queryList('SELECT * FROM measurements',
        mapper: _measurementsMapper);
  }

  @override
  Future<Measurement> findMeasurementById(int id) async {
    return _queryAdapter.query('SELECT * FROM measurements WHERE id = ?',
        arguments: <dynamic>[id], mapper: _measurementsMapper);
  }

  @override
  Future<Test> findTestById(int id) async {
    return _queryAdapter.query('SELECT * FROM tests WHERE id = ?',
        arguments: <dynamic>[id], mapper: _testsMapper);
  }

  @override
  Future<List<Test>> getAllTests() async {
    return _queryAdapter.queryList('SELECT * FROM tests', mapper: _testsMapper);
  }

  @override
  Future<int> insertMeasurement(Measurement measurement) {
    return _measurementInsertionAdapter.insertAndReturnId(
        measurement, sqflite.ConflictAlgorithm.ignore);
  }

  @override
  Future<int> updateMeasurement(Measurement measurement) {
    return _measurementUpdateAdapter.updateAndReturnChangedRows(
        measurement, sqflite.ConflictAlgorithm.ignore);
  }
}

class _$RawMeasurementDataDao extends RawMeasurementDataDao {
  _$RawMeasurementDataDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _rawMeasurementDataInsertionAdapter = InsertionAdapter(
            database,
            'raw_measurements_data',
            (RawMeasurementData item) => <String, dynamic>{
                  'id': item.id,
                  'token': item.token,
                  'measurement_id': item.measurementId,
                  'timestamp': item.timestamp,
                  'accuracy': item.accuracy,
                  'accelerometer_x': item.accelerometerX,
                  'accelerometer_y': item.accelerometerY,
                  'accelerometer_z': item.accelerometerZ,
                  'gyroscope_x': item.gyroscopeX,
                  'gyroscope_y': item.gyroscopeY,
                  'gyroscope_z': item.gyroscopeZ
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _raw_measurements_dataMapper = (Map<String, dynamic> row) =>
      RawMeasurementData(
          id: row['id'] as int,
          token: row['token'] as String,
          measurementId: row['measurement_id'] as int,
          timestamp: row['timestamp'] as int,
          accuracy: row['accuracy'] as int,
          accelerometerX: row['accelerometer_x'] as double,
          accelerometerY: row['accelerometer_y'] as double,
          accelerometerZ: row['accelerometer_z'] as double,
          gyroscopeX: row['gyroscope_x'] as double,
          gyroscopeY: row['gyroscope_y'] as double,
          gyroscopeZ: row['gyroscope_z'] as double);

  final InsertionAdapter<RawMeasurementData>
      _rawMeasurementDataInsertionAdapter;

  @override
  Future<List<RawMeasurementData>> findAllRawMeasDataForId(
      int measurementId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM raw_measurements_data WHERE measurement_id = ?',
        arguments: <dynamic>[measurementId],
        mapper: _raw_measurements_dataMapper);
  }

  @override
  Future<List<RawMeasurementData>> getAllData() async {
    return _queryAdapter.queryList('SELECT * FROM raw_measurements_data',
        mapper: _raw_measurements_dataMapper);
  }

  @override
  Future<List<int>> insertRawMeasurements(List<RawMeasurementData> measData) {
    return _rawMeasurementDataInsertionAdapter.insertListAndReturnIds(
        measData, sqflite.ConflictAlgorithm.ignore);
  }
}

class _$CogvDataDao extends CogvDataDao {
  _$CogvDataDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _cogvDataInsertionAdapter = InsertionAdapter(
            database,
            'cogv_data',
            (CogvData item) => <String, dynamic>{
                  'id': item.id,
                  'measurement_id': item.measurementId,
                  'ap': item.ap,
                  'ml': item.ml
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _cogv_dataMapper = (Map<String, dynamic> row) => CogvData(
      id: row['id'] as int,
      measurementId: row['measurement_id'] as int,
      ap: row['ap'] as double,
      ml: row['ml'] as double);

  final InsertionAdapter<CogvData> _cogvDataInsertionAdapter;

  @override
  Future<List<CogvData>> findAllCogvDataForId(int measurementId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM cogv_data WHERE measurement_id = ?',
        arguments: <dynamic>[measurementId],
        mapper: _cogv_dataMapper);
  }

  @override
  Future<List<CogvData>> getAllData() async {
    return _queryAdapter.queryList('SELECT * FROM cogv_data',
        mapper: _cogv_dataMapper);
  }

  @override
  Future<List<int>> insertCogvData(List<CogvData> cogvs) {
    return _cogvDataInsertionAdapter.insertListAndReturnIds(
        cogvs, sqflite.ConflictAlgorithm.ignore);
  }
}

class _$WomDao extends WomDao {
  _$WomDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _womVoucherInsertionAdapter = InsertionAdapter(
            database,
            'wom_vouchers',
            (WomVoucher item) => <String, dynamic>{
                  'id': item.id,
                  'token': item.token,
                  'test': item.test,
                  'otc': item.otc,
                  'password': item.password
                }),
        _womVoucherUpdateAdapter = UpdateAdapter(
            database,
            'wom_vouchers',
            ['id'],
            (WomVoucher item) => <String, dynamic>{
                  'id': item.id,
                  'token': item.token,
                  'test': item.test,
                  'otc': item.otc,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _wom_vouchersMapper = (Map<String, dynamic> row) => WomVoucher(
      id: row['id'] as int,
      token: row['token'] as String,
      test: row['test'] as int,
      otc: row['otc'] as String,
      password: row['password'] as String);

  final InsertionAdapter<WomVoucher> _womVoucherInsertionAdapter;

  final UpdateAdapter<WomVoucher> _womVoucherUpdateAdapter;

  @override
  Future<WomVoucher> getWom(String token, int test) async {
    return _queryAdapter.query(
        'SELECT * FROM wom_vouchers WHERE token = ? AND test = ?',
        arguments: <dynamic>[token, test],
        mapper: _wom_vouchersMapper);
  }

  @override
  Future<List<WomVoucher>> getAllWom() async {
    return _queryAdapter.queryList('SELECT * FROM wom_vouchers',
        mapper: _wom_vouchersMapper);
  }

  @override
  Future<WomVoucher> findWomById(int id) async {
    return _queryAdapter.query('SELECT * FROM wom_vouchers WHERE id = ?',
        arguments: <dynamic>[id], mapper: _wom_vouchersMapper);
  }

  @override
  Future<int> insertWom(WomVoucher wom) {
    return _womVoucherInsertionAdapter.insertAndReturnId(
        wom, sqflite.ConflictAlgorithm.ignore);
  }

  @override
  Future<int> updateWom(WomVoucher wom) {
    return _womVoucherUpdateAdapter.updateAndReturnChangedRows(
        wom, sqflite.ConflictAlgorithm.ignore);
  }
}
