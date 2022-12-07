import 'package:flutter/material.dart';

class RegistroPlanta extends StatefulWidget {
  const RegistroPlanta({Key? key}) : super(key: key);

  @override
  _RegistroPlantaState createState() => _RegistroPlantaState();
}

class _RegistroPlantaState extends State<RegistroPlanta> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  bool? checkboxListTileValue1;
  bool? checkboxListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFCFCFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          backgroundColor: const Color(0xD76FB244),
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
                        fontSize: 25,
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
                Align(
                  alignment: const AlignmentDirectional(0, 0.1),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    width: 350,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFCFCFC),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0, -0.15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Text(
                              'Descripción',
                              style: TextStyle(
                                fontFamily: 'Crimson Pro',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: textController2,
                            autofocus: true,
                            obscureText: false,
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
                              fillColor: Colors.white
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
                  alignment: const AlignmentDirectional(0, 0.1),
                  child: Container(
                    width: 350,
                    height: 80,
                    margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFCFCFC),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0, -0.15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            child: Text(
                              'Condicion',
                              style: TextStyle(
                                fontFamily: 'Crimson Pro',
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: textController3,
                            autofocus: true,
                            obscureText: false,
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
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFCFCFC),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Text(
                            'Exposición al sol',
                            style: TextStyle(
                              fontFamily: 'Crimson Pro',
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: const Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: checkboxListTileValue1 ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                          () => checkboxListTileValue1 = newValue!);
                                },
                                title: const Text(
                                  'Sol',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                tileColor: const Color(0xFFF5F5F5),
                                activeColor: Colors.blue,
                                dense: false,
                                controlAffinity:
                                ListTileControlAffinity.trailing,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: const Color(0xFF95A1AC),
                              ),
                              child: CheckboxListTile(
                                value: checkboxListTileValue2 ??= true,
                                onChanged: (newValue) async {
                                  setState(
                                          () => checkboxListTileValue2 = newValue!);
                                },
                                title: const Text(
                                  'Sombra',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black
                                  ),
                                ),
                                tileColor: const Color(0xFFF5F5F5),
                                activeColor: Colors.blue,
                                dense: false,
                                controlAffinity:
                                ListTileControlAffinity.trailing,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                                primary: const Color(0xFFF46161),
                                textStyle: const TextStyle(
                                  fontFamily: 'Crimson Pro',
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w200,
                                ),
                              ), child: const Text ("Cancelar"),
                            ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                                primary: const Color(0xFF9DBE8B),
                                textStyle: const TextStyle(
                                  fontFamily: 'Crimson Pro',
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w200,
                                ),
                              ), child: const Text ("Guardar"),
                            )
                        ),
                      ),
                    ],
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

