import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/customs/custom_button.dart';
import 'package:greenapp/features/qr/presentation/providers/produc_recycle_provider.dart';
import 'package:greenapp/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProductPreviewPage extends HookConsumerWidget {
  const ProductPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRecycleProvider);
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (state.productId != null && !state.isDone && !state.isCanceled) &&
                      state.productRecycle != null
                  ? Column(
                      children: [
                        Image.network(
                          state.productRecycle!.image,
                          width: 200,
                          height: 200,
                        ),
                        Text(
                          "Ürününüz: ${state.productRecycle?.name}",
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text('${state.productRecycle!.refund.toString()}₺'),
                        Text(
                            '${state.productRecycle!.nature_point.toString()} point'),
                        ElevatedButton(
                          onPressed: () {
                            ref.read(productRecycleProvider.notifier).setDone();
                            ref
                                .read(productRecycleProvider.notifier)
                                .setPointAndRefund();
                          },
                          child: const Text("Onaylıyorum"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(productRecycleProvider.notifier)
                                  .setCanceled();
                            },
                            child: const Text("Onaylamıyorum"))
                      ],
                    )
                  : state.isCanceled || state.isDone
                      ? Column(
                          children: [
                            Text(
                                "Your Balance:${state.userData?.balance.toStringAsFixed(2)} "),
                            Text(
                                "Your Nature Point:${state.userData?.naturePoint.toString()}"),
                            Text(
                              textAlign: TextAlign.center,
                              state.isDone
                                  ? 'Your product has been recycled successfully'
                                  : "Your product has been canceled",
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            Icon(
                              state.isDone ? Icons.check_circle : Icons.cancel,
                              size: 48,
                              color: state.isDone ? Colors.green : Colors.red,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                                productRecycleProvider.notifier)
                                            .resetInfo();
                                        context.router.replaceAll([
                                          MainRoute(),
                                        ]);
                                      },
                                      text: "Main Page",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.h,
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                                productRecycleProvider.notifier)
                                            .again();
                                      },
                                      text: "Again",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "Lütfen ürününüzü makineye okutunuz",
                          textAlign: TextAlign.center,
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
