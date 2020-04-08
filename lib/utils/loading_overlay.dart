import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  static OverlayEntry _loadingIndicator =
      OverlayEntry(maintainState: true, builder: (context) => LoadingOverlay());

  static bool _overlayVisible = false;

  static bool get overLayVisible => _overlayVisible;

  static showLoadingOverlay(BuildContext context) {
    Overlay.of(context).insert(_loadingIndicator);
    _overlayVisible = true;
  }

  static hideOverLay() {
    if (_overlayVisible){ 
      _overlayVisible = false;
      _loadingIndicator.remove();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white.withOpacity(0.2),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
