class Todo {
  String? id;
  String? todoText;
  bool isdone;

  Todo({required this.id, required this.todoText, this.isdone = false});
  static List<Todo> todolist() {
    return [
      Todo(id: '01', todoText: 'Being Responsible', isdone: false),
      Todo(id: '02', todoText: 'Irresponsible', isdone: true),
    ];
  }
}
