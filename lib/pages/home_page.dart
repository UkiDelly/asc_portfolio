import 'package:asc_portfolio/common_enum/product/product_enum.dart';
import 'package:asc_portfolio/controller/home_controller.dart';
import 'package:asc_portfolio/dto/user_ticket_dto.dart';
import 'package:asc_portfolio/pages/nav_drawer/nav_drawer_page.dart';
import 'package:asc_portfolio/pages/payment/in_app_payment/in_app_payment.dart';
import 'package:asc_portfolio/pages/payment/payment_page.dart';
import 'package:asc_portfolio/pages/seat/specific_seat_page.dart';
import 'package:asc_portfolio/pages/cafe/select_cafe_page.dart';
import 'package:asc_portfolio/service/home_service.dart';
import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'package:asc_portfolio/server/dio_server.dart';
import 'package:asc_portfolio/pages/admin/admin_main_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../server/api/api.dart';
import 'login/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  static final storage = FlutterSecureStorage();

  static bool isLogined = false;
  String rolyType = "";
  int selectedSeatNumber = 0;

  HomeController _homeController = HomeController();
  HomeService _homeService = HomeService();

  void _roomFetchGet() async {
    final roomDatas = await server.getAllRoomStateReq(context);
    setState(() {
      _homeController.seatDatas = roomDatas;
    });
  }

  void getRolyType() async {
    String? _rolyType = await storage.read(key: "roleType");
    setState(() {
      rolyType = _rolyType ?? "";
    });
    if (rolyType == "ADMIN") {
      Navigator.popAndPushNamed(context, "/AdminMainPage");
    }
  }

  void _loginCheckAndFetch() async {
    bool checkLoginValid = await server.getCheckLogin(context);
    setState(() {
      isLogined = checkLoginValid;
    });
    if (isLogined == true) {
      final userQrAndNameData = await server.getUserQrAndNameReq(context);
      setState(() {
        _homeController.qrCode = userQrAndNameData.qrCode;
        _homeController.userName = userQrAndNameData.userName;
      });
      final userTicketInfo = await server.getUserTicketInfo(context);
      print("userTicketproductLabel="+userTicketInfo.productLabel);
      setState(() {
        _homeController.userTicketInfo = userTicketInfo;

        if (userTicketInfo.productLabel.contains("PART-TIME")) {
          _homeController.period = userTicketInfo.remainingTime ?? 0;
        } else if (userTicketInfo.productLabel.contains("FIXED-TERM")) {
          _homeController.period = userTicketInfo.period ?? 0;
        }
      });
      final userSeatReservationInfo = await server.getUserSeatReservationInfo(context);
      setState(() {
        _homeController.seatReservationSeatNumber = userSeatReservationInfo.seatNumber;
        _homeController.seatReservationStartTime = userSeatReservationInfo.startTime;
        _homeController.seatReservationCreateDate = userSeatReservationInfo.createDate;
        _homeController.seatReservationPeriod = userSeatReservationInfo.period;
        _homeController.seatReservationTimeInUse = userSeatReservationInfo.timeInUse;
        _homeController.format = DateFormat('HH시 mm분').format(DateTime.parse(_homeController.seatReservationCreateDate).subtract(
            Duration(days: DateTime.now().day, hours: DateTime.now().hour + 9, minutes: DateTime.now().minute)));
      });
      print("_loginCheckAndFetch실행");
      print("seatReservationCreateDate=" + _homeController.seatReservationCreateDate);
      print("seatReservationSeatNumber=" + _homeController.seatReservationSeatNumber.toString());
      print("seatReservationStartTime=" + _homeController.seatReservationStartTime.toString());
      print('seatReservationPeriod='+ _homeController.seatReservationPeriod);
      print("userQrAndName=" + _homeController.qrCode);
    }
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies실행");
    _loginCheckAndFetch();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getRolyType();
    _roomFetchGet();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List seatList = [];
    // String parse = DateFormat('yyyy MM dd일 HH시 mm분').format(DateTime.now().add(
    //     Duration(
    //         hours: 9,
    //         minutes: _homeController.period
    //     ))
    //     .subtract(
    //     Duration(
    //         days: DateTime.now().day,
    //         hours: DateTime.now().hour + 9,
    //         minutes: DateTime.now().minute)));
    //
    // print("pares="+parse);

    print("DateTime="+DateTime.now().toString());
    //.replaceAll(' ', '').replaceAll('-', '').replaceAll(':', '').replaceAll('.', '')
    String validTime = DateFormat('yyyy-MM-dd h시 mm분까지').format(
        DateTime.now().add(Duration(hours : 9, minutes: _homeController.period)));
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
                  label: Text("${Api.cafeName}",style: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.w200),),// <-- Text
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
                  heroTag: 'Text5',
                  label: Text("결제 테스트",style: TextStyle(fontSize: 13,color: Colors.white, fontWeight: FontWeight.w300),),// <-- Text
                  backgroundColor: AppColor.appPurple,
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InAppPaymentSecond(product: Product.FIFTY_HOUR_PART_TIME_TICKET,)));
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
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
              margin: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(20),
                width: 30,
                height: 60,
                child: TimerBuilder.periodic(Duration(seconds: 1),
                    builder: (context){
                      return Text(
                        '현재시간 : ${DateFormat('yyyy년 MM월 dd일 h시 mm분 ss초 a').format(DateTime.now().add(Duration(hours: 9)))
                        }',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16, color: Colors.white),
                    );
                  }
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(width: 500,
                child: Divider(color: Colors.black, thickness: 2.0)),
            SizedBox(height: 20),
            Row(
              children: [
                FloatingActionButton.extended(
                    heroTag: 'entrance2',
                    label: Text('${Api.cafeName}'),// <-- Text
                    backgroundColor: AppColor.appPurple,
                    onPressed: ()  {
                    }
                ),
              ],
            ),
            SizedBox(height: 70),
            FloatingActionButton.extended(
                heroTag: 'Area1',
                label: Text('좌석번호'),// <-- Text
                backgroundColor: AppColor.appPurple,
                onPressed: ()  {
                  //server.getAllRoomStateReq(context);
                  print(seatList);
                }
            ),
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
            SizedBox(height: 40),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: _homeController.seatDatas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (isLogined == true && _homeController.seatDatas[index].seatState.length == 10
                        && _homeController.userTicketInfo?.isValidTicket == "VALID") {
                      setState(() {
                        selectedSeatNumber = index + 1;
                      });
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificSeatPage(selectedSeatNumber)));
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
                        color: _homeService.getRoomState(index, _homeController) ? AppColor.appPurple : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          SizedBox(width: 4,),
                          Text(
                            "${_homeController.seatDatas[index].seatNumber + 1}",
                            style: TextStyle(
                              color: _homeService.getRoomState(index, _homeController) ? Colors.white : AppColor.appPurple,
                              fontSize: 35,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 130),
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
              label: _homeController.userName != "" ? Text("${_homeController.userName}님",
                style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),) : Text("로그인 후 사용해주세요"),
              backgroundColor: AppColor.appPurple,

              onPressed: ()  {
              }
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'UserSeat',
              icon: Icon(Icons.event_seat),
              label: _homeController.seatReservationSeatNumber != 0 ? Text('내 좌석번호 : ${_homeController.seatReservationSeatNumber + 1}번',
                style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16)) : Text('사용중인 좌석이 없습니다'),// <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: ()  {
              }
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'UserTime',
              icon: Icon(Icons.timer),
              label: _homeController.seatReservationStartTime != 0 ?
              Text('좌석 남은시간: ${_homeController.format}',
                style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),) : Text('사용중인 좌석이 없습니다'),// <-- Text
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
              label: Text('${Api.cafeName}', style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
              backgroundColor: AppColor.appPurple,
              onPressed: ()  {
              }
          ),
          Image.asset("assets/images/logo_pass.png",width: 400, height: 400,),
          SizedBox(height: 10),
          FloatingActionButton.extended(
              heroTag: 'Pass',
              icon: Icon(Icons.timelapse_rounded),
              label: _homeController.period == 0 ? Text('이용권이 없습니다') : Text('티켓남은기간: $validTime ',
                style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 16),),// <-- Text
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectCafePage())),
            },
            icon: Icon(Icons.storefront_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () => {
              if(isLogined == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage()))
              } else if(isLogined == false) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDemo())),
                }
              },
            icon: isLogined ? Icon(Icons.add_card) : Icon(Icons.login),
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.appPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: isLogined ? Colors.white.withOpacity(.60) : Colors.white.withOpacity(.10),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _homeController.selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          if(isLogined == true) {
            setState(() {
              _homeController.selectedIndex = index;
            });
          }
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
