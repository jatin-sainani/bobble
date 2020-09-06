import 'package:flutter/material.dart';

class chat extends StatefulWidget
{
  List<String> text;
  chat(this.text);
  _chatState createState() => new _chatState(text);
}

class _chatState extends State<chat> with SingleTickerProviderStateMixin
{
  List<String> text2;
  _chatState(this.text2);

  TextEditingController _controller = new TextEditingController();

  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobble',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        //1C8C80
        backgroundColor: Colors.teal,
      ),
      body:
      Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: text2.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                      leading: Icon(Icons.message),
                      title:Text(
                        text2[index],
                      style: TextStyle(
                      fontSize: controller.value*50
                      ),
                      )
                  );
                }
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _controller
                ,decoration: InputDecoration(
                hintText: "Enter text",
                hintStyle: TextStyle(
                    color: Colors.teal
                ),
                icon: Icon(Icons.message, color: Colors.teal,),

              ),
                style: TextStyle(color: Colors.black,
                    fontSize: 20.0),
                obscureText: false,
              )

            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    onTapDown: (_) => controller.forward(),
                    onTapUp: (_) {
                      if (controller.status == AnimationStatus.forward) {
                        controller.stop();
                        print(controller.value);
                      }
                    },
                    child:
                    new Container(
                      width: 160.0,
                      height: 60.0,
                      alignment: FractionalOffset.center,
                      decoration: new BoxDecoration(
                        color: Colors.teal,
                        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                      ),

                      child: new Text(
                        "Display",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.3,
                        ),
                      ),
                    )
                ),
              )

            ],
          )
        ],
      )
    );
  }
}