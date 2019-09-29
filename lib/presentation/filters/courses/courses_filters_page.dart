import 'package:chyc_sie_roboty/presentation/filters/courses/select_categories_page.dart';
import 'package:chyc_sie_roboty/style/app_colors.dart';
import 'package:chyc_sie_roboty/style/app_typography.dart';
import 'package:chyc_sie_roboty/style/dimens.dart';
import 'package:chyc_sie_roboty/style/strings.dart';
import 'package:chyc_sie_roboty/widget/labeled_button.dart';
import 'package:chyc_sie_roboty/widget/labeled_dropdown.dart';
import 'package:chyc_sie_roboty/widget/labeled_input.dart';
import 'package:chyc_sie_roboty/widget/two_colors_button.dart';
import 'package:flutter/material.dart';

class CoursesFiltersPage extends StatefulWidget {
  @override
  _CoursesFiltersPageState createState() => _CoursesFiltersPageState();
}

class _CoursesFiltersPageState extends State<CoursesFiltersPage> {
  String _selected = categories()[0];
  String _localization;
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTop(context),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(Dimens.L),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    LabeledInput(
                      label: Strings.localization(context),
                      hint: Strings.filterInput(context),
                      controller: _controller,
                      onTextChange: (text) {
                        setState(() {
                          _localization = text;
                        });
                      },
                    ),
                    SizedBox(height: Dimens.M),
                    LabeledButton(
                      label: Strings.courseType(context),
                      selected: _selected,
                      onTap: () {
                        selectCategory(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.M),
              child: TwoColorsButton(
                leftText: Strings.filterReset(context),
                rightText: Strings.filterApply(context),
                leftClick: () {
                  setState(() {
                    _selected = categories()[0];
                    _localization = null;
                    _controller.clear();
                  });
                },
                rightClick: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Future selectCategory(BuildContext context) async {
    String newSelected = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectCategoryPage()),
    );
    setState(() {
      _selected = newSelected;
    });
  }

  Container _buildTop(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.L),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.filterCourses(context),
              style: AppTypography.screenTitle,
            ),
            Text(
              Strings.filtersSubtitle(context),
              style: AppTypography.screenSubTitle,
            )
          ],
        ),
      ),
    );
  }
}

categories() => <String>[
      "Dowolna",
      "Administracja biurowa",
      "Doradztwo / Konsulting",
      "Badania i rozwój",
      "Bankowość",
      "BHP / Ochrona środowiska",
      "Budownictwo",
      "Call Center",
      "Edukacja / Szkolenia",
      "Finanse / Ekonomia",
      "Franczyza / Własny biznes",
      "Hotelarstwo / Gastronomia / Turystyka",
      "Human Resources / Zasoby ludzkie",
      "Internet / e - Commerce / Nowe media",
      "Inżynieria",
      "IT - Administracja",
      "IT - Rozwój oprogramowania",
      "Łańcuch dostaw",
      "Marketing",
      "Media / Sztuka / Rozrywka",
      "Nieruchomości",
      "Obsługa klienta",
      "Praca fizyczna",
      "Prawo",
      "Produkcja",
      "Public Relations",
      "Reklama / Grafika / Kreacja / Fotografia",
      "Sektor publiczny",
      "Sprzedaż",
      "Transport / Spedycja",
      "Ubezpieczenia",
      "Zakupy",
      "Kontrola jakości",
      "Zdrowie / Uroda / Rekreacja",
      "Energetyka",
      "Inne"
    ];
