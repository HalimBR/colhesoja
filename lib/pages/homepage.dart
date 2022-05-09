import 'dart:convert';

import 'package:colhesoja/controllers/drawer.dart';
import 'package:colhesoja/models/jsontempo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final lat;
  final lng;
  const HomePage({Key? key, required this.lat, required this.lng})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController(initialPage: 0);
  // ignore: prefer_const_constructors
  var corsoja = Color.fromRGBO(242, 226, 171, 1);
  var cortempo = Colors.transparent;
  var cormoeda = Colors.transparent;
  var cortempotxt = Colors.black;
  var cormoedatxt = Colors.black;
  var corsojatxt = Color.fromRGBO(242, 226, 171, 1);
  Color selecionado = Color.fromRGBO(242, 226, 171, 1);
  Color normal = Colors.transparent;
  Color normaltxt = Colors.black;

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
              colors: [
                Color.fromARGB(255, 219, 170, 35),
                Color.fromARGB(255, 175, 134, 20),
                Color.fromARGB(255, 139, 105, 9)
              ])),
      child: Scaffold(
          drawer: const MenuDrawer(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromRGBO(81, 34, 13, 1),
              title: Text("ColheSoja", style: GoogleFonts.iceberg())),
          body: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              corsoja = selecionado;
                              corsojatxt = selecionado;
                              cormoeda = normal;
                              cormoedatxt = normaltxt;
                              cortempo = normal;
                              cortempotxt = normaltxt;
                              _controller.jumpToPage(0);
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                                child: Text(
                              "SOJA",
                              style: GoogleFonts.iceberg(
                                  fontSize: 20, color: corsojatxt),
                            )),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(187, 135, 75, 1),
                                border:
                                    Border(bottom: BorderSide(color: corsoja))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              cormoeda = normal;
                              corsoja = normal;
                              corsojatxt = normaltxt;
                              cormoedatxt = normaltxt;
                              cortempo = selecionado;
                              cortempotxt = selecionado;
                              _controller.jumpToPage(1);
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                                child: Text(
                              "TEMPO",
                              style: GoogleFonts.iceberg(
                                  fontSize: 20, color: cortempotxt),
                            )),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(187, 135, 75, 1),
                                border: Border(
                                    bottom: BorderSide(color: cortempo))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              cormoeda = selecionado;
                              corsoja = normal;
                              corsojatxt = normaltxt;
                              cormoedatxt = selecionado;
                              cortempo = normal;
                              cortempotxt = normaltxt;
                              _controller.jumpToPage(2);
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                                child: Text(
                              "MOEDA",
                              style: GoogleFonts.iceberg(
                                  fontSize: 20, color: cormoedatxt),
                            )),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(187, 135, 75, 1),
                                border: Border(
                                    bottom: BorderSide(color: cormoeda))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          tileMode: TileMode.clamp,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(187, 135, 75, 1),
                            Colors.white
                          ]),
                      image: DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: AssetImage("assets/fundo.png")),
                    ),
                    child: PageView(
                      controller: _controller,
                      allowImplicitScrolling: false,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Soja(),
                        Tempo(lat: widget.lat, lng: widget.lng),
                        Moeda()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.height,
                    color: const Color.fromRGBO(242, 226, 171, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "FUNCIONALIDADES",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Selecione um dos recursos abaixo para obter maiores informações sobre a colheita mecanizada da soja",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(
                                bottom: 25, left: 15, right: 15, top: 15),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Card(
                                  color: const Color.fromRGBO(115, 97, 47, 1),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(115, 97, 47, 1),
                                              Color.fromRGBO(172, 155, 103, 55),
                                              Colors.white
                                            ])),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Center(
                                              child: Text(
                                                "Perdas",
                                                style: GoogleFonts.iceberg(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.asset(
                                            "assets/perdas.png",
                                            alignment: Alignment.bottomCenter,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: const Color.fromRGBO(115, 97, 47, 1),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(115, 97, 47, 1),
                                              Color.fromRGBO(172, 155, 103, 55),
                                              Colors.white
                                            ])),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Center(
                                              child: Text(
                                                  "Produtividade Estimativa",
                                                  style: GoogleFonts.iceberg(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.asset(
                                            "assets/estimativas.png",
                                            alignment: Alignment.bottomCenter,
                                            scale: 2,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: const Color.fromRGBO(115, 97, 47, 1),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(115, 97, 47, 1),
                                              Color.fromRGBO(172, 155, 103, 55),
                                              Colors.white
                                            ])),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Center(
                                              child: Text(
                                                "Custo Horário",
                                                style: GoogleFonts.iceberg(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Image.asset(
                                            "assets/calculadora.png",
                                            alignment: Alignment.bottomCenter,
                                            cacheWidth: 400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: const Color.fromRGBO(115, 97, 47, 1),
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(115, 97, 47, 1),
                                              Color.fromRGBO(172, 155, 103, 55),
                                              Colors.white
                                            ])),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Center(
                                              child: Text(
                                                  "Capacidade Operacional",
                                                  style: GoogleFonts.iceberg(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                  textAlign: TextAlign.center),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Image.asset(
                                                  "assets/capacidade.png"),
                                              Image.asset(
                                                  "assets/operacional.png")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class Soja extends StatefulWidget {
  const Soja({Key? key}) : super(key: key);

  @override
  State<Soja> createState() => _SojaState();
}

class _SojaState extends State<Soja> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

class Tempo extends StatefulWidget {
  final lat;
  final lng;
  const Tempo({Key? key, this.lat, this.lng}) : super(key: key);

  @override
  State<Tempo> createState() => _TempoState();
}

class _TempoState extends State<Tempo> {
  Future<JsonTEMPO> getTempo() async {
    var lat = widget.lat;
    var lng = widget.lng;
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lng&appid=cb39989a80c47f27caa6dfc7039e2e67&units=metric");
    var response = await http.get(url);
    JsonTEMPO jsonTEMPO = JsonTEMPO.fromJson(jsonDecode(response.body));
    return jsonTEMPO;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<JsonTEMPO>(
      future: getTempo(),
      builder: (context, snap) {
        if (snap.hasData) {
          return Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(187, 135, 75, 1),
                        child: Icon(
                          FontAwesomeIcons.moon,
                          color: Color.fromRGBO(242, 226, 171, 1),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snap.data!.main!.temp!.toStringAsFixed(0) +
                                "°" +
                                "C",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(81, 34, 13, 1),
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            snap.data!.weather![0].description.toString(),
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(81, 34, 13, 1),
                                fontSize: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                            snap.data!.name.toString()
                                ,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(81, 34, 13, 1),
                              fontSize: 15,
                            ),
                          ),
                  SizedBox(height: MediaQuery.of(context).size.height / 7,)
                  
                ],
              ));
        } else
          return Container(
            child: Text("Erro"),
          );
      },
    );
  }
}

class Moeda extends StatefulWidget {
  const Moeda({Key? key}) : super(key: key);

  @override
  State<Moeda> createState() => _MoedaState();
}

class _MoedaState extends State<Moeda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
