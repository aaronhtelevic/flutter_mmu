import 'package:flutter/material.dart';
import 'package:flutter_mmu/delegate_widget.dart';
import 'dart:convert';
import 'package:flutter_mmu/types/delegate.dart';
import 'package:flutter/services.dart' show rootBundle;

class DelegatesPage extends StatefulWidget {
  const DelegatesPage({super.key});

  @override
  State<DelegatesPage> createState() => _DelegatesPageState();
}

class _DelegatesPageState extends State<DelegatesPage> {
  Future<List<Delegate>>? _futureDelegates;

  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();

  List<Delegate> _allDelegates = [];

  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
    _futureDelegates = loadDelegates();
  }

  Future<List<Delegate>> loadDelegates() async {
    final String jsonString =
        await rootBundle.loadString('assets/delegates.json');
    _allDelegates = _parseDelegates(jsonString) ?? [];
    return _allDelegates;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Delegate> _filterDelegates() {
    if (_searchText.isEmpty) {
      return _allDelegates;
    } else {
      return _allDelegates
          .where((delegate) =>
              delegate.fnam.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: SearchBar(
              hintText: "Search delegates", controller: _searchController),
        ),
        Expanded(
          child: FutureBuilder<List<Delegate>>(
            future: _futureDelegates,
            builder:
                (BuildContext context, AsyncSnapshot<List<Delegate>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                if (snapshot.data != null) {
                  final delegates = _filterDelegates();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5, // Adjust the aspect ratio as needed
                    ),
                    itemCount: delegates.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DelegateWidget(delegate: delegates[index]);
                    },
                  );
                } else {
                  return const Text('');
                }
              }
            },
          ),
        )
      ],
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
