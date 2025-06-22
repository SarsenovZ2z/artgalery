import 'package:artgalery/src/utils/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UnsplashClient extends Api {
  UnsplashClient() : super() {
    final unsplashKey = dotenv.get('UNSPLASH_ACCESS_KEY');
    instance.options.baseUrl = "https://api.unsplash.com";
    instance.options.headers['Authorization'] = "Client-ID $unsplashKey";
  }
}
