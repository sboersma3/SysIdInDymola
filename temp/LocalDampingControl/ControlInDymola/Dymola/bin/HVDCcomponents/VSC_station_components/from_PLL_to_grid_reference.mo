within HVDCcomponents.VSC_station_components;
model from_PLL_to_grid_reference
  Modelica.Blocks.Interfaces.RealInput vd_pll annotation (
    Placement(visible = true, transformation(origin = {-120, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput delta_teta annotation (
    Placement(visible = true, transformation(origin = {8, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {8, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput vq_pll annotation (
    Placement(visible = true, transformation(origin = {-120, -14}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vd annotation (
    Placement(visible = true, transformation(origin = {114, 36}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {114, 36}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vq annotation (
    Placement(visible = true, transformation(origin = {114, -14}, extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {114, -14}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
equation
  vd = vd_pll * cos(delta_teta) - vq_pll * sin(delta_teta);
  vq = vd_pll * sin(delta_teta) + vq_pll * cos(delta_teta);
end from_PLL_to_grid_reference;
