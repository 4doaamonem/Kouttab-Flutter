import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorageService {
  static const _tokenKey = 'auth_token';
  static const _hasSeenOnboardingKey = 'has_seen_onboarding';
  
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  // --- Token Methods ---
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  // --- Onboarding Methods ---
  Future<void> setOnboardingSeen() async {
    await _storage.write(key: _hasSeenOnboardingKey, value: 'true');
  }

  Future<bool> isFirstTime() async {
    final val = await _storage.read(key: _hasSeenOnboardingKey);
    return val == null; // If null, it's the first time
  }
}