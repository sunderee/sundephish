import 'package:get_it/get_it.dart';
import 'package:sundephish/core/api/api.provider.dart';

final GetIt getIt = GetIt.instance;

void configureDependencies(String groupID) {
  final provider = ApiProvider(
    groupID: groupID,
    baseHostname: const String.fromEnvironment('URL'),
  );
  getIt.registerSingleton<IApiProvider>(provider);
}
