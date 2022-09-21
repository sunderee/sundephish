import 'package:get_it/get_it.dart';
import 'package:sundephish/core/api/api.provider.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  final provider = ApiProvider(
    groupID: const String.fromEnvironment('ID', defaultValue: 'test'),
    baseHostname: const String.fromEnvironment(
      'URL',
      defaultValue: 'localhost:3000',
    ),
  );
  getIt.registerSingleton<IApiProvider>(provider);
}
