import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  bool checklist1 = false;
  bool checklist2 = false;
  bool checklist3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Color(0xFFF5F6FF),
      appBar: buildAppBarToDo(),
      body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: ListView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                BoxDay (title: 'Hoje', checklists: <Widget>[
                  CheckListTask(
                    title: 'Fazer Compras', 
                    value: checklist1, 
                    onChange: (value) {
                      setState(() {
                        checklist1 = value;
                      });
                    }
                  ),
                  CheckListTask(
                    title: 'Estudar Flutter', 
                    value: checklist2, 
                    onChange: (value) {
                      setState(() {
                        checklist2 = value;
                      });
                    }
                  ),
                  CheckListTask(
                    title: 'Criar app de academia', 
                    value: checklist3, 
                    onChange: (value) {
                      setState(() {
                        checklist3 = value;
                      });
                    }
                  )]
                  ),
                  BoxDay (title: 'Amanhã', checklists: <Widget>[
                  CheckListTask(
                    title: 'Fazer Compras', 
                    value: checklist1, 
                    onChange: (value) {
                      setState(() {
                        checklist1 = value;
                      });
                    }
                  ),
            
                  CheckListTask(
                    title: 'Estudar Flutter', 
                    value: checklist2, 
                    onChange: (value) {
                      setState(() {
                        checklist2 = value;
                      });
                    }
                  ),
                  CheckListTask(
                    title: 'Criar app de academia', 
                    value: checklist3, 
                    onChange: (value) {
                      setState(() {
                        checklist3 = value;
                      });
                    }
                  )]
                  ),
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: <Widget>[
                  Icon(Icons.list, size: 40),
                  Text(
                    'Outras',
                    style: TextStyle(fontSize: 30)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                children: <Widget>[
                  CheckListTask(title: 'Fazer a API', value: true),
                  CheckListTask(title: 'Prototipar aplicativo', value: true),
                  CheckListTask(title: 'Enviar protótipo para o cliente', value: true),
                  CheckListTask(title: 'Receber dinheiro', value: false),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Align (
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
          label: Text('Adcionar tarefa'),
          icon: Icon(Icons.add),
          backgroundColor: Color(0xff101639),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xff101639),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  PreferredSize buildAppBarToDo() {
    return PreferredSize(
      preferredSize: Size(null, 100),
      child: Container(
        height: 100,
        padding: EdgeInsets.only(left: 20, top: 30),
        child: Row(
          children: <Widget>[
            Text('To Do',
              style: TextStyle(fontSize: 36)
            )
          ],
        ),
      ),
    );
  }
}

class BoxDay extends StatelessWidget {
  const BoxDay({
    Key key, this.checklists, this.title,
  }) : super(key: key);

  final String title;
  final List<Widget> checklists;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 260,
      margin: EdgeInsets.only(right: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(26)),
        boxShadow: [BoxShadow(
          blurRadius: 13,
          color: Colors.black.withOpacity(.2),
          offset: Offset(6, 7)
        )]
      ),
      child: Column (
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.today), Text(title)
              ],
            ),
          ),
          
        ]..addAll(checklists),
      ),
    );
  }
}

class CheckListTask extends StatelessWidget {

  final String title;
  final bool value;
  final ValueChanged<bool> onChange;

  const CheckListTask({
    Key key, this.title, this.value, this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChange(!value);
      },
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Color(0xff101639),
            value: value,
            onChanged: (value){
              onChange(value);
            },
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                decoration: value ? TextDecoration.lineThrough : TextDecoration.none,
                decorationColor: Colors.black,
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2
              )
            ),
          ),
        ],
      ),
    );
  }
}