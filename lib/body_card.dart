import 'package:calendarappnew/Item_card.dart';
import 'package:calendarappnew/details/components/details_screens.dart';
import 'package:calendarappnew/details/detailsDone/details.dart';
import 'package:calendarappnew/details/details_screen.dart';
import 'package:calendarappnew/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geolocator/geolocator.dart';

class BodyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // TabController _tabController = TabController(length: 2, vsync: this);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TabBarMenWom(),
          StoitNeStoit(),
          CategorLook(),
          TabCateg(),
          TitleWithMoreBtn(
              title: "НОВИНКИ",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewLook(),
                  ),
                );
              }),
          FeaturePlants(),
          SizedBox(
            height: 10,
          ),
          DoneTitle(
            title: 'ГОТОВЫЕ ОБРАЗЫ',
          ),
          SizedBox(height: 10.0),
          DoneLook(),
        ],
      ),
    );
  }
}

/////////////////////////////////
class CategorLook extends StatelessWidget {
  const CategorLook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 10, right: 25),
      child: Row(
        children: [
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Категория одежды\nСезон 2022',
                    style: TextStyle(color: Colors.grey[800], fontSize: 30))
              ]))
            ],
          )
        ],
      ),
    );
  }
}

/////////////////////////////////
class TabCateg extends StatelessWidget {
  const TabCateg({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    tabs: [
                      Tab(text: "Верх"),
                      Tab(text: "Низ"),
                      Tab(
                        text: "Обувь",
                      ),
                    ]),
              ),
            ),
          ),
          Container(
            height: 336,
            child: TabBarView(
              children: <Widget>[
                VerhCateg(),
                NizCateg(),
                ObuvCateg(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
///////////////////////////

class VerhCateg extends StatelessWidget {
  final categorList = CardTrend.generateCardTrend();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategorList("Новый сезон"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 11),
            height: 280,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TopTrend(categorList[index]),
                separatorBuilder: (_, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: categorList.length),
          ),
        ],
      ),
    );
  }
}

class CategorList extends StatelessWidget {
  final String title;
  CategorList(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.grey[800]),
          ),
          Row(
            children: [
              Text(
                'Больше',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800]),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TopTrend extends StatelessWidget {
  final CardTrend cardTrend;
  TopTrend(this.cardTrend);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4),
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(cardTrend.imageUrl),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 110,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  cardTrend.style,
                  style: TextStyle(fontWeight: FontWeight.w600, height: 1.5),
                ),
                Text(
                  cardTrend.sizon,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardTrend {
  String style;
  String sizon;
  String imageUrl;
  List<String> detailUrl;

  CardTrend(this.style, this.sizon, this.imageUrl, this.detailUrl);
  static List<CardTrend> generateCardTrend() {
    return [
      CardTrend('Кардиган', 'Осень-Весна', 'assets/Categors/verh/0.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg']),
      CardTrend('Хлопковая рубкашка', 'Лето', 'assets/Categors/verh/1.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg']),
      CardTrend('Топ', 'Лето', 'assets/Categors/verh/2.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg']),
      CardTrend('Оверсайз футболка', 'Лето', 'assets/Categors/verh/3.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg'])
    ];
  }
}

///////////////////////////////////////////////////////////////

class NizCategorList extends StatelessWidget {
  final String title;
  NizCategorList(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Row(
            children: [
              Text(
                'Больше',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class NizTopTrend extends StatelessWidget {
  final NizCardTrend nizcardTrend;
  NizTopTrend(this.nizcardTrend);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4),
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(nizcardTrend.imageUrl),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      left: 110,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  nizcardTrend.style,
                  style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
                Text(
                  nizcardTrend.sizon,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NizCateg extends StatelessWidget {
  final nizcategorList = NizCateg.generateNizCardTrend();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategorList("Новый сезон"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            height: 280,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    NizTopTrend(nizcategorList[index]),
                separatorBuilder: (_, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: nizcategorList.length),
          ),
        ],
      ),
    );
  }

  static generateNizCardTrend() {
    return [
      NizCardTrend('Джинсы клш', 'Осень-Весна', 'assets/Categors/niz/0.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg']),
      NizCardTrend('Юбка теннисная', 'Лето', 'assets/Categors/niz/1.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg']),
      NizCardTrend('Штаны классичесие', 'Лето', 'assets/Categors/niz/2.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg'])
    ];
  }
}

class NizCardTrend {
  String style;
  String sizon;
  String imageUrl;
  List<String> detailUrl;

  NizCardTrend(this.style, this.sizon, this.imageUrl, this.detailUrl);
}

//////////////////////////////////////////////
////////////////////////////////////////
class ObuvCategorList extends StatelessWidget {
  final String title;
  ObuvCategorList(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Row(
            children: [
              Text(
                'Больше',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ObuvTopTrend extends StatelessWidget {
  final ObuvCardTrend obuvcardTrend;
  ObuvTopTrend(this.obuvcardTrend);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4),
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(obuvcardTrend.imageUrl),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 110,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  obuvcardTrend.style,
                  style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
                Text(
                  obuvcardTrend.sizon,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ObuvCateg extends StatelessWidget {
  final obuvcategorList = ObuvCateg.generateObuvCardTrend();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategorList("Новый сезон"),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            height: 280,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    ObuvTopTrend(obuvcategorList[index]),
                separatorBuilder: (_, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: obuvcategorList.length),
          ),
        ],
      ),
    );
  }

  static generateObuvCardTrend() {
    return [
      ObuvCardTrend('Туфлии', 'Весна-Лето', 'assets/Categors/obuv/0.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg']),
      ObuvCardTrend('Кроссовки', 'Осень-Весна', 'assets/Categors/obuv/1.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg']),
      ObuvCardTrend('Лоферы', 'Осень-Весна', 'assets/Categors/obuv/2.jpg',
          ['assets/icons/color1.jpg', 'assets/icons/color2.jpg'])
    ];
  }
}

class ObuvCardTrend {
  String style;
  String sizon;
  String imageUrl;
  List<String> detailUrl;

  ObuvCardTrend(this.style, this.sizon, this.imageUrl, this.detailUrl);
}

//
///////////////////////////////////////////////////////////////////
class DoneTitle extends StatelessWidget {
  const DoneTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              TitleWithCustomUnderline(text: title),
            ])));
  }
}

//
class DoneLook extends StatelessWidget {
  const DoneLook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      children: List.generate(6, (int n) {
        return _DoneTile(n);
      }),
    );
  }
}

class _DoneTile extends StatelessWidget {
  _DoneTile(this.n);
  final int n;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => DetailsDone("assets/doneobrz/$n.jpg"),
              ),
            );
          },
          child: Hero(
              tag: "assets/doneobrz",
              child: Image.asset("assets/doneobrz/$n.jpg")),
        ),
      ),
    );
  }
}

//
//-------------------------------------------------------//
class FullObraz extends StatelessWidget {
  const FullObraz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ГОТОВЫЕ ОБРАЗЫ"),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        body: StaggeredGrid.count(
          crossAxisCount: 2,
          children: List.generate(6, (int z) {
            return _FullTile(z);
          }),
        ),
      ),
    );
  }
}

class _FullTile extends StatelessWidget {
  _FullTile(this.z);
  final int z;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: Image.asset("assets/FullLook/$z.jpg"),
      ),
    );
  }
}
//

//--------------------------------------------------------//
//new look details
class NewLook extends StatelessWidget {
  const NewLook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Новинки"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: StaggeredGrid.count(
        crossAxisCount: 2,
        children: List.generate(6, (int i) {
          return _Tile(i);
        }),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  _Tile(this.i);
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        child: Image.asset("assets/newlook/$i.jpg"),
      ),
    );
  }
}
//new look detals

//-------------------------------------------------------//

// таб ьар стоит не стоит
class StoitNeStoit extends StatelessWidget {
  const StoitNeStoit({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    tabs: [
                      Tab(text: "КРАСИВО"),
                      Tab(
                        text: "НЕ СОЧЕТАТЬ",
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 302,
            child: TabBarView(
              children: <Widget>[
                RecomendsPlants(),
                NoRecStyle(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//

//-------------------------------------------------------//

//таб м ж
class TabBarMenWom extends StatelessWidget {
  const TabBarMenWom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(18)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(18),
                    ),
                    tabs: [
                      Tab(
                        text: "ЖЕНЩИНЫ",
                      ),
                      Tab(
                        text: "МУЖЧИНЫ",
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 275,
            child: TabBarView(
              children: <Widget>[
                WomenRec(),
                MenRec(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//

//-------------------------------------------------------//

//женщины
class WomenRec extends StatelessWidget {
  const WomenRec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            RecomendPlantCard(
              image: "assets/WomanLook/0.jpg",
              title: "",
              color: "                   Лето",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/WomanLook/1.jpg",
              title: "",
              color: "            Весна-Лето",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/WomanLook/2.jpg",
              title: "",
              color: "                   Лето",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/WomanLook/3.jpg",
              title: "",
              color: "           Осень-Весна",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/WomanLook/4.jpg",
              title: "",
              color: "                   Лето",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/WomanLook/5.jpg",
              title: "Style",
              color: "color",
              assesment: 4,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

//

//-------------------------------------------------------//

//мужчины

class MenRec extends StatelessWidget {
  const MenRec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            RecomendPlantCard(
              image: "assets/men/0.jpg",
              title: "",
              color: "          ОСЕНЬ-ВЕСНА",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/men/1.jpg",
              title: "",
              color: "          ВЕСНА-ЛЕТО",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/men/2.jpg",
              title: "",
              color: "         ОСЕНЬ-ВЕСНА",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/men/3.jpg",
              title: "Style",
              color: "color",
              assesment: 4,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
//

//-------------------------------------------------------//

//
class FeaturePlants extends StatelessWidget {
  const FeaturePlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeaturePlanCard(
            image: "assets/p1.jpg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          FeaturePlanCard(
            image: "assets/newlook/0.jpg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          FeaturePlanCard(
            image: "assets/p2.jpg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          FeaturePlanCard(
            image: "assets/p3.jpg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeaturePlanCard extends StatelessWidget {
  const FeaturePlanCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(left: 8.0, top: 8.0 / 2, bottom: 8.0 / 2),
        width: size.width * 0.8,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

class NoRecStyle extends StatelessWidget {
  const NoRecStyle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            RecomendPlantCard(
              image: "assets/BedLook/0.jpg",
              title: "Style",
              color: "color",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/BedLook/1.jpg",
              title: "Style",
              color: "color",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/BedLook/2.jpg",
              title: "Style",
              color: "color",
              assesment: 4,
              press: () {},
            ),
            RecomendPlantCard(
              image: "assets/BedLook/3.jpg",
              title: "Style",
              color: "color",
              assesment: 4,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecomendPlantCard(
            image: "assets/p3.jpg",
            title: "Style",
            color: "color",
            assesment: 4,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/p2.jpg",
            title: "Style",
            color: "color",
            assesment: 4,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/Beuty/2.jpg",
            title: "Style",
            color: "color",
            assesment: 4,
            press: () {},
          ),
          RecomendPlantCard(
            image: "assets/Beuty/4.jpg",
            title: "Style",
            color: "color",
            assesment: 4,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.color,
    required this.assesment,
    required this.press,
  }) : super(key: key);

  final String image, title, color;
  final int assesment;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 8.0,
        top: 4.0,
        bottom: 10.0,
      ),
      width: size.width * 0.41, //расположение картинок
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(0.1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Colors.blueGrey.withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: "$color".toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            TitleWithCustomUnderline(text: title),
            Spacer(),
            FlatButton(
              height: 25,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: press,
              child: Text(
                "Больше",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.grey[800],
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithMoreBtnDone extends StatelessWidget {
  const TitleWithMoreBtnDone({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            TitleWithCustomUnderline(text: title),
            Spacer(),
            FlatButton(
              height: 25,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: press,
              child: Text(
                "Больше",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0 / 8),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 8.0 / 8),
              height: 4,
              color: Colors.blueGrey.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.02,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 36.0,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          )
        ],
      ),
    );
  }
}
