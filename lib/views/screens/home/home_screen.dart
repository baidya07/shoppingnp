import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shoppingnp/repository/remote/networks/dio_client.dart';
import 'package:shoppingnp/views/widget/cached_network_image_builder.dart';
import 'package:shoppingnp/views/widget/forms/buttons.dart';

import '../../../app_config/size_constants.dart';
import '../../../models/network_response_model/home_data_model.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  final DioClient _client = DioClient();

  // late List<Banners>? _banners = [];
  //
  // // @override
  // void initState() {
  //   super.initState();
  //   _getBannerData();
  // }
  //
  // // void _getBannerData() async {
  //   _banners = (await DioClient(dio: null).getBanners(title: 'asd'))!;
  //   Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {}));
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<Banners?>(
              future: _client.getBanners(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Banners? bannerInfo = snapshot.data;
                  if (bannerInfo != null) {
                    Banners bannerData = bannerInfo;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 100.0,
                          ),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Colors.orangeAccent,
                                            ),
                                            child: Text(
                                              '${bannerData.title}',
                                              style: const TextStyle(
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: SC.mW, vertical: SC.mH),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      5, (index) => const _CategoryComponent()),
                                ),
                              ),
                              SBC.lH,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Current Deals',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.greenAccent),
                                  ),
                                  PrimaryTextButton(
                                    onPressed: () {},
                                    title: 'See All',
                                  ),
                                ],
                              ),
                              SBC.lH,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      3, (index) => const _ProductTiles()),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Text('${bannerInfo!.title}');
                }
                return  Center(child: Column(
                  children: [
                    // CircularProgressIndicator(),
                    // Text('${snapshot.data}'),
                  ],
                ));
                  // const CircularProgressIndicator();
              })),
    );
  }
}

// switch (snapshot.connectionState) {
// case ConnectionState.none:
// return Text('none data');
// case ConnectionState.active:
//           // return Text('data');
//           case ConnectionState.waiting:
//             return Column(
//               children: [
//                 CircularProgressIndicator(),
//                 const Text('waiting for the data'),
//               ],
//             );
//           case ConnectionState.done:
//             return const Text('end state or finished');
//         }

class _ProductTiles extends StatelessWidget {
  const _ProductTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          Container(
            width: 150,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 0.1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const CustomCachedNetworkImage(
              'https://m.media-amazon.com/images/I/61xzuXWWozS._SL1200_.jpg',
              aspectRatio: 3.3,
              fit: BoxFit.contain,
            ),
          ),
          const Positioned(
              right: 10.0,
              top: 8.0,
              child: Icon(
                Icons.favorite_border,
                color: Colors.red,
              )),
        ]),
        SBC.mH,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Noise ColorFit Pro 2\nTouch Control Smart Watch',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
            ),
            SBC.mH,
            Text(
              'Rs 2999',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryComponent extends StatelessWidget {
  const _CategoryComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              width: 0.1,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                height: 100,
                child: CustomCachedNetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhq1zJXL6YUWK4JxyrN1NJ-qx20fNL0mJSzg&usqp=CAU',
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Category',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
