import 'package:colhesoja/controllers/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:  [
              Color.fromARGB(255, 219, 170, 35),
              Color.fromARGB(255, 175, 134, 20),
              Color.fromARGB(255, 139, 105, 9)
            ]
          )
        ),
      child: Scaffold(
        drawer: MenuDrawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: const Center(child: Text("ColheSoja"))
        ),
        body: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 8,
                      child: Container(
                        child: Text("Cotação Soja"),
                      ),
                    ),
                    Card(
                      elevation: 8,
                      child: Container(
                        child: Text("Cotação Dolar"),
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                flex: 5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      child: Container(
                        child: Text("Capacidade Operacional"),
                      ),
                    ),
                     Card(
                      child: Container(
                        child: Text("Custo Horario"),
                      ),
                    ),
                     Card(
                      child: Container(
                        child: Text("Estimativa Produtividade"),
                      ),
                    ),
                     Card(
                      child: Container(
                        child: Text("Perdas"),
                      ),
                    )
                  ],
                )
              ),
              Expanded(
                flex: 3,
                child: Container(
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}