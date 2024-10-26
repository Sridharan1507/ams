import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String guestAuthTokenKey = "GUEST_AUTH_TOKEN_KEY";
  static const String sessionIdKey = "SESSION_ID";
  static const String isLoggedInKey = "IS_LOGGED";
  static const String mobileNumberKey = "MOBILE_NUMER";
  static const String sessionIdleKey = "SESSION_IDLE_TIME";
  static const String accountSessionLogInfo = "ACCOUNT_SESSION_LOG_INFO";

  static Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(guestAuthTokenKey) ?? '';
  }

  static saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(guestAuthTokenKey, token);
  }

  static Future<String> getSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionIdKey) ?? '';
  }

  static saveSessionId(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(sessionIdKey, token);
  }

  static Future<String> getSessionIdleTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionIdleKey) ?? '';
  }

  static saveSessionIdleTime(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(sessionIdleKey, token);
  }

  static Future<bool> getIsLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  static saveIsLogged(bool isLogged) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoggedInKey, isLogged);
  }

  static Future<String> getMobileNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(mobileNumberKey) ?? '';
  }

  static setMobileNumber(String mobileNum) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(mobileNumberKey, mobileNum);
  }

  static logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<String> getAccountSessionLogInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accountSessionLogInfo) ?? '';
  }

  static saveAccountSessionLogInfo(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(accountSessionLogInfo, token);
  }

  static login(String authToken, String sessionId, String mobileNum) async {
    saveAuthToken(authToken);
    saveSessionId(sessionId);
    saveIsLogged(true);
    setMobileNumber(mobileNum);
  }
}
