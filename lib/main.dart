import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Countdowns {
  final String title;

  Countdowns(this.title);
}

final countdowns = List<Countdowns>.generate(
  5,
  (i) => Countdowns(
    'Countdown $i',
  ),
);

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.teal.shade400,
      ),
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Text(
      'Index 1: Einmalig',
    ),
    Text(
      'Index 2: Wiederholend',
    ),
    Text(
      'Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 20,
        hoverElevation: 20,
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.white10,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              title: Text('Alle'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              title: Text('Einmalig'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              title: Text('Wiederholend'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Einstellungen'),
            ),
          ],
          selectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: countdowns.length,
      itemBuilder: (context, index) {
        return TimeCard();
      },
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        child: InkWell(
          child: Image(image: AssetImage('assets/image.jpeg')),
        ));
  }
}
