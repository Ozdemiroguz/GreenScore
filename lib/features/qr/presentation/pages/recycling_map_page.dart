import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecyclingMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycling Points Map'),
      ),
      body: Center(
        child: Text('Recycling Points Map'),
      ),
    );
  }
}
