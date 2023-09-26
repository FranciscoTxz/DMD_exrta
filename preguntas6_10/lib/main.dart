import 'package:flutter/material.dart';
import 'pagina2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  bool validacion = false;
  int cnt = 0;
  List<int> aux = [0, 32, 38, 68, 96];
  int seccion = 6;
  int seccionTitulo = 6;
  List<int> numpreguntas = [0, 0, 0, 0, 0, 4, 2, 4, 4, 4, 4];
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
    ],
    [
      //preguntas seccion 8
      'Ignoran mis sentimientos',
      'He tenido relaciones sexuales por tener',
      'Me he sentido agredido(a)',
      'Se burlan de mi en publico',
      'Me han excluido de reuniones familiares.',
      'Me han cortado con algun objeto',
      'Me siento comparado(a) con otras personas',
      'He enviado fotos intimas por redes sociales',
      'Me llaman por un apodo que me desagrada',
      'Me han obligado a tener relaciones sexuales',
      'En oportunidades siento que me han agredido',
      'Me han humillado o menos preciado delante de otras personas',
      'Mis padres se preocupan cuando estoy enfermo',
      'Me han tirado una bofetada',
      'Me han golpeado con la mano',
      'Me han podido tener relaciones sexuales a cambio de algo',
      'Me han prohbido ver a mis amistades',
      'Me dejan sin probar alimento',
      'He tenido lesiones en mi cuerpo',
      'Me han tocado mis partes intimas sin consentimiento',
      'Me da miedo hacer algo nuevo por temor a la critica',
      'Me han botado de la casa',
      'Me han obligado a tener relaciones sexuales por chantaje',
      'Me controlan constantemente mis salidas',
      'Me han jaloneado de los brazos',
      'Me han pateado',
      'He tenido relaciones sexuales con efectos del alcohol',
      'Me tratan con indiferencia o me ignoran',
      'Me han empujado con mucha fuerza',
      'Me da miedo hacer algo nuevo por miedo a la criica',
    ],
    [
      //preguntas seccion 9
      'Cuando estas muy triste sientes que tus problemas no tienen solucion',
      'Pierdes el control cuando te enojas',
      'Cuando esta nervioso(a), si te lo propones puedes relajarte facilmente',
      'Cuando te enojas avientas lo primero que tienes a la mano',
      'Si las cosas no salen cono las tenias planeadas te desaminas facilmente',
      'Cuando te pones triste te dices frases que te levanten el animo',
      'Te es dificil recuperar la tranquilidad despues de que te sientes triste',
      'Es muy dificil que vuelvas a sentirte bien cuando se frustran tus planes',
      'Cuando empiezas a sentirte triste ya no te puedes detener',
      'Evitas alejarte cuando te enojas',
      'Cuando te sientes frustrado platicas contigo mismo(a) para tranquilizarte',
      'Darte cuenta de como te sientes te ayuda a recuperarte de los problemas',
      'Cuando tienes problemas tratas de permanecer tranquilo(a)',
      'Sietes que tienes el control sobre tu vida',
      'Cuando es necesario tienes la capacidad de controlar tus emociones',
      'Cuando algo te sale mal continuas esforzandote sin darte por vencido(a)',
      'Puedes enfrentar situaciones dificiles permaneciendo con calma',
      'Tratas de no alterarte y de hablar como "gente decente"',
    ],
    [],
    [
      //preguntas seccion 7b
      '',
      '',
      '',
      'Me sentía deprimido(a)',
      'Dormía, pero sin descansar',
      'Me sentía triste'
    ]
  ];

  List<List<String>> respuestas = [
    [],
    [],
    [],
    [],
    [],
    ['Nunca', 'A veces', 'Muchas veces', 'Siempre'],
    ['Si', 'No'],
    ['Siempre', 'Casi Siempre', 'Nunca', 'Casi nunca'],
    ['Casi siempre', 'Algunas veces', 'Rara vez', 'Casi nunca'],
    [],
    [
      'Nunca',
      'Pocas veces',
      'Bastantes veces',
      'Casi todos los días'
    ], //11 extra de la 7
  ];

  void incrementar_contador() {
    if (opcion_seleccionada != null) {
      setState(() {
        if (num_pregunta != 85) {
          num_pregunta++;
          cnt_pregunta++;
        }

        if (num_pregunta == 85) {
          //llamar seccion 10
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pagina2()));
        }

        if (num_pregunta >= 35 && num_pregunta <= 37) {
          seccion = 11;
        } else {
          seccion = seccionTitulo;
        }

        //Seccion 6, 7, 8, 9
        if (num_pregunta == 32 ||
            num_pregunta == 38 ||
            num_pregunta == 68 ||
            num_pregunta == 96) {
          cnt++;
          seccion++;
          seccionTitulo = seccion;
          cnt_pregunta = 0;
        }
        //guardar_resultados(seccionTitulo,opcion_seleccionada);
        //opcion_seleccionada = null; //regresa los checkbox a vacio, quitar para ir rapido
      });
    }
  }

  void decrementar_contador() {
    if (opcion_seleccionada != null) {
      setState(() {
        if (num_pregunta != 0) {
          cnt_pregunta--;
          num_pregunta--;
        }
        print(num_pregunta);
        //Seccion 6, 7, 8, 9
        if (num_pregunta >= 35 && num_pregunta <= 37) {
          if (num_pregunta == 37) {
            seccionTitulo = 7;
            cnt_pregunta = num_pregunta - aux[cnt - 1];
            cnt--;
          }
          seccion = 11;
        } else {
          seccion = seccionTitulo;
          if (num_pregunta == 31 || num_pregunta == 67 || num_pregunta == 95) {
            seccion--;
            seccionTitulo = seccion;
            cnt_pregunta = num_pregunta - aux[cnt - 1];
            cnt--;
          }
        }
        //guardar_resultados(seccionTitulo,opcion_seleccionada);
        //opcion_seleccionada = null; //regresa los checkbox a vacio, quitar para ir rapido
      });
    }
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
                            0, // Espacio horizontal entre elementos
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
                                      opcion_seleccionada =
                                          (opcion_seleccionada == index)
                                              ? null
                                              : index;
                                    });
                                    print(
                                        'Opción seleccionada: $opcion_seleccionada');
                                  },
                                  activeColor: Color.fromRGBO(182, 157, 248, 1),
                                ),
                                Text(
                                  '${respuestas[seccion - 1][index]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
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
