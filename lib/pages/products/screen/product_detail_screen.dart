import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/data/blocs/product/product_bloc.dart';
import 'package:remember_prices/data/blocs/product/product_state.dart';
import 'package:remember_prices/data/models/product/index.dart';
import 'package:remember_prices/shared/screens/index.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:remember_prices/shared/widgets/index.dart';
import 'package:remember_prices/shared/widgets/times_series_chart.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key key, this.documentId}) : super(key: key);
  final String documentId;
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _productBloc = kiwi.Container().resolve<ProductBloc>();

  @override
  void initState() {
    super.initState();
    _productBloc.onGetById(widget.documentId);
  }

  @override
  void dispose() {
    super.dispose();
    _productBloc.close();
  }

  List<charts.Series<TimeSeriesSales, DateTime>> _createDataChartsTimeSeries(
      BuiltList<Shopping> shopping) {
    List<TimeSeriesSales> data = [];

    for (var item in shopping) {
      data.add(new TimeSeriesSales(DateTime.parse(item.date), item.price));
    }

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  String _getLowestPrice(BuiltList<Shopping> shopping) {
    shopping.toList().sort((a, b) => a.price.compareTo(b.price));

    return shopping.first.price.toStringAsFixed(2);
  }

  String _getAveragePrice(BuiltList<Shopping> shopping) {
    double sum = 0;

    for (var e in shopping) {
      sum += e.price;
    }

    return (sum / shopping.length).toStringAsFixed(2);
  }

  String _getHighestPrice(BuiltList<Shopping> shopping) {
    shopping.toList().sort((a, b) => a.price.compareTo(b.price));

    return shopping.last.price.toStringAsFixed(2);
  }

  Text _getTextWidget(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
                    SliverAppBar(
                      leading: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            ExtendedNavigator.of(context).pop();
                          }),
                      expandedHeight: 400,
                      backgroundColor: Colors.black,
                      pinned: true,
                      floating: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        titlePadding: EdgeInsetsDirectional.only(start: 0),
                        title: Text(
                          state.product.data.name,
                          textAlign: TextAlign.justify,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 0.7,
                        ),
                        // Stack orders children behind each other
                        background: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            InternalCachedNetworkImage(
                              url: state.product.data.imageUrl,
                              fit: BoxFit.cover,
                            ),
                            Container(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          <Widget>[
                            SizedBox(height: 5),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Lowest Price:",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Chip(
                                        backgroundColor: Colors.redAccent,
                                        padding: EdgeInsets.all(10),
                                        label: Text(
                                            _getLowestPrice(
                                                state.product.data.shopping),
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Average Prices:",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                      Chip(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        padding: EdgeInsets.all(10),
                                        label: Text(
                                            _getAveragePrice(
                                                state.product.data.shopping),
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      _getTextWidget("Highest Price:"),
                                      Chip(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        padding: EdgeInsets.all(10),
                                        label: Text(
                                            _getHighestPrice(
                                                state.product.data.shopping),
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            Container(
                              height: 400,
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: state.product.data.shopping != null
                                          ? TimeSeriesChart(
                                              _createDataChartsTimeSeries(
                                                  state.product.data.shopping))
                                          : BlankScreen(),
                                    ),
                                  ],
                                ),
                              )),
                            )
                          ],
                        ),
                      ),
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
