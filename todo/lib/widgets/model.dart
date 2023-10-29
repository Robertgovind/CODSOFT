class ToDo {
  String? id;
  String? workText;
  bool? isCompleted;

  ToDo({required this.id, required this.workText, this.isCompleted = false});

  static List<ToDo> todolist() {
    return [
      ToDo(id: '01', workText: "Rading a novel"),
      ToDo(id: '02', workText: "Watching a movie", isCompleted: true),
      ToDo(id: '03', workText: "Flutter Tutorial"),
      ToDo(id: '04', workText: "Advanced electronics practical"),
      ToDo(
          id: '05',
          workText: "Football practice with friends",
          isCompleted: true),
      ToDo(id: '06', workText: "Data Structure and Algorithm tutorial"),
      ToDo(id: '07', workText: "Practical of DSA"),
      ToDo(id: '08', workText: "Talking to friend"),
      ToDo(id: '09', workText: "Go to market", isCompleted: true),
      ToDo(id: '10', workText: "Go to Cinema"),
    ];
  }
}
