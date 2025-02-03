import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_mmu/types/delegate.dart';
import 'package:flutter/services.dart' show rootBundle;

class DelegateDataSource extends DataTableSource {
  final List<Delegate> delegates;

  DelegateDataSource(this.delegates);

  @override
  DataRow getRow(int index) {
    final delegate = delegates[index];
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(delegate.fnam)),
        DataCell(Text(delegate.nam)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => delegates.length;

  @override
  int get selectedRowCount => 0;
}

class DelegatesPage extends StatefulWidget {
  const DelegatesPage({super.key});

  @override
  State<DelegatesPage> createState() => _DelegatesPageState();
}

class DelegateTable extends StatelessWidget {
  final List<Delegate> delegates;

  const DelegateTable({super.key, required this.delegates});

  @override
  Widget build(BuildContext context) {
    final delegateDataSource = DelegateDataSource(delegates);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: PaginatedDataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('First Name')),
          DataColumn(label: Text('Last Name')),
        ],
        source: delegateDataSource,
        rowsPerPage: 60,
      ),
    );
  }
}

class _DelegatesPageState extends State<DelegatesPage> {
  Future<List<Delegate>>? _futureDelegates;

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  void initState() {
    super.initState();
    _futureDelegates = loadDelegates();
  }

  Future<List<Delegate>> loadDelegates() async {
    final String jsonString =
        await rootBundle.loadString('assets/delegates.json');
    return _parseDelegates(jsonString) ?? [];
  }

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Delegate>>(
              future: _futureDelegates,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Delegate>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.data != null) {
                    return Expanded(
                      flex: 1,
                      child: DelegateTable(delegates: snapshot.data!),
                    );
                  } else {
                    return const Text('');
                  }
                }
              },
            ),
            Flexible(flex: 2, child: Container())
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
