import 'package:prueba0/page/listpage.dart';
import 'package:flutter/material.dart';
import '../services/firebase_crud.dart';

class AddPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPager();
  }
}

class _AddPager extends State<AddPager> {
  final _planta_nombre = TextEditingController();
  final _planta_description = TextEditingController();
  final _planta_condicion = TextEditingController();
  final _planta_recordatorio = TextEditingController();
  final _planta_exposicion = TextEditingController();
  bool? checkboxListTileValue1;
  bool? checkboxListTileValue2;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    final plantanombre = TextFormField(
        controller: _planta_nombre,
        autofocus: false,
        obscureText: false,

        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        style: const TextStyle(
          color: Colors.black,
        ),
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
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Nombre de la planta",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final plantadescripcion = TextFormField(
        controller: _planta_description,
        autofocus: false,
        obscureText: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
  
            hintText: "Descripcion",
             hintStyle: const TextStyle(
                color: Colors.black),
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
                width: 1,),
                borderRadius: BorderRadius.circular(0),),
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
                
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                filled: true,
                fillColor: Colors.white),
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                ),
                );
    
    final plantacondicion = TextFormField(
        controller: _planta_condicion,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Condicion de la planta",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final plantarecordatorio = TextFormField(
        controller: _planta_recordatorio,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Recordatorio de la planta",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final plantaexposicion = TextFormField(
        controller: _planta_exposicion,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Exposicion de la planta",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
            
    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPage(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('Veer lista de plantas'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.addPlant(
                plantanombre: _planta_nombre.text,
                plantadescripcion: _planta_description.text,
                plantarecordatorio: _planta_recordatorio.text,
                plantacondicion: _planta_condicion.text,
                plantaexposicion: _planta_exposicion.text,
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
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
      child: AppBar(
        backgroundColor: const Color(0xD76FB244),
        title: const Text('Agregar Planta'),
        automaticallyImplyLeading: false,
          actions: const [ ],
          centerTitle: false,
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
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
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFFFCFCFC),
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0, -0.15),
                  child: Text(
                    'Registro de planta',
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        color: Color(0xFF2D382F),
                        fontWeight: FontWeight.w600,
                        fontSize: 25, ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.15,0),
                child: Container(
                  width: 350,
                  height: 80,
                  decoration: const BoxDecoration( 
                    color: Color(0xFFFCFCFC),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Nombre',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                      plantanombre,
                      const SizedBox(height: 25.0),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Nombre',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                      plantadescripcion,
                      const SizedBox(height: 35.0),
                      
                    ],
                  ),
                 ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      plantacondicion,
                      const SizedBox(height: 35.0),
                      plantarecordatorio,
                      const SizedBox(height: 35.0),
                      plantaexposicion,
                      viewListbutton,
                      const SizedBox(height: 45.0),
                      SaveButon,
                      const SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
            ],
            ),
          ),
         ),
      
        
      ),
    );
  }
}
