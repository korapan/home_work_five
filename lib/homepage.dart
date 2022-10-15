import 'package:flutter/material.dart';
import 'package:home_work_five/todo.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Todo> todos = [
    Todo(text: "การบ้านครั้งที่ 1", checked: true),
    Todo(text: "การบ้านครั้งที่ 2", checked: true),
    Todo(text: "การบ้านครั้งที่ 3", checked: false)
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.check_box),
            SizedBox(
              width: 8,
            ),
            Text("My ToDo")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: todos.isEmpty
            ? const Center(
                child: Text("Empty ToDo list"),
              )
            : ListView.builder(
                itemBuilder: (BuildContext buildContext, int i) {
                  return Card(
                    child: Row(
                      children: [
                        Checkbox(
                            value: todos[i].checked,
                            onChanged: (value) {
                              setState(() {
                                todos[i].checked = value;
                              });
                            }),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: !todos[i].checked!
                                ? Text(todos[i].text)
                                : Text(
                                    todos[i].text,
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough),
                                  )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                todos.removeAt(i);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  );
                },
                itemCount: todos.length),
      ),
      bottomSheet: SizedBox(
        height: 64,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Row(
            children: [
              Flexible(
                  child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Enter new ToDo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              )),
              TextButton(
                onPressed: () {
                  setState(() {
                    if (_controller.text.isEmpty) return;
                    todos.add(Todo(text: _controller.text, checked: false));
                    _controller.text = "";
                  });
                },
                child: const Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
