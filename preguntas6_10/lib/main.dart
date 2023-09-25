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
  List<int> numpreguntas = [0, 0, 0, 0, 0, 4, 2, 4, 4, 4];
  int num_pregunta = 0;
  int cnt_pregunta = 0; // Índice de la pregunta seleccionada
  int? opcion_seleccionada; // Variable para almacenar la opción seleccionada
  List<List<String>> preguntas = [
    [],
    [],
    [],
    [],
    [],
    [
      'Hay cosas que me preocupan.',
      'Me da miedo la obscuridad',
      'Cuando tengo un problema siento raro en el estómago.',
      'Siento temor',
      'Me daría miedo estar solo(a) en casa.',
      'Me da miedo presentar un examen. ',
      'Siento temor o mucho asco si tengo que usar baños públicos.',
      'Me preocupo cuando estoy lejos de mis padres.',
      'Tengo miedo de equivocarme enfrente de la gente.',
      'Me preocupa hacer un mal trabajo en la escuela.',
      'Me preocupa que algo malo le suceda a alguien de mi familia.',
      'De repente siento como si no pudiera respirar sin razón alguna.',
      'Tengo que estar revisando varias veces que las cosas que hago estén bien (como apagar la luz o cerrar la puerta con llave).',
      'Siento miedo si tengo que dormir solo(a).',
      'No puedo dejar de pensar en cosas malas o tontas.',
      'Cuando tengo un problema mi corazón late muy fuerte.',
      'De repente empiezo a temblar sin razón.',
      'Me preocupa que algo malo pueda pasarme.',
      'Me asusta ir al doctor o al dentista.',
      'Me asustan los lugares altos (como montañas, azoteas, etc). O los elevadores.',
      'Tengo que pensar en cosas especiales (por ejemplo, pensar en un número o una palabra) que me ayuden a evitar que pase algo malo.',
      'Me siento asustado(a) si tengo que viajar en carro, autobús o metro.',
      'Me da miedo estar en lugares donde hay mucha gente (centros comerciales, cines, camiones, parques).',
      'De repente me siento muy asustado(a) sin razón.',
      'Me dan miedo los insectos o las arañas.',
      'De repente me siento mareado(a) sin razón.',
      'Me da miedo tener que hablar frente a mi salón.',
      'De repente mi corazón late muy rápido sin razón.',
      'Me da miedo estar en lugares pequeños y cerrados, como túneles o cuartos pequeños.',
      'Me molestan pensamientos malos o tontos, o imágenes en mi mente.',
      'Hay cosas que tengo que hacer de la manera correcta para que no pase nada malo.',
      'Me daría miedo pasar la noche lejos de mi casa.',
    ],
    [
      'No tenía ganas de comer',
      'No podía quitarme la tristeza',
      'Tenía dificultad para mantener mi mente en lo que hacía',
      'Me sentía deprimido(a)',
      'Dormía, pero sin descansar',
      'Me sentía triste'
    ],
    [
      'r',
      'r',
      'r',
      'r',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ],
    [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ],
  ];

  List<List<String>> respuestas = [
    [],
    [],
    [],
    [],
    [],
    ['Nunca', 'A veces', 'Muchas veces', 'Siempre'],
    ['Si', 'No'],
    ['Siempre','Casi Siempre','Nunca','Casi nunca'],
    ['Casi siempre','Algunas veces','Rara vez','Casi nunca'],
  ];

  void incrementar_contador() {
    setState(() {
      num_pregunta++;
      cnt_pregunta++;
      //Seccion 6, 7, 8, 9
      if (num_pregunta == 32 || num_pregunta ==38 || num_pregunta == 68 || num_pregunta == 96) {
        seccion++;
        cnt_pregunta = 0;
      }
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
                'Sección ${seccion}', //cambiar
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
                                '${preguntas[seccion - 1][cnt_pregunta]}',
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
                                  style: TextStyle(fontSize: 17),
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
