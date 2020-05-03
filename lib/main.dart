import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remember_prices/routes/router.gr.dart';
import 'package:remember_prices/utils/injection_container.dart';
import 'package:remember_prices/utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initiKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remember Prices',
      theme: ThemeData(primarySwatch: blueTheme, backgroundColor: whiteTheme),
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
