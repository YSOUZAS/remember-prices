import 'package:auto_route/auto_route_annotations.dart';
import 'package:remember_prices/pages/index.dart';
import 'package:remember_prices/pages/products/screen/insert_product_screen.dart';
import 'package:remember_prices/pages/products/screen/product_detail_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomePage homePage;
  BrandsPage brandsPage;
  ProductsPage productsPage;
  ProductDetailScreen productDetailScreen;
  InserProductScreen inserProductScreen;
}
