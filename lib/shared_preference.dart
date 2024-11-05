import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String guestAuthTokenKey = "GUEST_AUTH_TOKEN_KEY";
  static const String sessionIdKey = "SESSION_ID";
  static const String isLoggedInKey = "IS_LOGGED";
  static const String userNameKey = "USER_NAME";
  static const String sessionIdleKey = "SESSION_IDLE_TIME";
  static const String accountSessionLogInfo = "ACCOUNT_SESSION_LOG_INFO";
   static const String savePasswordkey = "PASSWORD";

  static Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(guestAuthTokenKey) ?? '';
  }

  static saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(guestAuthTokenKey, token);
  }

    static Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(savePasswordkey) ?? '';
  }

  static savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(savePasswordkey, password);
  }

  static Future<String> getSessionToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(sessionIdKey) ?? '';
  }

  static saveSessionToken(String token) async {
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

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey) ?? '';
  }

  static setUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userNameKey, userName);
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

  static login({String? authToken, String? sessionId, String? userNmae,String? password}) async {
    saveAuthToken(authToken!);
    saveSessionToken(sessionId!);
    saveIsLogged(true);
    setUserName(userNmae!);
    savePassword(password!);
  }
}
