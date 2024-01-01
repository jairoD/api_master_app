import 'package:shared_preferences/shared_preferences.dart';

enum StorageTypes { BOOL, DOUBLE, INT, STRING, LIST }

class SharedPreferencesService {
  Future<dynamic> getData(StorageTypes type, String name) async {
    try {
      SharedPreferences data = await SharedPreferences.getInstance();
      switch (type) {
        case StorageTypes.BOOL:
          return data.getBool(name);
        case StorageTypes.DOUBLE:
          return data.getDouble(name);
        case StorageTypes.INT:
          return data.getInt(name);
        case StorageTypes.STRING:
          return data.getString(name);
        case StorageTypes.LIST:
          return data.getStringList(name);
        default:
          return data.get(name);
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveData(StorageTypes type, dynamic value, String key) async {
    try {
      SharedPreferences data = await SharedPreferences.getInstance();
      switch (type) {
        case StorageTypes.BOOL:
          return data.setBool(key, value);
        case StorageTypes.DOUBLE:
          return data.setDouble(key, value);
        case StorageTypes.INT:
          return data.setInt(key, value);
        case StorageTypes.STRING:
          return data.setString(key, value);
        case StorageTypes.LIST:
          return data.setStringList(key, value);
        default:
          return data.setString(key, value);
      }
    } catch (e) {
      return false;
    }
  }
}
