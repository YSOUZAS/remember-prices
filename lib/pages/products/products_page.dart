import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/data/blocs/product/product_bloc.dart';
import 'package:remember_prices/data/blocs/product/product_state.dart';
import 'package:remember_prices/routes/router.gr.dart';
import 'package:remember_prices/shared/screens/index.dart';
import 'package:remember_prices/shared/widgets/internal_cached_network_image.dart';

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
                  return GestureDetector(
                    onTap: () {
                      _goToProductDetail(context, state, index);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: InternalCachedNetworkImage(
                                width: 200,
                                height: 200,
                                url: state.products[index].data?.imageUrl
                                    ?.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.products[index].data.name,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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

  void _goToProductDetail(BuildContext context, ProductState state, int index) {
    ExtendedNavigator.of(context).pushNamed(Routes.productDetailScreen,
        arguments: ProductDetailScreenArguments(
            documentId: state.products[index].documentID));
  }
}
