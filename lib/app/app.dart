import 'package:estate_community_app/app/cubit/root_cubit.dart';
import 'package:estate_community_app/app/features/auth/pages/auth_gate.dart';
import 'package:estate_community_app/app/features/home/home_page.dart';
import 'package:estate_community_app/app/features/login/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estate Community App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const AuthGate(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          final user = state.user;
          if (user == null) {
            return LoginPage();
          }
          return HomePage(user: user);
        },
      ),
    );
  }
}
