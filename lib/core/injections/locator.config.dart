// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:flutter_gemini/flutter_gemini.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i16;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i15;
import '../../features/home/data/repostitories/home_repository_impl.dart'
    as _i10;
import '../../features/home/domain/repositories/home_repository.dart' as _i9;
import '../../features/map/data/repositories/map_repository_impl.dart' as _i18;
import '../../features/map/domain/repositories/map_repository.dart' as _i17;
import '../../features/profile/data/repositories/profile_repository_imp.dart'
    as _i24;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i23;
import '../../features/qr/data/repositories/gemini_repository_impl.dart'
    as _i22;
import '../../features/qr/data/repositories/product_repository_impl.dart'
    as _i12;
import '../../features/qr/domain/repositories/gemini.repository.dart' as _i21;
import '../../features/qr/domain/repositories/product_repository.dart' as _i11;
import '../../router/router.dart' as _i3;
import '../../services/location/location_service.dart' as _i13;
import '../../services/location/location_service_impl.dart' as _i14;
import '../../services/user_service/user_service.dart' as _i19;
import '../../services/user_service/user_service_impl.dart' as _i20;
import 'register_module.dart' as _i25;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppRouter>(() => registerModule.appRouter);
    await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i5.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseFirestore>(
        () => registerModule.firebaseFirestore);
    gh.lazySingleton<_i7.FirebaseStorage>(() => registerModule.firebaseStorage);
    gh.lazySingleton<_i8.Gemini>(() => registerModule.gemini);
    gh.lazySingleton<_i9.HomeRepository>(
        () => _i10.HomeRepositoryImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i11.ProductRepository>(
        () => _i12.ProductRepositoryImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i13.LocationService>(
        () => const _i14.LocationServiceImpl());
    gh.lazySingleton<_i15.AuthRepository>(() => _i16.AuthRepositoryImpl(
          gh<_i5.FirebaseAuth>(),
          gh<_i6.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i17.MapRepository>(
        () => _i18.MapRepositoryImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i19.UserService>(() => _i20.UserServiceImpl(
          gh<_i6.FirebaseFirestore>(),
          gh<_i5.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i21.GeminiRepository>(
        () => _i22.GeminiRepositoryImpl(gh<_i8.Gemini>()));
    gh.lazySingleton<_i23.ProfileRepository>(() => _i24.ProfileRepositoryImpl(
          gh<_i6.FirebaseFirestore>(),
          gh<_i7.FirebaseStorage>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i25.RegisterModule {
  @override
  _i3.AppRouter get appRouter => _i3.AppRouter();
}
