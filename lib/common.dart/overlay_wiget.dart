import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../core/models/status.dart';

class OverlayWidget extends StatefulWidget {
  final String error;
  final AuthStatus status;
  final VoidCallback onTap;
  final Widget child;

  const OverlayWidget({
    super.key,
    required this.status,
    required this.onTap,
    required this.child,
    required this.error,
  });

  @override
  State<OverlayWidget> createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  @override
  Widget build(BuildContext context) {
    //switch case for state
    switch (widget.status) {
      case AuthStatus.loading:
        return Stack(
          children: [
            widget.child,
            const BuildLoading(),
          ],
        );
      case AuthStatus.error:
        return GestureDetector(
          onTap: widget.onTap,
          child: Stack(
            children: [
              widget.child,
              BuildError(message: widget.error),
            ],
          ),
        );
      case AuthStatus.authenticated:
        return Stack(
          children: [
            widget.child,
            const BuildAuthenticated(),
          ],
        );
      default:
        return widget.child;
    }
  }
}

class BuildLoading extends StatelessWidget {
  const BuildLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(orange),
        ),
      ),
    );
  }
}

class BuildError extends StatelessWidget {
  final String message;

  const BuildError({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: red,
              size: 50,
            ),
            Text(
              message,
              style: const TextStyle(color: red),
            ),
            // TextButton(
            //   onPressed: onTap,
            //   child: Text(
            //     "Try Again",
            //     style: TextStyle(color: orange),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class BuildAuthenticated extends StatelessWidget {
  const BuildAuthenticated({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBlue.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: green,
              size: 50,
            ),
            //ingilizce giriş yaptı yazısı
            const Text(
              textAlign: TextAlign.center,
              "You have successfully logged in",
              style: TextStyle(
                color: green,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            const Text(
              "You will be redirected to the home page",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: green,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
