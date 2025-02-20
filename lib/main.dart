import 'package:flutter/material.dart';

void main() {
  runApp(const TabsApp());
}

class TabsApp extends StatelessWidget {
  const TabsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: _TabsNonScrollableDemo(),
      ),
    );
  }
}

class _TabsNonScrollableDemo extends StatefulWidget {
  @override
  __TabsNonScrollableDemoState createState() =>
      __TabsNonScrollableDemoState();
}

class __TabsNonScrollableDemoState extends State<_TabsNonScrollableDemo>
    with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController _tabController;
  final RestorableInt tabIndex = RestorableInt(0);
  final TextEditingController _textController = TextEditingController();

  @override
  String get restorationId => 'tab_non_scrollable_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(tabIndex, 'tab_index');
    _tabController.index = tabIndex.value;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        tabIndex.value = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    tabIndex.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = ['Text', 'Image', 'Button', 'ListView'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Tabs Demo'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: [for (final tab in tabs) Tab(text: tab)],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Text with Text Field
          Container(
            color: Colors.red,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _textController,
                    onSubmitted: (value) => setState(() {}),
                    decoration: const InputDecoration(
                      hintText: 'Enter some text',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _textController.text.isEmpty
                        ? 'Please enter some text'
                        : _textController.text,
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),

          // Tab 2: Image with Card Widget
          Container(
            color: Colors.green,
            child: Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/flower.jpg',
                      height: 250,
                      width: 250
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Flower Card Widget'),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tab 3: Button with Alert Dialog
          Container(
            color: Colors.blue,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Alert"),
                        content: const Text("This is an alert dialog."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Show Alert'),
              ),
            ),
          ),

          // Tab 4: ListView
          Container(
            color: Colors.yellow,
            child: ListView(
              children: const [
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
                ListTile(title: Text('Item 3')),
                ListTile(title: Text('Item 4')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a bottom app bar'),
          ],
        ),
      ),
    );
  }
}
