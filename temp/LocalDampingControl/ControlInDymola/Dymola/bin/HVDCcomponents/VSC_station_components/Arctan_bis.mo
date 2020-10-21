within HVDCcomponents.VSC_station_components;
model Arctan_bis
  Modelica.Blocks.Interfaces.RealInput u1 annotation (
    Placement(visible = true, transformation(origin = {-120, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (
    Placement(visible = true, transformation(origin = {-120, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(visible = true, transformation(origin = {110, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
import PI = Modelica.Constants.pi;
equation
 if u2 == 0 then
  y = PI/2;
 else
  y = atan2(u1,u2);
 end if;

end Arctan_bis;
