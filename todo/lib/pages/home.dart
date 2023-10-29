import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/widgets/model.dart';
import 'package:todo/widgets/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todolist();

  void todo_onclick(ToDo todo) {
    setState(() {
      todo.isCompleted = !todo.isCompleted!;
    });
  }

  void todo_onDelete(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  final controllerAddItem = TextEditingController();

  void addToDoItem(String toDo_text) {
    setState(() {
      todoList.add(
          ToDo(id: DateTime.now().microsecond.toString(), workText: toDo_text));
    });
    controllerAddItem.clear();
  }

  List<ToDo> seached = [];

  void _searchingProcess(String searched_text) {
    List<ToDo> result = [];
    if (searched_text.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where(
            (element) => element.workText!.toLowerCase().contains(
                  searched_text.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      seached = result;
    });
  }

  @override
  void initState() {
    seached = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BGcolor,
      appBar: AppBar(
        backgroundColor: BGcolor,
        elevation: 0,
        shadowColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              size: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/profile.webp"),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 13),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child: TextField(
                    onChanged: (value) => _searchingProcess(value),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(9),
                      prefixIcon: Icon(
                        Icons.search,
                        color: customGrey,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(fontSize: 19, color: customGrey),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 22, maxWidth: 28),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 0, top: 18, bottom: 12),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          "ToDo's List",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todo in seached)
                        ToDoList(
                          todo_var: todo,
                          whentodoChanged: todo_onclick,
                          whentodoDeleted: todo_onDelete,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                    padding: const EdgeInsets.only(left: 18, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                            color: customGrey, blurRadius: 5, spreadRadius: 1),
                      ],
                    ),
                    child: TextField(
                      controller: controllerAddItem,
                      decoration: const InputDecoration(
                          hintText: "Add a new todo work",
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 75,
                  margin: const EdgeInsets.only(right: 12, bottom: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      addToDoItem(controllerAddItem.text);
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: customBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
