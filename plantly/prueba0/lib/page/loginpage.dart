import 'package:flutter/material.dart';
import 'package:prueba0/page/addpage%20copy.dart';
import 'package:prueba0/page/addpage.dart';
import 'package:prueba0/page/registroplantapage.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({Key? key}) : super(key: key);

  @override
  _IniciarSesionState createState() =>
      _IniciarSesionState();
}

class _IniciarSesionState
    extends State<IniciarSesion> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final _usuario = TextEditingController();
  final _password = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }
  final usuario = TextEditingController();
  final pasword = TextEditingController();

  String usu ='';
  String pasw= '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          backgroundColor: const Color(0xD76FB244),
          automaticallyImplyLeading: false,
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              //Imagen top
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Image.asset('assets/logo-removebg-preview.png',
                    width: 120,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //titulo iniciar secion
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0, -0.15),
                  child: Text(
                    'Inicia sesión',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      color: Color.fromARGB(255, 26, 30, 26),
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              // contenedor de todo
              Align(
                alignment: const AlignmentDirectional(0.15, 0),
                child: Container(
                  width: 350,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Texto Email
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Crimson Pro',
                            fontSize: 17,
                            color: Color.fromARGB(255, 26, 30, 26),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      //TextFOrm EMail
                      TextFormField(
                        controller: _usuario,
                        autofocus: true,
                        obscureText: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                          return 'Este elemento es necesario';
                            }
                          },
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Colors.black
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Align contrasenia
              Align(
                alignment: const AlignmentDirectional(0.15, 0),
                child: Container(
                  width: 350,
                  height: 80,
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),

                  child: Align(
                    //alignment: const AlignmentDirectional(0, -0.15),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Texto de Contrasenia
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Text(
                            'Contraseña',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        //TetForm Contrsasenia
                        TextFormField(
                          controller: _password,
                          autofocus: true,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                               return 'Este elemento es necesario';
                                 }
                             },
                          decoration: InputDecoration(
                            //hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color:
                                Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color:
                                Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            filled: true,
                              fillColor: Colors.white,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  //Buttom Inciiar Sesion
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      //usu = usuario.text;
                      usu = _usuario.text;
                      pasw = _password.text;
                      //pasw = pasword.text;

                      if(usu == 'admin' && pasw == 'admin')
                      {
                        Navigator.push(
                        context,
                        //CAMBIO DE PAGINA
                        MaterialPageRoute(builder: (context) =>  AddPage()),
                      );
                      }
                      else
                      {
                        print('no validado');
                      }

                      
                    },
                    //Button estilo Iniciar Sesion
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      primary: const Color(0xFF9DBE8B),
                      
                      textStyle: const TextStyle(
                        fontFamily: 'Crimson Pro',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w200,
                      ),

                    ), child: const Text ("Iniciar sesión"),
                  ),
                ),
              ),
              //Aling Olvide mi Contrsenia
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 30),
                  child: InkWell(
                    onTap: () async {
                      //context.pushNamed('InciarSesion');
                    },
                    //Texto Olvide mi contrasenia
                    child: const Text(
                      '¿Olvide mi contraseña?',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Crimson Pro',
                        color: Color(0xFF714D3B),
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              //Imagen Bottom
              Image.asset('assets/planta-log.png',
                width: 50,
                height: 500,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}