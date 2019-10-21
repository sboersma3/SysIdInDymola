within HVDCcomponents.vdc_controls;

model vdc_PI_control_with_filter
  parameter Real Cdc "Capacitance of the DC grid in F";
  parameter Real Ksi "damping coefficient";
  parameter Real tr "response time of the controller in s";
  Modelica.Blocks.Interfaces.RealInput vdc annotation(
    Placement(visible = true, transformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vdcref annotation(
    Placement(visible = true, transformation(origin = {-192, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pref annotation(
    Placement(visible = true, transformation(origin = {116, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-50, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 2 * Ksi * (1 / tr) * Cdc) annotation(
    Placement(visible = true, transformation(origin = {0, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = (1 / tr) ^ 2 * Cdc) annotation(
    Placement(visible = true, transformation(origin = {4, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-105, 11}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {-80, -36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(a = {2 * Ksi / tr, (1 / tr) ^ 2}, b = {(1 / tr) ^ 2}) annotation(
    Placement(visible = true, transformation(origin = {-80, 38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  connect(transferFunction1.y, add1.u1) annotation(
    Line(points = {{-72, 38}, {-68, 38}, {-68, 12}, {-62, 12}, {-62, 12}}, color = {0, 0, 127}));
  connect(product1.y, transferFunction1.u) annotation(
    Line(points = {{-98, 12}, {-94, 12}, {-94, 38}, {-90, 38}, {-90, 38}}, color = {0, 0, 127}));
  connect(vdcref, product1.u1) annotation(
    Line(points = {{-192, 42}, {-118, 42}, {-118, 15}, {-113, 15}}, color = {0, 0, 127}));
  connect(product1.u2, vdcref) annotation(
    Line(points = {{-113, 7}, {-180, 7}, {-180, 42}, {-192, 42}}, color = {0, 0, 127}));
  connect(product2.y, add1.u2) annotation(
    Line(points = {{-74, -36}, {-68, -36}, {-68, 0}, {-62, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(product2.u1, vdc) annotation(
    Line(points = {{-88, -32}, {-106, -32}, {-106, -42}, {-120, -42}}, color = {0, 0, 127}));
  connect(vdc, product2.u2) annotation(
    Line(points = {{-120, -42}, {-88, -42}, {-88, -40}, {-88, -40}}, color = {0, 0, 127}));
  connect(integrator1.y, add2.u2) annotation(
    Line(points = {{16, -20}, {28, -20}, {28, -10}, {44, -10}, {44, -10}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation(
    Line(points = {{-38, 6}, {-30, 6}, {-30, -22}, {-8, -22}, {-8, -20}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u1) annotation(
    Line(points = {{12, 34}, {24, 34}, {24, 2}, {44, 2}, {44, 2}}, color = {0, 0, 127}));
  connect(add1.y, gain1.u) annotation(
    Line(points = {{-38, 6}, {-24, 6}, {-24, 34}, {-12, 34}, {-12, 34}}, color = {0, 0, 127}));
  connect(add2.y, Pref) annotation(
    Line(points = {{68, -4}, {94, -4}, {94, 0}, {116, 0}, {116, 0}}, color = {0, 0, 127}));


end vdc_PI_control_with_filter;
