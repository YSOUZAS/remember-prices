import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/data/blocs/product/product_bloc.dart';
import 'package:remember_prices/data/blocs/product/product_state.dart';
import 'package:remember_prices/data/blocs/shopping/index.dart';
import 'package:remember_prices/data/repositories/firebase/shopping_repository.dart';
import 'package:remember_prices/pages/products/screen/index.dart';
import 'package:remember_prices/pages/products/screen/product_shopping_detail_padding.dart';
import 'package:remember_prices/shared/screens/index.dart';
import 'package:remember_prices/shared/widgets/index.dart';
import 'package:remember_prices/utils/index.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key key, this.documentId}) : super(key: key);
  final String documentId;
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _productBloc = kiwi.Container().resolve<ProductBloc>();
  final dateController = TextEditingController();
  final _getAllShoppingsFromProductIdBloc =
      kiwi.Container().resolve<GetAllShoppingsFromProductIdBloc>();
  final controller = new MoneyMaskedTextController(
    decimalSeparator: '.',
  );
  var finaldate;

  @override
  void initState() {
    super.initState();
    _productBloc.onGetById(widget.documentId);
  }

  @override
  void dispose() {
    super.dispose();
    _productBloc.close();
    _getAllShoppingsFromProductIdBloc.close();
  }

  Container _getContainerOpacity() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.15, 0.5],
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Container _getImage(ProductState state) {
    return Container(
      decoration: BoxDecoration(color: whiteTheme.shade500),
      child: InternalCachedNetworkImage(
        url: state.product.data.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Stack _getBackgroundStack(ProductState state) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _getImage(state),
        _getContainerOpacity(),
      ],
    );
  }

  FlexibleSpaceBar _getFlexibleSpaceBar(ProductState state) {
    return FlexibleSpaceBar(
      centerTitle: true,
      titlePadding: EdgeInsetsDirectional.only(start: 0),
      title: Text(
        state.product.data.name,
        textAlign: TextAlign.justify,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 0.7,
      ),
      background: _getBackgroundStack(state),
    );
  }

  IconButton _getIconButton(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          ExtendedNavigator.of(context).pop();
        });
  }

  SliverAppBar _getSliverAppBar(BuildContext context, ProductState state) {
    return SliverAppBar(
      leading: _getIconButton(context),
      expandedHeight: 200,
      pinned: true,
      floating: true,
      flexibleSpace: _getFlexibleSpaceBar(state),
    );
  }

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
    });
  }

  Future<DateTime> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  Future<String> _showDialog() async {
    return await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 200,
              child: Column(
                children: <Widget>[
                  new TextField(
                    autofocus: true,
                    controller: controller,
                    decoration: new InputDecoration(
                        labelText: 'Price', hintText: 'eg. 4,98'),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: finaldate == null
                        ? Text(
                            "Use below button to Select a Date",
                            textScaleFactor: 1.0,
                          )
                        : Text(
                            "$finaldate",
                            textScaleFactor: 1.0,
                          ),
                  ),
                  new RaisedButton(
                    onPressed: callDatePicker,
                    color: Colors.blueAccent,
                    child: new Text('Click here',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context, "false");
                  }),
              new FlatButton(
                  child: const Text('CONFIRM'),
                  onPressed: () {
                    Navigator.pop(context, "true");
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var response = await _showDialog();
            if (response == "false") return;

            var month = finaldate.month.toString().length == 1
                ? "0${finaldate.month}"
                : finaldate.month.toString();
            var day = finaldate.day.toString().length == 1
                ? "0${finaldate.day}"
                : finaldate.day.toString();

            var map = {
              "price": double.parse(controller.text.trim()),
              "date": "${finaldate.year}$month$day",
              "productId": widget.documentId,
              "brandId": "9nZiyVCdgK7zYg630BRh"
            };

            var _shoppingRepository =
                kiwi.Container().resolve<ShoppingRepository>();

            await _shoppingRepository.insertShopping(map);

            _productBloc.onGetById(widget.documentId);
          },
          child: Icon(FontAwesomeIcons.plus),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (BuildContext context, ProductState state) {
              if (state.isLoading) {
                return LoadingScreen();
              } else if (state.isSuccessful) {
                return CustomScrollView(
                  slivers: <Widget>[
                    _getSliverAppBar(context, state),
                    ProductShoppingDetailPadding(
                      productId: state.product.documentID,
                    )
                  ],
                );
              } else {
                return BlankScreen();
              }
            },
          ),
        ),
      ),
      create: (BuildContext context) => _productBloc,
    );
  }
}
