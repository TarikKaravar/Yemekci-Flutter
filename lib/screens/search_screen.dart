import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart'; // Eğer BottomMenu buradaysa, bu import gerekli

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  File? _selectedImage;
  String? _confirmedText; // Onaylanan tarif yazısı burada tutulacak
  bool _isConfirmed = false; // Tarif onaylandı mı?
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedRecipe(); // Uygulama açıldığında kaydedilen tarifi yükle
  }

  /// 📌 Kaydedilen tarifi yükle
  Future<void> _loadSavedRecipe() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImagePath = prefs.getString('recipe_image');
    final savedText = prefs.getString('recipe_text');

    if (savedImagePath != null && savedText != null) {
      setState(() {
        _selectedImage = File(savedImagePath);
        _confirmedText = savedText;
        _isConfirmed = true;
      });
    }
  }

  /// 📌 Yeni tarif kaydet
  Future<void> _saveRecipe(String imagePath, String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('recipe_image', imagePath);
    await prefs.setString('recipe_text', text);
  }

  Future<void> _pickImage() async {
    // Depolama izni iste
    if (Platform.isAndroid || Platform.isIOS) {
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Depolama izni verilmedi!")),
        );
        return;
      }
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      print("Dosya Seçildi: ${result.files.single.path}"); // Debug için

      setState(() {
        _selectedImage = File(result.files.single.path!);
        _isConfirmed = false; // Yeni fotoğraf seçildiğinde tekrar yazma izni ver
        _descriptionController.clear(); // Yeni tarif için alanı temizle
      });
    } else {
      print("Dosya Seçilmedi!");
    }
  }

  void _confirmRecipe() {
    if (_selectedImage == null || _descriptionController.text.isEmpty) return;

    setState(() {
      _isConfirmed = true;
      _confirmedText = _descriptionController.text;
    });

    // 📌 Tarif kaydediliyor
    _saveRecipe(_selectedImage!.path, _confirmedText!);
    _descriptionController.clear(); // Yeni tarif için alan temizlendi
  }

  @override
  Widget build(BuildContext context) {
    print("Seçilen Resim: $_selectedImage"); // Debug için

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tarif Yükleme Ekranı",
          style: TextStyle(
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black87, Colors.black54]
                : [Colors.white, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100), // AppBar boşluğu
                      if (_selectedImage != null)
                        Column(
                          children: [
                            Image.file(
                              _selectedImage!,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            if (!_isConfirmed)
                              TextField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  hintText: "Tarifinizi buraya yazın...",
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 3,
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _confirmedText ?? "",
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                          ],
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "Henüz bir görsel seçilmedi.",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: _isConfirmed ? _pickImage : (_selectedImage == null ? _pickImage : _confirmRecipe),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 4,
                    shadowColor: theme.shadowColor,
                  ),
                  icon: Icon(_isConfirmed ? Icons.upload : (_selectedImage == null ? Icons.upload : Icons.check), size: 22),
                  label: Text(
                    _isConfirmed ? "Yeni Tarif Yükle" : (_selectedImage == null ? "Tarif Yükle" : "Tarifi Onayla"),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Butonu biraz yukarı almak için
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
