import 'package:asc_portfolio/controller/home_controller.dart';
import 'package:asc_portfolio/main.dart';
import 'package:asc_portfolio/pages/nav_drawer/nav_drawer_page.dart';
import 'package:asc_portfolio/pages/payment/payment_page.dart';
import 'package:asc_portfolio/pages/select_cafe/select_cafe_page.dart';
import 'package:asc_portfolio/service/home_service.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:asc_portfolio/server/dio_server.dart';
import 'package:asc_portfolio/pages/admin/admin_main_page.dart';
import 'login/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {

  bool _isLogined = false;

  HomeController _homeController = HomeController();
  HomeService _homeService = HomeService();

  void _fetchGet() async {
    if (_isLogined = true) {
      final roomDatas = await server.getAllRoomStateReq(context);
      final userQrAndNameData = await server.getUserQrAndNameReq(context);
      final userTicketInfo = await server.getUserTicketInfo(context);

      setState(() {
        _homeController.seatDatas = roomDatas;
        _homeController.userQrAndNameData = userQrAndNameData.first.toJson();
        _homeController.qrCode =
            _homeController.userQrAndNameData.values.toString().replaceAll(
                '(', '').replaceAll(')', '') ?? '';
        _homeController.userName =
            _homeController.userQrAndNameData.keys.toString().replaceAll(
                '(', '').replaceAll(')', '') ?? '';
        _homeController.userTicketInfo = userTicketInfo;
        _homeController.period = userTicketInfo.period ?? '';
        _homeController.remainingTime = userTicketInfo.remainingTime ?? 0;
      });
      print("userQrAndName=" + _homeController.userQrAndNameData.toString());
      print("userTicketInfo=" + _homeController.userTicketInfo.toString());
    }
  }

  @override
  void didChangeDependencies() {
    if (_isLogined == true) {
      print("didChangeDependencies실행");
      _fetchGet();
    }
    super.didChangeDependencies();
  }

  void loginFetch() async {
    _isLogined = await server.getCheckLogin(context);
  }

  @override
  void initState() {
    setState(() {
      loginFetch();
    });
    print(_isLogined);
    super.initState();
    print(_isLogined);
    _fetchGet();
  }

  @override
  Widget build(BuildContext context) {

    List seatList = [];

    for (int i=0; i< _homeController.seatDatas.length; i++) {
      seatList.add(_homeController.seatDatas[i].toJson());
    }

    List _widgetOptions = [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[

            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: AppColor.appPurple ,
                child: Image.asset("assets/images/logo_set_splash.png", width: 200, height: 200,)),
            Container(
              padding: EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                  heroTag: 'Text2',
                  label: Text("${MyApp.cafeName}",style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.w200),),// <-- Text
                  backgroundColor: AppColor.appPurple,
                  onPressed: ()  {
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: FloatingActionButton.extended(
                  heroTag: 'Text4',
                  label: Text("관리자페이지 테스트",style: TextStyle(fontSize: 13,color: Colors.white, fontWeight: FontWeight.w300),),// <-- Text
                  backgroundColor: AppColor.appPurple,
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMainPage()));
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: FloatingActionButton.extended(
                  heroTag: 'Text',
                  label: Text("좌석 선택후 시간을 선택해주세요.",style: TextStyle(fontSize: 13,color: Colors.white, fontWeight: FontWeight.w300),),// <-- Text
                  backgroundColor: AppColor.appPurple,
                  onPressed: ()  {
                  }
              ),
            ),
            Card(
              color: AppColor.appPurple,
              margin: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                width: 30,
                height: 60,
                child: TimerBuilder.periodic(Duration(seconds: 1),
                    builder: (context){
                      return Text(
                        '현재시간 : ${DateFormat('yyyy-MM-dd h시 mm분 ss초 a').format(DateTime.now().add(Duration(hours: 9)))
                        }',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),
                      );
                    }),
              ),
            ),
            SizedBox(height: 20,),
            Container(width: 500,
                child: Divider(color: Colors.black, thickness: 2.0)),
            SizedBox(height: 20),
            Card(
              color: Colors.grey,
              child: Row(
                children: [
                  FloatingActionButton.small(
                      heroTag: 'colorSelect',
                      backgroundColor: Colors.white,
                      onPressed: ()  {
                      }
                  ),
                  Text(" : 사용가능"),
                  FloatingActionButton.small(
                      heroTag: 'colorSelect2',
                      backgroundColor: AppColor.appPurple,
                      onPressed: ()  {
                      }
                  ),
                  Text(" : 사용불가능"),
                ],
              ),
            ),
            SizedBox(height: 100,),
            Row(
              children: [
                FloatingActionButton.extended(
                    heroTag: 'entrance',
                    label: Text('입구 >>'),// <-- Text
                    backgroundColor: AppColor.appPurple,
                    onPressed: ()  {
                    }
                ),
                SizedBox(width: 200,),
                FloatingActionButton.extended(
                    heroTag: 'entrance2',
                    label: Text('${MyApp.cafeName}'),// <-- Text
                    backgroundColor: AppColor.appPurple,
                    onPressed: ()  {
                    }
                ),
              ],
            ),

            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area1',
                label: Text('1번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                  server.getAllRoomStateReq(context);
                }
            ),
            SizedBox(height: 20),

            GridView.builder(

              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: _homeController.seatDatas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      print(_homeController.seatDatas[index].toJson());
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificSeatPage()));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: _homeService.getRoomState(index, _homeController) ? AppColor.appPurple : Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "${_homeController.seatDatas[index].toJson().keys.toString().replaceAll('(', '').replaceAll(')', '')}",
                        style: TextStyle(
                          color: _homeService.getRoomState(index, _homeController) ? Colors.white : AppColor.appPurple,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area2',
                label: Text('2번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                }
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      print("123");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Text("index: $index"),
                  ),
                );
              },
            ),
            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area3',
                label: Text('3번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                }
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      print("123");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Text("index: $index"),
                  ),
                );
              },
            ),
            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area4',
                label: Text('4번구역'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                }
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    if(index == 1) {
                      print("123");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white
                    ),
                    child: Text("index: $index"),
                  ),
                );
              },
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
      Column(
        children: [
          Card(
              margin: EdgeInsets.all(50.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              elevation: 6.0,
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 300,
                  height: 300,
                  child: QrImage(
                    data: _homeController.qrCode,
                    version: QrVersions.auto,
                    backgroundColor: Colors.white,
                  ))),
          Text("주의 ! QR코드를 타인에게 노출하지마세요.",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.black,fontSize: 16)),

          SizedBox(height: 30),
          FloatingActionButton.extended(
              heroTag: 'UserName',
              icon: Icon(Icons.account_box),
              label: Text('${_homeController.userName}',
                style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPurple,

              onPressed: ()  {
              }
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'UserSeat',
              icon: Icon(Icons.event_seat),
              label: Text('좌석 : ', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: ()  {
              }
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'UserTime',
              icon: Icon(Icons.timer),
              label: Text('좌석남은시간: ', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: ()  {
              }
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
              heroTag: 'Pass3',
              icon: Icon(Icons.credit_card_outlined),
              label: Text('내 이용권정보', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: ()  {
              }
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'Pass2',
              label: Text('${MyApp.cafeName}', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: ()  {
              }
          ),
          Image.asset("assets/images/logo_pass.png",width: 400, height: 400,),
          SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'Pass',
              icon: Icon(Icons.timelapse_rounded),
              label: Text('티켓남은기간:${_homeController.period}', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: ()  {
              }
          ),
        ],
      )
    ];

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        title: Image.asset("assets/images/logo.png", fit: BoxFit.fill,),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCafePage())),
            },
            icon: Icon(Icons.storefront_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () => {
              if(_homeController.loginCheck == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage()))
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDemo())),
                }
              },
            icon: _homeController.loginCheck ? Icon(Icons.add_card) : Icon(Icons.account_circle),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.appPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _homeController.selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _homeController.selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "좌석",
            icon: Icon(Icons.event_seat),
          ),
          BottomNavigationBarItem(
            label: "QR코드",
            icon: Icon(Icons.qr_code_2),
          ),
          BottomNavigationBarItem(
            label: "내 이용권",
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),


      body: Center(
        child: _widgetOptions.elementAt(_homeController.selectedIndex),
      ),
    );
  }
}
