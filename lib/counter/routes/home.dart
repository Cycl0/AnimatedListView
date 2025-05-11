import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:list_view_animada/counter/routes/routeGenerator.dart';
import 'package:list_view_animada/counter/state/count.dart';

class Home extends StatelessWidget {
  const Home({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Multi Provider App (${context.watch<Count>().count})'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            const Text('Count: '),
            Counter(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteGenerator.cart);
              },
              child: const Text('Go to second screen'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            key: Key('increment_floatingActionButton'),
            onPressed: () => context.read<Count>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            key: Key('decrement_floatingActionButton'),
            onPressed: () => context.read<Count>().decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({ super.key });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Count>().count}',
      style: Theme.of(context).textTheme.headlineMedium,
      key: Key('counterState'),
    );
  }
}
              
          
