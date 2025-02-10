import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'types/agenda.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  Future<Agenda?>? _futureAgenda;

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void initState() {
    super.initState();
    _futureAgenda = loadAgenda();
  }

  Future<Agenda?> loadAgenda() async {
    final String jsonString = await rootBundle.loadString('assets/agenda.json');

    return _parseAgenda(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: FutureBuilder<Agenda?>(
        future: _futureAgenda,
        builder: (BuildContext context, AsyncSnapshot<Agenda?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (snapshot.data != null) {
              return Text('Agenda: ${snapshot.data!.ti.val[0]}');
            } else {
              return const Text('');
            }
          }
        },
      ),
    );
  }

  Agenda? _parseAgenda(String? data) {
    if (data == null) return null;
    try {
      final jsonData = jsonDecode(data);
      if (jsonData['nam'] == 'agenda') {
        AgendaComm agendaComm = AgendaComm.fromJson(jsonData);
        return agendaComm.ag;
      }
    } catch (e) {
      print('Error parsing JSON: $e');
    }
    return null;
  }
}
