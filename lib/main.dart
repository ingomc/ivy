import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Countdowns {
  final String title;

  Countdowns(this.title);
}

final countdowns = List<Countdowns>.generate(
  4,
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
    return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
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
          notchMargin: 6.0,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => {_onItemTapped(0)},
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0, bottom:8.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.date_range),
                            Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text('Alle', maxLines: 1, textScaleFactor: 0.8,),
                            )
                          ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => {_onItemTapped(1)},
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0, bottom:8.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.today),
                            Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text('Einmalig', maxLines: 1, textScaleFactor: 0.8,),
                            )
                          ]),
                    ),
                  ),
                ),
                SizedBox(width: 80, height: 25),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => {_onItemTapped(2)},
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0, bottom:8.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.cake),
                            Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text('Wiederholend', maxLines: 1, textScaleFactor: 0.8,),
                            )
                          ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => {_onItemTapped(3)},
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0, bottom:8.0),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.account_circle),
                            Padding(
                              padding: const EdgeInsets.only(top:4.0),
                              child: Text('Profil', maxLines: 1, textScaleFactor: 0.8,),
                            )
                          ]),
                    ),
                  ),
                ),
              ]),
        ));
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
