import 'package:animate_do/animate_do.dart';
import 'package:challenges/modes/reqres_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginaPrincipal(),
    );
  }
}

Future<ReqResRespuesta> getUsuarios() async {
  var url = Uri.parse('https://reqres.in/api/users');
  final respuesta = await http.get(url);

  return reqResRespuestaFromJson(respuesta.body);
}

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUsuarios(),
      builder: (BuildContext context, AsyncSnapshot<ReqResRespuesta> snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting)
            ? Center(child: CircularProgressIndicator())
            : _ListaUsuarios(snapshot.data!.data);
      },
    );
  }
}

class _ListaUsuarios extends StatelessWidget {
  final List<User>? usuarios;

  _ListaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios!.length,
      itemBuilder: (BuildContext context, int index) {
        final usuario = usuarios![index];

        return FadeIn(
          delay: Duration(milliseconds: 100 * index),
          child: ListTile(
              title: Text('${usuario.firstName} ${usuario.lastName}'),
              subtitle: Text('${usuario.email}'),
              trailing: Image.network('${usuario.avatar}')),
        );
      },
    );
  }
}
