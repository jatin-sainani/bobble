import 'package:flutter/material.dart';
import 'package:bobble/chat.dart';

class home extends StatefulWidget
{
  _homestate createState() => new _homestate();
}

class _homestate extends State<home>
{

  List<String> text=["hello","friend"];
  TextEditingController _controller = new TextEditingController();



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
      body: Builder(
        builder: (context) =>
         Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 300.0,
                height: 200.0,
                alignment: Alignment.center,
                child: Image.asset('assets/logo.png')
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
             ),
               ),
             ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                      onTap: () {
                        text.add(_controller.text);
                        final snackBar = SnackBar(
                          content: Text('Message sent'),
                        );

                        Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          _controller.clear();
                        });
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
                          "Send",
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                      onTap: ()
                      {

                        print('Display button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => chat(text)
                          ),
                        );

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
            ),



          ],
        ),
      )

    );
  }
}