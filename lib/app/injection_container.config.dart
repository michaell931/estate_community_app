// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:estate_community_app/app/cubit/auth_cubit.dart' as _i9;
import 'package:estate_community_app/data_sources/auth_data_source.dart' as _i3;
import 'package:estate_community_app/data_sources/forum_data_source.dart'
    as _i5;
import 'package:estate_community_app/data_sources/news_data_source.dart' as _i7;
import 'package:estate_community_app/features/forum/cubit/forum_cubit.dart'
    as _i10;
import 'package:estate_community_app/features/news/cubit/news_cubit.dart'
    as _i11;
import 'package:estate_community_app/repositories/auth_repository.dart' as _i4;
import 'package:estate_community_app/repositories/forum_repository.dart' as _i6;
import 'package:estate_community_app/repositories/news_repository.dart' as _i8;
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
    gh.factory<_i3.AuthDataSource>(() => _i3.AuthDataSource());
    gh.factory<_i4.AuthRepository>(
        () => _i4.AuthRepository(authDataSource: gh<_i3.AuthDataSource>()));
    gh.factory<_i5.ForumDataSource>(() => _i5.ForumDataSource());
    gh.factory<_i6.ForumRepository>(
        () => _i6.ForumRepository(forumDataSource: gh<_i5.ForumDataSource>()));
    gh.factory<_i7.NewsDataSource>(() => _i7.NewsDataSource());
    gh.factory<_i8.NewsRepository>(
        () => _i8.NewsRepository(gh<_i7.NewsDataSource>()));
    gh.factory<_i9.AuthCubit>(
        () => _i9.AuthCubit(authRepository: gh<_i4.AuthRepository>()));
    gh.factory<_i10.ForumCubit>(
        () => _i10.ForumCubit(forumRepository: gh<_i6.ForumRepository>()));
    gh.factory<_i11.NewsCubit>(
        () => _i11.NewsCubit(newsRepository: gh<_i8.NewsRepository>()));
    return this;
  }
}
