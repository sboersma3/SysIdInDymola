within HVDCcomponents;
model Vdc_droop
  parameter Real g_droop = 195E-6 "Voltage droop W/V";
  Modelica.Blocks.Interfaces.RealInput vdcref annotation (
    Placement(visible = true, transformation(origin = {-120, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vdc annotation (
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pref annotation (
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(visible = true, transformation(origin = {0, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = g_droop)  annotation (
    Placement(visible = true, transformation(origin = {49, 9}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
equation
  connect(vdcref, feedback.u1) annotation (
    Line(points = {{-120, 44}, {-52, 44}, {-52, 8}, {-8, 8}, {-8, 8}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation (
    Line(points = {{10, 8}, {28, 8}, {28, 10}, {28, 10}}, color = {0, 0, 127}));
  connect(feedback.u2, vdc) annotation (
    Line(points = {{0, 0}, {0, 0}, {0, -20}, {-120, -20}, {-120, -20}}, color = {0, 0, 127}));
  connect(gain.y, Pref) annotation (
    Line(points = {{68, 10}, {106, 10}, {106, 10}, {110, 10}}, color = {0, 0, 127}));
end Vdc_droop;
