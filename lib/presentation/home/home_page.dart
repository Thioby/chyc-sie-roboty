import 'package:chyc_sie_roboty/presentation/home/course_card.dart';
import 'package:chyc_sie_roboty/presentation/home/home_app_bar.dart';
import 'package:chyc_sie_roboty/presentation/home/home_bloc.dart';
import 'package:chyc_sie_roboty/presentation/home/home_event.dart';
import 'package:chyc_sie_roboty/presentation/home/home_state.dart';
import 'package:chyc_sie_roboty/presentation/home/offer_card.dart';
import 'package:chyc_sie_roboty/presentation/home/swipe_type.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/images.dart';
import 'package:chyc_sie_roboty/util/bloc_state.dart';
import 'package:chyc_sie_roboty/widget/bottom_info.dart';
import 'package:chyc_sie_roboty/widget/image_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  final Function(SwipeType) swipeTypeCallback;
  final Observable buttonNotifier;

  HomePage({Key key, @required this.swipeTypeCallback, @required this.buttonNotifier}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(buttonNotifier);
}

class _HomePageState extends BlocState<HomePage, HomeBloc> {
  CardController _cardController = CardController();
  final Observable buttonNotifier;

  _HomePageState(this.buttonNotifier);

  @override
  void afterBlocInit() {
    buttonNotifier.listen((_) {
      bloc.dispatch(ChangeDataType());
    });
    super.afterBlocInit();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: bloc.state,
        builder: _builder,
      );

  Widget _builder(BuildContext context, AsyncSnapshot<HomeState> snapshot) {
    final state = snapshot.data;

    if (state is ShowLoadingOfferCards) {
      widget.swipeTypeCallback(SwipeType.OFFER);
      return _buildView('Adam', _buildLoadingCardsView(), "loadingOffer");
    } else if (state is ShowLoadingCourseCards) {
      widget.swipeTypeCallback(SwipeType.COURSE);
      return _buildView('Adam', _buildLoadingCardsView(), "loadingCourse");
    } else if (state is ShowOfferCards) {
      widget.swipeTypeCallback(SwipeType.OFFER);
      return _buildView(
        'Adam',
        _buildOfferView(state),
        SwipeType.OFFER.toString(),
      );
    } else if (state is ShowCourseCards) {
      widget.swipeTypeCallback(SwipeType.COURSE);
      return _buildView(
        'Adam',
        _buildCourseView(state),
        SwipeType.COURSE.toString(),
      );
    }

    return Container();
  }

  Widget _buildOfferView(ShowOfferCards state) => state.offers.length > 0
      ? _buildOfferSwipeView(
          (index) => OfferCard(offer: state.offers[index]),
          state.offers.length,
        )
      : Center(
          child: Text(
          'Na tą chwilę nie mamy dla Ciebie więcej ofert pracy.',
          style: AppTypography.offerLabelTextStyle,
        ));

  Widget _buildCourseView(ShowCourseCards state) => state.courses.length > 0
      ? _buildOfferSwipeView(
          (index) => CourseCard(course: state.courses[index]),
          state.courses.length,
        )
      : Center(
          child: Text(
          'Na tą chwilę nie mamy dla Ciebie więcej kursów.',
          style: AppTypography.offerLabelTextStyle,
        ));

  Widget _buildView(String userName, Widget contentView, String key) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        key: Key(key),
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
  ) {
    print('size $size');
    return Column(
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
                        _showAcceptedOfferBottomSheet();
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
  }

  Row _buildCardControlsRow() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundImageButton(
            image: SvgPicture.asset(Images.CANCEL),
            onTap: () => _cardController?.triggerLeft(),
            text: "Następny",
          ),
          SizedBox(width: 48),
          RoundImageButton(
            image: SvgPicture.asset(Images.REVERT),
            onTap: () {},
            text: "Cofnij",
          ),
          SizedBox(width: 48),
          RoundImageButton(
            image: SvgPicture.asset(Images.HEART),
            onTap: () => _cardController?.triggerRight(),
            text: "ChyćSie",
          ),
        ],
      );

  Center _buildLoadingCardsView() => Center(child: CircularProgressIndicator());

  void _showAcceptedOfferBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return BottomInfo();
      },
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}
