within HVDCcomponents.VSC_station_components;

model Idq_to_Icomplex
Modelica.Blocks.Interfaces.RealInput id annotation(
    Placement(visible = true, transformation(origin = {-120, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput iq annotation(
    Placement(visible = true, transformation(origin = {-120, -28}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -28}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vr annotation(
    Placement(visible = true, transformation(origin = {-32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealInput vi annotation(
    Placement(visible = true, transformation(origin = {32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {32, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealOutput Ir annotation(
    Placement(visible = true, transformation(origin = {119, 31}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, 31}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput Ii annotation(
    Placement(visible = true, transformation(origin = {119, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0), iconTransformation(origin = {119, -21}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
import PI = Modelica.Constants.pi; 
Real teta;
Modelica.Blocks.Interfaces.RealInput Ib annotation(
    Placement(visible = true, transformation(origin = {-120, 76}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 76}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
if vr == 0 then
 teta = PI/2;
 else 
 teta = atan2(vi,vr);
end if;
Ir = (id * cos(teta) + iq * sin(teta))/Ib; 
Ii = (id * sin(teta) - iq * cos(teta))/Ib;


end Idq_to_Icomplex;
