
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App (BLoC)"),
        centerTitle: true,
      ),

      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state is CounterIncremented) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Number Incremented")),
            );
          }




          if (state is CounterDecremented) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Number Decremented")),
            );
          }

          if (state is CounterReset) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Counter Reset")),
            );
          }
        },

        child: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Current Count",
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    state.count.toString(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "minus",
                        onPressed: () {
                          context.read<CounterBloc>().add(Decrement());
                        },
                        child: const Icon(Icons.remove),
                      ),

                      const SizedBox(width: 15),

                      FloatingActionButton(
                        heroTag: "reset",
                        onPressed: () {
                          context.read<CounterBloc>().add(Reset());
                        },
                        child: const Icon(Icons.refresh),
                      ),

                      const SizedBox(width: 15),

                      FloatingActionButton(
                        heroTag: "plus",
                        onPressed: () {
                          context.read<CounterBloc>().add(Increment());
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
