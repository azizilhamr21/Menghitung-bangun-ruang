import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalkulator Volume',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildMenu(
      BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.deepPurple),
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => page));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Volume Bangun Ruang"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildMenu(context, "Kubus", Icons.square_outlined,
                const KubusPage()),
            buildMenu(context, "Tabung", Icons.circle_outlined,
                const TabungPage()),
            buildMenu(context, "Kerucut", Icons.change_history,
                const KerucutPage()),
          ],
        ),
      ),
    );
  }
}

class KubusPage extends StatefulWidget {
  const KubusPage({super.key});

  @override
  State<KubusPage> createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController sisiController = TextEditingController();
  double hasil = 0;

  void hitung() {
    double s = double.parse(sisiController.text);
    setState(() {
      hasil = pow(s, 3).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold("Volume Kubus", "Masukkan Sisi", hitung,
        sisiController, hasil);
  }
}

class TabungPage extends StatefulWidget {
  const TabungPage({super.key});

  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final TextEditingController rController = TextEditingController();
  final TextEditingController tController = TextEditingController();
  double hasil = 0;

  void hitung() {
    double r = double.parse(rController.text);
    double t = double.parse(tController.text);
    setState(() {
      hasil = pi * pow(r, 2) * t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold2("Volume Tabung", rController, tController, hitung, hasil);
  }
}

class KerucutPage extends StatefulWidget {
  const KerucutPage({super.key});

  @override
  State<KerucutPage> createState() => _KerucutPageState();
}

class _KerucutPageState extends State<KerucutPage> {
  final TextEditingController rController = TextEditingController();
  final TextEditingController tController = TextEditingController();
  double hasil = 0;

  void hitung() {
    double r = double.parse(rController.text);
    double t = double.parse(tController.text);
    setState(() {
      hasil = (1 / 3) * pi * pow(r, 2) * t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold2("Volume Kerucut", rController, tController, hitung, hasil);
  }
}

Widget buildScaffold(String title, String label,
    VoidCallback hitung, TextEditingController controller, double hasil) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: hitung,
            child: const Text("Hitung"),
          ),
          const SizedBox(height: 20),
          Text("Hasil: ${hasil.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );
}

Widget buildScaffold2(String title,
    TextEditingController rController,
    TextEditingController tController,
    VoidCallback hitung,
    double hasil) {
  return Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: rController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Jari-jari",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: tController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Tinggi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: hitung,
            child: const Text("Hitung"),
          ),
          const SizedBox(height: 20),
          Text("Hasil: ${hasil.toStringAsFixed(2)}",
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );
}