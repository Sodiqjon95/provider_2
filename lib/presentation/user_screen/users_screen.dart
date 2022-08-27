import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_2/data_layer/db/cached_user_model.dart';
import 'package:provider_2/view_models/user_view_model.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<UserViewModel>(context, listen: false).getUserData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        actions: [
                          TextField(
                            decoration: const InputDecoration(hintText: "Name"),
                            controller: nameController,
                          ),
                          TextField(
                            decoration: const InputDecoration(hintText: "age"),
                            controller: ageController,
                            keyboardType: TextInputType.phone,
                          ),
                          TextField(
                            decoration: const InputDecoration(hintText: "count"),
                            controller: countController,
                            keyboardType: TextInputType.phone,
                          ),
                          Row(
                            children: [
                              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Close",style: TextStyle(color: Colors.red),)),
                              TextButton(
                                  onPressed: () {
                                    if(countController.text.isEmpty && ageController.text.isEmpty && nameController.text.isEmpty){
                                      showDialog(context: context, builder: (context)=> AlertDialog(title: Text("malumot kiriting"),));
                                    }
                                    CachedUser cachedUser = CachedUser(
                                      age: int.parse(countController.text),
                                      name: nameController.text,
                                      count: int.parse(countController.text),
                                    );
                                    context.read<UserViewModel>().addUser(cachedUser);
                                    countController.clear();
                                    nameController.clear();
                                    ageController.clear();
                                    Navigator.pop(context);
                                  },
                                  child: Text("Add")),

                            ],
                          )
                        ],
                      ));
            },
            icon: const Icon(Icons.person_add),
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
        mainAxisAlignment: MainAxisAlignment.center,
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
                            leading: Text(cachedUser.count.toString()),
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
