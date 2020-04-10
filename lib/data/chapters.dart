
import 'package:formulas_cms/models/models.dart';

List<Chapter> getParentChapters() {

  List<String> separated = chaptersCsv.split('\n');
  
  var chaptersRes = separated.where((s) => s.isNotEmpty).map((str){
    var splits = str.split(',');
    return Chapter(
      courseId: splits[0],
      name: splits[1],
      image: null,
      description: '',
    );
  }).toList();

  List<Chapter> uniqueParentChapter = List();

  chaptersRes.forEach((chap){
    if(!uniqueParentChapter.any((c) => c.name == chap.name)) {
      uniqueParentChapter.add(chap);
    }
  });

  return uniqueParentChapter;

}

List<Chapter> getChildChapters(String parentName) {

  List<String> separated = chaptersCsv.split('\n');
  
  var chaptersRes = separated.where((s) => s.contains(parentName)).map((str){
    var splits = str.split(',');
    return Chapter(
      courseId: splits[0],
      name: splits[2],
      image: splits[3],
      description: '',
    );
  }).toList();

  List<Chapter> uniqueParentChapter = List();

  chaptersRes.forEach((chap){
    if(!uniqueParentChapter.any((c) => c.name == chap.name)) {
      uniqueParentChapter.add(chap);
    }
  });

  return uniqueParentChapter;

}

String chaptersCsv = """
5e7ee5388a96706e1879011f,Mechanics,Velocity,1_1_1
5e7ee5388a96706e1879011f,Mechanics,Acceleration,1_1_2
5e7ee5388a96706e1879011f,Mechanics,Equation of motion,1_1_3
5e7ee5388a96706e1879011f,Mechanics,Newton's 2nd law,1_1_4
5e7ee5388a96706e1879011f,Mechanics,Weight,1_1_5
5e7ee5388a96706e1879011f,Mechanics,Dry friction,1_1_6
5e7ee5388a96706e1879011f,Mechanics,Centripetal Acceleration,1_1_7
5e7ee5388a96706e1879011f,Mechanics,Momentum,1_1_8
5e7ee5388a96706e1879011f,Mechanics,Impulse,1_1_9
5e7ee5388a96706e1879011f,Mechanics,Impulse Momentum,1_1_10
5e7ee5388a96706e1879011f,Mechanics,Work,1_1_11
5e7ee5388a96706e1879011f,Mechanics,Work Energy,1_1_12
5e7ee5388a96706e1879011f,Mechanics,Kinetic Engergy,1_1_13
5e7ee5388a96706e1879011f,Mechanics,Potential Energy,1_1_14
5e7ee5388a96706e1879011f,Mechanics,Gravitational Potential Energy,1_1_15
5e7ee5388a96706e1879011f,Mechanics,Efficiency,1_1_16
5e7ee5388a96706e1879011f,Mechanics,Power,1_1_17
5e7ee5388a96706e1879011f,Mechanics,Power Velocity,1_1_18
5e7ee5388a96706e1879011f,Mechanics,Angular Velocity,1_1_19
5e7ee5388a96706e1879011f,Mechanics,Angular Acceleration,1_1_20
5e7ee5388a96706e1879011f,Mechanics,Equation of motion,1_1_21
5e7ee5388a96706e1879011f,Mechanics,Torque,1_1_22
5e7ee5388a96706e1879011f,Mechanics,2nd law of motion,1_1_23
5e7ee5388a96706e1879011f,Mechanics,Moment of Inertia,1_1_24
5e7ee5388a96706e1879011f,Mechanics,Rotational Work,1_1_25
5e7ee5388a96706e1879011f,Mechanics,Rotational Power,1_1_26
5e7ee5388a96706e1879011f,Mechanics,Rotational K.E,1_1_27
5e7ee5388a96706e1879011f,Mechanics,Angular Momentum,1_1_28
5e7ee5388a96706e1879011f,Mechanics,Angular Impulse ,1_1_29
5e7ee5388a96706e1879011f,Mechanics,Angular Impulse Momentum,1_1_30
5e7ee5388a96706e1879011f,Mechanics,Universal Gravitation,1_1_31
5e7ee5388a96706e1879011f,Mechanics,Gravitational Field,1_1_32
5e7ee5388a96706e1879011f,Mechanics,Gravitational Potential Energy,1_1_33
5e7ee5388a96706e1879011f,Mechanics,Gravitational Potential,1_1_34
5e7ee5388a96706e1879011f,Mechanics,Orbital velocity,1_1_35
5e7ee5388a96706e1879011f,Mechanics,Escape velocity,1_1_36
5e7ee5388a96706e1879011f,Mechanics,Hooke's law,1_1_37
5e7ee5388a96706e1879011f,Mechanics,Sprint Potential Energy,1_1_38
5e7ee5388a96706e1879011f,Mechanics,Simple Harmonic Oscillator,1_1_39
5e7ee5388a96706e1879011f,Mechanics,Simple pendulum,1_1_40
5e7ee5388a96706e1879011f,Mechanics,Frequency,1_1_41
5e7ee5388a96706e1879011f,Mechanics,Angular frequency,1_1_42
5e7ee5388a96706e1879011f,Mechanics,Density,1_1_43
5e7ee5388a96706e1879011f,Mechanics,Pressure,1_1_44
5e7ee5388a96706e1879011f,Mechanics,Fluid Pressure,1_1_45
5e7ee5388a96706e1879011f,Mechanics,Buoyancy,1_1_46
5e7ee5388a96706e1879011f,Mechanics,Mass flow rate,1_1_47
5e7ee5388a96706e1879011f,Mechanics,Volume flow rate,1_1_48
5e7ee5388a96706e1879011f,Mechanics,Mass continuity,1_1_49
5e7ee5388a96706e1879011f,Mechanics,Volume continuity,1_1_50
5e7ee5388a96706e1879011f,Mechanics,Bernoulli's equation,1_1_51
5e7ee5388a96706e1879011f,Mechanics,Dynamic viscosity,1_1_52
5e7ee5388a96706e1879011f,Mechanics,Kinematic viscosity,1_1_53
5e7ee5388a96706e1879011f,Mechanics,Drag,1_1_54
5e7ee5388a96706e1879011f,Mechanics,Match number,1_1_55
5e7ee5388a96706e1879011f,Mechanics,Reynolds number,1_1_56
5e7ee5388a96706e1879011f,Mechanics,Froude number,1_1_57
5e7ee5388a96706e1879011f,Mechanics,Young's number,1_1_58
5e7ee5388a96706e1879011f,Mechanics,Shear modulus,1_1_59
5e7ee5388a96706e1879011f,Mechanics,Bulk modulus,1_1_60
5e7ee5388a96706e1879011f,Mechanics,Surface tension,1_1_61
5e7ee5388a96706e1879011f,Thermal Physics,Solid expansion,1_2_1
5e7ee5388a96706e1879011f,Thermal Physics,Liquid expansion,1_2_2
5e7ee5388a96706e1879011f,Thermal Physics,Sensible heat,1_2_3
5e7ee5388a96706e1879011f,Thermal Physics,Latent heat,1_2_4
5e7ee5388a96706e1879011f,Thermal Physics,Ideal gas law,1_2_5
5e7ee5388a96706e1879011f,Thermal Physics,Molecular constants,1_2_6
5e7ee5388a96706e1879011f,Thermal Physics,Maxwell-Boltzmann,1_2_7
5e7ee5388a96706e1879011f,Thermal Physics,Molecular K.E,1_2_8
5e7ee5388a96706e1879011f,Thermal Physics,Molecular speeds,1_2_9
5e7ee5388a96706e1879011f,Thermal Physics,heat flow rate,1_2_10
5e7ee5388a96706e1879011f,Thermal Physics,Thermal conduction,1_2_11
5e7ee5388a96706e1879011f,Thermal Physics,Stefan-Boltzmann law,1_2_12
5e7ee5388a96706e1879011f,Thermal Physics,Wien displacement law,1_2_13
5e7ee5388a96706e1879011f,Thermal Physics,Internal energy,1_2_14
5e7ee5388a96706e1879011f,Thermal Physics,Thermodynamic work,1_2_15
5e7ee5388a96706e1879011f,Thermal Physics,1at law of thermodynamics,1_2_16
5e7ee5388a96706e1879011f,Thermal Physics,Entropy,1_2_17
5e7ee5388a96706e1879011f,Thermal Physics,Efficiency,1_2_18
5e7ee5388a96706e1879011f,Thermal Physics,Coefficient of performance,1_2_19
5e7ee5388a96706e1879011f,Waves and Optics,Periodic waves,1_3_1
5e7ee5388a96706e1879011f,Waves and Optics,Frequency,1_3_2
5e7ee5388a96706e1879011f,Waves and Optics,Beat frequency,1_3_3
5e7ee5388a96706e1879011f,Waves and Optics,Intensity,1_3_4
5e7ee5388a96706e1879011f,Waves and Optics,Intensity level,1_3_5
5e7ee5388a96706e1879011f,Waves and Optics,Pressure level,1_3_6
5e7ee5388a96706e1879011f,Waves and Optics,Doppler effect,1_3_7
5e7ee5388a96706e1879011f,Waves and Optics,mach angle,1_3_8
5e7ee5388a96706e1879011f,Waves and Optics,Cerenkov angle,1_3_9
5e7ee5388a96706e1879011f,Waves and Optics,Interference fringes,1_3_10
5e7ee5388a96706e1879011f,Waves and Optics,Index of  refraction,1_3_11
5e7ee5388a96706e1879011f,Waves and Optics,Snell's law,1_3_12
5e7ee5388a96706e1879011f,Waves and Optics,Criticle angle,1_3_13
5e7ee5388a96706e1879011f,Waves and Optics,Image location,1_3_14
5e7ee5388a96706e1879011f,Waves and Optics,Image sizes,1_3_15
5e7ee5388a96706e1879011f,Waves and Optics,Spherical mirrors,1_3_16
5e7ee5388a96706e1879011f,Electricity and Magnetism,Coulomb's law,1_4_1
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric field definition,1_4_2
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric potential definition,1_4_3
5e7ee5388a96706e1879011f,Electricity and Magnetism,Field and potential,1_4_4
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric field,1_4_5
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric potential,1_4_6
5e7ee5388a96706e1879011f,Electricity and Magnetism,Capacitance,1_4_7
5e7ee5388a96706e1879011f,Electricity and Magnetism,plate capacitor,1_4_8
5e7ee5388a96706e1879011f,Electricity and Magnetism,Cylindrical capacitor,1_4_9
5e7ee5388a96706e1879011f,Electricity and Magnetism,Spherical capacitor,1_4_10
5e7ee5388a96706e1879011f,Electricity and Magnetism,Capacitive P.E.,1_4_11
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric current,1_4_12
5e7ee5388a96706e1879011f,Electricity and Magnetism,Charge density,1_4_13
5e7ee5388a96706e1879011f,Electricity and Magnetism,Current density,1_4_14
5e7ee5388a96706e1879011f,Electricity and Magnetism,Ohm's law,1_4_15
5e7ee5388a96706e1879011f,Electricity and Magnetism,Resitivity conductivity,1_4_16
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric resistance,1_4_17
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric power,1_4_18
5e7ee5388a96706e1879011f,Electricity and Magnetism,Resistors in series,1_4_19
5e7ee5388a96706e1879011f,Electricity and Magnetism,Resistors in parallel,1_4_20
5e7ee5388a96706e1879011f,Electricity and Magnetism,Capacitors in series,1_4_21
5e7ee5388a96706e1879011f,Electricity and Magnetism,Capacitors in parallel,1_4_22
5e7ee5388a96706e1879011f,Electricity and Magnetism,Magnetic force: Charge,1_4_23
5e7ee5388a96706e1879011f,Electricity and Magnetism,Magnetic force: Current,1_4_24
5e7ee5388a96706e1879011f,Electricity and Magnetism,Biot Savart law,1_4_25
5e7ee5388a96706e1879011f,Electricity and Magnetism,Solenoid,1_4_26
5e7ee5388a96706e1879011f,Electricity and Magnetism,Straight wire,1_4_27
5e7ee5388a96706e1879011f,Electricity and Magnetism,Parallel wires,1_4_28
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electric flux,1_4_29
5e7ee5388a96706e1879011f,Electricity and Magnetism,Magnetic flux,1_4_30
5e7ee5388a96706e1879011f,Electricity and Magnetism,Motional flux,1_4_31
5e7ee5388a96706e1879011f,Electricity and Magnetism,Induced emf,1_4_32
5e7ee5388a96706e1879011f,Electricity and Magnetism,Gauss's law,1_4_33
5e7ee5388a96706e1879011f,Electricity and Magnetism,No one's law,1_4_34
5e7ee5388a96706e1879011f,Electricity and Magnetism,Faraday's law,1_4_35
5e7ee5388a96706e1879011f,Electricity and Magnetism,Ampere's law,1_4_36
5e7ee5388a96706e1879011f,Electricity and Magnetism,Electromagnetic plane wave,1_4_37
5e7ee5388a96706e1879011f,Electricity and Magnetism,em wave energy density,1_4_38
5e7ee5388a96706e1879011f,Electricity and Magnetism,poynting vector,1_4_39
5e7ee5388a96706e1879011f,Electricity and Magnetism,em radiation pressure,1_4_40
5e7ee5388a96706e1879011f,Modern Physics,Lorentz factor,1_5_1
5e7ee5388a96706e1879011f,Modern Physics,Time dilation,1_5_2
5e7ee5388a96706e1879011f,Modern Physics,Length Contraction,1_5_3
5e7ee5388a96706e1879011f,Modern Physics,Relative velocity,1_5_4
5e7ee5388a96706e1879011f,Modern Physics,Realitivistic energy,1_5_5
5e7ee5388a96706e1879011f,Modern Physics,Realitivistic momentum,1_5_6
5e7ee5388a96706e1879011f,Modern Physics,Energy momentum,1_5_7
5e7ee5388a96706e1879011f,Modern Physics,Mass energy,1_5_8
5e7ee5388a96706e1879011f,Modern Physics,Realitivistic K.E.,1_5_9
5e7ee5388a96706e1879011f,Modern Physics,Realitivistic doppler effect,1_5_10
5e7ee5388a96706e1879011f,Modern Physics,Photon energy,1_5_11
5e7ee5388a96706e1879011f,Modern Physics,Photon momentum,1_5_12
5e7ee5388a96706e1879011f,Modern Physics,Photoelectric effect,1_5_13
5e7ee5388a96706e1879011f,Modern Physics,Schroedinger's equation,1_5_14
5e7ee5388a96706e1879011f,Modern Physics,Uncertainity principle,1_5_15
5e7ee5388a96706e1879011f,Modern Physics,Rydberg equation,1_5_16
5e7ee5388a96706e1879011f,Modern Physics,Half life,1_5_17
5e7ee5388a96706e1879011f,Modern Physics,Absorbed dose,1_5_18
5e7ee5388a96706e1879011f,Modern Physics,Effective dose,1_5_19
""";
