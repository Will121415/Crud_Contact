import 'package:crud_contact/main.dart';
import 'package:flutter/material.dart';

class Modify extends StatefulWidget {
  final Client client;
  Modify(this.client, {Key key}) : super(key: key);

  @override
  _ModifyState createState() => _ModifyState();
}

class _ModifyState extends State<Modify> {
  String name, surname, phone;

  TextEditingController controllerName;
  TextEditingController controllerSurname;
  TextEditingController controllerPhone;

  @override
  void initState() {
    Client c = widget.client;
    controllerName = TextEditingController(text: c.name);
    controllerSurname = TextEditingController(text: c.surname);
    controllerPhone = TextEditingController(text: c.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modify',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Modificar Contacto'),
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
              child: Text('Actualizar'),
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
