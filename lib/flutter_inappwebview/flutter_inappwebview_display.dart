import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FlutterInAppWebViewDisplay extends StatefulWidget {
  const FlutterInAppWebViewDisplay({super.key});

  @override
  State<FlutterInAppWebViewDisplay> createState() =>
      _FlutterInAppWebViewDisplayState();
}

class _FlutterInAppWebViewDisplayState
    extends State<FlutterInAppWebViewDisplay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'flutter_inappwebview',
            textScaler: TextScaler.linear(2.0),
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        ElevatedButton(
          child: const Text('Modal'),
          onPressed: () async {
            await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.88,
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
                  );
                });
          },
        ),
        ElevatedButton(
          child: const Text('Push Nav'),
          onPressed: () async {
            Navigator.of(context).pushNamed('/inappwebview-page');
          },
        ),
      ],
    );
  }
}
