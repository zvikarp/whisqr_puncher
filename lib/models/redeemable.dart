class Redeemable {
  Redeemable({
    required this.index,
    this.count = 0,
  });

  final int index;
  final int count;

  Map<String, int> toMap() {
    return {
      'count': count,
      'rewardindex': index,
    };
  }

  factory Redeemable.fromStringMap(Map<String, int> map) => Redeemable(
        index: int.parse((map['rewardindex'] ?? -1).toString()),
        count: int.parse((map['count'] ?? 0).toString()),
      );

  Redeemable updateCount(int multiplyer) =>
      Redeemable(index: index, count: count + multiplyer);
}
