within HVDCcomponents.VSC_station_components;
model Outer_control_VSC_open_loop
Modelica.Blocks.Interfaces.RealInput Pref annotation (
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput Qref annotation (
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vgd annotation (
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealOutput igdref annotation (
    Placement(visible = true, transformation(origin = {116, 40}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, 40}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput igqref annotation (
    Placement(visible = true, transformation(origin = {116, -42}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, -42}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
equation
igdref = Pref / vgd;
igqref = Qref / vgd;


end Outer_control_VSC_open_loop;
