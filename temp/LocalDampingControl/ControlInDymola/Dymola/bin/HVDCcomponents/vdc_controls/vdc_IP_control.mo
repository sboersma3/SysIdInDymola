within HVDCcomponents.vdc_controls;
model vdc_IP_control
  parameter Real Cdc "Capacitance of the DC grid in F";
  parameter Real tr "response time of the controller in s";
  parameter Real Ksi "damping coefficient";
  Modelica.Blocks.Interfaces.RealInput vdc annotation (
    Placement(visible = true, transformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vdcref annotation (
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Pref annotation (
    Placement(visible = true, transformation(origin = {116, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, 0}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation (
    Placement(visible = true, transformation(origin = {-36, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {-71, 17}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation (
    Placement(visible = true, transformation(origin = {-71, -25}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.SteadyState,k = Cdc * (1 / tr) ^ 2, y_start = 52900000000) annotation (
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 2 * Cdc * (1 / tr) * Ksi) annotation (
    Placement(visible = true, transformation(origin = {14, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k1 = -1, k2 = +1) annotation (
    Placement(visible = true, transformation(origin = {56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(add2.y, Pref) annotation (
    Line(points = {{68, -4}, {94, -4}, {94, 0}, {116, 0}, {116, 0}}, color = {0, 0, 127}));
  connect(add2.u2, gain1.y) annotation (
    Line(points = {{44, -10}, {30, -10}, {30, -32}, {26, -32}, {26, -32}}, color = {0, 0, 127}));
  connect(integrator1.y, add2.u1) annotation (
    Line(points = {{22, 10}, {32, 10}, {32, 2}, {44, 2}, {44, 2}}, color = {0, 0, 127}));
  connect(product2.y, gain1.u) annotation (
    Line(points = {{-64, -24}, {-8, -24}, {-8, -32}, {2, -32}, {2, -32}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation (
    Line(points = {{-24, 12}, {-2, 12}, {-2, 10}, {-2, 10}}, color = {0, 0, 127}));
  connect(product2.y, add1.u2) annotation (
    Line(points = {{-64, -24}, {-58, -24}, {-58, 6}, {-48, 6}}, color = {0, 0, 127}));
  connect(product1.y, add1.u1) annotation (
    Line(points = {{-64, 18}, {-48, 18}}, color = {0, 0, 127}));
  connect(product2.u1, vdc) annotation (
    Line(points = {{-80, -20}, {-110, -20}, {-110, -42}, {-120, -42}}, color = {0, 0, 127}));
  connect(product2.u2, vdc) annotation (
    Line(points = {{-80, -30}, {-106, -30}, {-106, -42}, {-120, -42}}, color = {0, 0, 127}));
  connect(product1.u2, vdcref) annotation (
    Line(points = {{-80, 12}, {-106, 12}, {-106, 40}, {-120, 40}}, color = {0, 0, 127}));
  connect(vdcref, product1.u1) annotation (
    Line(points = {{-120, 40}, {-88, 40}, {-88, 22}, {-80, 22}, {-80, 22}}, color = {0, 0, 127}));


end vdc_IP_control;
