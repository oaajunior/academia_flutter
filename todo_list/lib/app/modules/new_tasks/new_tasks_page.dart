import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/modules/new_tasks/new_tasks_controller.dart';
import 'package:todo_list/app/shared/time_component.dart';

class NewTasksPage extends StatefulWidget {
  static const routerName = '/new';

  @override
  _NewTasksPageState createState() => _NewTasksPageState();
}

class _NewTasksPageState extends State<NewTasksPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<NewTasksController>(context, listen: false).addListener(() {
        var controller = context.read<NewTasksController>();
        if (controller.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(controller.error),
          ));
        }
        if (controller.saved) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Todo cadastrado com sucesso!'),
          ));
          Future.delayed(Duration(seconds: 1), () => Navigator.pop(context));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTasksController>(
      builder: (BuildContext context, NewTasksController controller, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NOVA TASK',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Data',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.dayFormatted,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nome da Task',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.nameTaskController,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Nome da task é obrigatório!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Hora',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TimeComponent(
                        date: controller.daySelected,
                        onSelectedTime: (date) {
                          controller.daySelected = date;
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    _buildButton(controller),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(NewTasksController controller) {
    return Center(
      child: InkWell(
        onTap: () => !controller.saved ? controller.save() : null,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.decelerate,
          width: controller.saved ? 80 : MediaQuery.of(context).size.width,
          height: controller.saved ? 80 : 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: controller.saved
                ? BorderRadius.circular(100)
                : BorderRadius.circular(0),
            boxShadow: [
              controller.saved
                  ? BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 30,
                      offset: Offset(2, 2),
                    )
                  : BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 1,
                      offset: Offset(2, 2),
                    ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: !controller.saved ? 0 : 80,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInBack,
                  opacity: !controller.saved ? 0 : 1,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
              Visibility(
                visible: !controller.saved,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Salvar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
