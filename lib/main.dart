import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_plus_minus_test_app/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_plus_minus_test_app/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_plus_minus_test_app/logic/cubit/settings_cubit.dart';
import 'package:flutter_bloc_plus_minus_test_app/logic/utility/app_bloc_observer.dart';
import 'package:flutter_bloc_plus_minus_test_app/presentation/router/app_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();

  runApp(MyApp(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatefulWidget {
  final Connectivity connectivity;
  final AppRouter appRouter;
  const MyApp({super.key, required this.connectivity, required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
        BlocProvider<InternetCubit>(
            create: (_) => InternetCubit(connectivity: widget.connectivity)),
        BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: widget.appRouter.onGenerateRoute,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.appRouter.dispose();
  }
}
