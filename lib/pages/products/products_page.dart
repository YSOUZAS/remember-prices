import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/data/blocs/product/product_bloc.dart';
import 'package:remember_prices/data/blocs/product/product_state.dart';
import 'package:remember_prices/routes/router.gr.dart';
import 'package:remember_prices/shared/screens/index.dart';
import 'package:remember_prices/shared/widgets/horizontal_card.dart';
import 'package:remember_prices/shared/widgets/internal_cached_network_image.dart';
import 'package:remember_prices/utils/theme.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key, this.vale}) : super(key: key);

  final String vale;
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _productBloc = kiwi.Container().resolve<ProductBloc>();

  @override
  void initState() {
    _productBloc.onProductInitiated();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _productBloc.close();
  }

  void _goToProductDetail(BuildContext context, ProductState state, int index) {
    ExtendedNavigator.of(context).pushNamed(Routes.productDetailScreen,
        arguments: ProductDetailScreenArguments(
            documentId: state.products[index].documentID));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, ProductState state) {
            if (state.isLoading) {
              return LoadingScreen();
            } else if (state.isSuccessful) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                      onTap: () {
                        _goToProductDetail(context, state, index);
                      },
                      child: new Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                        child: new Stack(
                          children: <Widget>[
                            HorizontalCard(
                              child:
                                  _getContent(state.products[index].data.name),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  topLeft: Radius.circular(8)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: whiteTheme.shade500,
                                  boxShadow: <BoxShadow>[
                                    new BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10.0,
                                      offset: new Offset(10.0, 10.0),
                                    ),
                                  ],
                                ),
                                child: InternalCachedNetworkImage(
                                  url: state.products[index].data.imageUrl,
                                  height: 130.0,
                                  width: 92.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              );
            } else {
              return BlankScreen();
            }
          },
        ),
      ),
      create: (BuildContext context) => _productBloc,
    );
  }

  Container _getContent(
    String name,
  ) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            name,
            maxLines: 1,
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
          /* new Container(height: 10.0),
          new Text(
            "dsaasddsaads",
            style: const TextStyle(
                fontFamily: 'Poppins',
                color: const Color(0xffb6b2df),
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
  

          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Container(
                  child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.dollarSign,
                        ),
                        new Text(
                          "7.90",
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                ),
              ),
              new Container(
                width: 8.0,
              ),
              new Expanded(
                flex: 1,
                child: new Container(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.cartPlus),
                      new Container(width: 8.0),
                      new Text(
                        "1",
                        style: const TextStyle(
                            fontFamily: 'Poppins', fontSize: 9.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
       */
        ],
      ),
    );
  }
}
