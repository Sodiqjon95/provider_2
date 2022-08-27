import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_2/data_layer/db/cached_user_model.dart';
import 'package:provider_2/view_models/user_view_model.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<UserViewModel>(context, listen: false).getUserData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              CachedUser cachedUser =CachedUser(age: 27, name: "Sodiqjon", count: 100);
              context.read<UserViewModel>().addUser(cachedUser);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
             context.read<UserViewModel>().deleteAllUsers();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<UserViewModel>(
            builder: (context, userViewModel, child) {
              // context.read<UserViewModel>().getUserData();
              return userViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView(
                        children: List.generate(userViewModel.cachedUsers.length, (index) {

                          CachedUser cachedUser = userViewModel.cachedUsers[index];
                          return ListTile(
                            title: Text(cachedUser.name),
                            subtitle: Text(cachedUser.age.toString()),
                          );
                        }),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
