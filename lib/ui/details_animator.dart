import 'package:flutter/material.dart';
import 'package:profile_app/repo/repo.dart';
import 'package:profile_app/ui/details_page.dart';

class DetailsAnimator extends StatefulWidget {
  @override
  _DetailsAnimatorState createState() => _DetailsAnimatorState();
}

class _DetailsAnimatorState extends State<DetailsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 1780), vsync: this);
    super.initState();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsPage(
      details: RepoData.projects,
      controller: _controller,
    );
  }
}
