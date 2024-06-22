import 'package:greenapp/features/qr/presentation/pages/qr_page.dart';
import 'package:greenapp/features/qr/presentation/states/map_state/scan_map_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';

final scanMapProvider =
    NotifierProvider.autoDispose<_ScanMapNotifier, ScanMapState>(
        _ScanMapNotifier.new);

final class _ScanMapNotifier extends AutoDisposeNotifier<ScanMapState> {
  @override
  ScanMapState build() {
    Future(() => init());
    return ScanMapState.initial();
  }

  Future<void> init() async {
    state = state.copyWith(
        currentLocation:
            await ref.read(locationServiceProvier).getCurrentPosition(),
        recyclingPoints: ref.read(
          currentPointsProvider,
        ),
        currentRecyclingPoint: await ref.read(currentLocationProvider),
        currentRecycling: await ref.read(currentRecyclingPointProvider));
  }
}
