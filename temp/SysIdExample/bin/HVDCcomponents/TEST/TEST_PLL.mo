within HVDCcomponents.TEST;

model TEST_PLL
  HVDCcomponents.VSC_station_components.PLL pll1(kipll = -2.53, kppll = -0.05, w_base = 314, wcpll = 200)  annotation(
    Placement(visible = true, transformation(origin = {-2, -3}, extent = {{-30, -15}, {30, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant V_ref(k = 0)  annotation(
    Placement(visible = true, transformation(origin = {-93, 19}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 400) annotation(
    Placement(visible = true, transformation(origin = {-71, -53}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1 annotation(
    Placement(visible = true, transformation(origin = {93, 2}, extent = {{-13, -12}, {13, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 10) annotation(
    Placement(visible = true, transformation(origin = {5, -79}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
equation
  connect(const1.y, pll1.teta_g) annotation(
    Line(points = {{20, -78}, {36, -78}, {36, -38}, {4, -38}, {4, -22}, {4, -22}}, color = {0, 0, 127}));
  connect(realValue1.numberPort, pll1.w_pll) annotation(
    Line(points = {{78, 2}, {48, 2}, {48, 8}, {16, 8}, {16, 6}}, color = {0, 0, 127}));
  connect(const.y, pll1.V_g) annotation(
    Line(points = {{-56, -52}, {-10, -52}, {-10, -22}, {-10, -22}}, color = {0, 0, 127}));
  connect(pll1.Vgq_ref, V_ref.y) annotation(
    Line(points = {{-20, 6}, {-48, 6}, {-48, 19}, {-79, 19}}, color = {0, 0, 127}));
end TEST_PLL;
