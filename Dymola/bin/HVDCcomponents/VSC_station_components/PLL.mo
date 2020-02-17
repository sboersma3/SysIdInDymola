within HVDCcomponents.VSC_station_components;

model PLL
parameter Real wcpll "gain of the filter integrator";
parameter Real kipll "gain of the integrator of PI controller";
parameter Real kppll "gain of PI controller";
parameter Real w_base;
  HVDCcomponents.PLL_components.low_pass_filter low_pass_filter1(wcpll = wcpll)  annotation(
    Placement(visible = true, transformation(origin = {-139, 9}, extent = {{-27, -27}, {27, 27}}, rotation = 0)));
  HVDCcomponents.PLL_components.PI_controller_PLL pI_controller_PLL1(kipll = kipll, kppll = kppll)  annotation(
    Placement(visible = true, transformation(origin = {54.4259, 15.787}, extent = {{-52.4259, -26.213}, {26.213, 26.213}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-53, 55}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vgq_ref annotation(
    Placement(visible = true, transformation(origin = {-220, 64}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-118, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = w_base)  annotation(
    Placement(visible = true, transformation(origin = {140, 20}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2(k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {102, -70}, extent = {{16, -16}, {-16, 16}}, rotation = 0)));
  Modelica.Blocks.Math.Sin sin1 annotation(
    Placement(visible = true, transformation(origin = {34, -64}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-48, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput teta_g annotation(
    Placement(visible = true, transformation(origin = {146, -122}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {42, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput V_g annotation(
    Placement(visible = true, transformation(origin = {-20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-58, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput w_pll annotation(
    Placement(visible = true, transformation(origin = {219, 53}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, 61}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput teta_pll annotation(
    Placement(visible = true, transformation(origin = {215, 13}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {119, 1}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
equation
  connect(add2.y, sin1.u) annotation(
    Line(points = {{84, -70}, {64, -70}, {64, -64}, {46, -64}}, color = {0, 0, 127}));
  connect(sin1.y, product1.u1) annotation(
    Line(points = {{23, -64}, {-8, -64}, {-8, -70}, {-36, -70}}, color = {0, 0, 127}));
  connect(pI_controller_PLL1.w_pll, w_pll) annotation(
    Line(points = {{78, 30}, {82, 30}, {82, 52}, {220, 52}, {220, 54}}, color = {0, 0, 127}));
  connect(product1.u2, V_g) annotation(
    Line(points = {{-36, -82}, {-20, -82}, {-20, -120}, {-20, -120}}, color = {0, 0, 127}));
  connect(add2.u2, teta_g) annotation(
    Line(points = {{122, -80}, {148, -80}, {148, -122}, {146, -122}}, color = {0, 0, 127}));
  connect(product1.y, low_pass_filter1.Vgq_pll) annotation(
    Line(points = {{-60, -76}, {-190, -76}, {-190, 8}, {-170, 8}, {-170, 10}}, color = {0, 0, 127}));
  connect(integrator1.y, add2.u1) annotation(
    Line(points = {{156, 20}, {170, 20}, {170, -60}, {122, -60}, {122, -60}}, color = {0, 0, 127}));
  connect(pI_controller_PLL1.w_pll, integrator1.u) annotation(
    Line(points = {{78, 30}, {108, 30}, {108, 20}, {124, 20}, {124, 20}}, color = {0, 0, 127}));
  connect(add1.y, pI_controller_PLL1.delta_Vgq) annotation(
    Line(points = {{-36, 56}, {-18, 56}, {-18, 32}, {12, 32}, {12, 32}}, color = {0, 0, 127}));
  connect(add1.u1, Vgq_ref) annotation(
    Line(points = {{-72, 64}, {-220, 64}}, color = {0, 0, 127}));
  connect(low_pass_filter1.Vgq_pll_filtre, add1.u2) annotation(
    Line(points = {{-108, 8}, {-88, 8}, {-88, 46}, {-72, 46}, {-72, 46}}, color = {0, 0, 127}));
  connect(teta_pll, integrator1.y) annotation(
    Line(points = {{216, 14}, {184, 14}, {184, 20}, {156, 20}, {156, 20}}, color = {0, 0, 127}));

annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");
end PLL;
