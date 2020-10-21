within HVDCcomponents.VSC_station_components;
model ri_to_dq

Modelica.Blocks.Interfaces.RealInput xr annotation (
    Placement(visible = true, transformation(origin = {-120, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput xi annotation (
    Placement(visible = true, transformation(origin = {-120, -28}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -28}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput angle annotation (
    Placement(visible = true, transformation(origin = {-32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealOutput xd annotation (
    Placement(visible = true, transformation(origin = {119, 31}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, 31}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput xq annotation (
    Placement(visible = true, transformation(origin = {119, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
import PI = Modelica.Constants.pi;

equation

xd = (xr * cos(angle) + xi * sin(angle));
xq = (xr * sin(angle) - xi * cos(angle));


end ri_to_dq;
