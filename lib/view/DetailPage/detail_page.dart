import 'package:dog_walk_app/view/RequestPage/request_page.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  DetailPage({required this.dogInfo, Key? key}) : super(key: key);
  Map dogInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            GestureDetector(
              child: Hero(
                tag: 'Dog',
                child: Image.network(
                  dogInfo['img'],
                  width: ScreenUtil().screenWidth,
                  height: 450,
                  fit: BoxFit.fitWidth,
                ),
              ),
              onTap: () {
                Get.to(() => FullImage(
                      img: dogInfo['img'],
                    ));
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.turned_in_not_outlined),
                    color: white,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 320),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                  width: ScreenUtil().screenWidth,
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          dogInfo['name'],
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DogInfo(
                              infoTitle: 'AGE',
                              info: dogInfo['age'],
                            ),
                            DogInfo(
                              infoTitle: 'SIZE',
                              info: dogInfo['size'],
                            ),
                            DogInfo(
                              infoTitle: 'SEX',
                              info: dogInfo['sex'],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'LOCATION',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        const Text(
                          'Kastanienallee, Berlin',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'SERVICE TYPE',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg_icons/footprints.svg',
                              width: 25,
                            ),
                            Text(
                              dogInfo['service_type'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'SERVICE HOURS',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        Column(
                          children: List.generate(
                            dogInfo['service_hours'].length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      child: Text(
                                        dogInfo['service_hours'][index]['day'],
                                        style: TextStyle(
                                            color: dogInfo['service_hours']
                                                    [index]['is_booked']
                                                ? offWhite
                                                : black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: Text(
                                        dogInfo['service_hours'][index]
                                            ['service_hour'],
                                        style: TextStyle(
                                            color: dogInfo['service_hours']
                                                    [index]['is_booked']
                                                ? offWhite
                                                : black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    if (dogInfo['service_hours'][index]
                                        ['is_booked'])
                                      const Text(
                                        'Booked',
                                        style: TextStyle(
                                            color: red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg_icons/info.svg',
                              width: 18,
                              color: yellow,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth - 120,
                              child: dogInfo['is_cycled_week']
                                  ? const Text(
                                      'Please note that, this service is not one-time. It will occur in every week.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : const Text(
                                      'Please note that, this service is one-time. It will not occur in every week.',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'SERVICE FEE',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        Text(
                          '\$${dogInfo['service_fee']} / hr',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'DETAILS',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        Text(
                          dogInfo['details'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          dogInfo['sex'] == 'Female'
                              ? 'HER HUMAN'
                              : "HIS HUMAN",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: offWhite),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  dogInfo['owner_img'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dogInfo['owner'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  dogInfo['owner_mail'],
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 55,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: black)),
                                child: const Icon(
                                  Icons.chat_bubble_outline_outlined,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => RequestPage(dogInfo: dogInfo,));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 55,
                                  width: ScreenUtil().screenWidth - 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: black),
                                  child: const Text(
                                    'Create A Request',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FullImage extends StatelessWidget {
  FullImage({required this.img, Key? key}) : super(key: key);
  String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Stack(
          children: [
            Image.network(
              img,
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 30,
              child: SizedBox(
                width: ScreenUtil().screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.turned_in_not_outlined),
                      color: white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DogInfo extends StatelessWidget {
  const DogInfo({
    required this.infoTitle,
    required this.info,
    Key? key,
  }) : super(key: key);

  final String infoTitle;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          infoTitle,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: offWhite),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
