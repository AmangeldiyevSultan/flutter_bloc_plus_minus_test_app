import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_plus_minus_test_app/cubit/counter_cubit.dart';
import 'package:flutter_bloc_plus_minus_test_app/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_plus_minus_test_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_plus_minus_test_app/presentation/screens/third_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
              title: 'Home Screen',
            ),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
              title: 'Second Screen',
              color: Colors.redAccent,
            ),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
              title: 'Third Screen',
              color: Colors.redAccent,
            ),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
              title: 'Home Screen',
            ),
          ),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
