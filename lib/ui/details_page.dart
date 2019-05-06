import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:profile_app/model/profile.dart';
import 'package:profile_app/ui/details_intro_animation.dart';
import 'package:profile_app/ui/project_card.dart';

class DetailsPage extends StatelessWidget {
  final Profile details;
  final DetailsIntroAnimation animation;

  Widget _createAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Opacity(
          opacity: animation.bgdropOpacity.value,
          child: Image.asset(
            details.backdropPhoto,
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: animation.bgdropBlur.value,
            sigmaY: animation.bgdropBlur.value,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: animation.controller, builder: _createAnimation),
    );
  }

  DetailsPage(
      {@required this.details, @required AnimationController controller})
      : animation = DetailsIntroAnimation(controller);

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createLogoAvatar(),
          _createAboutDetails(),
          _createProjectScroller()
        ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return Transform(
      transform: Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        height: 110.0,
        margin: EdgeInsets.only(top: 32.0, left: 19.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 27.0,
              backgroundColor: Colors.white,
              child: Image.asset(
                details.logo,
                width: 50.00,
                height: 400.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Flutter Apps",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35 * animation.avatarSize.value + 2.0,
                    color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createAboutDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 14.0, left: 14.0, right: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            details.name,
            style: TextStyle(
                color: Colors.white.withOpacity(animation.nameOpacity.value),
                fontSize: 30.0 * animation.avatarSize.value + 2.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            details.location,
            style: TextStyle(
                color:
                    Colors.white.withOpacity(animation.locationOpacity.value),
                fontWeight: FontWeight.w400),
          ),
          Container(
            color: Colors.white.withOpacity(0.79),
            margin: EdgeInsets.symmetric(vertical: 14.0),
            width: animation.dividerWidth.value,
            height: 1.0,
          ),
          Text(
            details.about,
            style: TextStyle(
              color: Colors.white.withOpacity(animation.aboutOpacity.value),
              height: 1.4,
            ),
          )
        ],
      ),
    );
  }

  Widget _createProjectScroller() {
    return Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Transform(
        transform: Matrix4.translationValues(
            animation.projectScrollerXTranslation.value, 0.0, 0.0),
        child: SizedBox.fromSize(
          size: Size.fromHeight(250.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var projects = details.projects[index];
              return ProjectCard(projects);
            },
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            itemCount: details.projects.length,
          ),
        ),
      ),
    );
  }
}
