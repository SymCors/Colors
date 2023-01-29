import 'dart:convert';

import 'package:colors/core/constants/constants.dart';
import 'package:colors/core/models/color_save_model/color_save_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// This file contains the HiveRepository class
class HiveRepository {
  /// This method initializes the Hive database.
  static Future<void> initHive() async {
    const secureStorage = FlutterSecureStorage();
    final encryptionKey =
        await secureStorage.read(key: Constants.appStorageKey);
    if (encryptionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: Constants.appStorageKey,
        value: base64UrlEncode(key),
      );
    }
  }

  /// This method registers the Hive database.
  static void registerHiveAdapters() {
    Hive.registerAdapter<ColorSaveModel>(ColorSaveModelAdapter());
  }

  /// This method opens the Hive box.
  static Future<Box<T>> openBox<T>(String boxName) async {
    const secureStorage = FlutterSecureStorage();
    final key = await secureStorage.read(key: Constants.appStorageKey) ?? '';
    final encryptionKeyRead = base64Url.decode(key);


    return Hive.openBox<T>(
      boxName,
      encryptionCipher: HiveAesCipher(encryptionKeyRead),
    );
  }
}
