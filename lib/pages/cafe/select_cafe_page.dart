import 'package:asc_portfolio/server/api/api.dart';
import 'package:asc_portfolio/server/dio_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../server/api/api.dart';

import '../../style/app_color.dart';
import '../home_page.dart';
import '../../common_enum/cafe/cafe_name.dart';


class SelectCafePage extends StatefulWidget {

  @override
  _SelectCafePageState createState() => _SelectCafePageState();
}

class _SelectCafePageState extends State<SelectCafePage> {

  void _fetchChangeCafe(String cafeName) async {
    await server.postChangeCafe(context, cafeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.appPurple,
        title: Image.asset("assets/images/logo.png", fit: BoxFit.fill,),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => {
            Navigator.pop(context),
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: ListView(
          children:[
            Container(
              height: 70,
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                tileColor: Colors.white,
                title: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('     합리적인 공간, 알라딘 스터디 카페입니다.', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black45,fontSize: 20))),
                onTap: () {
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset("assets/images/cafe_image1.jpg", width: 110, height: 200,),
              title: Text('${CafeNameType.seoul.name}'),
              subtitle: const Text("연중무휴 , 24시간 운영"),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () async {
                _fetchChangeCafe(CafeNameType.seoul.name);
                setState(() {
                  Api.cafeName = CafeNameType.seoul.name;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset("assets/images/cafe_image6.jpg", width: 110, height: 200,),
              title: Text('${CafeNameType.busan.name}'),
              subtitle: const Text("연중무휴 , 24시간 운영"),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () async {
                _fetchChangeCafe(CafeNameType.busan.name);
                setState(() {
                  Api.cafeName = CafeNameType.busan.name;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset("assets/images/cafe_image2.jpg", width: 110, height: 200,),
              title: Text('${CafeNameType.incheon.name}'),
              subtitle: const Text("연중무휴 , 24시간 운영"),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                setState(() {
                  Api.cafeName = CafeNameType.incheon.name;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset("assets/images/cafe_image3.jpg", width: 110, height: 200,),
              title: Text('${CafeNameType.daegue.name}'),
              subtitle: const Text("연중무휴 , 24시간 운영"),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                setState(() {
                  Api.cafeName = CafeNameType.daegue.name;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset("assets/images/cafe_image4.jpg", width: 110, height: 200,),
              title: Text('${CafeNameType.daejeon.name}'),
              subtitle: const Text("연중무휴 , 24시간 운영"),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                setState(() {
                  Api.cafeName = CafeNameType.daejeon.name;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Image.asset("assets/images/cafe_image5.jpg", width: 110, height: 200,),
              title: Text('${CafeNameType.gwangju.name}'),
              subtitle: const Text("연중무휴 , 24시간 운영"),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                setState(() {
                  Api.cafeName = CafeNameType.gwangju.name;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            const Divider(
              color: Colors.grey,
            ),
          ]
      ),
    );
  }
}
