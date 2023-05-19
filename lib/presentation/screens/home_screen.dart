import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_plus_minus_test_app/constants/enum.dart';
import 'package:flutter_bloc_plus_minus_test_app/cubit/counter_cubit.dart';
import 'package:flutter_bloc_plus_minus_test_app/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _incrementCounter() {
    BlocProvider.of<CounterCubit>(context).increment();
  }

  void _decrementCounter() {
    BlocProvider.of<CounterCubit>(context).decrement();
  }

  void _snackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 300),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Colors.green);
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {}
        if (state is InternetConnected &&
            state.connectivityType == ConnectivityType.wifi) {
          context.read<CounterCubit>().increment();
        } else if (state is InternetConnected &&
            state.connectivityType == ConnectivityType.mobiles) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectivityType == ConnectivityType.wifi) {
                    return Text('Wifi', style: textStyle);
                  } else if (state is InternetConnected &&
                      state.connectivityType == ConnectivityType.mobiles) {
                    return Text('Mobiles', style: textStyle);
                  } else if (state is InternetDisconnected) {
                    return Text('Disconnected', style: textStyle);
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'first',
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  BlocConsumer<CounterCubit, CounterState>(
                    listener: (context, state) {
                      if (state.wasIncrement == true) {
                        _snackBar('Incremented!');
                      } else if (state.wasIncrement == false) {
                        _snackBar('Decremented!');
                      }
                    },
                    builder: (context, state) {
                      return Text(
                        state.valueCounter.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                  FloatingActionButton(
                    heroTag: 'second',
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/second',
                  );
                },
                child: const Text(
                  'Second page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/third',
                  );
                },
                child: const Text(
                  'Third page',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
