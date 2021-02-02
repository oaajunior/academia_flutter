import 'package:sqflite/sqlite_api.dart';

void createV1(Batch batch) {
  batch.execute('''CREATE TABLE todo(
                  id Integer PRIMARY KEY AUTOINCREMENT,
                  descricao varchar(500) NOT NULL,
                  data_hora datetime,
                  finalizado Integer)''');
}
