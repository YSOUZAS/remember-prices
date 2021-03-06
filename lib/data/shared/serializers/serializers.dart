library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:remember_prices/data/models/brand/index.dart';
import 'package:remember_prices/data/models/product/index.dart';
import 'package:remember_prices/data/models/shopping/index.dart';

part 'serializers.g.dart';

@SerializersFor(
    const [Brand, DataBrand, Product, DataProduct, Shopping, DataShopping])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
