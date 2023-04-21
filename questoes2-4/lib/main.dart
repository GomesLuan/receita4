import 'package:flutter/material.dart';

var dataObjects = [
  {
    "name": "La Fin Du Monde",
    "style": "Bock",
    "ibu": "65"
  },
  {
    "name": "Sapporo Premiume",
    "style": "Sour Ale",
    "ibu": "54"
  },
  {
    "name": "Duvel", 
    "style": "Pilsner", 
    "ibu": "82"
  },
  {
    "name": "Cerveja 1",
    "style": "Genérico",
    "ibu": "01"
  },
  {
    "name": "Cerveja 2",
    "style": "Genérico",
    "ibu": "02"
  },
  {
    "name": "Cerveja 3",
    "style": "Genérico",
    "ibu": "03"
  },
  {
    "name": "Cerveja 4",
    "style": "Genérico",
    "ibu": "04"
  },
  {
    "name": "Cerveja 5",
    "style": "Genérico",
    "ibu": "05"
  },
  {
    "name": "Cerveja 6",
    "style": "Genérico",
    "ibu": "06"
  },
  {
    "name": "Cerveja 7",
    "style": "Genérico",
    "ibu": "07"
  },
  {
    "name": "Cerveja 8",
    "style": "Genérico",
    "ibu": "08"
  },
  {
    "name": "Cerveja 9",
    "style": "Genérico",
    "ibu": "09"
  },
];
var beerColumnNames = ["Nome","Estilo","IBU"];


void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar( 
          title: const Text("Dicas"),
        ),
        body: MytileWidget(
          objects: dataObjects, 
          columnNames: beerColumnNames,
        ),
        bottomNavigationBar: NewNavBar(),
      )
    );
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
        label: "Cervejas", 
        icon: Icon(Icons.local_drink_outlined)
      ),
      BottomNavigationBarItem(
        label: "Nações", 
        icon: Icon(Icons.flag_outlined)
      )
    ]);
  }
}

class MytileWidget extends StatelessWidget {
  final List<Map> objects;
  final List columnNames;

  MytileWidget( {
    this.objects = const [], 
    this.columnNames = const [], 
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: columnNames.map( 
          (name) => DataColumn(
            label: Expanded(
              child: Text(name, style: TextStyle(fontStyle: FontStyle.italic))
            )
          )
        ).toList(),
        rows: objects.map( 
          (obj) => DataRow(
            cells: obj.keys.map(
              (propName) => DataCell(Text(obj[propName]))
            ).toList()
          )
        ).toList()
      )
    );
  }
}