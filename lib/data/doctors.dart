import 'package:nuncare/models/doctor.dart';

const doctors = [
  Doctor(
    picture: "assets/images/profil_1.png",
    name: "Dr Marie Kouassi",
    role: "Cardiologue",
    stars: 4.5,
    years: 10,
    position: 5,
    about: "Medecin cardiologue depuis 10 ans à la clinique Farah",
    isActive: true,
  ),
  Doctor(
    picture: "assets/images/profil_2.png",
    name: "Dr Ortense Blé",
    role: "Medecin généraliste",
    stars: 4.7,
    years: 12,
    position: 6,
    about:
        "Medecin généraliste depuis 12 ans à la clinique municipale de cocody",
    isActive: true,
  ),
  Doctor(
    picture: "assets/images/profil_3.png",
    name: "Dr Marcus Koffi",
    role: "Neurochirurgien",
    stars: 4.8,
    years: 7,
    position: 9,
    about:
        "Medecin Neurochirurgien depuis 7 ans à l'hopital public de Koumassi",
    isActive: true,
  ),
];
