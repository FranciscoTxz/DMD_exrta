import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //int cnt = 0;
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
              child: Home(),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int seccion = 6;
  List<int> numpreguntas = [0, 0, 0, 0, 0, 4, 3, 5, 4, 4];
  int cnt_pregunta = 0; // Índice de la pregunta seleccionada
  int? opcion_seleccionada; // Variable para almacenar la opción seleccionada
  List<List<String>> preguntas = [
    [],
    [],
    [],
    [],
    [],
    [
      '¿Cuál es la capital de Francia?',
      '¿Quién escribió "Cien años de soledad"?',
      '¿Cuál es el planeta más grande del sistema solar?',
      '¿Cuál es el río más largo del mundo?',
      '¿En qué año se descubrió América?'
    ],
    ['D', 'E', 'F'],
    ['G', 'H', 'I'],
  ];

  List<List<String>> respuestas = [
    [],
    [],
    [],
    [],
    [],
    ['Nunca', 'A veces', 'Muchas veces', 'Siempre'],
    ['D', 'E', 'F'],
    ['G', 'H', 'I'],
  ];

  void incrementar_contador() {
    setState(() {
      cnt_pregunta++;
    });
  }

  void decrementar_contador() {
    setState(() {
      cnt_pregunta--;
    });
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
          fontSize: 20,
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
                'Sección ${seccion}', //cambiar
                style: TextStyle(
                  fontSize: 30,
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
                                      fontSize: 40,
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
                                '${preguntas[seccion - 1][cnt_pregunta]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: numpreguntas[seccion - 1],
                        childAspectRatio: 0.8, // Relación de aspecto cuadrada
                        crossAxisSpacing:
                            8, // Espacio horizontal entre elementos
                        mainAxisSpacing: 8,
                      ),
                      itemCount: numpreguntas[seccion -
                          1], // Cambia este valor según la cantidad de preguntas.
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              opcion_seleccionada = index;
                            });
                            print('Opción seleccionada: $opcion_seleccionada');
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Checkbox(
                                  value: opcion_seleccionada == index,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      opcion_seleccionada = index;
                                    });
                                    print(
                                        'Opción seleccionada: $opcion_seleccionada');
                                  },
                                  activeColor: Color.fromRGBO(182, 157, 248, 1),
                                ),
                                Text(
                                  '${respuestas[seccion - 1][index]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

/*
*/
