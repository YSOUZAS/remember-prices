import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_prices/data/blocs/shopping/index.dart';
import 'package:remember_prices/data/models/shopping/index.dart';
import 'package:remember_prices/shared/screens/index.dart';
import 'package:remember_prices/shared/widgets/times_series_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/utils/theme.dart';

class ProductShoppingDetailPadding extends StatefulWidget {
  ProductShoppingDetailPadding({Key key, @required this.productId})
      : super(key: key);
  final String productId;
  _ProductShoppingDetailPaddingState createState() =>
      _ProductShoppingDetailPaddingState();
}

class _ProductShoppingDetailPaddingState
    extends State<ProductShoppingDetailPadding> {
  final _getAllShoppingsFromProductIdBloc =
      kiwi.Container().resolve<GetAllShoppingsFromProductIdBloc>();

  @override
  void initState() {
    super.initState();
    _getAllShoppingsFromProductIdBloc.onInitiated(widget.productId);
  }

  @override
  void dispose() {
    super.dispose();
    _getAllShoppingsFromProductIdBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllShoppingsFromProductIdBloc>(
      child: BlocBuilder<GetAllShoppingsFromProductIdBloc,
          GetAllShoppingsFromProductIdState>(
        builder:
            (BuildContext context, GetAllShoppingsFromProductIdState state) {
          if (state.isLoading) {
            return SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[LoadingScreen()],
                ),
              ),
            );
          } else if (state.isSuccessful) {
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
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[BlankScreen()],
                ),
              ),
            );
          }
        },
      ),
      create: (BuildContext context) => _getAllShoppingsFromProductIdBloc,
    );
  }
}

String _getLowestPrice(BuiltList<Shopping> shopping) {
  var list = shopping.toList();
  list.sort((a, b) => a.data.price.compareTo(b.data.price));

  return list.first.data.price.toStringAsFixed(2);
}

String _getAveragePrice(BuiltList<Shopping> shopping) {
  double sum = 0;

  for (var e in shopping) {
    sum += e.data.price;
  }

  return (sum / shopping.length).toStringAsFixed(2);
}

String _getHighestPrice(BuiltList<Shopping> shopping) {
  var list = shopping.toList();
  list.sort((a, b) => a.data.price.compareTo(b.data.price));

  return list.last.data.price.toStringAsFixed(2);
}

Card _getCardWidget(GetAllShoppingsFromProductIdState state) {
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

Expanded _getExpandedWidget(GetAllShoppingsFromProductIdState state) {
  return Expanded(
    child: state.shoppings != null
        ? TimeSeriesChart(_createDataChartsTimeSeries(state.shoppings))
        : BlankScreen(),
  );
}

Container _getMiddleContainer(GetAllShoppingsFromProductIdState state) {
  return Container(
    child: Column(
      children: <Widget>[
        _getRow(
          "Lowest Price:",
          _getLowestPrice(state.shoppings),
        ),
        SizedBox(height: 5),
        _getRow(
          "Average Prices:",
          _getAveragePrice(state.shoppings),
        ),
        SizedBox(height: 5),
        _getRow(
          "Highest Price:",
          _getHighestPrice(state.shoppings),
        ),
      ],
    ),
  );
}

Container _getRow(String textBoxText, String chipText) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _getTextWidget(textBoxText),
        _getTextWidget(chipText),
      ],
    ),
    height: 50.0,
    margin: new EdgeInsets.only(left: 1.0),
    decoration: new BoxDecoration(
      color: blueTheme.shade500,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}

Padding _getTextWidget(String text, {Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
    ),
  );
}

List<charts.Series<TimeSeriesSales, DateTime>> _createDataChartsTimeSeries(
    BuiltList<Shopping> shopping) {
  List<TimeSeriesSales> data = [];

  for (var item in shopping) {
    data.add(
        new TimeSeriesSales(DateTime.parse(item.data.date), item.data.price));
  }
  data.sort((a, b) => a.time.compareTo(b.time));

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
