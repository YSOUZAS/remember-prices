import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_prices/data/blocs/brand/brand_bloc.dart';
import 'package:remember_prices/data/blocs/brand/brand_state.dart';
import 'package:remember_prices/data/models/brand/index.dart';
import 'package:remember_prices/data/repositories/firebase/index.dart';
import 'package:remember_prices/data/repositories/firebase/shopping_repository.dart';
import 'package:remember_prices/routes/router.gr.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/shared/screens/index.dart';
import 'package:remember_prices/shared/widgets/index.dart';

class InserProductScreen extends StatefulWidget {
  InserProductScreen({Key key, this.barcode}) : super(key: key);
  final String barcode;

  _InserProductScreenState createState() => _InserProductScreenState();
}

class _InserProductScreenState extends State<InserProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _brandBloc = kiwi.Container().resolve<BrandBloc>();

  DateTime finaldate = DateTime.now();
  String name;
  double price;
  String dropdownValue = 'BMrje6KFWt0oYSFbVNVz';

  @override
  void initState() {
    super.initState();
    _brandBloc.onBrandInitiated();
  }

  @override
  void dispose() {
    _brandBloc.close();
    super.dispose();
  }

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrandBloc>(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Insert Product"),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: BlocBuilder<BrandBloc, BrandState>(
            builder: (BuildContext context, BrandState state) {
              if (state.isLoading) {
                return LoadingScreen();
              } else if (state.isSuccessful) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.shopping_cart),
                                hintText: 'Name in the bill?',
                                labelText: 'Named *',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some name';
                                }
                                setState(() {
                                  name = value;
                                });
                                return null;
                              },
                            ),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: const InputDecoration(
                                icon: Icon(Icons.euro_symbol),
                                hintText: 'Price of product?',
                                labelText: 'Price *',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some price';
                                }
                                setState(() {
                                  if (value.contains(","))
                                    value = value.replaceAll(",", ".");

                                  price = double.parse(value);
                                });
                                return null;
                              },
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: state.brands.map((Brand brand) {
                                    return DropdownMenuItem<String>(
                                      value: brand.documentID,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          InternalCachedNetworkImage(
                                            url: brand.data.imageUrl,
                                            height: 25,
                                            width: 100,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: new RaisedButton(
                                  onPressed: callDatePicker,
                                  color: Colors.blueAccent,
                                  child: new Text(
                                      "${finaldate.day}/${finaldate.month}/${finaldate.year}",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: RaisedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      var productMap = {
                                        "barcode": widget.barcode,
                                        "imageUrl":
                                            "https://image.flaticon.com/icons/png/512/36/36601.png",
                                        "name": name,
                                      };
                                      final productRepository = kiwi.Container()
                                          .resolve<ProductRepository>();

                                      var productCreated =
                                          await productRepository
                                              .insertProduct(productMap);

                                      var month =
                                          finaldate.month.toString().length == 1
                                              ? "0${finaldate.month}"
                                              : finaldate.month.toString();
                                      var day =
                                          finaldate.day.toString().length == 1
                                              ? "0${finaldate.day}"
                                              : finaldate.day.toString();

                                      var map = {
                                        "price": price,
                                        "date": "${finaldate.year}$month$day",
                                        "productId": productCreated.documentID,
                                        "brandId": dropdownValue
                                      };

                                      var _shoppingRepository = kiwi.Container()
                                          .resolve<ShoppingRepository>();

                                      await _shoppingRepository
                                          .insertShopping(map);

                                      ExtendedNavigator.of(context)
                                          .popAndPushNamed(
                                              Routes.productDetailScreen,
                                              arguments:
                                                  ProductDetailScreenArguments(
                                                      documentId: productCreated
                                                          .documentID));
                                    }
                                  },
                                  child: Text('Submit'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return BlankScreen();
              }
            },
          ),
        ),
      ),
      create: (BuildContext context) => _brandBloc,
    );
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
}
