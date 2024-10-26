import 'package:flutter/material.dart';

import 'home_foorter.dart';
import 'home_header.dart';
import 'home_icons.dart';
import 'home_navbuttons.dart';
import 'home_note.dart';
import 'home_posts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: HomeHeader(
                    notificationCount: 2,
                    profileImageUrl: null,
                    userName: 'Laura Myhem',
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: HomeIcons()),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  child: const HomeNavButtons(),
                ),
              ),
              const SliverToBoxAdapter(child: HomeNote()),
              const SliverToBoxAdapter(child: HomePost()),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const HomeFooter(),
      backgroundColor: Colors.transparent,
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  double get minExtent => 61.0;
  @override
  double get maxExtent => 61.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
