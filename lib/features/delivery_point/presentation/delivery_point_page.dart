import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DeliveryPointPage extends ConsumerWidget {
  const DeliveryPointPage();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: const Text('Delivery Point'),
      ),
    );
  }
}
