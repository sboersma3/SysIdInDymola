within HVDCcomponents.VSC_station_components;
model PLL2

parameter Real wcpll "gain of the filter integrator";
parameter Real kipll "gain of the integrator of PI controller";
parameter Real kppll "gain of PI controller";
parameter Real w_base;
parameter Real teta_bus "connection bus angle (rad)";
  HVDCcomponents.VSC_station_components.low_pass_filter low_pass_filter1(wcpll = wcpll)  annotation (
    Placement(visible = true, transformation(origin = {-139, 9}, extent = {{-27, -27}, {27, 27}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.PI_controller_PLL pI_controller_PLL1(kipll = kipll, kppll = kppll)  annotation (
    Placement(visible = true, transformation(origin = {22.4259, 15.787}, extent = {{-52.4259, -26.213}, {26.213, 26.213}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(k = w_base, y(fixed = true, start = teta_bus), y_start = teta_bus)  annotation (
    Placement(visible = true, transformation(origin = {106, 30}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vr annotation (
    Placement(visible = true, transformation(origin = {132, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-58, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput w_pll annotation (
    Placement(visible = true, transformation(origin = {219, 53}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, 61}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput teta_pll annotation (
    Placement(visible = true, transformation(origin = {215, 13}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {119, 1}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation (
    Placement(visible = true, transformation(origin = {83, 75}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation (
    Placement(visible = true, transformation(origin = {-4, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation (
    Placement(visible = true, transformation(origin = {148, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = w_base) annotation (
    Placement(visible = true, transformation(origin = {58, 128}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1)  annotation (
    Placement(visible = true, transformation(origin = {-118, -74}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vi annotation (
    Placement(visible = true, transformation(origin = {182, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Math.Add add2(k1 = 0, k2 = +1) annotation (
    Placement(visible = true, transformation(origin = {-55, -73}, extent = {{15, -15}, {-15, 15}}, rotation = 0)));
  HVDCcomponents.VSC_station_components.ri_to_dq ri_to_dq2 annotation (
    Placement(visible = true, transformation(origin = {61, -69}, extent = {{17, -17}, {-17, 17}}, rotation = 0)));
equation
  connect(pI_controller_PLL1.w_pll, integrator1.u) annotation (
    Line(points = {{47, 29}, {68, 29}, {68, 30}, {89, 30}}, color = {0, 0, 127}));
  connect(pI_controller_PLL1.w_pll, add.u2) annotation (
    Line(points = {{46, 30}, {54, 30}, {54, 66}, {65, 66}}, color = {0, 0, 127}));
  connect(const.y, add.u1) annotation (
    Line(points = {{7, 100}, {74, 100}, {74, 84}, {65, 84}}, color = {0, 0, 127}));
  connect(add.y, product.u2) annotation (
    Line(points = {{99.5, 75}, {112, 75}, {112, 98}, {136, 98}}, color = {0, 0, 127}));
  connect(const1.y, product.u1) annotation (
    Line(points = {{70, 128}, {116, 128}, {116, 110}, {136, 110}, {136, 110}}, color = {0, 0, 127}));
  connect(product.y, w_pll) annotation (
    Line(points = {{160, 104}, {182, 104}, {182, 52}, {220, 52}, {220, 54}}, color = {0, 0, 127}));
  connect(gain.y, low_pass_filter1.Vgq_pll) annotation (
    Line(points = {{-130, -74}, {-188, -74}, {-188, 8}, {-170, 8}, {-170, 10}}, color = {0, 0, 127}));
  connect(integrator1.y, teta_pll) annotation (
    Line(points = {{121, 30}, {162, 30}, {162, 14}, {216, 14}}, color = {0, 0, 127}));
  connect(gain.u, add2.y) annotation (
    Line(points = {{-106, -74}, {-72, -74}, {-72, -72}, {-72, -72}}, color = {0, 0, 127}));
  connect(ri_to_dq2.xr, Vr) annotation (
    Line(points = {{81, -64}, {134, -64}, {134, -120}, {132, -120}}, color = {0, 0, 127}));
  connect(ri_to_dq2.xi, Vi) annotation (
    Line(points = {{81, -74}, {184, -74}, {184, -120}, {182, -120}}, color = {0, 0, 127}));
  connect(ri_to_dq2.xq, add2.u2) annotation (
    Line(points = {{41, -73}, {-22, -73}, {-22, -82}, {-36, -82}}, color = {0, 0, 127}));
  connect(add2.u1, ri_to_dq2.xd) annotation (
    Line(points = {{-36, -64}, {41, -64}}, color = {0, 0, 127}));
  connect(ri_to_dq2.angle, integrator1.y) annotation (
    Line(points = {{66, -49}, {66, -32}, {152, -32}, {152, 30}, {121, 30}}, color = {0, 0, 127}));
  connect(low_pass_filter1.Vgq_pll_filtre, pI_controller_PLL1.delta_Vgq) annotation (
    Line(points = {{-108, 8}, {-68, 8}, {-68, 30}, {-20, 30}, {-20, 32}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");


end PLL2;
