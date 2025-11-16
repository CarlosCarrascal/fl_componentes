import 'package:flutter/material.dart';
import '../themes/profile_colors.dart';
import '../themes/theme_helper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Pun pun Onodera');
  final phoneController = TextEditingController(text: '421345321');
  final emailController = TextEditingController(text: 'punpun@gmail.com');
  bool isDarkMode = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = T(isDarkMode);
    
    return Scaffold(
      backgroundColor: theme.bg,
      appBar: _buildAppBar(theme),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _buildAvatarSection(theme),
            const SizedBox(height: 40),
            _buildTextField(nameController, 'Nombre completo', Icons.person_rounded, null, theme),
            const SizedBox(height: 18),
            _buildTextField(phoneController, 'Teléfono', Icons.phone_rounded, TextInputType.phone, theme),
            const SizedBox(height: 18),
            _buildTextField(emailController, 'Email', Icons.email_rounded, TextInputType.emailAddress, theme),
            const SizedBox(height: 40),
            _buildSaveButton(theme),
            const SizedBox(height: 16),
            _buildCancelButton(theme),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(T theme) => AppBar(
    title: Text('Editar Perfil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: theme.t1)),
    centerTitle: true,
    backgroundColor: theme.bg,
    elevation: 0,
    iconTheme: IconThemeData(color: theme.t1),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded, color: theme.t1, size: 20),
            Switch(
              value: isDarkMode,
              onChanged: (value) => setState(() => isDarkMode = value),
              activeTrackColor: C.a,
              activeThumbColor: Colors.white,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: theme.b,
            ),
          ],
        ),
      ),
    ],
  );

Widget _buildAvatarSection(T theme) => Center(
  child: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: theme.b, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDarkMode ? 0.3 : 0.1),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/images/avatars/profile.jpg'),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            color: C.a,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: C.a.withValues(alpha: 0.4),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
            onPressed: () => _showImagePicker(theme),
          ),
        ),
      ),
    ],
  ),
);

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, TextInputType? keyboardType, T theme) => 
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: theme.t1, fontSize: 15, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: theme.t2, fontSize: 14),
        prefixIcon: Icon(icon, size: 22, color: theme.t2),
        filled: true,
        fillColor: theme.c,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.b, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.b, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: C.a, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: C.e, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: C.e, width: 2),
        ),
      ),
      validator: (value) => _validateField(value, label),
    );

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) return 'Campo requerido';
    if (fieldName == 'Email' && !value.contains('@')) return 'Email inválido';
    if (fieldName == 'Teléfono' && value.length < 8) return 'Teléfono muy corto';
    return null;
  }

  Widget _buildSaveButton(T theme) => SizedBox(
    width: double.infinity,
    height: 52,
    child: ElevatedButton(
      onPressed: _handleSave,
      style: ElevatedButton.styleFrom(
        backgroundColor: C.a,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
      child: const Text(
        'Guardar Cambios',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.3),
      ),
    ),
  );

  Widget _buildCancelButton(T theme) => SizedBox(
    width: double.infinity,
    height: 52,
    child: OutlinedButton(
      onPressed: () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        foregroundColor: theme.t2,
        side: BorderSide(color: theme.b, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Cancelar',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  void _showImagePicker(T theme) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Seleccionar imagen...'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: theme.c,
      ),
    );
  }

  void _handleSave() {
    if (formKey.currentState!.validate()) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.white),
              SizedBox(width: 12),
              Text('Perfil actualizado exitosamente'),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: C.s,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }
}
