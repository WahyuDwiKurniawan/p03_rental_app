class Customer {
  final String id;
  final String name;
  final String? phone;

  Customer({required this.id, required this.name, this.phone}) {
    if (id.trim().isEmpty) {
      throw ArgumentError('ID customer tidak boleh kosong.');
    }
    if (name.trim().isEmpty) {
      throw ArgumentError('Nama customer tidak boleh kosong.');
    }
  }

  @override
  String toString() {
    return 'Customer: $name | Telepon: ${phone ?? 'Tidak tersedia'}';
  }
}