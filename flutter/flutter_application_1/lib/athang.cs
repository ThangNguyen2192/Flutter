
//Khai baos image
Child: Image(
    fit: BoxFit.cover,
     // height: double.infinity,
    // width: double.infinity,
    image: NetworkImage(
     "https://haycafe.vn/wp-content/uploads/2023/01/Hinh-anh-thien-nhien-dep-nhat.jpeg"))),

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

  ElevatedButton.icon(
       onPressed: () {},
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