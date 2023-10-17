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
    title: Text(
      '¡Alerta!',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Rio ** en riesgo de desbordamiento. \n Su zona esta en riesgo de Inundación",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

class _NotificacionDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Notificación 1'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildPopupDialog(context));
            },
          )
        ],
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

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4388,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
                const Center(
                  child: Text(
                    "Atoyatl Estadio Tlahuicole",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                Center(
                  child: Image.asset('Assets/Images/MapaRio.png'),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.cyan,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 10.0,
                  ),
                ),
                child: const Column(
                  children: <Widget>[
                    Text(
                      'Rio: Rio Zahuapan                                 ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(""),
                    Text(
                      'Localidad: Tlaxcala, cerca a la zona El Mirador',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(""),
                    Text(
                      'Atoyatls mas cercanos:                    \n - Atoyatl Bodega Aurera \n - Atoyatl Paqueteria Express',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 192, 255, 248),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 60,
                        ),
                        Image.asset('Assets/Images/warningSign.png'),
                        const Text(' Riesgo de \n desbordamiento',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.6,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 75,
                        color: const Color.fromARGB(255, 131, 131, 131),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.only(left: 85),
                              child: Center(
                                child: Image.asset('Assets/Images/atoyatl.png'),
                              )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6458,
                              height: MediaQuery.of(context).size.height * 0.2,
                              color: const Color.fromARGB(68, 58, 160, 255),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 75,
                        color: const Color.fromARGB(255, 131, 131, 131),
                      ),
                    ],
                  ),
                )
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
                        width: MediaQuery.of(context).size.width * 0.6,
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
                        width: MediaQuery.of(context).size.width * 0.4,
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
                          )),
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: const Color.fromARGB(255, 192, 255, 248),
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.175,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      //color: Colors.amber,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Image.asset('Assets/Images/pfp.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    'Jose Hernandez',
                    style: TextStyle(
                      fontSize: 25, // Adjust the font size as needed
                      color: Colors.black, // Change the text color
                      fontWeight: FontWeight.bold, // Change the font weight
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.lightBlue,
            height: MediaQuery.of(context).size.height * 0.3888,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 10.0,
                  ),
                ),
              ),
            ),
          ),
        ],
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
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: _NotificacionDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: "Localización",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Pagina Principal",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
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
