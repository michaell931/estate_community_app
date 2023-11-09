// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:estate_community_app/app/cubit/auth_cubit.dart' as _i6;
import 'package:estate_community_app/features/forum/cubit/forum_cubit.dart'
    as _i7;
import 'package:estate_community_app/features/news/cubit/news_cubit.dart'
    as _i8;
import 'package:estate_community_app/repositories/auth_repository.dart' as _i3;
import 'package:estate_community_app/repositories/forum_repository.dart' as _i4;
import 'package:estate_community_app/repositories/news_repository.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthRepository>(() => _i3.AuthRepository());
    gh.factory<_i4.ForumRepository>(() => _i4.ForumRepository());
    gh.factory<_i5.NewsRepository>(() => _i5.NewsRepository());
    gh.factory<_i6.AuthCubit>(
        () => _i6.AuthCubit(authRepository: gh<_i3.AuthRepository>()));
    gh.factory<_i7.ForumCubit>(
        () => _i7.ForumCubit(forumRepository: gh<_i4.ForumRepository>()));
    gh.factory<_i8.NewsCubit>(
        () => _i8.NewsCubit(newsRepository: gh<_i5.NewsRepository>()));
    return this;
  }
}
