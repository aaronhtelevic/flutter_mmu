import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:flutter_mmu/types/delegate.dart';

class Delegates extends StatefulWidget {
  const Delegates({super.key});

  @override
  State<Delegates> createState() => _DelegatesState();
}

class DelegateTable extends StatelessWidget {
  final List<Delegate> delegates;

  const DelegateTable({super.key, required this.delegates});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text('First Name')),
            DataColumn(label: Text('Last Name')),
            DataColumn(label: Text('Username')),
          ],
          rows: delegates.map((Delegate delegate) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(delegate.fnam)),
                DataCell(Text(delegate.nam)),
                DataCell(Text(delegate.unam ?? "")),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _DelegatesState extends State<Delegates> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:7682'),
  );

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (snapshot.error is WebSocketException) {
                    WebSocketException e = snapshot.error as WebSocketException;
                    return Text('WSE Error: ${e.message}');
                  }

                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final delegates = _parseDelegates(snapshot.data);
                  if (delegates != null) {
                    return SizedBox(
                      height: 500.0, // Set the desired height
                      child: SingleChildScrollView(
                        child: DelegateTable(delegates: delegates),
                      ),
                    );
                  } else {
                    return const Text('');
                  }
                } else {
                  return const Text('Loading delegates...');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  List<Delegate>? _parseDelegates(String? data) {
    if (data == null) return null;
    try {
      final jsonData = jsonDecode(data);
      if (jsonData['nam'] == 'delinfo') {
        DelegateComm delegateComm = DelegateComm.fromJson(jsonData);
        return delegateComm.delegates;
      }
    } catch (e) {
      print('Error parsing JSON: $e');
    }
    return null;
  }
}
