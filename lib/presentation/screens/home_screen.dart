import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_plus_minus_test_app/cubit/counter_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Incremented!'),
                        duration: Duration(milliseconds: 300),
                      ));
                    } else if (state.wasIncrement == false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Decremented!'),
                        duration: Duration(milliseconds: 300),
                      ));
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
    );
  }
}
