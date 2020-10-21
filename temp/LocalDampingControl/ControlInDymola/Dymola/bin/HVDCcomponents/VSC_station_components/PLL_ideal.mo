within HVDCcomponents.VSC_station_components;
model PLL_ideal

  Modelica.Blocks.Interfaces.RealInput Vr annotation (
    Placement(visible = true, transformation(origin = {132, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-58, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput teta_pll annotation (
    Placement(visible = true, transformation(origin = {215, 13}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {119, 1}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Vi annotation (
    Placement(visible = true, transformation(origin = {182, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  HVDCcomponents.VSC_station_components.Arctan_bis arctan_bis annotation (
    Placement(visible = true, transformation(origin = {99, -15}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
equation
  connect(arctan_bis.y, teta_pll) annotation (
    Line(points = {{120, -14}, {162, -14}, {162, 12}, {216, 12}, {216, 14}}, color = {0, 0, 127}));
  connect(Vi, arctan_bis.u1) annotation (
    Line(points = {{182, -120}, {180, -120}, {180, -44}, {-6, -44}, {-6, -6}, {76, -6}, {76, -4}}, color = {0, 0, 127}));
  connect(arctan_bis.u2, Vr) annotation (
    Line(points = {{76, -20}, {24, -20}, {24, -88}, {132, -88}, {132, -120}, {132, -120}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");



end PLL_ideal;
