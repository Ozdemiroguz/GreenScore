import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greenapp/core/models/user_data.dart';
import 'package:greenapp/features/qr/domain/models/product_recycle.dart';
import 'package:greenapp/features/qr/domain/models/recycling_point.dart';

part 'product_recycle_state.freezed.dart';

@freezed
class ProductRecycleState with _$ProductRecycleState {
  factory ProductRecycleState({
    required String? productId,
    required ProductRecycle? productRecycle,
    required UserData? userData,
    required bool isLoading,
    required bool isDone,
    required bool isCanceled,
  }) = _ProductRecycleState;

  factory ProductRecycleState.initial() => ProductRecycleState(
        productId: null,
        isLoading: false,
        productRecycle: null,
        userData: null,
        isDone: false,
        isCanceled: false,
      );
}
