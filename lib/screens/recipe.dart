import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List recipeItemTitleImage = [
  ["칠리 샌드위치", 'images/recipe/recipe1.png'],
  ["새우 버섯 샐러드", 'images/recipe/recipe2.png'],
  ["아보카도 계란 식빵", 'images/recipe/recipe3.png'],
  ["견과류 보울", 'images/recipe/recipe4.png'],
  ["과일 그릭 요거트", 'images/recipe/recipe5.png']
];

List recipeCommentLevelTime = [
  ["아침에 후다닥 나갈 때 Best!", "5m ~ 10m", "쉬움", "짧음"],
  ["오동통한 새우와 아삭아삭한 샐러드의 조화", "5m ~ 15m", "보통", "보통"],
  ["부드러운 아보카도와 담백한 계란", "5m ~ 10m", "보통", "보통"],
  ["아침에 먹기 좋은 음식 1위 견과류!", "5m", "쉬움", "짧음"],
  ["장 운동을 도와줄 요거트와 상큼한 과일", "5m ~ 10m", "쉬움", "짧음"],
];

List recipeLevelIcon = [
  ['images/recipe/fullRiceIcon.png', 'images/recipe/emptyRiceIcon.png', 'images/recipe/emptyRiceIcon.png'],
  ['images/recipe/fullRiceIcon.png', 'images/recipe/fullRiceIcon.png', 'images/recipe/emptyRiceIcon.png',],
  ['images/recipe/fullRiceIcon.png', 'images/recipe/fullRiceIcon.png', 'images/recipe/emptyRiceIcon.png',],
  ['images/recipe/fullRiceIcon.png', 'images/recipe/emptyRiceIcon.png', 'images/recipe/emptyRiceIcon.png'],
  ['images/recipe/fullRiceIcon.png', 'images/recipe/emptyRiceIcon.png', 'images/recipe/emptyRiceIcon.png'],
];

List recipeColor = [
  ["0xFFD8EDBD"], ["0xFFFFF8E0"], ["0xFFFFEBE4"], ["0xFFFFFFC6"], ["0xFFFFF1C1"]
];

List keyWordImage = [
  ["육류", 'images/recipe/drumstickcategory.png'],
  ["어패류", 'images/recipe/fishcategory.png'],
  ["채소류", 'images/recipe/saladcategory.png'],
  ["찌개류", 'images/recipe/soupcategory.png'],
  ["과일류", 'images/recipe/emptyRiceIcon.png'],
  ["추천", 'images/recipe/emptyRiceIcon.png'],
  ["추천", 'images/recipe/emptyRiceIcon.png'],
  ["추천", 'images/recipe/emptyRiceIcon.png'],
  ["추천", 'images/recipe/emptyRiceIcon.png'],
  ["추천", 'images/recipe/emptyRiceIcon.png'],
];

void main() {
  runApp(const Recipe());
}


// 전체 코드 틀
class Recipe extends StatelessWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// 메인 화면
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("레시피"), ),
      body: Container(
        child: RecipePage(),
      ),
    );
  }
}

// 레시피 페이지

final CarouselController _controller = CarouselController();

class RecipePage extends StatelessWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30.0),
      children: <Widget>[
        _pageOfTop(), // 상단
        _pageOfMiddle1(), // 중단1
        _pageOfMiddle2(), // 중단2
        _pageOfBottom(), // 하단
      ],
    );
  }
}

// 인사말, 검색창
Widget _pageOfTop() {
  return Column(

    children: <Widget>[
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("트윙크", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30), ),
              Text("님", style: TextStyle(fontSize: 25),),
            ],
          ),
          Row(
            children: [
              Text("좋은 아침밥이에요.", style: TextStyle(fontSize: 25),),
            ],
          )
        ],
      ),
      ///////////////////////////// 검색바
      Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEFEFEF),
              hintText: "든든한 아침밥!",
              // 기본 아웃라인
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30)
              ),
              // 포커스 됐을 때 아웃라인
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30)
              ),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search_rounded),
            )
        ),
      ),
    ],
  );
}

Widget _pageOfMiddle1() {
  // 첫 요소 왼쪽에 여백이 생기는 문제 해결
  // https://stackoverflow.com/questions/74627678/how-to-make-carousel-slider-on-the-left-side
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          child: Text("추천하는 아침밥", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
            height: 350.0,
            enableInfiniteScroll: false,
            initialPage: 0,
            viewportFraction: 0.6
        ),
        items: [0,1,2,3,4].map((i) { //
          return Builder(
            builder: (BuildContext context) { // context 사용할 경우 활용
              return Container(
                  transform: Matrix4.translationValues(-620 / 8, 0, 0),
                  padding: EdgeInsets.all(10.0),
                  width: (MediaQuery.of(context).size.width), // 기기 가로사이즈 받아오기
                  margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0), // 좌우여백 설정
                  decoration: BoxDecoration(
                      color: Color(int.parse(recipeColor[i][0])),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 6.0,
                            offset: Offset(0, 6)
                        )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // 이미지
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(recipeItemTitleImage[i][1], fit: BoxFit.fitHeight, width: 120, height: 120,),
                          ],
                        ),
                      ),
                      // 텍스트
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recipeItemTitleImage[i][0], style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, ),),
                          Text(recipeCommentLevelTime[i][0], style: TextStyle(fontSize: 14)),
                          Row(
                            children: [
                              Image.asset(recipeLevelIcon[i][0]),
                              Image.asset(recipeLevelIcon[i][1]),
                              Image.asset(recipeLevelIcon[i][2]),
                              Container(
                                child: Text("쉬움", textAlign: TextAlign.center,),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0,
                                          blurRadius: 6.0,
                                          offset: Offset(0, 2)
                                      )
                                    ]
                                ),
                                width: 40,
                                height: 23,
                              ),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) => Detail()));
                                  }

                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('images/clockIcon.png'),
                              Text(recipeCommentLevelTime[i][1]),
                            ],
                          )
                        ],
                      )
                    ],
                  )
              );
            },
          );
        }).toList(),
      ),
    ],
  );
}

Widget _pageOfMiddle2() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("카테고리로 찾아보세요!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      CarouselSlider(
        options: CarouselOptions(
            height: 150.0,
            enableInfiniteScroll: false,
            initialPage: 0,
            viewportFraction: 0.33
        ),
        items: [0,1,2,3,4,5,7,8,9].map((i) { //
          return Builder(
            builder: (BuildContext context) { // context 사용할 경우 활용
              return Container(
                  transform: Matrix4.translationValues(-1000 / 8, 0, 0),
                  padding: EdgeInsets.all(10.0),
                  width: 120,
                  margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0), // 좌우여백 설정
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 6.0,
                            offset: Offset(0, 6)
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Image.asset(keyWordImage[i][1], width: 50, height: 50,),
                      Text(keyWordImage[i][0]),
                    ],
                  )
              );
            },
          );
        }).toList(),
      ),
    ],
  );
}

Widget _pageOfBottom() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text("대부분 이런 아침밥을 즐겨요!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      Row(
        children: [
          Category(),
          Category(),
          Category(),
        ],
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Text(""),
          ),
          Category(),
          Category(),
          Category(),
        ],
      )
    ],
  );
}


class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("#샌드위치", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),),
      decoration: BoxDecoration(
          color: Color(int.parse(recipeColor[0][0])),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 6.0,
                offset: Offset(0, 2)
            )
          ]
      ),
      width: 100,
      height: 30,
    );
  }
}

// 상세페이지
class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.5),
                  child: Image.asset('images/recipe1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: (){Navigator.pop(context);},
                        icon: Icon(Icons.arrow_back_outlined), iconSize: 50,)
                    ],
                  )),
            ],
          ),
          Positioned(
              bottom: -300,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                ),
                child: Column(
                  children: [

                  ],
                ),
              ))
        ],
      ),
    );
  }
}