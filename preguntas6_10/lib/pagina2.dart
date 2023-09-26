import 'package:flutter/material.dart';
import 'main.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Fondo de imagen
            Image.asset(
              'imagenes/fondo.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Contenido
            Center(
              child: Seccion10(),
            ),
          ],
        ),
      ),
    );
  }
}

class Seccion10 extends StatefulWidget {
  const Seccion10({super.key});
  @override
  State<Seccion10> createState() => _Seccion10State();
}

class _Seccion10State extends State<Seccion10> {
  String _text = '';
  bool validacion = false;
  int seccion = 10;
  int cnt_pregunta = 0;
  int seccionTitulo = 10;
  String pregunta = 'Cuentanos brevemente tu mejor chiste: ';

  void incrementar_contador() {
    setState(() {
      //guardar_resultados(seccionTitulo,opcion_seleccionada);
      //opcion_seleccionada = null; //regresa los checkbox a vacio, quitar para ir rapido
    });
  }

  void decrementar_contador() {
    //String newData = _text;
    setState(() {
      Navigator.pop(context);
    });
    //guardar_resultados(seccionTitulo,opcion_seleccionada);
    //opcion_seleccionada = null; //regresa los checkbox a vacio, quitar para ir rapido
  }

  ElevatedButton customButton(String buttonText, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB69DF8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 10,
        minimumSize: Size(150, 50),
        shadowColor: Colors.black,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child: Text(
                'Sección ${seccionTitulo}', //cambiar
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: 380, // Ancho del contenedor del contenido
            height: 400, // Alto del contenedor del contenido
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.2),
              //color: Colors.white70, // Fondo semitransparente
              borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    '${cnt_pregunta + 1}',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                                width: 50,
                                height: 50,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEADDFF),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFF371A6E)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                '${pregunta}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            //color: Colors.white,
                            width: 300.0,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  _text = value;
                                });
                              },
                              keyboardType: TextInputType
                                  .multiline, // Permite múltiples líneas
                              maxLines:
                                  6, // Permite un número indefinido de líneas
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16.0),
                                //border: OutlineInputBorder(),
                                hintText: 'Escribe aqui...',
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('Texto ingresado: $_text'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customButton('Atrás', decrementar_contador),
              SizedBox(width: 20),
              customButton('Siguiente', incrementar_contador),
            ],
          ),
          flex: 2,
        ),
      ],
    );
  }
}
