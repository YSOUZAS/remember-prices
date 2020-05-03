import 'package:flutter/material.dart';
import 'package:remember_prices/shared/widgets/index.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CenteredCircularProgressIndicator(),
    );
  }
}
