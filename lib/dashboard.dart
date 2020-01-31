import 'package:flutter/material.dart';
import 'data/screen_size.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data/sample_post.dart';
import 'data/model/post_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    print(height);
    print(width);
    return Scaffold(
      backgroundColor:Color.fromRGBO(38, 43, 77, 1) ,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                color: Color.fromRGBO(32, 36, 66, 1),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: height*8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding:  EdgeInsets.only(right:width*3),
                            child: Icon(FontAwesomeIcons.bell,color: Colors.white38,),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right:width*3),
                            child: Icon(FontAwesomeIcons.youtube,color: Colors.white38),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical:height),
                      child: Text("STULANCE",
                        style: TextStyle(fontSize: width*3,color: Colors.amber),),
                    ),
                    Container(
                      margin: EdgeInsets.all(width),
                      height: height*40,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(45,50,90,1),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: height*1),
                      height: height*8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _tags("Chemistry", Colors.lightBlueAccent),
                          _tags("Physics", Colors.redAccent),
                          _tags("Biology", Colors.greenAccent),
                          _tags("Math", Colors.deepOrangeAccent),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical:height*2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _tile(Color.fromRGBO(78, 124, 255, 1)),
                          _tile(Color.fromRGBO(112, 51, 255, 1)),
                          _tile(Color.fromRGBO(246, 81, 100, 1)),
                          _tile(Color.fromRGBO(78, 124, 255, 1)),
                        ],
                      ),
                    ),
                 Padding(
                      padding:  EdgeInsets.symmetric(vertical:height,horizontal: width),
                      child: Text("Questions: ",
                        style: TextStyle(fontSize: width*2,color: Colors.white),),
                    ),
                    Container(
                      child: Expanded(
                        child: ListView.builder(
                            itemCount: postsList == null ? 0 : postsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _postTile(postsList[index], index);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: height*8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ClipOval(
                            child: Image.network(
                              'https://www.zip06.com/apps/pbcsi.dll/bilde?Site=Z6&Date=20191128&Category=SPORT19&ArtNo=191129760&Ref=AR&Item=0',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(left:width*1),
                            child: Text("Kousik Ambani",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      height: height*90,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container _tags(String title,Color clr){
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(title,style: TextStyle(color: Colors.white,fontSize:15),textAlign: TextAlign.center,),
//      width: width*5,
      decoration: BoxDecoration(
        border: Border.all(
          color: clr,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Container _tile(Color clr){
    return Container(
//      child: Text(title,style: TextStyle(color: Colors.white,fontSize:15),textAlign: TextAlign.center,),
      width: width*10,
      height: height*25,
      decoration: BoxDecoration(
          color: clr,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  }

  Padding _postTile(Post post, int i) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height/2, horizontal: width),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              post.post,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width *1.5,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 1),
              child: Text(
                post.user,
                style: TextStyle(color: Colors.white70, fontSize: width *1),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.mode_comment,
                      color: Colors.white60,
                    ),
                    Text(
                      post.comment.toString(),
                      style: TextStyle(
                          color: Colors.white60, fontSize: width *1.5),
                    )
                  ],
                ),
                SizedBox(
                  width: width * 2,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.white60,
                    ),
                    Text(
                      post.love.toString(),
                      style: TextStyle(
                          color: Colors.white60, fontSize: width * 1.5),
                    )
                  ],
                ),
                SizedBox(
                  width: width * 2,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.white60,
                    ),
                    Text(
                      post.view.toString(),
                      style: TextStyle(
                          color: Colors.white60, fontSize: width * 1.5),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        width: width * 100,
        padding: EdgeInsets.all(width ),
        decoration: BoxDecoration(
          color: i % 2 == 0
              ? Color.fromRGBO(9, 182, 214,0.5)
              : Color.fromRGBO(86, 115, 164,0.5),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
      ),
    );
  }
}
