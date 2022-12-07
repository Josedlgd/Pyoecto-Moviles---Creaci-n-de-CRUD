import 'package:flutter/material.dart';
import 'package:prueba0/page/addpage.dart';
import 'package:prueba0/page/registroplantapage.dart';
import '../services/firebase_crud.dart';
import 'loginpage.dart';


class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({Key? key}) : super(key: key);

  @override
  _Registrouser createState() =>
      _Registrouser();
}

class _Registrouser
    extends State<RegistroUsuario> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final _email_usuario = TextEditingController();
  final _nombre_usuario = TextEditingController();
  final _contrasenia_usuario = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

     final usuarionombre = TextFormField(
        controller: _nombre_usuario,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        }, //para poner color al border
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Nombre de Usuario",
            border: OutlineInputBorder(),
            hintStyle: TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);
    //Texform email de usuario
    final usuariomail = TextFormField(
        controller: _email_usuario,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border: OutlineInputBorder(),
            hintStyle: TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);

    final usuariocontrasenia = TextFormField(
        controller: _contrasenia_usuario,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Contraseña",
            border: OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);
    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xFF9DBE8B),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.addUser(
                usuarionombre: _nombre_usuario.text,
                usuarioemail: _email_usuario.text,
                usuariocontras: _contrasenia_usuario.text,
                
                );
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: Text(
          "Guardar",
          
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    final CancelButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: const Color(0xFFF46161),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        
        onPressed: () { 
          _nombre_usuario.text = '';
          _email_usuario.text = '';
          _contrasenia_usuario.text= '';
          
         },
        child: Text(
          "Borrar todo",
          
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      key: _formKey,
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
                  child: Image.asset('assets/logo-removebg-preview.png',
                    width: 120,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Form(child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Coloca tu nombre de usuario',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                      //TEXT USUARIO FIELD  
                      usuarionombre,
                      const SizedBox(height: 15.0),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Email de usuario',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                    usuariomail,
                    const SizedBox(height: 15.0),
                    const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Constraseña',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                    usuariocontrasenia,
                    const SizedBox(height: 15.0),
                    CancelButon,
                    const SizedBox(height: 25.0),
                    SaveButon,
                    const SizedBox(height: 25.0),
                  ],
                ),
              )),

              
            
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 30),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        //CAMBIO DE PAGINA
                        MaterialPageRoute(builder: (context) =>  IniciarSesion()));
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

