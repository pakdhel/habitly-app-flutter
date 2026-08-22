import 'package:flutter/material.dart';

enum HabitlyColors {
  // ---------- Base / Neutral ----------
  background("Background", Color(0xFFF9F6EE)), // Merino — latar belakang utama app
  surface("Surface", Color(0xFFFEFDFA)), // Bianca — popover / card di atas background
  surfaceMuted("Surface Muted", Color(0xFFEEEDE4)), // Pampas — input bg / surface variant
  border("Border", Color(0xFFDDDFD5)), // Moon Mist — border tipis, divider
  outline("Outline", Color(0xFFAFBBB1)), // Powder Ash — outline icon, placeholder text

  // ---------- Teks ----------
  textPrimary("Text Primary", Color(0xFF1C2D26)), // Celtic — teks utama (heading, body)
  textSecondary("Text Secondary", Color(0xFF67766D)), // Corduroy — teks sekunder / muted

  // ---------- Brand / Primary (hijau) ----------
  primary("Primary", Color(0xFF479780)), // Viridian — tombol utama, nav aktif, progress bar
  onPrimary("On Primary", Color(0xFFF7FEFA)), // White Ice — teks/icon di atas primary
  primaryContainer("Primary Container", Color(0xFFC1EBD9)), // Jagged Ice — badge / container hijau muda
  onPrimaryContainer("On Primary Container", Color(0xFF184035)), // Gable Green — teks di atas primaryContainer

  // ---------- Tag warna habit (dari screen "New Habit") ----------
  tagSky("Tag Sky", Color(0xFF7BB7D5)), // Downy
  tagSand("Tag Sand", Color(0xFFE0C394)), // Calico
  tagLilac("Tag Lilac", Color(0xFFB2A1D4)), // Cold Purple
  tagFlame("Tag Flame", Color(0xFFEB883B)), // Jaffa

  // ---------- Status ----------
  destructive("Destructive", Color(0xFFC65954)), // Fuzzy Wuzzy Brown — tombol log out, error
  onDestructive("On Destructive", Color(0xFFFFFFFF)),

  // ---------- Absolute ----------
  black("Black", Color(0xFF000000)),
  white("White", Color(0xFFFFFFFF));

  const HabitlyColors(this.name, this.color);
  final String name;
  final Color color;
}