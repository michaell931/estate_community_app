import 'package:get_it/get_it.dart';
import 'package:estate_community_app/app/injection_container.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
