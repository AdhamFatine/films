import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SQLdb{
  static Database? _db;
  Future<Database?> get db async{
    if (_db == null){
      _db = await initialisation();
      return _db;
    }else{
      return _db;
    }
  }

  //-------------------- Methode qui nous retourne la Base de Données
  Future<Database> initialisation() async{
    String db_path = await getDatabasesPath(); 
    String path = join(db_path, "Cinema");
    Database mydb = await openDatabase(path, onCreate: _createDB, version: 1);
    return mydb;
  }

  //-------------------- Methode qui nous crée la Table
  _createDB(Database db, int version) async{
    await db.execute('''
    CREATE TABLE "films" (
    "id" INTEGER PRYMARY KEY AUTOINCREMENT,
    "titre" TEXT NOT NULL,
    "duree" INT NOT NULL
    )
    ''');
    print("============= DATABASE is created =============");
  }

  //-------------------- CRUD
  /* -------------------- Insert (Ajouter) ---------------------*/
  Future<int> insertData(String sql) async{
    Database? mydb = await db;
    int rep = await mydb!.rawInsert(sql);
    return rep;
  }
  /* -------------------- Select (Lecture/lire) ---------------------*/
  Future<List<Map>> selectAllData(String sql) async{
    Database? mydb = await db;
    List<Map> rep = await mydb!.rawQuery(sql);
    return rep;
  }
  /* ------------------- Update (Modifier) ---------------------*/
  Future<int> updateData(String sql) async{
    Database? mydb = await db;
    int rep = await mydb!.rawUpdate(sql);
    return rep;
  }
  /* ------------------- Delete (Supprimer) ---------------------*/
  Future<int> deleteData(String sql) async{
    Database? mydb = await db;
    int rep = await mydb!.rawDelete(sql);
    return rep;
  }


}