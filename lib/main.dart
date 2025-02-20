import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          //tab 1: text
          Container(
            color: Colors.red,
            child: const Center(
              child: Text('This is a text widget'),
            ),
          ),

          //tab 2: image
          Container(
            color: Colors.green,
            child: Center(
              child: Image.network(
                'https://www.google.com/imgres?q=free%20flower%20transparent%20background&imgurl=https%3A%2F%2Fi.pinimg.com%2F736x%2Fb3%2Fc2%2Fb0%2Fb3c2b07591e831813e82006b756ac43f.jpg&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2Fpink-flower-isolated-on-transparent-background-flower-pink-flowr-flowers-png-transparent-image-and-clipart-for-free-download--333266441193585135%2F&docid=mpI4N0U-G4_9FM&tbnid=yZgJhI9VJZ9r1M&vet=12ahUKEwjA85H3rtOLAxXFGtAFHYnVLvUQM3oFCIIBEAA..i&w=640&h=640&hcb=2&ved=2ahUKEwjA85H3rtOLAxXFGtAFHYnVLvUQM3oFCIIBEAA',
                width: 150,
                height: 150,
              ),
            ),
          ),

          //tab 3: button
          Container(
            color: Colors.blue,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Button pressed in ${tabs[2]} tab!'),
                    ),
                  );
                },
                child: const Text('Click me'),
              ),
            ),
          ),

          //tab 4: list
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
    );
  }
}
