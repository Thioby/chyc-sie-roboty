import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'offer.jser.dart';

class Offer {
  String id;
  final List<String> benefits;
  final String companyName;
  final String offerName;
  final String place;
  final List<String> requiredSkills;

  Offer(
    this.id,
    this.benefits,
    this.companyName,
    this.offerName,
    this.place,
    this.requiredSkills,
  );
}

@GenSerializer()
class OfferSerializer extends Serializer<Offer> with _$OfferSerializer {}