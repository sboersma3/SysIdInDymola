within HVDCcomponents.VSC_station_components;
model Voltage_limiter

  Real ec_pu;
  Real ec;
  Real ec_max;
  Real angle;
  parameter Real ec_max_pu = 1.1 "Maximum current (pu)";
  parameter Real Vb "Base current (A)";
  Modelica.Blocks.Interfaces.RealInput vmd_u annotation (
    Placement(visible = true, transformation(origin = {-104, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vmq_u annotation (
    Placement(visible = true, transformation(origin = {-108, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vmd_y annotation (
    Placement(visible = true, transformation(origin = {102, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vmq_y annotation (
    Placement(visible = true, transformation(origin = {104, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
import PI = Modelica.Constants.pi;
equation

ec_pu = sqrt((vmd_u/Vb)^2+(vmq_u/Vb)^2);
ec = Vb*ec_pu;
ec_max =  ec_max_pu*Vb;

if vmd_u == 0 then
  angle = PI/2;
 else
  angle = atan2(vmq_u,vmd_u);
end if;

if ec_pu < (ec_max_pu) then
  vmd_u = vmd_y;
  vmq_u = vmq_y;
  else
  vmd_y = cos(angle)*ec_max;
  vmq_y = sin(angle)*ec_max;
end if;

end Voltage_limiter;
