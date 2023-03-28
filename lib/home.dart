import 'package:contact_provider/connecting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contatct",
          style: TextStyle(color: Colors.deepOrange),
        ),
        backgroundColor: Colors.white30,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: username,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Provider.of<ConnectingProvider>(context, listen: false)
                  .addNote(username.text);
            },
            child: Text("save")),
        Expanded(
            child: ListView.builder(
          itemCount: Provider.of<ConnectingProvider>(context).name.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              color: Colors.orangeAccent[200],
              child: ListTile(
                subtitle:
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: IconButton(onPressed: () {
                        Provider.of<ConnectingProvider>(context,listen: false).Delete(username.text);
                      }, icon: Icon(Icons.delete)),
                    ),
                leading: Icon(Icons.person_4_rounded),
                title:
                    Text(Provider.of<ConnectingProvider>(context).name[index]),
              ),
            );
          },
        )),
        // Divider(thickness: 2,color: Colors.black54,)
      ]),
    );
  }
}
