within HVDCcomponents.VSC_station_components;
model Current_lim2

  parameter Real i_max = 1.1 "Maximum current (pu)";
  parameter Real Ib;
  parameter String Priority= "q" "d,q";
  Modelica.Blocks.Interfaces.RealInput id_u annotation (
    Placement(visible = true, transformation(origin = {-158, 92}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iq_u annotation (
    Placement(visible = true, transformation(origin = {-162, -82}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput id_y annotation (
    Placement(visible = true, transformation(origin = {150, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput iq_y annotation (
    Placement(visible = true, transformation(origin = {154, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter_d annotation (
    Placement(visible = true, transformation(origin = {-20, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter_q annotation (
    Placement(visible = true, transformation(origin = {-18, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sqrt sqrt_q annotation (
    Placement(visible = true, transformation(origin = {87, -35}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant I_max(k = i_max * Ib * i_max * Ib)  annotation (
    Placement(visible = true, transformation(origin = {22, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(visible = true, transformation(origin = {50, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation (
    Placement(visible = true, transformation(origin = {50, -62}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Math.Gain neg_d(k = -1)  annotation (
    Placement(visible = true, transformation(origin = {-59, 73}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain neg_q(k = -1) annotation (
    Placement(visible = true, transformation(origin = {-59, -109}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Imax(k = i_max * Ib) annotation (
    Placement(visible = true, transformation(origin = {-136, 8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Sqrt sqrt_d annotation (
    Placement(visible = true, transformation(origin = {91, 49}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = i_max * Ib * i_max * Ib) annotation (
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(visible = true, transformation(origin = {58, 76}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation (
    Placement(visible = true, transformation(origin = {58,50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
equation
  if Priority == "q" then
    Imax.y = variableLimiter_q.limit1;
    Imax.y = neg_q.u;
    sqrt_q.y = variableLimiter_d.limit1;
    sqrt_q.y = neg_d.u;
  else
    Imax.y = variableLimiter_d.limit1;
    Imax.y = neg_d.u;
    sqrt_d.y = variableLimiter_q.limit1;
    sqrt_d.y = neg_q.u;
  end if;
  connect(iq_u, variableLimiter_q.u) annotation (
    Line(points = {{-162, -82}, {-32, -82}, {-32, -83}, {-30, -83}, {-30, -84}}, color = {0, 0, 127}));
  connect(id_u, variableLimiter_d.u) annotation (
    Line(points = {{-158, 92}, {-41, 92}, {-41, 94}, {-32, 94}}, color = {0, 0, 127}));
  connect(variableLimiter_d.y, id_y) annotation (
    Line(points = {{-9, 94}, {150, 94}}, color = {0, 0, 127}));
  connect(variableLimiter_q.y, iq_y) annotation (
    Line(points = {{-7, -84}, {148, -84}, {148, -82}, {154, -82}}, color = {0, 0, 127}));
  connect(I_max.y, feedback.u1) annotation (
    Line(points = {{33, -38}, {42, -38}}, color = {0, 0, 127}));
  connect(feedback.u2, product.y) annotation (
    Line(points = {{50, -46}, {50, -53}}, color = {0, 0, 127}));
  connect(product.u1, variableLimiter_q.y) annotation (
    Line(points = {{45, -72}, {44, -72}, {44, -84}, {-7, -84}}, color = {0, 0, 127}));
  connect(product.u2, variableLimiter_q.y) annotation (
    Line(points = {{55, -72}, {56, -72}, {56, -84}, {-7, -84}}, color = {0, 0, 127}));
  connect(feedback.y, sqrt_q.u) annotation (
    Line(points = {{59, -38}, {72, -38}, {72, -35}, {79, -35}}, color = {0, 0, 127}));
  connect(neg_d.y, variableLimiter_d.limit2) annotation (
    Line(points = {{-51, 73}, {-46, 73}, {-46, 86}, {-32, 86}}, color = {0, 0, 127}));
  connect(neg_q.y, variableLimiter_q.limit2) annotation (
    Line(points = {{-51, -109}, {-42, -109}, {-42, -92}, {-30, -92}}, color = {0, 0, 127}));
  connect(constant1.y, feedback1.u1) annotation (
    Line(points = {{41, 50}, {50, 50}}, color = {0, 0, 127}));
  connect(feedback1.u2, product1.y) annotation (
    Line(points = {{58, 58}, {58, 67}}, color = {0, 0, 127}));
  connect(feedback1.y, sqrt_d.u) annotation (
    Line(points = {{67, 50}, {83, 50}, {83, 49}}, color = {0, 0, 127}));
  connect(product1.u1, variableLimiter_d.y) annotation (
    Line(points = {{54, 86}, {52, 86}, {52, 94}, {-8, 94}, {-8, 94}}, color = {0, 0, 127}));
  connect(product1.u2, variableLimiter_d.y) annotation (
    Line(points = {{62, 86}, {62, 86}, {62, 94}, {-8, 94}, {-8, 94}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})));
end Current_lim2;
