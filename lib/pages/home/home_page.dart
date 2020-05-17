import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remember_prices/data/repositories/firebase/index.dart';
import 'package:remember_prices/routes/router.gr.dart';
import 'package:remember_prices/services/barcode.dart';
import 'package:remember_prices/shared/widgets/index.dart';
import 'package:remember_prices/utils/index.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var barcode = await Barcode.scan();
          if (barcode.isEmpty) return;

          final productRepository =
              kiwi.Container().resolve<ProductRepository>();
          var documentId =
              await productRepository.getDocumentIdByBarcode(barcode);

          if (documentId != null)
            ExtendedNavigator.of(context).pushNamed(Routes.productDetailScreen,
                arguments:
                    ProductDetailScreenArguments(documentId: documentId));
          else
            ExtendedNavigator.of(context).pushNamed(Routes.inserProductScreen,
                arguments: InserProductScreenArguments(barcode: barcode));
        },
        child: Icon(FontAwesomeIcons.barcode),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: SearchBar(),
      ),
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: <Widget>[
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Center(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(FontAwesomeIcons.cartPlus),
                          ),
                          Text('Products'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                _goToPage(context);
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              color: blueTheme.shade500,
            ),
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Center(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(FontAwesomeIcons.storeAlt),
                          ),
                          Text('Supermarkets'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                ExtendedNavigator.of(context).pushNamed(Routes.brandsPage);
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              color: blueTheme.shade500,
            ),
          ],
        ),
      ),
    );
  }

  void _goToPage(BuildContext context) {
    ExtendedNavigator.of(context).pushNamed(Routes.productsPage);
  }
}
