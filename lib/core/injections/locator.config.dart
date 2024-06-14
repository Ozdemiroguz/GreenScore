// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:flutter_gemini/flutter_gemini.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i13;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i12;
import '../../features/home/data/repostitories/home_repository_impl.dart'
    as _i9;
import '../../features/home/domain/repositories/home_repository.dart' as _i8;
import '../../features/map/data/repositories/map_repository_impl.dart' as _i15;
import '../../features/map/domain/repositories/map_repository.dart' as _i14;
import '../../features/qr/data/repositories/gemini_repository_impl.dart'
    as _i19;
import '../../features/qr/data/repositories/product_repository_impl.dart'
    as _i11;
import '../../features/qr/domain/repositories/gemini.repository.dart' as _i18;
import '../../features/qr/domain/repositories/product_repository.dart' as _i10;
import '../../router/router.dart' as _i3;
import '../../services/user_service/user_service.dart' as _i16;
import '../../services/user_service/user_service_impl.dart' as _i17;
import 'register_module.dart' as _i20;

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
    gh.lazySingleton<_i7.Gemini>(() => registerModule.gemini);
    gh.lazySingleton<_i8.HomeRepository>(
        () => _i9.HomeRepositoryImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i10.ProductRepository>(
        () => _i11.ProductRepositoryImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
          gh<_i5.FirebaseAuth>(),
          gh<_i6.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i14.MapRepository>(
        () => _i15.MapRepositoryImpl(gh<_i6.FirebaseFirestore>()));
    gh.lazySingleton<_i16.UserService>(() => _i17.UserServiceImpl(
          gh<_i6.FirebaseFirestore>(),
          gh<_i5.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i18.GeminiRepository>(
        () => _i19.GeminiRepositoryImpl(gh<_i7.Gemini>()));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {
  @override
  _i3.AppRouter get appRouter => _i3.AppRouter();
}
