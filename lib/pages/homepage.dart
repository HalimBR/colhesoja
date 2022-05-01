import 'package:colhesoja/controllers/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                          onTap: (){
                            setState(() {
                              corsoja = selecionado;
                            corsojatxt = selecionado;
                            cormoeda = normal;
                            cormoedatxt = normaltxt;
                            cortempo = normal;
                            cortempotxt = normaltxt;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                                child: Text(
                              "SOJA",
                              style: GoogleFonts.iceberg(fontSize: 20, color: corsojatxt),
                            )),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(187, 135, 75, 1),
                                border: Border(
                                  bottom: BorderSide(
                                    color: corsoja
                                  )
                                )
                            ),
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
                          });
                        },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                                child: Text(
                              "TEMPO",
                              style: GoogleFonts.iceberg(fontSize: 20, color: cortempotxt),
                            )),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(187, 135, 75, 1),
                                border: Border(
                                  bottom: BorderSide(
                                    color: cortempo
                                  )
                                )),
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
                          });
                        },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: Center(
                                child: Text(
                              "MOEDA",
                              style: GoogleFonts.iceberg(fontSize: 20, color: cormoedatxt),
                            )),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(187, 135, 75, 1),
                                border: Border(
                                  bottom: BorderSide(
                                    color: cormoeda
                                  )
                                )),
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
                            image: AssetImage("assets/fundo.png"))),
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
                                              child: Text("Perdas", style: GoogleFonts.iceberg(
                                                color: Colors.black,
                                                fontSize: 16
                                              ),),
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
                                              child: Text("Produtividade Estimativa", style: GoogleFonts.iceberg(
                                                color: Colors.black,
                                                fontSize: 16,
                                                
                                              ), textAlign: TextAlign.center),
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
                                              child: Text("Custo Horário", style: GoogleFonts.iceberg(
                                                color: Colors.black,
                                                fontSize: 16,
                                                
                                              ), ),
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
                                              child: Text("Capacidade Operacional", style: GoogleFonts.iceberg(
                                                color: Colors.black,
                                                fontSize: 16,
                                                
                                              ), textAlign: TextAlign.center),
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
