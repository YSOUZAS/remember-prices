import 'package:flutter/material.dart';
import 'package:remember_prices/shared/widgets/internal_cached_network_image.dart';

class CardListTile extends StatelessWidget {
  const CardListTile(
      {Key key,
      this.url,
      this.title,
      this.width = 100,
      this.height = 100,
      this.margin = 0.5,
      this.fit})
      : super(key: key);

  final String url;
  final String title;
  final double width;
  final double height;
  final double margin;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(margin),
      child: ListTile(
        leading: InternalCachedNetworkImage(
          width: width,
          height: height,
          fit: fit,
          url: url,
        ),
        title: Text(title),
      ),
    );
  }
}
