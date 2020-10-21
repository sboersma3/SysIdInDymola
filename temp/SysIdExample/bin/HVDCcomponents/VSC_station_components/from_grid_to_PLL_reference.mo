within HVDCcomponents.VSC_station_components;

model from_grid_to_PLL_reference
  Modelica.Blocks.Interfaces.RealInput delta_teta annotation(
    Placement(visible = true, transformation(origin = {10, -122}, extent = {{-22, -22}, {22, 22}}, rotation = 90), iconTransformation(origin = {10, -122}, extent = {{-22, -22}, {22, 22}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput id annotation(
    Placement(visible = true, transformation(origin = {-120, 76}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 76}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iq annotation(
    Placement(visible = true, transformation(origin = {-122, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-122, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput id_pll annotation(
    Placement(visible = true, transformation(origin = {115, 75}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {115, 75}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput iq_pll annotation(
    Placement(visible = true, transformation(origin = {115, 33}, extent = {{-15, -15}, {15, 15}}, rotation = 0), iconTransformation(origin = {115, 33}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vd annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vq annotation(
    Placement(visible = true, transformation(origin = {-120, -76}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -76}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vd_pll annotation(
    Placement(visible = true, transformation(origin = {114, -20}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {114, -20}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vq_pll annotation(
    Placement(visible = true, transformation(origin = {113, -59}, extent = {{-13, -13}, {13, 13}}, rotation = 0), iconTransformation(origin = {113, -59}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
equation
  id_pll = id * cos(delta_teta) + iq * sin(delta_teta);
  iq_pll = iq * cos(delta_teta) - id * sin(delta_teta);
  
  vd_pll = vd * cos(delta_teta) + vq * sin(delta_teta);
  vq_pll = vq * cos(delta_teta) - vd * sin(delta_teta);
end from_grid_to_PLL_reference;
