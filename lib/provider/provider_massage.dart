import 'package:easy_whats/screens/email/emailScreen.dart';
import 'package:easy_whats/screens/sms/smsScreen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../main.dart';
import '../screens/massages/message_setting.dart';

import '../screens/whats/whats_screen.dart';
import '../shared/constants/constants.dart';

class MessageProvider extends ChangeNotifier {
  List<Map> allMassage = [];

  late int massageIndex = 0;
  List<Map> massageMaster = [
    {
      'title': sharedPreferences.getString('MasterTitle') ?? ' الرئيسية',
      'massage': sharedPreferences.getString('MasterMessage') ??
          ' السلام عليكم ورحمة الله وبركات'
    }
  ];
   int id = sharedPreferences.getInt('id')??0;
  String titleMessageApp =
      "${sharedPreferences.getString('MasterTitle') ?? "موضوع الرسالة"} ";
  String messageApp =
      "${sharedPreferences.getString('MasterMessage') ?? "السلام عليكم ورحمة الله وبركاته"}";

  chackAllMassage(int index) async {
    if (index==0) {
      await sharedPreferences.remove('MasterTitle');
      await sharedPreferences.remove('MasterMessage');
      print('sharadPrf NULL => ${sharedPreferences.getString('MasterTitle')}');
       titleMessageApp ="رسالة";
       messageApp ="السلام عليكم ورحمة الله وبركاته" ;

    }
    notifyListeners();
  }

  changeMessageInAllApp(int index) async {
    sharedPreferences.setString('MasterTitle', allMassage[index]['title']);
    sharedPreferences.setString('MasterMessage', allMassage[index]['massage']);
    massageMaster[0]['title'] = allMassage[index]['title'];
    massageMaster[0]['massage'] = allMassage[index]['massage'];
    titleMessageApp =

        /// change message in all app
        '${allMassage[index]['title']}';
    messageApp = '${allMassage[index]['massage']}';
    notifyListeners();
  }

  void changeMassage(int index) {
    massageIndex = index;
    notifyListeners();
  }

  List<Widget> screen = [
    WhatsappScreen(),
    sms_screen(),
    email_screen(),
    MessageScreen(),
  ];
  List<String> title = [
    'Whatsapp Services',
    'SMS Services',
    'Email Services ',
    'Message Setting ',
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

  updateDatabase(
      {required String title, required String massage, required int id}) async {
    await database?.rawUpdate(
        'UPDATE $tableName SET title = ?, massage = ? WHERE id = ?',
        [title, massage, '$id']).then((value) {
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
