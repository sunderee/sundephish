import 'package:get_it/get_it.dart';
import 'package:sundephish/core/api/api.provider.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies() {
  final provider = ApiProvider(
    groupID: const String.fromEnvironment('ID'),
    baseHostname: const String.fromEnvironment('URL'),
  );
  getIt.registerSingleton<IApiProvider>(provider);
}
