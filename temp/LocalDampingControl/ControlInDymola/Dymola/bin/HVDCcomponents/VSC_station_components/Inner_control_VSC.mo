within HVDCcomponents.VSC_station_components;
model Inner_control_VSC
  parameter Real Lr;
  parameter Real Rr;
  parameter Real wg;
  parameter Real tr;
  Real Kp;
  Real Ki;
  Real u1;
  Real u2;
  output Real x1;
  output Real x2;
Modelica.Blocks.Interfaces.RealOutput vmd annotation (
    Placement(visible = true, transformation(origin = {114, 30}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {114, 34}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput vmq annotation (
    Placement(visible = true, transformation(origin = {115, -9}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {114, -34}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput igd annotation (
    Placement(visible = true, transformation(origin = {-120, 68}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-115, 73}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput igq annotation (
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-115, 25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vgd annotation (
    Placement(visible = true, transformation(origin = {-120, -24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-115, -19}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vgq annotation (
    Placement(visible = true, transformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-115, -65}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput igdref annotation (
    Placement(visible = true, transformation(origin = {-44, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-38, 114}, extent = {{-14, -14}, {14, 14}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealInput igqref annotation (
    Placement(visible = true, transformation(origin = {46, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {46, 114}, extent = {{-14, -14}, {14, 14}}, rotation = -90)));
initial equation
der(x1)=0;
der(x2)=0;
equation
Kp = Lr / tr;
Ki = Rr / tr;
u1 = igdref - igd;
u2 = igqref - igq;
der(x1) = u1;
der(x2) = u2;
vmd = Kp*u1 + Ki*x1 + vgd - wg*Lr*igq;
vmq = Kp*u2 + Ki*x2 + vgq + wg*Lr*igd;


end Inner_control_VSC;
