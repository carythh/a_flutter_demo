import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSportsPage extends StatefulWidget {
  const HomeSportsPage({super.key});

  @override
  _HomeSportsPageState createState() => _HomeSportsPageState();
}
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();

class _HomeSportsPageState extends State<HomeSportsPage> {
  int _currentIndex = 0;
  List<String> _imageUrls = [
    'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
    'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
    'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Class'),
      ),
      body: Column(
        children: [
          Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  viewportFraction: 0.88,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: false,
                ),
                items: imageSliders,
              )),
          // Container(
          //     child: CarouselSlider(
          //       options: CarouselOptions(
          //         aspectRatio: 2.0,
          //         enlargeCenterPage: true,
          //         scrollDirection: Axis.vertical,
          //         autoPlay: true,
          //       ),
          //       items: imageSliders,
          //     )),

          // CarouselSlider(
          //   items: _imageUrls.map((url) {
          //     return Image.network(url, fit: BoxFit.cover);
          //   }).toList(),
          //   options: CarouselOptions(
          //     height: 200,
          //     viewportFraction: 1.0,
          //     onPageChanged: (index, reason) {
          //       setState(() {
          //         _currentIndex = index;
          //       });
          //     },
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: _imageUrls.map((url) {
          //     int index = _imageUrls.indexOf(url);
          //     return Container(
          //       width: 8,
          //       height: 8,
          //       margin: EdgeInsets.symmetric(horizontal: 4),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: _currentIndex == index ? Colors.blue : Colors.grey,
          //       ),
          //     );
          //   }).toList(),
          // ),

          // Container(
          //   height: 200,
          //   child: PageView(
          //     children: [
          //       Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
          //       Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
          //       Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png', fit: BoxFit.cover),
          //     ],
          //   ),
          // ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      'Grid Item $index',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),

    );
  }
}

