import 'package:flutter/material.dart';
import 'main.dart';

class Register extends StatefulWidget {
  final titulo;
  Register(this.titulo);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Paso #2
  //Definir un lista del tipo Cliente OJO Arriba import 'main.dart'
  String name, surname, phone;

  TextEditingController controllerName;
  TextEditingController controllerSurname;
  TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert',
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
        ),
        body: ListView(
          children: [
            TextBox(
              controlador: controllerName,
              label: 'Nombre',
            ),
            TextBox(
              controlador: controllerSurname,
              label: 'Apellido',
            ),
            TextBox(
              controlador: controllerPhone,
              label: 'Telefono',
            ),

            // Boton
            ElevatedButton(
              onPressed: () {
                name = controllerName.text;
                surname = controllerSurname.text;
                phone = controllerPhone.text;

                if (name.isNotEmpty && surname.isNotEmpty) {
                  Navigator.pop(context,
                      Client(name: name, surname: surname, phone: phone));
                }
              },
              child: Text('Save'),
            ),

            //
          ],
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final label;
  const TextBox({
    this.label,
    Key key,
    @required this.controlador,
  }) : super(key: key);

  final TextEditingController controlador;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
          controller: controlador,
          decoration: InputDecoration(
              filled: true,
              labelText: this.label,
              // suffix: Icon(Icons.access_alarm),
              suffix: GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  controlador.clear();
                },
              )
              //probar suffix
              ),
          onSubmitted: (String nombres) {
            // cajatexto(context, nombres);
          }),
    );
  }
}
