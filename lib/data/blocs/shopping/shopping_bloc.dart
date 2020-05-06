import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_prices/data/blocs/shopping/index.dart';
import 'package:remember_prices/data/repositories/firebase/shopping_repository.dart';

class GetAllShoppingsFromProductIdBloc
    extends Bloc<ShoppingEvent, GetAllShoppingsFromProductIdState> {
  final ShoppingRepository _repository;

  GetAllShoppingsFromProductIdBloc(this._repository) : super();

  @override
  GetAllShoppingsFromProductIdState get initialState =>
      GetAllShoppingsFromProductIdState.initial();

  void onGetAllShoppingsFromProductIdState(String productId) =>
      add(GetAllShoppingsFromProductIdStateInitiated(
          (b) => b..productId = productId));

  @override
  Stream<GetAllShoppingsFromProductIdState> mapEventToState(
      ShoppingEvent event) async* {
    yield GetAllShoppingsFromProductIdState.loading();

    if (event is GetAllShoppingsFromProductIdStateInitiated)
      yield* mapShoppingInitiated(event);
  }

  Stream<GetAllShoppingsFromProductIdState> mapShoppingInitiated(
      GetAllShoppingsFromProductIdStateInitiated event) async* {
    try {
      final searchResult =
          await _repository.getShoppingByProductId(event.productId);
      yield GetAllShoppingsFromProductIdState.success(searchResult);
    } on Exception catch (e) {
      yield GetAllShoppingsFromProductIdState.failure(e.toString());
    }
  }
}
