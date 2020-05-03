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
                    _getSliverAppBar(context, state),
                    _getSliverPadding(state)
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

  SliverPadding _getSliverPadding(ProductState state) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            SizedBox(height: 5),
            _getMiddleContainer(state),
            SizedBox(height: 50),
            Container(
              height: 400,
              child: _getCardWidget(state),
            )
          ],
        ),
      ),
    );
  }

  Card _getCardWidget(ProductState state) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          _getExpandedWidget(state),
        ],
      ),
    ));
  }

  Expanded _getExpandedWidget(ProductState state) {
    return Expanded(
      child: state.product.data.shopping != null
          ? TimeSeriesChart(
              _createDataChartsTimeSeries(state.product.data.shopping))
          : BlankScreen(),
    );
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

  Stack _getBackgroundStack(ProductState state) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _getImage(state),
        _getContainerOpacity(),
      ],
    );
  }

  Container _getMiddleContainer(ProductState state) {
    return Container(
      child: Column(
        children: <Widget>[
          _getRow(
            "Lowest Price:",
            _getLowestPrice(state.product.data.shopping),
          ),
          SizedBox(height: 5),
          _getRow(
            "Average Prices:",
            _getAveragePrice(state.product.data.shopping),
          ),
          SizedBox(height: 5),
          _getRow(
            "Highest Price:",
            _getHighestPrice(state.product.data.shopping),
          ),
        ],
      ),
    );
  }

  Row _getRow(String textBoxText, String chipText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _getTextWidget(textBoxText),
        _getChipWidget(chipText),
      ],
    );
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

  InternalCachedNetworkImage _getImage(ProductState state) {
    return InternalCachedNetworkImage(
      url: state.product.data.imageUrl,
      fit: BoxFit.cover,
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

  Text _getTextWidget(String text, {Color color = Colors.black}) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: color),
    );
  }

  Chip _getChipWidget(String text) {
    return Chip(
      backgroundColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(10),
      label: _getTextWidget(text, color: Colors.white),
    );
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
}
