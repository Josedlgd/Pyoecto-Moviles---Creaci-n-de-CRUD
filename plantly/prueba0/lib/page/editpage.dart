import 'package:prueba0/page/listpage.dart';
import 'package:flutter/material.dart';

import '../models/plant.dart';
import '../services/firebase_crud.dart';

class EditPage extends StatefulWidget {
final Plant? plant;
 EditPage({this.plant});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {
  final _planta_nombre = TextEditingController();
  final _planta_description = TextEditingController();
  final _planta_condicion = TextEditingController();
  final _planta_recordatorio = TextEditingController();
  final _planta_exposicion = TextEditingController();
  final _docid = TextEditingController();

   
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
    _docid.value = TextEditingValue(text: widget.plant!.uid.toString());
    _planta_nombre.value = TextEditingValue(text: widget.plant!.plantanombre.toString());
    _planta_description.value = TextEditingValue(text: widget.plant!.plantadescripcion.toString());
    _planta_condicion.value = TextEditingValue(text: widget.plant!.platacondicion.toString());
    _planta_exposicion.value = TextEditingValue(text: widget.plant!.plantaexposicion.toString());
    _planta_recordatorio.value = TextEditingValue(text: widget.plant!.recordatorio.toString());
  }

  @override
  Widget build(BuildContext context) {


    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

         

    final plantanombre = TextFormField(
        controller: _planta_nombre,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Esta seccion es obligatoria';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Nombre de la planta",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final plantadescripcion = TextFormField(
        controller: _planta_description,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Esta seccion es obligatorio';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Descripcion de la planta",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final plantacondicion = TextFormField(
        controller: _planta_condicion,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Esta seccion es obligatoria';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Condicion de la planta",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final plantaexposicion = TextFormField(
        controller: _planta_exposicion,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Esta seccion es obligatoria';
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
            return 'Esta seccion es obligatoria';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Cambia el recordatorio de la planta",
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
        child: const Text('Ver lista de Plantas'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.updatePlant(
                plantanombre: _planta_nombre.text,
                plantadescripcion: _planta_description.text,
                plantacondicion: _planta_condicion.text,
                plantaexposicion: _planta_exposicion.text,
                plantarecordatorio: _planta_recordatorio.text,
                plantId: _docid.text);
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
          "Actualizar",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Lista de plantas'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DocIDField,
                  const SizedBox(height: 25.0),
                  plantanombre,
                  const SizedBox(height: 25.0),
                  plantadescripcion,
                  const SizedBox(height: 25.0),
                  plantacondicion,
                  const SizedBox(height: 25.0),
                  plantaexposicion,
                  const SizedBox(height: 32.0),
                  plantarecordatorio,
                  const SizedBox(height: 35.0),
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
    );
  }
}
