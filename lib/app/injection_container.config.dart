// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:estate_community_app/app/cubit/root_cubit.dart' as _i8;
import 'package:estate_community_app/app/features/forum/cubit/forum_cubit.dart'
    as _i6;
import 'package:estate_community_app/app/features/news/cubit/news_cubit.dart'
    as _i7;
import 'package:estate_community_app/repositories/forum_repository.dart' as _i3;
import 'package:estate_community_app/repositories/news_repository.dart' as _i4;
import 'package:estate_community_app/repositories/root_repository.dart' as _i5;
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
    gh.factory<_i3.ForumRepository>(() => _i3.ForumRepository());
    gh.factory<_i4.NewsRepository>(() => _i4.NewsRepository());
    gh.factory<_i5.RootRepository>(() => _i5.RootRepository());
    gh.factory<_i6.ForumCubit>(() => _i6.ForumCubit(gh<_i3.ForumRepository>()));
    gh.factory<_i7.NewsCubit>(() => _i7.NewsCubit(gh<_i4.NewsRepository>()));
    gh.factory<_i8.RootCubit>(() => _i8.RootCubit(gh<_i5.RootRepository>()));
    return this;
  }
}
