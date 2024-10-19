import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/model/usermodel.dart';
import 'package:getx_mvvm/utilis/routs/routs_name.dart';
import 'package:getx_mvvm/view_model/home_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setBool('islogin', false);
              Get.toNamed(RoutsName.loginview);
            },
            icon: const Icon(
              Icons.logout_sharp,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: FutureBuilder<UserModel?>(
        future: homeViewModel.gethomeapi(context),
        builder: (context, AsyncSnapshot<UserModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while fetching data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle error state
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Data successfully fetched, display it in the ListView
            UserModel userModel = snapshot.data!;

            return ListView.builder(
              itemCount: userModel
                  .data!.length, // Assuming the UserModel has a list of 'data'
              itemBuilder: (context, index) {
                var user = userModel.data![index]; // Access each user data
                return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar
                            .toString()), // Assuming there is an 'avatar' field in the UserModel
                      ),
                      title: Text(
                          user.firstName.toString()), // Display user's name
                      subtitle: Text(user.email.toString()),
                      trailing: const Icon(Icons.call)),
                );
              },
            );
          } else {
            // If no data is available
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
