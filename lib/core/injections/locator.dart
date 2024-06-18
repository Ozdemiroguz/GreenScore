import 'package:get_it/get_it.dart';
import 'package:greenapp/features/map/domain/repositories/map_repository.dart';
import 'package:greenapp/features/profile/domain/repositories/profile_repository.dart';
import 'package:greenapp/services/location/location_service.dart';
import 'package:greenapp/services/user_service/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/qr/domain/repositories/gemini.repository.dart';
import '../../features/qr/domain/repositories/product_repository.dart';
import '../../router/router.dart';
import 'locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: true)
Future<void> configureDependencies() => getIt.init();

final appRouterProvider = Provider.autoDispose((ref) => getIt<AppRouter>());

final authRepositoryProvider =
    Provider.autoDispose((ref) => getIt<AuthRepository>());

final geminiRepositoryProvider =
    Provider.autoDispose((ref) => getIt<GeminiRepository>());

final homeRepositoryProvider =
    Provider.autoDispose((ref) => getIt<HomeRepository>());

final prodcuctRepositoryProvider =
    Provider.autoDispose((ref) => getIt<ProductRepository>());

final mapRepositoryProvider =
    Provider.autoDispose((ref) => getIt<MapRepository>());

final userServiceProvider = Provider((ref) => getIt<UserService>());

final locationServiceProvier = Provider((ref) => getIt<LocationService>());

final profileRepositoryProvider =
    Provider.autoDispose((ref) => getIt<ProfileRepository>());
