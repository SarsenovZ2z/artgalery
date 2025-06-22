import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferences sharedPreferences;

  const LocalDataSource({
    required this.sharedPreferences,
  });
}
