within HVDCcomponents.Examples;
model TEST_VSC_without_PLL
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 100, V_b = 400, fn = 50) annotation (
    Placement(visible = true, transformation(origin = {62, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 400E3)  annotation (
    Placement(visible = true, transformation(origin = {-84, 12}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  PQ_sensor pQ_sensor1(S_b = 100) annotation (
    Placement(visible = true, transformation(origin = {56.4, 2}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-83, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control vSC_station_dq0_with_control1(Lr = 0.05, Rr = 0.5, tr = 0.003)  annotation (
    Placement(visible = true, transformation(origin = {-2, 8}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 700E6)  annotation (
    Placement(visible = true, transformation(origin = {-60, 62}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 185E6)  annotation (
    Placement(visible = true, transformation(origin = {-60, 38}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = 50E6, startTime = 5)  annotation (
    Placement(visible = true, transformation(origin = {-60, 84}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(add1.y, vSC_station_dq0_with_control1.Pref) annotation (
    Line(points = {{-14, 60}, {-8, 60}, {-8, 30}, {-22, 30}, {-22, 16}, {-14, 16}, {-14, 16}}, color = {0, 0, 127}));
  connect(const.y, add1.u2) annotation (
    Line(points = {{-54, 62}, {-48, 62}, {-48, 56}, {-28, 56}, {-28, 56}}, color = {0, 0, 127}));
  connect(step1.y, add1.u1) annotation (
    Line(points = {{-54, 84}, {-38, 84}, {-38, 64}, {-28, 64}, {-28, 64}}, color = {0, 0, 127}));
  connect(const1.y, vSC_station_dq0_with_control1.Qref) annotation (
    Line(points = {{-54, 38}, {-40, 38}, {-40, 12}, {-14, 12}, {-14, 12}}, color = {0, 0, 127}));
  connect(vSC_station_dq0_with_control1.p, pQ_sensor1.p) annotation (
    Line(points = {{10, 8}, {30, 8}, {30, 2}, {50, 2}, {50, 2}}, color = {0, 0, 255}));
  connect(constantVoltage.n, vSC_station_dq0_with_control1.pin_n) annotation (
    Line(points = {{-84, 4}, {-70, 4}, {-70, 2}, {-12, 2}, {-12, 2}}, color = {0, 0, 255}));
  connect(constantVoltage.p, vSC_station_dq0_with_control1.pin_p) annotation (
    Line(points = {{-84, 20}, {-58, 20}, {-58, 6}, {-14, 6}, {-14, 6}}, color = {0, 0, 255}));
  connect(pQ_sensor1.n, infiniteBus1.p) annotation (
    Line(points = {{62, 2}, {86, 2}, {86, -34}, {72, -34}, {72, -34}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground1.p) annotation (
    Line(points = {{-84, 4}, {-86, 4}, {-86, -8}, {-83, -8}}, color = {0, 0, 255}));
  annotation (
    Diagram(graphics = {Line(origin = {0, 8}, points = {{0, 0}})}, coordinateSystem(initialScale = 0.1)));


end TEST_VSC_without_PLL;
