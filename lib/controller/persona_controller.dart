import 'package:integranic_movil_cliente/models/persona.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PersonController {
  static var database;
  Future<void> initDataBase() async {
    PersonController.database = openDatabase(
      join(await getDatabasesPath(), 'users_and.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE Persona(id INTEGER PRIMARY KEY, nombre TEXT, usuario TEXT, password TEXT, especialidad TEXT,estadoCivil TEXT, habilidades TEXT)',
        );
      },
      version: 1,
    );
    print("donete");
  }

  Future<void> addPerson(Persona person) async {
    final db = await database;
    await db.insert(
      'Persona',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Persona>> getPersonas() async {
    final db = await PersonController.database;
    final List<Map<String, dynamic>> maps = await db.query('Persona');
    return List.generate(maps.length, (index) {
      var list = (maps[index]['habilidades'] ?? "" as String).split('/');
      print("loaded");
      return Persona(
          maps[index]['id'] ?? "",
          maps[index]['nombre'] ?? "",
          maps[index]['usuario'] ?? "",
          maps[index]['password'] ?? "",
          maps[index]['especialidad'] ?? "",
          maps[index]['estadoCivil'] ?? "",
          list ?? []);
    }).toList() as List<Persona>;
  }
}
