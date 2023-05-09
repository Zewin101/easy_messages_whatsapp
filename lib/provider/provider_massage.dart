import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../screens/setting/setting_view.dart';
import '../screens/whats/whats_view.dart';
import '../shared/constants/constants.dart';

class MyProvider extends ChangeNotifier {

  List<Map> allMassage = [];
  late int massageIndex=0;
  List<Map> massageMaster = [{'title': 'الرئيسية', 'massage': 'السلام عليكم ورحمة الله وبركاتة'}];
  void changeMassage(int index){
    massageIndex=index;
    notifyListeners();
  }



  List<Widget> screen = [
    WhatsappScreen(),
    Setting_Screen(),
  ];
  List<String> title = [
    'Whats App Services',
    'Whats App Services 2',
  ];

  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
  Database? database;
  createDatabase() {
    openDatabase(
      'whatsapp.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        title TEXT, massage TEXT)''');
        print("table created ");
      },
      onOpen: (database) async {
        readDatabase(database);
      },
    ).then((value) {
      database = value;
    });
    notifyListeners();
  }

  insertDatabase({required String title, required String massage}) async {
    await database?.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO $tableName(title, massage) VALUES("$title","$massage")')
          .then((value) {
        print("$value inserted successfully");
        readDatabase(database);
      }).catchError((onError) {
        print('error insert =====');
      });
    });
  }

  void readDatabase(database) {
    database?.rawQuery('SELECT * FROM $tableName').then((value) {
      allMassage = value;
      print(allMassage);
      notifyListeners();
    });
  }
}
