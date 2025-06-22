import 'package:artgalery/src/utils/api.dart';
import 'package:artgalery/src/utils/unsplash_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/service_provider.dart';
import 'features/home/home_service_provider.dart';

const services = <ServiceProvider>[
  HomeServiceProvider(),
];

Future<void> init() async {
  for (var provider in services) {
    provider.register();
  }

  GetIt.instance.registerLazySingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  GetIt.instance.registerLazySingleton<Api>(
    () => Api(),
  );

  GetIt.instance.registerLazySingleton<UnsplashClient>(
    () => UnsplashClient(),
  );

  return GetIt.instance.allReady();
}
