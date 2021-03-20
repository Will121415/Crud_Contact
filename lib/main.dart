import 'package:crud_contact/modify.dart';
import 'package:crud_contact/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String myTitle = 'Contact By Will';
    return MaterialApp(
      title: myTitle,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: myTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Client> clients = [
    Client(name: 'Will', surname: 'Mora', phone: '302 454 25 93'),
    Client(name: 'Sam', surname: 'Perez', phone: '322 412 34 68'),
    Client(name: 'Marlon', surname: 'Gutierrez', phone: '301 441 36 98'),
    Client(name: 'Jhon', surname: 'Segura', phone: '310 789 90 62')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: clients.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                print(index);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => Modify(clients[index]))).then((value) {
                  if (value != null) {
                    setState(() {
                      clients.removeAt(index);
                      clients.insert(index, value);
                      _messageResponde(
                          context, value.name + ' a sido actualizado...!');
                    });
                  }
                });
              },
              onLongPress: () {
                setState(() {
                  _removeClient(context, clients[index]);
                });
              },
              title: Text(clients[index].name + ' ' + clients[index].surname),
              subtitle: Text(clients[index].phone),
              leading: CircleAvatar(
                child: Text(clients[index].name.substring(0, 1)),
              ),
              trailing: Icon(
                Icons.call,
                color: Colors.red,
              ),
            );
          }),

      //Paso # 1
      //Este es el Boton Adicionar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  Register(widget.title), //Llamar la Vista TextoEjercicio
            ),
          ).then((result) {
            if (result != null) {
              setState(() {
                clients.add(result);
                _messageResponde(context, result.name + ' a sido guardado...!');
              });
            }
          });
        },
        tooltip: 'Adicionar Client',
        child: Icon(Icons.add),
      ),

      //
    );
  }

  _messageResponde(BuildContext context, String name) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Mensaje Informativo...!'),
              content: Text('El contacto $name'),
            ));
  }

  _removeClient(context, Client client) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Elimnar Cliente...!'),
        content: Text('Esta Seguro de eliminar a ' + client.name + '?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                this.clients.remove(client);
                Navigator.pop(context);
              });
            },
            child: Text(
              'Eliminar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancelar',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class Client {
  var name;
  var surname;
  var phone;

  Client({this.name, this.surname, this.phone});
}
