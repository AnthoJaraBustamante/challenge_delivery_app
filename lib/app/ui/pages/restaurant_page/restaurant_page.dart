import 'package:animate_do/animate_do.dart';
import 'package:challenge_delivery_app/app/ui/global_widgets/icon_text_widget.dart';
import 'package:challenge_delivery_app/app/ui/global_widgets/my_elevated_button.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/local_widgets/category_list.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/local_widgets/featured_items_list.dart';
import 'package:challenge_delivery_app/app/ui/pages/restaurant_page/local_widgets/produts_item_list.dart';
import 'package:challenge_delivery_app/app/ui/theme/color_theme.dart';
import 'package:challenge_delivery_app/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/restaurant_controller.dart';

export './bindings/restaurant_binding.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final RestaurantController controller = Get.find<RestaurantController>();
    final size = MediaQuery.of(context).size;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    double width = size.width * 0.7;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<RestaurantController>(
        builder: (_) {
          _.scrollController.addListener(() {
            var pixels = _.scrollController.position.pixels;

            if (pixels >= 45) {
              if (_.hasBorders) {
                _.hasBorders = false;
                _.update();
              }
            } else {
              if (!_.hasBorders) {
                _.hasBorders = true;
                _.update();
              }
            }
            if (pixels >= 250) {
              if (!_.shrink) {
                _.shrink = true;
                _.update();
              }
            } else {
              if (_.shrink) {
                _.shrink = false;
                _.update();
              }
            }
          });
          return ScrollConfiguration(
            behavior: const ScrollBehavior()
              // ignore: deprecated_member_use
              ..buildOverscrollIndicator(
                  context,
                  Container(),
                  ScrollableDetails(
                      direction: AxisDirection.down,
                      controller: _.scrollController)),
            child: CustomScrollView(
              controller: _.scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 2.0,
                  expandedHeight: size.height * 0.4,
                  pinned: true,
                  collapsedHeight: 80,
                  stretchTriggerOffset: 600,
                  toolbarHeight: 70,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: SafeArea(
                      child: Visibility(
                        visible: _.shrink,
                        child: ZoomIn(
                          child: Row(
                            children: [
                              const MyBackButton(),
                              const CircleAvatarWidget(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:const [
                                  RestaurantName(),
                                  RestaurantAddress(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    background: Stack(
                      children: [
                        Image.asset(
                          Assets.assetsPizza1,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: size.height * 0.5,
                        ),
                        Container(
                          width: double.infinity,
                          height: size.height * 0.5,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.1, 0.98],
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            visible: size.width < size.height,
                            child: const SafeArea(child: MyBackButton())),
                        size.width > size.height
                            ? const ContractedAppBar()
                            : const ExpandedAppBar(),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ExpandedCustomCard(
                              hasBorders: _.hasBorders,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: <Widget>[
                                          const TitleText(
                                              text: 'Featured items'),
                                          const SizedBox(width: 10),
                                          GetBuilder<RestaurantController>(
                                            builder: (_) {
                                              return CircledNumberWidget(
                                                number: _.products
                                                    .where((element) =>
                                                        element.isFeatured)
                                                    .toList()
                                                    .length,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    GetBuilder<RestaurantController>(
                                      id: 'featured',
                                      builder: (_) {
                                        return FeaturedItems(
                                          products: _.products
                                              .where((element) =>
                                                  element.isFeatured)
                                              .toList(),
                                        );
                                      },
                                    ),
                                    GetBuilder<RestaurantController>(
                                      id: 'categories',
                                      builder: (_) {
                                        return CategoriesList(controller: _);
                                      },
                                    ),
                                    GetBuilder<RestaurantController>(
                                      id: 'products',
                                      builder: (_) {
                                        return ProductsList(
                                          controller: _,
                                          width: width,
                                          isDark: isDark,
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ContractedAppBar extends StatelessWidget {
  const ContractedAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            const SafeArea(child: MyBackButton()),
            const CircleAvatarWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                RestaurantName(),
                RestaurantAddress(),
              ],
            ),
            const RestaurantCategories(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                RestaurantServices(),
                RestaurantRating(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedAppBar extends StatelessWidget {
  const ExpandedAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 40),
          CircleAvatarWidget(),
          RestaurantName(),
          RestaurantAddress(),
          RestaurantCategories(),
          RestaurantServices(),
          RestaurantRating(),
        ],
      ),
    );
  }
}

class CircledNumberWidget extends StatelessWidget {
  const CircledNumberWidget({
    Key? key,
    required this.number,
  }) : super(key: key);
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: ColorTheme.darkQuinary,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          gradient: Theme.of(context).brightness == Brightness.light
              ? ColorTheme.primaryGradient
              : null),
      alignment: Alignment.center,
      // width: 25,
      // height: 20,

      child: Text(
        '$number',
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).brightness == Brightness.light
            ? ColorTheme.darkSecondary
            : ColorTheme.darkQuaternary,
      ),
    );
  }
}

class ExpandedCustomCard extends StatelessWidget {
  const ExpandedCustomCard({
    Key? key,
    required this.child,
    required this.hasBorders,
  }) : super(key: key);
  final Widget child;
  final bool hasBorders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(hasBorders ? 20 : 0),
              topRight: Radius.circular(hasBorders ? 20 : 0),
            ),
          ),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : ColorTheme.darkSecondary,
          elevation: 0,
          child: child),
    );
  }
}

class RestaurantRating extends StatelessWidget {
  const RestaurantRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(Icons.star, color: Colors.yellow, size: 15),
        const SizedBox(width: 5),
        const Text(
          '4.5',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 11,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '(30+)',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.7),
            fontSize: 11,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          'See Review \u2192',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.7),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class RestaurantServices extends StatelessWidget {
  const RestaurantServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        IconTextWidget(
          icon: Icons.delivery_dining_rounded,
          text: 'free delivery',
        ),
        IconTextWidget(
          icon: Icons.timer_rounded,
          text: '10-15 mins',
        ),
      ],
    );
  }
}

class RestaurantCategories extends StatelessWidget {
  const RestaurantCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return size.width < size.height
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              MyTagButton(text: 'Pizza'),
              MyTagButton(text: 'Chicken'),
              MyTagButton(text: 'Fast Food'),
            ],
          )
        : Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              MyTagButton(text: 'Pizza'),
              MyTagButton(text: 'Chicken'),
              MyTagButton(text: 'Fast Food'),
            ],
          );
  }
}

class RestaurantAddress extends StatelessWidget {
  const RestaurantAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '4102 Pretty View Lonenda',
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}

class RestaurantName extends StatelessWidget {
  const RestaurantName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Pizza Hut',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      // height: 80,
      // width: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          Assets.assetsPizzaHut,
          fit: BoxFit.contain,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
