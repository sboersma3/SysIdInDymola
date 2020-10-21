within HVDCcomponents.VSC_station_components;
model current_ref_limiter


  Real i_s_pu;
  Real i_s;
  Real i_max;
  parameter Real i_max_pu = 1.1 "Maximum current (pu)";
  parameter Real Ib "Base current (A)";
  parameter String Priority = "d" "d, q";
  Modelica.Blocks.Interfaces.RealInput id_u annotation (
    Placement(visible = true, transformation(origin = {-104, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iq_u annotation (
    Placement(visible = true, transformation(origin = {-108, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput id_y annotation (
    Placement(visible = true, transformation(origin = {102, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput iq_y annotation (
    Placement(visible = true, transformation(origin = {104, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

i_s_pu = sqrt((id_u/Ib)^2+(iq_u/Ib)^2);
i_s = Ib*i_s_pu;
i_max =  i_max_pu*Ib;

if Priority == "d" then
  if i_s_pu < (i_max_pu) then
  id_u = id_y;
  iq_u = iq_y;
  else
    if (i_max^2)-(id_u^2) <= 0 then
    id_y = (id_u);
    iq_y = 0;
    else
    id_y = (id_u);
    iq_y = sign(iq_u) * sqrt((i_max^2)-(id_u^2)+5); //+5 to avoid zero crossing problems
    end if;
  end if;
else
  if i_s_pu < (i_max_pu) then
  id_u = id_y;
  iq_u = iq_y;
  else
    if (i_max^2)-(id_u^2) <= 0 then
    iq_y = iq_u;
    id_y = 0;
    else
    iq_y = (iq_u);
    id_y = sign(id_u) * sqrt((i_max^2)-(iq_u^2)+5); //+5 to avoid zero crossing problems
    end if;
  end if;
end if;

end current_ref_limiter;
