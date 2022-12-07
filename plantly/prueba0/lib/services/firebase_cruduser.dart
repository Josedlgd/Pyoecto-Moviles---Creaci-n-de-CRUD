import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Users');

class FirebaseCrud {

   static Future<Response> addUser({
    required String usuarionombre,
    required String usuarioemail,
    required String usuariocontras,
   
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "usuario_nombre": usuarionombre,
      "usuario_email": usuarioemail,
      "usuario_contras" : usuariocontras,
      

    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
          response.code = 200;
          response.message = "Añadida correctamente";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }



  static Future<Response> updatePlant({
    required String plantanombre,
    required String plantadescripcion,
    required String plantacondicion,
    required String plantarecordatorio,
    required String plantaexposicion,
    required String plantId,

  }) async {
    Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(plantId);

    Map<String, dynamic> data = <String, dynamic>{
      "planta_nombre": plantanombre,
      "planta_descripcion": plantadescripcion,
      "planta_condicion" : plantacondicion,
      "planta_recordatorio": plantarecordatorio,
      "planta_exposicion": plantaexposicion,
      
    };

    await documentReferencer
        .update(data)
        .whenComplete(() {
           response.code = 200;
          response.message = "Actualizada correctamente";
        })
        .catchError((e) {
            response.code = 500;
            response.message = e;
        });

        return response;
  }

  static Stream<QuerySnapshot> readPlant() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> deletePlant({
    required String docId,
  }) async {
     Response response = Response();
    DocumentReference documentReferencer =
        _Collection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete((){
          response.code = 200;
          response.message = "Eliminada correctamente";
        })
        .catchError((e) {
           response.code = 500;
            response.message = e;
        });

   return response;
  }

}