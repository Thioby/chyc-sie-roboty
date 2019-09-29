// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$OfferSerializer implements Serializer<Offer> {
  @override
  Map<String, dynamic> toMap(Offer model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'id', model.id);
    setMapValue(
        ret, 'benefits', codeIterable(model.benefits, (val) => val as String));
    setMapValue(ret, 'companyName', model.companyName);
    setMapValue(ret, 'offerName', model.offerName);
    setMapValue(ret, 'place', model.place);
    setMapValue(ret, 'requiredSkills',
        codeIterable(model.requiredSkills, (val) => val as String));
    setMapValue(ret, 'timestamp', model.timestamp);
    return ret;
  }

  @override
  Offer fromMap(Map map) {
    if (map == null) return null;
    final obj = Offer(
        getJserDefault('id'),
        codeIterable<String>(
                map['benefits'] as Iterable, (val) => val as String) ??
            getJserDefault('benefits'),
        map['companyName'] as String ?? getJserDefault('companyName'),
        map['offerName'] as String ?? getJserDefault('offerName'),
        map['place'] as String ?? getJserDefault('place'),
        codeIterable<String>(
                map['requiredSkills'] as Iterable, (val) => val as String) ??
            getJserDefault('requiredSkills'),
        map['timestamp'] as int ?? getJserDefault('timestamp'));
    obj.id = map['id'] as String;
    return obj;
  }
}
