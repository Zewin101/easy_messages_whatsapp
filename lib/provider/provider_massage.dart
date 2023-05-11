import 'package:easy_whats/screens/email/emailScreen.dart';
import 'package:easy_whats/screens/sms/smsScreen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../screens/massages/message_setting.dart';
import '../screens/setting/setting.dart';
import '../screens/whats/whats_view.dart';
import '../shared/constants/constants.dart';

class MessageProvider extends ChangeNotifier {
  List<Map> allMassage = [];
  late int massageIndex = 0;
  List<Map> massageMaster = [
    {'title': 'الرئيسية', 'massage': 'السلام عليكم ورحمة الله وبركاتة'}
  ];

  void changeMassage(int index) {
    massageIndex = index;
    notifyListeners();
  }

  List<Widget> screen = [
    WhatsappScreen(),
    sms_screen(),
    email_screen(),
    MessageScreen(),
    Setting_Screen(),
  ];
  List<String> title = [
    'Whatsapp Services',
    'SMS Services',
    'Email Services ',
    'Message Setting ',
    'Setting ',
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
  updateDatabase({required String title, required String massage,required int id}) async {
    await database?.rawUpdate(
        'UPDATE $tableName SET title = ?, massage = ? WHERE id = ?',
        ['updated name', '9876', '$id']).then((value) {
      print("$value update successfully");
      readDatabase(database);
    }).catchError((onError) {
      print('error update ===== $onError');
    });
  }
  deleteRowInDatabase({required int id}) async {
    await database
        ?.rawDelete('DELETE FROM $tableName WHERE id = $id')
        .then((value) {
      print("$value delete successfully");
      readDatabase(database);
    }).catchError((onError) {
      print('error delete ===== $onError');
    });
  }
  readDatabase(database) {
    database?.rawQuery('SELECT * FROM $tableName').then((value) {
      allMassage = value;
      print(allMassage);
      notifyListeners();
    });
  }
}
