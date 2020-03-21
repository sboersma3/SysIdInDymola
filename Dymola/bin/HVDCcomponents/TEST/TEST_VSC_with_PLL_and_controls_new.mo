within HVDCcomponents.TEST;

model TEST_VSC_with_PLL_and_controls_new
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 100, V_b = 400, fn = 50) annotation(
    Placement(visible = true, transformation(origin = {62, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 185E6, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-59, 37}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 400E3)  annotation(
    Placement(visible = true, transformation(origin = {-84, 12}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  Modelica.Blocks.Sources.Step step(height = 700E6, startTime = 0) annotation(
    Placement(visible = true, transformation(origin = {-57, 63}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PQ_sensor pQ_sensor1(S_b = 100) annotation(
    Placement(visible = true, transformation(origin = {56.4, 2}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-83, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis1(Lr = 0.05, P_ref = 700E6, Q_ref = -185E6, Rr = 0.5, Vgd = 400E3, tr = 0.003)  annotation(
    Placement(visible = true, transformation(origin = {-4, 6}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
equation
  connect(pQ_sensor1.n, infiniteBus1.p) annotation(
    Line(points = {{62, 2}, {86, 2}, {86, -34}, {72, -34}, {72, -34}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground1.p) annotation(
    Line(points = {{-84, 4}, {-86, 4}, {-86, -8}, {-83, -8}}, color = {0, 0, 255}));
  connect(step.y, vSC_station_dq0_with_control_PLL_bis1.Pref) annotation(
    Line(points = {{-52, 64}, {-24, 64}, {-24, 14}, {-16, 14}, {-16, 14}}, color = {0, 0, 127}));
  connect(step2.y, vSC_station_dq0_with_control_PLL_bis1.Qref) annotation(
    Line(points = {{-53.5, 37}, {-26, 37}, {-26, 10}, {-16, 10}}, color = {0, 0, 127}));
  connect(constantVoltage.p, vSC_station_dq0_with_control_PLL_bis1.pin_p) annotation(
    Line(points = {{-84, 20}, {-42, 20}, {-42, 4}, {-16, 4}, {-16, 4}}, color = {0, 0, 255}));
  connect(constantVoltage.n, vSC_station_dq0_with_control_PLL_bis1.pin_n) annotation(
    Line(points = {{-84, 4}, {-48, 4}, {-48, 0}, {-14, 0}, {-14, 0}}, color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control_PLL_bis1.p, pQ_sensor1.p) annotation(
    Line(points = {{8, 6}, {38, 6}, {38, 2}, {50, 2}, {50, 2}}, color = {0, 0, 255}));
protected
  annotation(
    Diagram(graphics = {Line(origin = {0, 8}, points = {{0, 0}})}, coordinateSystem(initialScale = 0.1)));


end TEST_VSC_with_PLL_and_controls_new;
