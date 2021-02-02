import 'package:sqflite/sqlite_api.dart';

void createV2(Batch batch) {
  batch.execute('''CREATE TABLE  teste (id Integer)''');
}

void upgradeV2(Batch batch) {
  batch.execute('''CREATE TABLE  teste (id Integer)''');
}
