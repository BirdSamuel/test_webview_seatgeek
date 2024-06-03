import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FlutterInAppWebviewPage extends StatefulWidget {
  const FlutterInAppWebviewPage({super.key});
  @override
  State<FlutterInAppWebviewPage> createState() =>
      _FlutterInAppWebviewPageState();
}

class _FlutterInAppWebviewPageState extends State<FlutterInAppWebviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("FlutterInAppWebView Page"),
      ),
      body: Center(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse("https://www.seatgeek.com"),
          ),
          gestureRecognizers: {
            Factory<DragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
          },
        ),
      ),
    );
  }
}
