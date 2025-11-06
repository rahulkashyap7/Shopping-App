import 'package:get_storage/get_storage.dart';

class RLocalStorage {

  late final GetStorage _storage;

  // Singleton Instance
  static RLocalStorage? _instance;
  
  RLocalStorage._internal();

  factory RLocalStorage.instance() {
    _instance ??= RLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = RLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  // Generic method to dave data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

//   Generic method to read Data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

// Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

// Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
