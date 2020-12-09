import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(int state) : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

class CounterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(0),
      child: CounterView(),
    );
  }
}
//Exemplo de contador usando Block
class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nosso Contador'),
      ),
      body: Center(
        // é notificado quando deve ser rebuidar
        child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
          return Text(
            '$state',
            style: textTheme.headline2,
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            //Abordagem de como acessar um BLoC
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            //Abordagem de como acessar um BLoC
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
