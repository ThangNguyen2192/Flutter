//list view
https://www.youtube.com/watch?v=q5wDHkVgTkw&list=PLRhlTlpDUWsxWhGA4jTr0oGeNs7xYyDPW&index=12
https://www.youtube.com/watch?v=kLfgeNKX0Qs&list=PLv6GftO355AvO_rrcm5F7gTBHLTjV0oD5

cai dat va viet todo list
https://www.youtube.com/watch?v=Hadc-GBPsmY&list=PLv6GftO355AsxyLjGVkpOmN8DUbcPdIBv

//--Tài liệu về Flutter
https://cafedev.vn/series-tu-hoc-flutter-tu-co-ban-toi-nang-cao/
//Khai baos image
Child: Image(
    fit: BoxFit.cover,
     // height: double.infinity,
    // width: double.infinity,
    image: NetworkImage(
     "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg"))),


//--Text field
child: TextField(
                    textAlignVertical: TextAlignVertical
                        .bottom, // Center vertically Căn cho chữ luôn ở giữa dòng theo chiều đứng
                    controller: textSearch,
                    style: const TextStyle(fontSize: 18),
                    // textAlign: TextAlign.left,
                    // textAlign: TextAlign.mid,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.search),
                      prefixIcon: Icon(Icons.search),
                      // prefixIconColor: Colors.black,
                      hintText: "Tìm kiếm",

                      filled: true,
                      fillColor: Color.fromARGB(255, 223, 206, 206),
                      // labelText: "Tìm kiếm",
                      //labelStyle: TextStyle(color: Colors.black),
                      // border: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide.none
                          // borderSide:
                          //borderSide: BorderSide(),
                          ),
                      // contentPadding: EdgeInsets.all(10),
                      //enabledBorder: OutlineInputBorder.none,
                      // focusedBorder: OutlineInputBorder(
                      //     //borderSide: BorderSide(color: Colors.black),
                      //     ),
                    ),
                    onChanged: (value) {
                      _maxindex = 0;
                      setState(() {});
                    },
                    onEditingComplete: () {
                      print("v");
                    },
                    onSubmitted: (value) {
                      print("su");
                    },
                  ),
//-- The nut bo tron         
floatingActionButton: FloatingActionButton(
         shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
          ),
        backgroundColor: Colors.blue,
        onPressed: () {
          print("a");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
nút có icon và text
  ElevatedButton.icon(
       onPressed: () {},
       child: ElevatedButton.icon(
                              onPressed: _setLikeColor,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,//--độ cao của bóng nút =0 là coi như trong suốt
                                side: const BorderSide(
                                    style: BorderStyle.none,
                                    color: Colors.white),
                                backgroundColor: Colors
                                    .white, // Set the button background color to transparent
                              ),
                              icon: Icon(
                                Icons.favorite,
                                color: _likeColor,
                              ), // Use the heart icon
                              label: const Text(
                                'Like',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
       style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .transparent, // Set the button background color to transparent
                              ),

        icon: const Icon(
       Icons.favorite,
       color: Colors.transparent,
        ), // Use the heart icon
         label: const Text(
         'Like'), // Text displayed next to the icon
         style: ButtonStyle(
         shape: MaterialStateProperty.all<
           RoundedRectangleBorder>(
           RoundedRectangleBorder(
            borderRadius:
             BorderRadius.circular(18.0),
              side: const BorderSide(
              color: Colors
             .black), // Add a black border
             ),
               ),
              ),
            ),


            import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _handleButtonPress() {
    // Add your onPressed functionality here
    print('Button pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ButtonStyle Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _handleButtonPress,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Set background color
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Set padding
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set border radius
                ),
              ),
              elevation: MaterialStateProperty.all<double>(4.0), // Set elevation
            ),
            child: Text('Custom Button'), // Button text
          ),
        ),
      ),
    );
  }
}



//--Container
Center(
              child: Container(
                color: Colors.red,
                width: 200,
                height: 200,
                padding: const EdgeInsets.all(20),//--ngan cach voi ben trong
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  margin: const EdgeInsets.all(20),//-ngancach voi ben ngoai
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 5, color: Colors.black), //them boder
                    borderRadius: const BorderRadius.all(
                        Radius.circular(20)), // bo 4 góc 20px
                    color: Colors.green,
                  ),
                
                ),
              ),
            )

  child: Column(
                  children: [
                    Expanded(
                        flex: 3,//--ty so voi cac thang con lai
                        child: Container(
                          color: Colors.yellow,
                        )),
                    const Spacer(),
                    Flexible(
                        child: Container(
                      color: Colors.green,
                    ))
                  ],
                )),

//--- Mở bàn phím lên là object tự đẩy lên trên
Padding(
                  padding: MediaQuery.of(context).viewInsets,//--


  // child: Image.network(
              //   'https://inkythuatso1.com/uploads/images/2022/03/hinh-anh-avatar-dep-cho-con-gai-dai-dien-30-14-15-58.jpg',
              //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              //     return const Text('abcd');
              //   },
              //   errorBuilder: (BuildContext context, Object exception,
              //       StackTrace? stackTrace) {
              //     return const Text('Your error widget...');
              //   },
              // ),
              //     child: FadeInImage(
              //       fadeInDuration: Duration(milliseconds: 1),

              //   width: 200,
              //   height: 200,
              //   image: const NetworkImage(
              //       "https://inkythuatso.com/uploads/images/2022/03/hinh-anh-avatar-dep-cho-con-gai-dai-dien-30-14-15-58.jpg"),
              //   placeholder: const AssetImage("assets/images/1.png"),
              //   imageErrorBuilder: (context, error, stackTrace) {
              //     return Image.asset(
              //         width: 200,
              //         height: 200,
              //         'assets/images/1.png',
              //         fit: BoxFit.cover);
              //   },
              //   fit: BoxFit.fitWidth,
              // )