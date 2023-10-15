import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atoyatl',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Atoyatl'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget _buildPopupDialog(BuildContext context) {
  return const AlertDialog(
    title: Text('Popup example'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hello"),
      ],
    ),
  );
}

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Location Page',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;
  final String text;

  const GridItem({super.key, required this.index, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18, // Adjust the font size as needed
            color: Colors.black, // Change the text color
            fontWeight: FontWeight.bold, // Change the font weight
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 350,
            width: 600,
            color:  const Color.fromARGB(255, 192, 255, 248),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 600,
                  child: Center(
                    child: Row(
                      children: <Widget> [
                        const SizedBox(width: 60, ),
                        Image.asset('Assets/Images/warningSign.png'),
                        const Text(
                          ' Riesgo de \n desbordamiento',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 273.52,
                        color: const Color(0xFFa7fff4),
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Tiempo estimado a \n   desbordamiento: \n          1:02:30',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        color: const Color(0xFFa7fff4),
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: const Center(
                            child: Text(
                              'Porcentaje de \n       riesgo: \n          80%',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.blueAccent,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2, 
                      ),
                      itemBuilder: (context, index) {
                        String text;
                        if (index == 0) {
                          text = '    Densidad: \n 1000 kg/m^3';
                        } else if (index == 1) {
                          text = ' Altura: \n    8m';
                        } else if (index == 2) {
                          text = ' Temperatura: \n     18.72°C';
                        } else if (index == 3) {
                          text = ' PH: \n   5 ';
                        } else if (index == 4) {
                          text = ' Velocidad: \n    1km/h';
                        } else {
                          text = ' Volumen: \n       ¿?';
                        }
                        return GridItem(
                          index: index,
                          text: text,
                        );
                      },
                      itemCount: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    const LocationPage(),
    const HomePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: const TextStyle(fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: "Select Location",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
    );
  }
}
