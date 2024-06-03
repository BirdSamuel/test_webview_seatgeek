import 'package:flutter/material.dart';
import 'package:test_webview_seatgeek/core/vertical_spacer.dart';
import 'package:test_webview_seatgeek/flutter_inappwebview/flutter_inappwebview_display.dart';
import 'package:test_webview_seatgeek/flutter_inappwebview/flutter_inappwebview_page.dart';
import 'package:test_webview_seatgeek/webview_flutter/webview_flutter_display.dart';
import 'package:test_webview_seatgeek/webview_flutter/webview_widget_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeatGeek Webview Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(title: 'WebView Testing'),
        '/webview-page': (context) => const WebViewWidgetPage(),
        '/inappwebview-page': (context) => const FlutterInAppWebviewPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WebviewFlutterDisplay(),
            VerticalSpacer(),
            Divider(),
            FlutterInAppWebViewDisplay(),
          ],
        ),
      ),
    );
  }
}
