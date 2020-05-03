import 'package:flutter/material.dart';

class CenteredCircularProgressIndicator extends StatelessWidget {
  final double value;

  const CenteredCircularProgressIndicator({Key key, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: value,
      ),
    );
  }
}
