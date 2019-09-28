import 'package:chyc_sie_roboty/presentation/home/course_card.dart';
import 'package:chyc_sie_roboty/presentation/home/home_app_bar.dart';
import 'package:chyc_sie_roboty/presentation/home/home_bloc.dart';
import 'package:chyc_sie_roboty/presentation/home/home_event.dart';
import 'package:chyc_sie_roboty/presentation/home/home_state.dart';
import 'package:chyc_sie_roboty/presentation/home/offer_card.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:chyc_sie_roboty/util/bloc_state.dart';
import 'package:chyc_sie_roboty/widget/image_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class HomePage extends StatefulWidget {
  final Function(SwipeType) swipeTypeCallback;

  const HomePage({Key key, @required this.swipeTypeCallback}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  final CardController _cardController = CardController();

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: bloc.state,
        builder: _builder,
      );

  Widget _builder(BuildContext context, AsyncSnapshot<HomeState> snapshot) {
    final state = snapshot.data;

    if (state is ShowLoadingOfferCards) {
      return _buildView('Adam', _buildLoadingCardsView());
    } else if (state is ShowLoadingCourseCards) {
      return _buildView('Adam', _buildLoadingCardsView());
    } else if (state is ShowOfferCards) {
      return _buildView(
        'Adam',
        _buildOfferSwipeView(
          (index) => OfferCard(offer: state.offers[index]),
          state.offers.length,
        ),
      );
    } else if (state is ShowCourseCards) {
      return _buildView(
        'Adam',
        _buildOfferSwipeView(
          (index) => CourseCard(course: state.courses[index]),
          state.courses.length,
        ),
      );
    }

    return Container();
  }

  Widget _buildView(String userName, Widget contentView) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              HomeAppBar(userName: userName),
              Expanded(child: contentView),
            ],
          ),
        ),
      );

  Widget _buildOfferSwipeView(
    Widget Function(int) cardBuilder,
    int size,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.S),
                child: Container(
                  child: TinderSwapCard(
                    animDuration: 300,
                    stackNum: 3,
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                    minHeight: MediaQuery.of(context).size.height * 0.35,
                    orientation: AmassOrientation.BOTTOM,
                    cardController: _cardController,
                    cardBuilder: (context, index) => cardBuilder(index),
                    totalNum: size,
                    swipeCompleteCallback: (orientation, index) {
                      if (orientation != CardSwipeOrientation.RECOVER) {
                        if (orientation == CardSwipeOrientation.LEFT) {
                          bloc.dispatch(Discard.from(index));
                        } else {
                          bloc.dispatch(Accept.from(index));
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          size > 0 ? _buildCardControlsRow() : Container(),
          SizedBox(height: 40),
        ],
      );

  Row _buildCardControlsRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundImageButton(image: SvgPicture.asset(Images.CANCEL), onTap: () => _cardController.triggerLeft()),
          SizedBox(width: 48),
          RoundImageButton(image: SvgPicture.asset(Images.REVERT), onTap: () {}),
          SizedBox(width: 48),
          RoundImageButton(image: SvgPicture.asset(Images.HEART), onTap: () => _cardController.triggerRight()),
        ],
      );

  Center _buildLoadingCardsView() => Center(child: CircularProgressIndicator());
}
