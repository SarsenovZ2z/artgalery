import 'package:artgalery/src/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MixedDataSource {
  final Api api;
  final SharedPreferences sharedPreferences;

  const MixedDataSource({
    required this.api,
    required this.sharedPreferences,
  });
}
