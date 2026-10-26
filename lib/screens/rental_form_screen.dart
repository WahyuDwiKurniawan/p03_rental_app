import 'package:flutter/material.dart';

class RentalFormScreen extends StatefulWidget {
  const RentalFormScreen({super.key});

  @override
  State<RentalFormScreen> createState() => _RentalFormScreenState();
}

class _RentalFormScreenState extends State<RentalFormScreen> {
  // Kunci global validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller teks masukan
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  String _selectedCar = 'Toyota Avanza';
  final List<String> _carOptions = [
    'Toyota Avanza',
    'Honda Brio',
    'Daihatsu Xenia',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Peminjaman Mobil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Penyewa',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama penyewa tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Durasi Sewa (Hari)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Durasi sewa tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue:
                    _selectedCar, 
                decoration: const InputDecoration(
                  labelText: 'Pilih Mobil',
                  border: OutlineInputBorder(),
                ),
                items: _carOptions.map((String car) {
                  return DropdownMenuItem<String>(value: car, child: Text(car));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCar = newValue!;
                  });
                },
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Berhasil! ${_nameController.text} menyewa $_selectedCar selama ${_durationController.text} hari.',
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Simpan & Sewa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
