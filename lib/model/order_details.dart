library order_detail;

class OrderDetail {
  final String idx;
  final String order_idx;
  final String description;
  final String material;
  final String length;
  final String price;
  final String quantity;

  OrderDetail(String this.idx, String this.order_idx, String this.description,
      String this.material, String this.length, String this.price,
      String this.quantity);

  OrderDetail.fromMap(Map<String, Object> map) : this(
      map["idx"],
      map["order_idx"],
      map["description"],
      map["material"],
      map["length"],
      map["price"],
      map["quantity"]
  );
}