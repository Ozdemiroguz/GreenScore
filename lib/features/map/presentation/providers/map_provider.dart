import 'package:greenapp/core/injections/locator.dart';
import 'package:greenapp/features/map/domain/models/map_recycling_point.dart';
import 'package:greenapp/features/qr/presentation/pages/qr_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/map_state.dart';

final mapProvider = NotifierProvider<_MapNotifier, MapState>(_MapNotifier.new);

final class _MapNotifier extends Notifier<MapState> {
  @override
  MapState build() {
    Future(() => init());

    return MapState.initial();
  }

  Future<void> init() async {
    print(ref.read(currentCategoryProvivder.notifier).state);
    final List<MapRecyclingPoint> mapRecyclingPoints = await ref
        .read(mapRepositoryProvider)
        .getRecyclingPoints(ref.read(currentCategoryProvivder.notifier).state);
    final List<bool> visibleMarkers =
        List.generate(mapRecyclingPoints.length, (index) => false);

    for (var element in mapRecyclingPoints) {
      if (element.location ==
          ref.read(currentLocationProvider.notifier).state) {
        visibleMarkers[mapRecyclingPoints.indexOf(element)] = true;
      } else {
        visibleMarkers[mapRecyclingPoints.indexOf(element)] = false;
      }
    }

    state = state.copyWith(
      mapRecyclingPoints: mapRecyclingPoints,
      visibleMarkers: visibleMarkers,
      currentLocation: ref.read(currentLocationProvider.notifier).state,
      // currentLocaiton:
    );
  }

  Future<void> toggleMarkerVisibility(int index) async {
    List<bool> visibleMarkers =
        List.from(state.visibleMarkers); // Kopya oluşturuluyor
    visibleMarkers[index] = !visibleMarkers[index];
    state = state.copyWith(visibleMarkers: visibleMarkers);
  }
}
