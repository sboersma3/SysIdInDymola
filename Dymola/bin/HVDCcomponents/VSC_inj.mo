within HVDCcomponents;

model VSC_inj
  import Modelica.Constants.pi;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  HVDCcomponents.SignalCurrent_phasor signalCurrent_phasor1 annotation(
    Placement(visible = true, transformation(origin = {68, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HVDCcomponents.Ground_phasor ground_phasor1 annotation(
    Placement(visible = true, transformation(origin = {68, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.Iref_calc iref_calc1 annotation(
    Placement(visible = true, transformation(origin = {8, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {110, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.ComplexBlocks.ComplexMath.RealToComplex realToComplex1 annotation(
    Placement(visible = true, transformation(origin = {42, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Pref annotation(
    Placement(visible = true, transformation(origin = {-114, 16}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Qref annotation(
    Placement(visible = true, transformation(origin = {-115, -57}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {-115, -57}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
equation
  connect(iref_calc1.P, Pref) annotation(
    Line(points = {{-2, 12}, {-58, 12}, {-58, 18}, {-114, 18}, {-114, 16}}, color = {0, 0, 127}));
  connect(iref_calc1.vr, p.vr) annotation(
    Line(points = {{2, 16}, {2, 16}, {2, 28}, {114, 28}, {114, 4}, {110, 4}}, color = {0, 0, 127}));
  connect(iref_calc1.vi, p.vi) annotation(
    Line(points = {{14, 16}, {14, 16}, {14, 24}, {106, 24}, {106, 4}, {110, 4}}, color = {0, 0, 127}));
  connect(Qref, iref_calc1.Q) annotation(
    Line(points = {{-114, -56}, {-26, -56}, {-26, 0}, {-4, 0}, {-4, -2}, {-4, -2}}, color = {0, 0, 127}));
  connect(signalCurrent_phasor1.n, p) annotation(
    Line(points = {{68, 14}, {98, 14}, {98, 4}, {110, 4}}, color = {0, 0, 255}));
  connect(ground_phasor1.p, signalCurrent_phasor1.p) annotation(
    Line(points = {{68, -16}, {68, -6}}, color = {0, 0, 255}));
  connect(realToComplex1.y, signalCurrent_phasor1.i) annotation(
    Line(points = {{53, 4}, {60, 4}}, color = {85, 170, 255}));
  connect(iref_calc1.ir, realToComplex1.re) annotation(
    Line(points = {{19, 11}, {29, 11}, {29, 10}, {30, 10}}, color = {0, 0, 127}));
  connect(iref_calc1.ii, realToComplex1.im) annotation(
    Line(points = {{19, -2}, {30, -2}}, color = {0, 0, 127}));
end VSC_inj;
