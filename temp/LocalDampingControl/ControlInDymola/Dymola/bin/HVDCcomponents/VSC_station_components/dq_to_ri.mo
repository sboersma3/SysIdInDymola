within HVDCcomponents.VSC_station_components;
model dq_to_ri


Modelica.Blocks.Interfaces.RealInput xd annotation (
    Placement(visible = true, transformation(origin = {-120, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput xq annotation (
    Placement(visible = true, transformation(origin = {-120, -28}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -28}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput angle annotation (
    Placement(visible = true, transformation(origin = {-32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealOutput xr annotation (
    Placement(visible = true, transformation(origin = {119, 31}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, 31}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput xi annotation (
    Placement(visible = true, transformation(origin = {119, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
import PI = Modelica.Constants.pi;

equation

xr = (xd * cos(angle) + xq * sin(angle));
xi = (xd * sin(angle) - xq * cos(angle));




end dq_to_ri;
