import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_prices/data/blocs/brand/brand_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/data/blocs/brand/brand_state.dart';
import 'package:remember_prices/shared/screens/index.dart';
import 'package:remember_prices/shared/widgets/card_list_tile.dart';
import 'package:remember_prices/shared/widgets/index.dart';

class BrandsPage extends StatefulWidget {
  static const String routeName = '/brands';

  @override
  _BrandsPageState createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final _brandBloc = kiwi.Container().resolve<BrandBloc>();

  @override
  void initState() {
    _brandBloc.onBrandInitiated();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _brandBloc.close();
  }

  ListView _getListOfBrands(state) {
    return ListView.builder(
      itemCount: state.brands.length,
      itemBuilder: (BuildContext context, int index) {
        return CardListTile(
          title: state.brands[index].data.name,
          url: state.brands[index].data?.imageUrl?.toString(),
          margin: 0.5,
          height: 50,
          width: 100,
          fit: BoxFit.fitWidth,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrandBloc>(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Supermarkets"),
        ),
        body: BlocBuilder<BrandBloc, BrandState>(
          builder: (BuildContext context, BrandState state) {
            if (state.isLoading) {
              return LoadingScreen();
            } else if (state.isSuccessful) {
              return _getListOfBrands(state);
            } else {
              return BlankScreen();
            }
          },
        ),
      ),
      create: (BuildContext context) => _brandBloc,
    );
  }
}
