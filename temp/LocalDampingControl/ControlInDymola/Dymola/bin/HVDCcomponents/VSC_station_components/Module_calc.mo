within HVDCcomponents.VSC_station_components;
model Module_calc
Modelica.Blocks.Interfaces.RealInput ur annotation (
    Placement(visible = true, transformation(origin = {-120, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput ui annotation (
    Placement(visible = true, transformation(origin = {-120, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput u_module annotation (
    Placement(visible = true, transformation(origin = {117, -1}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {117, -1}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput Vb annotation (
    Placement(visible = true, transformation(origin = {-120, 64}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 64}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
u_module = sqrt(ur ^2 + ui^2)*Vb;


end Module_calc;
