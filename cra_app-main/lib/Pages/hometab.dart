import 'package:cra_complaints/Components/complainttile.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: _handleRefresh,
      color: Colors.deepPurple,
      backgroundColor: Colors.deepPurple[70],
      height: 200,
      animSpeedFactor: 1.5,
      springAnimationDurationInMilliseconds: 700,
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("complaints").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return CompTile(
                    cTitle: snapshot.data?.docs[index]['title'],
                    description: snapshot.data?.docs[index]['description'],
                    likeCount: snapshot.data?.docs[index]['upvote'],
                    status: snapshot.data?.docs[index]["status"],
                    uid: snapshot.data?.docs[index]["uid"],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.white, size: 30),
              );
            }
          }),
    );
  }
}
