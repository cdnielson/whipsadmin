library order;

class Order {
  final String idx;
  String lastName;
  String firstName;
  final String currency;
  final String shipping;
  final String total;
  final String paid;
  bool completed;

  Order(String this.idx, String lastname, String firstname,
      String this.currency, String this.shipping, String this.total, String this.paid,
      String _completed) {
    this.lastName = lastname;
    this.firstName = firstname;
    print(_completed);
    if(_completed == "1") {
      completed = true;
    } else {
      completed = false;
    }
  }

  Order.fromMap(Map<String, Object> map) : this(
      map["idx"],
      map["lastName"],
      map["firstName"],
      map["currency"],
      map["shipping"],
      map["total"],
      map["paid"],
      map["completed"]
  );
}