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
  int section = 6;
  List<int> numpreguntas = [0, 0, 0, 0, 0, 4, 3, 5, 4, 4];
  int selectedQuestionIndex = 0; // Índice de la pregunta seleccionada
  int? selectedOption; // Variable para almacenar la opción seleccionada
  List<List<String>> questions = [
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

  void _incrementCounter() {
    setState(() {
      selectedQuestionIndex++;
    });
  }

  void _decrementCounter() {
    setState(() {
      selectedQuestionIndex--;
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
                'Sección ${section}', //cambiar
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
                                    '${selectedQuestionIndex + 1}',
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
                                '${questions[section - 1][selectedQuestionIndex]}',
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
                        crossAxisCount: numpreguntas[section - 1],
                        childAspectRatio: 0.8, // Relación de aspecto cuadrada
                        crossAxisSpacing:
                            8, // Espacio horizontal entre elementos
                        mainAxisSpacing: 8,
                      ),
                      itemCount: numpreguntas[section -
                          1], // Cambia este valor según la cantidad de preguntas.
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = index;
                            });
                            print('Opción seleccionada: $selectedOption');
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Checkbox(
                                  value: selectedOption == index,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      selectedOption = index;
                                    });
                                    print(
                                        'Opción seleccionada: $selectedOption');
                                  },
                                  activeColor: Color.fromRGBO(182, 157, 248, 1),
                                ),
                                Text(
                                  '${respuestas[section - 1][index]}',
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
              customButton('Atrás', _decrementCounter),
              SizedBox(width: 20),
              customButton('Siguiente', _incrementCounter),
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
