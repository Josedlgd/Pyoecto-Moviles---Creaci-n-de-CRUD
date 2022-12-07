import 'package:flutter/material.dart';
import 'package:prueba0/page/addpage.dart';
import 'package:prueba0/page/registroplantapage.dart';
import '../services/firebase_crud.dart';
import 'loginpage.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Prueba proy',
    home: RecuperarContrasenia(),
  ));
}

Widget _buildPopupDialog(BuildContext context) {
  return  AlertDialog(
    title: const Text('Contraseña provicional'),
    content:  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Tu contraseña temporal es : admin"),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}

class RecuperarContrasenia extends StatefulWidget {
  const RecuperarContrasenia({Key? key}) : super(key: key);

  @override
  _RecuperarContraseniaState createState() => _RecuperarContraseniaState();
}

class _RecuperarContraseniaState extends State<RecuperarContrasenia> {
  TextEditingController? textController1;
  TextEditingController? textController2;

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

  @override
  Widget build(BuildContext context) {
// LLamada textform de nombre usuario

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
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Image.asset(
                    'assets/logo-removebg-preview.png',
                    width: 120,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0, -0.15),
                  child: Text(
                    'Recuperar contraseña',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      color: Color(0xFF2D382F),
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 40),
                  child: InkWell(
                    onTap: () async {
                      //context.pushNamed('InciarSesion');
                    },
                    child: const Text(
                      'Ingresa tu correo electrónico para recibir un método para reestablecer tu contraseña.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Crimson Pro',
                        color: Color(0xFF714D3B),
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Crimson Pro',
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: textController1,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.black),
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
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => _buildPopupDialog(context)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      primary: const Color(0xFF9DBE8B),
                      textStyle: const TextStyle(
                        fontFamily: 'Crimson Pro',
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    child: const Text("Enviar"),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 30),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          //CAMBIO DE PAGINA
                          MaterialPageRoute(
                              builder: (context) => IniciarSesion()));
                    },
                    child: const Text(
                      '¿Ya tienes cuenta?',
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
              Image.asset(
                'assets/planta-log.png',
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
