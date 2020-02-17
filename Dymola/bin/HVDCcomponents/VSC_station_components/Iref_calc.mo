within HVDCcomponents.VSC_station_components;

model Iref_calc
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  Modelica.Blocks.Interfaces.RealInput P annotation(
    Placement(visible = true, transformation(origin = {-122, 68}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 72}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Q annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-112, -64}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vr annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput vi annotation(
    Placement(visible = true, transformation(origin = {60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput ir annotation(
    Placement(visible = true, transformation(origin = {110, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput ii annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  ir = 1 / (vr ^ 2 + vi ^ 2) * (vr * P + vi * Q);
  ii = 1 / (vr ^ 2 + vi ^ 2) * (vi * P - vr * Q);


end Iref_calc;
