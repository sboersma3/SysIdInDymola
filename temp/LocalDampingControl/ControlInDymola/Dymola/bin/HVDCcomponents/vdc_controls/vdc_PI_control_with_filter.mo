within HVDCcomponents.vdc_controls;
model vdc_PI_control_with_filter
  parameter Real Cdc "Capacitance of the DC grid in F";
  parameter Real Ksi "damping coefficient";
  parameter Real tr "response time of the controller in s";
  parameter Real vdc0 "reference Dc voltage";
  Modelica.Blocks.Interfaces.RealInput vdc annotation (
    Placement(visible = true, transformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vdcref annotation (
    Placement(visible = true, transformation(origin = {-252, 64}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pref annotation (
    Placement(visible = true, transformation(origin = {116, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation (
    Placement(visible = true, transformation(origin = {-50, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 2 * Ksi * (1 / tr) * Cdc) annotation (
    Placement(visible = true, transformation(origin = {-6, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1, k2 = -1) annotation (
    Placement(visible = true, transformation(origin = {56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = (1 / tr) ^ 2 * Cdc, y(start = 0), y_start = 0) annotation (
    Placement(visible = true, transformation(origin = {1, -21}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-165, 33}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {-80, -36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator(k = 1, y(start = 0), y_start = vdc0 * vdc0) annotation (
    Placement(visible = true, transformation(origin = {-94, 34}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k =  1 / (2 * Ksi * tr)) annotation (
    Placement(visible = true, transformation(origin = {-115, 33}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(visible = true, transformation(origin = {-144, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(vdcref, product1.u1) annotation (
    Line(points = {{-252, 64}, {-178, 64}, {-178, 37}, {-173, 37}}, color = {0, 0, 127}));
  connect(product1.u2, vdcref) annotation (
    Line(points = {{-173, 29}, {-240, 29}, {-240, 64}, {-252, 64}}, color = {0, 0, 127}));
  connect(product2.y, add1.u2) annotation (
    Line(points = {{-74, -36}, {-68, -36}, {-68, 0}, {-62, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(product2.u1, vdc) annotation (
    Line(points = {{-88, -32}, {-106, -32}, {-106, -42}, {-120, -42}}, color = {0, 0, 127}));
  connect(vdc, product2.u2) annotation (
    Line(points = {{-120, -42}, {-88, -42}, {-88, -40}, {-88, -40}}, color = {0, 0, 127}));
  connect(integrator1.y, add2.u2) annotation (
    Line(points = {{15, -21}, {28, -21}, {28, -10}, {44, -10}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation (
    Line(points = {{-38, 6}, {-30, 6}, {-30, -22}, {-15, -22}, {-15, -21}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u1) annotation (
    Line(points = {{5, 40}, {28, 40}, {28, 2}, {44, 2}}, color = {0, 0, 127}));
  connect(add1.y, gain1.u) annotation (
    Line(points = {{-38, 6}, {-30, 6}, {-30, 40}, {-18, 40}}, color = {0, 0, 127}));
  connect(add2.y, Pref) annotation (
    Line(points = {{68, -4}, {94, -4}, {94, 0}, {116, 0}, {116, 0}}, color = {0, 0, 127}));
  connect(feedback.y, gain.u) annotation (
    Line(points = {{-135, 34}, {-129, 34}, {-129, 33}, {-123, 33}}, color = {0, 0, 127}));
  connect(integrator.y, feedback.u2) annotation (
    Line(points = {{-87, 34}, {-82, 34}, {-82, 14}, {-144, 14}, {-144, 26}}, color = {0, 0, 127}));
  connect(gain.y, integrator.u) annotation (
    Line(points = {{-107, 33}, {-90.5, 33}, {-90.5, 34}, {-101, 34}}, color = {0, 0, 127}));
  connect(feedback.u1, product1.y) annotation (
    Line(points = {{-152, 34}, {-158, 34}, {-158, 34}, {-158, 34}}, color = {0, 0, 127}));
  connect(integrator.y, add1.u1) annotation (
    Line(points = {{-88, 34}, {-74, 34}, {-74, 12}, {-62, 12}, {-62, 12}}, color = {0, 0, 127}));
end vdc_PI_control_with_filter;
