// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItemOr<Item, Or> {
  late final Item item;
  final Or other;
  final bool didSucceed;

  ItemOr({
    required this.item,
    required this.other,
    this.didSucceed = true,
  });
}
