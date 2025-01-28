import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController epostaYonetici = TextEditingController();
  TextEditingController sifreYonetici = TextEditingController();

  
  girisYap() {
   if (epostaYonetici.text.isEmpty || sifreYonetici.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Bilgilerinizi Girinizi"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        showCloseIcon: true,
        ),
      );
    } else { 
        if(sifreYonetici.text.length < 8) {
             ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Şireniz minimum 8 haneli olmak zorundadır."),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        showCloseIcon: true,
        ),
      );
        }
        else{
          context.go("/home");
        }
        
    }
    
   }
 



   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: SizedBox(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                children: [
                  const Center(
                    child: Text(""),
                  ),
                  TextField(
                    controller: epostaYonetici,
                    decoration: InputDecoration(
                    hintText: "E-Posta",
                    border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    obscureText: true,
                    controller: sifreYonetici,
                    decoration: InputDecoration(
                    hintText: "Şifre",
                    border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                  onPressed:girisYap, 
                  child: const Text("Giriş Yap"),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      context.pushReplacement("/register");
                    },
                    child: const Text("Kayıt Ol"),
                  ),
                    SizedBox(height: 10),
            
                
                 ],
                ),
              ),
            ],
          ) 
        ),
      ), 
    );
  }
}