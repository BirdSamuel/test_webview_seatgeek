import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewFlutterDisplay extends StatefulWidget {
  const WebviewFlutterDisplay({super.key});

  @override
  State<WebviewFlutterDisplay> createState() => _WebviewFlutterDisplayState();
}

class _WebviewFlutterDisplayState extends State<WebviewFlutterDisplay> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..loadRequest(Uri.parse("https://www.seatgeek.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'webview_flutter',
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
                    child: WebViewWidget(
                      controller: _webViewController,
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
            Navigator.of(context).pushNamed('/webview-page');
          },
        ),
      ],
    );
  }
}
