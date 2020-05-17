// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remember_prices/pages/home/home_page.dart';
import 'package:remember_prices/pages/brands/brands_page.dart';
import 'package:remember_prices/pages/products/products_page.dart';
import 'package:remember_prices/pages/products/screen/product_detail_screen.dart';
import 'package:remember_prices/pages/products/screen/insert_product_screen.dart';

abstract class Routes {
  static const homePage = '/';
  static const brandsPage = '/brands-page';
  static const productsPage = '/products-page';
  static const productDetailScreen = '/product-detail-screen';
  static const inserProductScreen = '/inser-product-screen';
  static const all = {
    homePage,
    brandsPage,
    productsPage,
    productDetailScreen,
    inserProductScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(),
          settings: settings,
        );
      case Routes.brandsPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => BrandsPage(),
          settings: settings,
        );
      case Routes.productsPage:
        if (hasInvalidArgs<ProductsPageArguments>(args)) {
          return misTypedArgsRoute<ProductsPageArguments>(args);
        }
        final typedArgs =
            args as ProductsPageArguments ?? ProductsPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              ProductsPage(key: typedArgs.key, vale: typedArgs.vale),
          settings: settings,
        );
      case Routes.productDetailScreen:
        if (hasInvalidArgs<ProductDetailScreenArguments>(args)) {
          return misTypedArgsRoute<ProductDetailScreenArguments>(args);
        }
        final typedArgs = args as ProductDetailScreenArguments ??
            ProductDetailScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProductDetailScreen(
              key: typedArgs.key, documentId: typedArgs.documentId),
          settings: settings,
        );
      case Routes.inserProductScreen:
        if (hasInvalidArgs<InserProductScreenArguments>(args)) {
          return misTypedArgsRoute<InserProductScreenArguments>(args);
        }
        final typedArgs = args as InserProductScreenArguments ??
            InserProductScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => InserProductScreen(
              key: typedArgs.key, barcode: typedArgs.barcode),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//ProductsPage arguments holder class
class ProductsPageArguments {
  final Key key;
  final String vale;
  ProductsPageArguments({this.key, this.vale});
}

//ProductDetailScreen arguments holder class
class ProductDetailScreenArguments {
  final Key key;
  final String documentId;
  ProductDetailScreenArguments({this.key, this.documentId});
}

//InserProductScreen arguments holder class
class InserProductScreenArguments {
  final Key key;
  final String barcode;
  InserProductScreenArguments({this.key, this.barcode});
}
