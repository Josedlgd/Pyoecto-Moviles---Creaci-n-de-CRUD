import 'package:prueba0/page/listpage.dart';
import 'package:flutter/material.dart';
import '../services/firebase_crud.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPage();
  }
}

class _AddPage extends State<AddPage> {
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
    //Textform Nombre de planta
    final plantanombre = TextFormField(
        controller: _planta_nombre,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        }, //para poner color al border
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Nombre de la planta",
            border: OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);
    //Texform descripcion de planta
    final plantadescripcion = TextFormField(
        controller: _planta_description,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Descripcion",
            border: OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);
    //Textform condion de planta
    final plantacondicion = TextFormField(
        controller: _planta_condicion,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Condicion de la planta",
            border: OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);
    //Textform recodatorio de plata
    final plantarecordatorio = TextFormField(
        controller: _planta_recordatorio,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Recordatorio de la planta",
              border: OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);
        //Textform de expocison
    final plantaexposicion = TextFormField(
        controller: _planta_exposicion,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Este elemento es necesario';
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Exposicion de la planta",
            border: OutlineInputBorder(),
            hintStyle: const TextStyle(color: Colors.black)),
          style: const TextStyle(color: Colors.black),);
            
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
      color: const Color(0xFF9DBE8B),
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
          _planta_condicion.text = '';
          _planta_nombre.text = '';
          _planta_description.text= '';
          _planta_recordatorio.text ='';
          _planta_exposicion.text = '';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
      child: AppBar(
        backgroundColor: const Color(0xFFFCFCFC),
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
                
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Nombre de la planta',
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
                          'Descripcion de la planta',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                      plantadescripcion,
                      const SizedBox(height: 25.0),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Condicion de la planta',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                      plantacondicion,
                      const SizedBox(height: 25.0),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Recordatorio de la planta',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                      plantarecordatorio,
                      const SizedBox(height: 25.0),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Text(
                          'Exposicion de la planta',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                        ),
                      ),
                      plantaexposicion,
                      viewListbutton,
                      CancelButon,
                      const SizedBox(height: 15.0),
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
