import 'package:flutter/material.dart';
import 'package:flutter_mmu/agenda_page.dart';
import 'package:flutter_mmu/home_page.dart';
// import 'package:flutter_mmu/video_example.dart';
import 'package:flutter_mmu/delegates_page.dart';
import 'package:flutter_mmu/video_example.dart';
import 'package:flutter_mmu/video_page.dart';
import 'dart:io';

import 'package:flutterpi_gstreamer_video_player/flutterpi_gstreamer_video_player.dart';

void main() {
  String flutterPi = Platform.environment['FLUTTER_PI'] ?? '0';
  if (flutterPi == '1') {
    FlutterpiVideoPlayer.registerWith();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFA6CF39)),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'Home'),
                  Tab(text: 'Delegates'),
                  Tab(text: 'Agenda'),
                  Tab(text: 'Movie'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    HomePage(),
                    DelegatesPage(),
                    AgendaPage(),
                    Platform.environment['FLUTTER_PI'] == '1'
                        ? VideoPage()
                        : VideoExamplePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
