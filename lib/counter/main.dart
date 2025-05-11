import 'package:flutter/material.dart';
import 'routes/routeGenerator.dart';
import 'state/cartState.dart';
import 'state/count.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartState()),
        ChangeNotifierProvider(create: (_) => Count()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteGenerator.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
