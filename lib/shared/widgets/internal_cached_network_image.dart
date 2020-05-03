import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InternalCachedNetworkImage extends StatelessWidget {
  const InternalCachedNetworkImage({
    Key key,
    @required this.url,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final double width;
  final double height;
  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
