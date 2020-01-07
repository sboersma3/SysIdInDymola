within HVDCcomponents.PLL_components;

model PI_controller_PLL
  parameter Real kppll;
  parameter Real kipll "gain of the integrator";
  Modelica.Blocks.Interfaces.RealInput delta_Vgq annotation(
    Placement(visible = true, transformation(origin = {-226, 60}, extent = {{-26, -26}, {26, 26}}, rotation = 0), iconTransformation(origin = {-128, 60}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = kppll)  annotation(
    Placement(visible = true, transformation(origin = {-97, 61}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-14, 52}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = kipll)  annotation(
    Placement(visible = true, transformation(origin = {-97, -19}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput w_pll annotation(
    Placement(visible = true, transformation(origin = {123, 51}, extent = {{-23, -23}, {23, 23}}, rotation = 0), iconTransformation(origin = {123, 51}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
equation
  connect(add1.y, w_pll) annotation(
    Line(points = {{4, 52}, {108, 52}, {108, 52}, {124, 52}}, color = {0, 0, 127}));
  connect(integrator1.y, add1.u2) annotation(
    Line(points = {{-80, -18}, {-60, -18}, {-60, 42}, {-34, 42}, {-34, 42}}, color = {0, 0, 127}));
  connect(integrator1.u, delta_Vgq) annotation(
    Line(points = {{-116, -18}, {-164, -18}, {-164, 56}, {-226, 56}, {-226, 60}}, color = {0, 0, 127}));
  connect(add1.u1, gain1.y) annotation(
    Line(points = {{-34, 62}, {-80, 62}, {-80, 62}, {-80, 62}}, color = {0, 0, 127}));
  connect(gain1.u, delta_Vgq) annotation(
    Line(points = {{-116, 62}, {-212, 62}, {-212, 60}, {-226, 60}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {100, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {100, 100}})),
    __OpenModelica_commandLineOptions = "");end PI_controller_PLL;
