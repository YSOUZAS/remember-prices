library shopping_event;

import 'package:built_value/built_value.dart';

part 'shopping_event.g.dart';

abstract class ShoppingEvent {}

abstract class GetAllShoppingsFromProductIdStateInitiated extends ShoppingEvent
    implements
        Built<GetAllShoppingsFromProductIdStateInitiated,
            GetAllShoppingsFromProductIdStateInitiatedBuilder> {
  @nullable
  String get productId;
  GetAllShoppingsFromProductIdStateInitiated._();

  factory GetAllShoppingsFromProductIdStateInitiated(
          [updates(GetAllShoppingsFromProductIdStateInitiatedBuilder b)]) =
      _$GetAllShoppingsFromProductIdStateInitiated;
}
