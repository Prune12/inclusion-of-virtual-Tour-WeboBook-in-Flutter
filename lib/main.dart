import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final IFrameElement _iframeElement = IFrameElement();
  @override
  void initState() {
    super.initState();
    _iframeElement.style.height = "100%";
    _iframeElement.style.width = "100%";
    _iframeElement.src =
        "https://webobook.com/public/641e0206b033a94df728cf32,en";
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory('iframeElement', (int viewId) => _iframeElement);
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: "iframeElement",
    key: UniqueKey(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("webview demo"),
      ),
      body: Center(
        
         child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
            
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Expanded(child: _iframeWidget),
            ),
          ),
        
      ),
    );
  }
}
