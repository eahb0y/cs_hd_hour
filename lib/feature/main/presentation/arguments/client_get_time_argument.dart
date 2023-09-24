class ClientGetTimeArguments {
  final String date;
  final String client;

  ClientGetTimeArguments({
    required this.date,
    required this.client,
  });

  factory ClientGetTimeArguments.fromFirebase(Map<String, dynamic> response) {
    return ClientGetTimeArguments(
      date: response['date'],
      client: response['name'],
    );
  }
}