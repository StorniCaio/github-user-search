import 'package:flutter/material.dart';
import 'package:github_user_search/models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 55.0,
                height: 55.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl ?? ""),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    user.login,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
