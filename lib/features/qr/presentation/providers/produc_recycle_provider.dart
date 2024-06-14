import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenapp/features/qr/domain/models/recycling_point.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../../../../core/models/user_data.dart';
import '../states/product_recycle_state/product_recycle_state.dart';

final productRecycleProvider =
    NotifierProvider.autoDispose<_ProductRecycleNotifier, ProductRecycleState>(
        _ProductRecycleNotifier.new);

final class _ProductRecycleNotifier
    extends AutoDisposeNotifier<ProductRecycleState> {
  @override
  ProductRecycleState build() {
    Future(() => init());
    return ProductRecycleState.initial();
  }

  Future<void> init() async {
    ref.read(prodcuctRepositoryProvider).setUser();
    ref.read(prodcuctRepositoryProvider).getMachineInfo().listen(
      (event) async {
        final String? productId = event["product_id"]!;
        if (productId != null && productId.isNotEmpty) {
          final data =
              await ref.read(prodcuctRepositoryProvider).getProduct(productId);

          state = state.copyWith(
            productRecycle: data,
            productId: productId,
          );
        }
      },
    );
    ref.read(prodcuctRepositoryProvider).getUserInfo().listen(
      (event) {
        state = state.copyWith(
          userData: UserData(
            email: event["email"],
            name: event["name"],
            surname: event["surname"],
            id: event["id"],
            naturePoint: event["nature_point"].toDouble(),
            balance: event["balance"].toDouble(),
            recycled: event["recycled"],
            savedCo2: event["saved_co2"],
            profileImage: event["profile_image"],
          ),
        );
      },
    );
  }

  Future<void> setDone() async {
    ref.read(prodcuctRepositoryProvider).setDone(
          state.productRecycle!,
        );
    state = state.copyWith(isDone: true);
  }

  Future<void> setCanceled() async {
    ref.read(prodcuctRepositoryProvider).setCanceled(state.productRecycle!);
    state = state.copyWith(isCanceled: true);
  }

  Future<void> setPointAndRefund() async {
    ref
        .read(prodcuctRepositoryProvider)
        .setPointAndRefund(state.productRecycle!, state.userData!);
  }

  Future<void> resetInfo() async {
    ref.read(prodcuctRepositoryProvider).resetInfo();
    state = state.copyWith(
      isDone: false,
      isCanceled: false,
      productId: null,
      productRecycle: null,
    );
  }

  Future<void> again() async {
    state = state.copyWith(
      isDone: false,
      isCanceled: false,
      productId: null,
      productRecycle: null,
    );
    ref.read(prodcuctRepositoryProvider).again();
  }
}
