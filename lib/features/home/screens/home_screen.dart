import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/home/widgets/categories_bar.dart';
import 'package:my_app/features/home/widgets/home_textfield.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                child: Image.asset(
                  "assets/images/app_bar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(15),
                    child: HomeTextField(
                      controller: _searchBarController,
                      onPressed: () {},
                      hintText: "Search a product",
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 5,
                ),
                child: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          CategoriesBar(),
        ],
      ),
    );
  }
}
