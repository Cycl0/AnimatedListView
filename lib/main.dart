import 'package:flutter/material.dart';

void main() {
	runApp(const App());
}

class App extends StatelessWidget {
	const App({ super.key });

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Lucas Kenzo Cyra',
			theme: ThemeData(
				colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
			),
			home: const Home(title: 'Home'),
		);
	}
}

class Home extends StatefulWidget {
	const Home({ super.key, required this.title });
	final String title;

	@override
	State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
	int _counter = 0;
	
	void _increment() {
		setState(() {
	    ++_counter;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				title: Text(widget.title),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						const Text('Count: '),
						Text(
								'$_counter',
								style: Theme.of(context).textTheme.headlineMedium,
						),
					],
				),
			),
		  floatingActionButton: FloatingActionButton(
				onPressed: _increment,
				tooltip: 'Increment',
				child: const Icon(Icons.add),
			)
		);
	}
}
