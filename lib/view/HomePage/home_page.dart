import 'package:dog_walk_app/models/doginfodata.dart';
import 'package:dog_walk_app/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: const [
              NavBar(),
              SizedBox(
                height: 10,
              ),
              FilteredOption(),
              JobList(),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pets_outlined,
            ),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: black,
        unselectedItemColor: offWhite,
      ),
    );
  }
}

class JobList extends StatelessWidget {
  const JobList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(dogList.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 250,
              width: ScreenUtil().screenWidth,
              child: Stack(
                children: [
                  Image.network(
                    dogList[index]['img'],
                    width: ScreenUtil().screenWidth,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dogList[index]['name'],
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: white),
                        ),
                        Text(
                          '${dogList[index]['service_day']} | ${dogList[index]['service_time']}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: ScreenUtil().screenWidth - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dogList[index]['service_type'],
                                style:
                                    const TextStyle(fontSize: 18, color: white),
                              ),
                              Text('\$ ${dogList[index]['service_fee']} / hr',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: white,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class FilteredOption extends StatelessWidget {
  const FilteredOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(searchOption.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Chip(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            label: Row(
              children: [
                Text(
                  searchOption[index],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  'assets/svg_icons/x.svg',
                  width: 18,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg_icons/map-pin.svg',
                width: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Kastanienallee, Berlin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              SvgPicture.asset(
                'assets/svg_icons/filter.svg',
                width: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(2),
                  color: black,
                  constraints:
                      const BoxConstraints(maxHeight: 15, minWidth: 15),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
