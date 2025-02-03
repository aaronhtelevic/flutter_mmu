import 'package:flutter/material.dart';
import 'package:flutter_mmu/agenda.dart';
import 'package:flutter_mmu/delegates.dart';
import 'package:flutter_mmu/header.dart';

void main() {
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
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'Delegates'),
                  Tab(text: 'Agenda'),
                ],
              ),
              Expanded(
                child: const TabBarView(
                  children: [
                    Delegates(),
                    Agenda(),
                  ],
                ),
              ),
              Row(spacing: 8, children: [
                TextButton(onPressed: () {}, child: Text('Font Size')),
                TextButton(onPressed: () {}, child: Text('Volume')),
                TextButton(onPressed: () {}, child: Text('Channel')),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
