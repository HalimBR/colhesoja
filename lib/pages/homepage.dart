import 'package:colhesoja/controllers/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        drawer: const MenuDrawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(81, 34, 13, 1),
          title:  Text("ColheSoja", style: GoogleFonts.iceberg())
        ),
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
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Center(child: Text("SOJA", style: GoogleFonts.iceberg(fontSize: 20),)),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(187, 135, 75, 1),
                          border: Border.all(
                            color: Colors.black,
                            width: 2
                          )

                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Center(child: Text("TEMPO", style: GoogleFonts.iceberg(fontSize: 20),)),
                        decoration: const BoxDecoration(

                          color: Color.fromRGBO(187, 135, 75, 1),
                          border:  Border(
                            top:  BorderSide(
                              color: Colors.black,
                              width: 2
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2
                            ),
                          )

                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Center(child: Text("MOEDA", style: GoogleFonts.iceberg(fontSize: 20),)),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(187, 135, 75, 1),
                          border: Border.all(
                            color: Colors.black,
                            width: 2
                          )

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
                      ]
                    ),
                    image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage("assets/fundo.png")
                    )
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
                        child: Text("FUNCIONALIDADES", style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 16,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text("Selecione um dos recursos abaixo para obter maiores informações sobre a colheita mecanizada da soja", style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 10,
                        ),),
                      ),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            bottom: 25,
                            left: 15,
                            right: 15,
                            top: 15
                          ),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [

                               Card(
                                color: const Color.fromRGBO(115, 97, 47, 1),
                                elevation: 5,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Image.asset("assets/perdas.png", 
                                        
                                        
                                        
                                        )
                                    ],
                                  ),
                                  
                                  
                                ),
                              ),
                              Card(
                                color: const Color.fromRGBO(115, 97, 47, 1),
                                elevation: 5,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Image.asset("assets/estimativas.png", 
                                        cacheWidth: 400,
                                        
                                        )
                                    ],
                                  ),
                                  
                                  
                                ),
                              ),
                              Card(
                                color: const Color.fromRGBO(115, 97, 47, 1),
                                elevation: 5,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  
                                  
                                ),
                              ),
                              Card(
                                color: const Color.fromRGBO(115, 97, 47, 1),
                                elevation: 5,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  
                                  
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
        )
      ),
    );
  }
}