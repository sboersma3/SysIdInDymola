within HVDCcomponents.VSC_station_components;
model current_limitation
  Real i_s;
  parameter Real i_max = 1.1 "Maximum current (pu)";
  parameter Real Ib;
  Modelica.Blocks.Interfaces.RealInput id_u annotation (
    Placement(visible = true, transformation(origin = {-104, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iq_u annotation (
    Placement(visible = true, transformation(origin = {-108, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput id_y annotation (
    Placement(visible = true, transformation(origin = {102, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput iq_y annotation (
    Placement(visible = true, transformation(origin = {104, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

i_s = sqrt((id_u/Ib)^2+(iq_u/Ib)^2);

if i_s < (i_max) then
id_u = id_y;
iq_u = iq_y;
else
  if (id_u^2) > (i_max^2) then
  id_y = sign(id_u)*i_max;
  iq_y = 0;
  else
  id_y = (id_u);
  iq_y = sign(iq_u) * sqrt( i_max^2-id_y^2);
  end if;
end if;

end current_limitation;
