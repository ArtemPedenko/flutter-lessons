import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lessons/layers/todos/states/todo_event.dart';
import 'package:flutter_lessons/layers/todos/states/todo_state.dart';
import 'package:flutter_lessons/layers/todos/todo_repository.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../states/todo_bloc.dart';

class TodosPage  extends StatelessWidget{
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (_) => TodoBloc(TodoRepository())..add(LoadTodos()),
      child: const TodosView(),
    );
  }
}

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Todos"),
      ),
      child: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];

                return Padding(
                  padding: const EdgeInsets.all(12),
                  // child: Text(todo.title),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            todo.title,
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Icon(
                          todo.completed
                          ? LucideIcons.check
                          : LucideIcons.circle,
                          size: 22,
                          color: todo.completed
                                 ? CupertinoColors.activeGreen
                                 : CupertinoColors.systemGrey,
                        )
                      ],
                    ),
                  ),
                );
              }
            );
          }

          if (state is TodoError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      )
    );
  }
}