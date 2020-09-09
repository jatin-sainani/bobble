import 'package:flutter/material.dart';
import 'package:bobble/chat.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bobble',
          style: TextStyle(
            color: Colors.white,
            //fontSize: 30.0,
            fontSize: ScreenUtil().setSp(90.0)
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
                width: ScreenUtil().setWidth(500.0),
                height: ScreenUtil().setHeight(500.0),
                //width: 300.0,
                //height: 200.0,
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
                     //fontSize: 20.0
                   fontSize: ScreenUtil().setSp(60.0)
                    ),
                 obscureText: false,
             ),
               ),
             ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left:ScreenUtil().setWidth(130.0),
                      right: ScreenUtil().setWidth(45.0),
                      top:ScreenUtil().setHeight(45.0)
                  ),
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
                        //width: 160.0,
                        //height: 60.0,
                        width: ScreenUtil().setWidth(360.0),
                        height: ScreenUtil().setHeight(150.0),
                        alignment: FractionalOffset.center,
                        decoration: new BoxDecoration(
                          color: Colors.teal,
                          borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                        ),

                        child: new Text(
                          "Send",
                          style: new TextStyle(
                            color: Colors.white,
                            //fontSize: 20.0,
                            fontSize: ScreenUtil().setSp(60),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left:ScreenUtil().setWidth(45.0),
                      right: ScreenUtil().setWidth(130.0),
                      top:ScreenUtil().setHeight(45.0)
                  ),
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
                        //width: 160.0,
                        //height: 60.0,
                        width: ScreenUtil().setWidth(360.0),
                        height: ScreenUtil().setHeight(150.0),
                        alignment: FractionalOffset.center,
                        decoration: new BoxDecoration(
                          color: Colors.teal,
                          borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                        ),

                        child: new Text(
                          "Display",
                          style: new TextStyle(
                            color: Colors.white,
                            //fontSize: 20.0,
                            fontSize: ScreenUtil().setSp(60),
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