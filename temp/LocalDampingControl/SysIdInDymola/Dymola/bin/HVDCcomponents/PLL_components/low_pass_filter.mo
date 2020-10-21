within HVDCcomponents.PLL_components;

model low_pass_filter
  parameter Real wcpll "gain of the integrator";
  Modelica.Blocks.Interfaces.RealInput Vgq_pll annotation(
    Placement(visible = true, transformation(origin = {-116, 8.88178e-16}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-116, 8.88178e-16}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Vgq_pll_filtre annotation(
    Placement(visible = true, transformation(origin = {114, -4}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {114, -4}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-62, -6}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = wcpll)  annotation(
    Placement(visible = true, transformation(origin = {24, -4}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
equation
  connect(integrator1.y, Vgq_pll_filtre) annotation(
    Line(points = {{38, -4}, {114, -4}}, color = {0, 0, 127}));
  connect(Vgq_pll, add1.u1) annotation(
    Line(points = {{-116, 0}, {-94.5, 0}, {-94.5, 1}, {-76, 1}}, color = {0, 0, 127}));
  connect(integrator1.y, add1.u2) annotation(
    Line(points = {{38, -4}, {64, -4}, {64, -72}, {-90, -72}, {-90, -12}, {-76, -12}, {-76, -14}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation(
    Line(points = {{-48, -6}, {8, -6}, {8, -4}, {10, -4}}, color = {0, 0, 127}));
end low_pass_filter;
