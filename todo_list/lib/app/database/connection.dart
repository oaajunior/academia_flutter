import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:synchronized/synchronized.dart';
import 'package:todo_list/app/database/migrations/migration_v1.dart';
import 'package:todo_list/app/database/migrations/migration_v2.dart';

class Connection {
  static const VERSION = 1;
  static const DATABASE_NAME = 'todo_list.db';
  static Connection _instance;
  Database _db;
  Lock _lock;

  factory Connection() {
    //O factory, pelo que entendi do Prof. Rahman, permite customizar o construtor.
    //Exemplo de criação de um singleton
    if (_instance == null) {
      _instance = Connection._();
    }
    return _instance;
  }

  Connection._(); //construtor privado no flutter

  Future<Database> get instance async => await _openConnection();

  Future<Database> _openConnection() async {
    _lock = Lock();
    if (_db == null) {
      await _lock.synchronized(() async {
        //esse _lock.synchronized é para lockar o processo concorrente.
        //parece o cobol, muito legal. Assim, existirá apenas uma única
        //conexão do banco de dados.
        if (_db == null) {
          //tem 2 checks de null porque, se o 1º passou e lockou
          //quando for deslockado, e o 2º processo passar do lock a
          //variável _db já não vai mais ser null.
          var databasePath = await getDatabasesPath();
          var pathDatabase = join(databasePath, DATABASE_NAME);
          _db = await openDatabase(
            pathDatabase,
            version: VERSION,
            onConfigure: _onConfigure,
            onCreate: _onCreate,
            onUpgrade: _onUpgrade,
          );
        }
      });
    }
    return _db;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  FutureOr<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreing_keys = ON'); //Essa configuração faz com
    //que as foreing key sejam deletadas se seus relacionamentos
    //não mais existirem.
  }

  FutureOr<void> _onCreate(Database db, int version) {
    var batch = db.batch();
    createV1(batch);
    batch.commit();
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    var batch = db.batch();
    //old == 1
    if (oldVersion < 2) {
      upgradeV2(batch);
    } //Aqui o professor Rodrigo deu uma dica para
    //realizar atualizacao de versoes de banco de dados
    // e ter cuidado para, por exemplo, nao pular nenhuma
    //versao de atualizacao.
    //old == 1
    if (oldVersion < 3) {
      //upgradeV3(batch);
    }

    batch.commit();
  }
}
