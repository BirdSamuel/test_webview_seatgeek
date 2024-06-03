import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidgetPage extends StatefulWidget {
  const WebViewWidgetPage({super.key});
  @override
  State<WebViewWidgetPage> createState() => _WebViewWidgetPageState();
}

class _WebViewWidgetPageState extends State<WebViewWidgetPage> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..loadRequest(Uri.parse("https://www.seatgeek.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("WebViewWidgetPage"),
      ),
      body: Center(
        child: WebViewWidget(
          controller: _webViewController,
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
