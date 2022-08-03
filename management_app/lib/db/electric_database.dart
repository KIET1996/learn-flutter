import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/Electric.dart';

class ElectricDatabase {
  static final ElectricDatabase instance = ElectricDatabase._init();

  static Database? _database;

  ElectricDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('electric.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const doubleType = 'DOUBLE NOT NULL';

    await db.execute('''
      CREATE TABLE $tableElectric ( 
        ${ElectricFields.id} $idType, 
        ${ElectricFields.monthYear} $textType,
        ${ElectricFields.indicator} $doubleType,
        ${ElectricFields.quantity} $doubleType,
        ${ElectricFields.price} $doubleType,
        ${ElectricFields.time} $textType
        )
      ''');
  }

  Future<Electric> create(Electric electric) async {
    final db = await instance.database;

    // final json = Electricelectric.toJson();
    // final columns =
    //     '${ElectricFields.title}, ${ElectricFields.description}, ${ElectricFields.time}';
    // final values =
    //     '${json[ElectricFields.title]}, ${json[ElectricFields.description]}, ${json[ElectricFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableElectric, electric.toJson());
    return electric.copy(id: id);
  }

  Future<Electric> readElectric(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableElectric,
      columns: ElectricFields.values,
      where: '${ElectricFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Electric.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Electric>> readAllElectrics() async {
    final db = await instance.database;

    final orderBy = '${ElectricFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableElectrics ORDER BY $orderBy');

    final result = await db.query(tableElectric, orderBy: orderBy);

    return result.map((json) => Electric.fromJson(json)).toList();
  }

  Future<int> update(Electric electric) async {
    final db = await instance.database;

    return db.update(
      tableElectric,
      electric.toJson(),
      where: '${ElectricFields.id} = ?',
      whereArgs: [electric.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableElectric,
      where: '${ElectricFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}