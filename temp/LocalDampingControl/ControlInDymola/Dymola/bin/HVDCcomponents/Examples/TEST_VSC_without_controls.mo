within HVDCcomponents.Examples;
model TEST_VSC_without_controls
 OpenIPSL.Electrical.Buses.Bus bus1(S_b = 1000, displayPF = true, fn = 50) annotation (
    Placement(visible = true, transformation(origin = {70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(S_b = 1000, V_b = 320, fn = 50) annotation (
    Placement(visible = true, transformation(origin = {62, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage1(V = 640000) annotation (
    Placement(visible = true, transformation(origin = {-80, 4}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-90, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor1 annotation (
    Placement(visible = true, transformation(origin = {-48, 38}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue Pdc annotation (
    Placement(visible = true, transformation(origin = {-18, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = 0.01, offset = 0.625, startTime = 2) annotation (
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step2(height = 0.01, startTime = 5) annotation (
    Placement(visible = true, transformation(origin = {-40, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 400E3) annotation (
    Placement(visible = true, transformation(origin = {44, 54}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 2500) annotation (
    Placement(visible = true, transformation(origin = {46, 34}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation (
    Placement(visible = true, transformation(origin = {-42, 78}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 1E6) annotation (
    Placement(visible = true, transformation(origin = {-80, 74}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0 vSC_station_dq01(Lr = 0.05, Rr = 0.5, wg = 314) annotation (
    Placement(visible = true, transformation(origin = {4, 4}, extent = {{-20, -13}, {30, 12}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 1000) annotation (
    Placement(visible = true, transformation(origin = {26.4, 2}, extent = {{-6, -5}, {6, 5}}, rotation = 0)));
equation
  connect(pQ_sensor1.n, bus1.p) annotation (
    Line(points = {{32, 2}, {70, 2}, {70, 2}, {70, 2}}, color = {0, 0, 255}));
  connect(pQ_sensor1.p, vSC_station_dq01.p) annotation (
    Line(points = {{20, 2}, {10, 2}, {10, 4}, {8, 4}, {8, 4}}, color = {0, 0, 255}));
  connect(powerSensor1.nc, vSC_station_dq01.pin_p) annotation (
    Line(points = {{-38, 38}, {-26, 38}, {-26, 9}, {-10, 9}}, color = {0, 0, 255}));
  connect(constantVoltage1.n, vSC_station_dq01.pin_n) annotation (
    Line(points = {{-80, -6}, {-46, -6}, {-46, 6}, {-10, 6}, {-10, 5}}, color = {0, 0, 255}));
  connect(step1.y, vSC_station_dq01.md) annotation (
    Line(points = {{-48, -30}, {-38, -30}, {-38, 14}, {-11, 14}, {-11, 13}}, color = {0, 0, 127}));
  connect(step2.y, vSC_station_dq01.mq) annotation (
    Line(points = {{-28, -62}, {-22, -62}, {-22, 2}, {-11, 2}, {-11, 1}}, color = {0, 0, 127}));
  connect(const.y, vSC_station_dq01.Vb) annotation (
    Line(points = {{37, 54}, {0, 54}, {0, 16}}, color = {0, 0, 127}));
  connect(const1.y, vSC_station_dq01.Ib) annotation (
    Line(points = {{40, 34}, {4, 34}, {4, 16}}, color = {0, 0, 127}));
  connect(bus1.p, infiniteBus1.p) annotation (
    Line(points = {{70, 2}, {86, 2}, {86, -34}, {72, -34}}, color = {0, 0, 255}));
  connect(constantVoltage1.p, powerSensor1.pc) annotation (
    Line(points = {{-80, 14}, {-70, 14}, {-70, 38}, {-58, 38}}, color = {0, 0, 255}));
  connect(powerSensor1.pv, constantVoltage1.p) annotation (
    Line(points = {{-48, 28}, {-80, 28}, {-80, 14}}, color = {0, 0, 255}));
  connect(powerSensor1.nv, constantVoltage1.n) annotation (
    Line(points = {{-48, 48}, {-48, 54}, {-108, 54}, {-108, -6}, {-80, -6}}, color = {0, 0, 255}));
  connect(powerSensor1.power, division1.u1) annotation (
    Line(points = {{-58, 49}, {-58, 82}, {-49, 82}}, color = {0, 0, 127}));
  connect(division1.y, Pdc.numberPort) annotation (
    Line(points = {{-35, 78}, {-29.5, 78}}, color = {0, 0, 127}));
  connect(const2.y, division1.u2) annotation (
    Line(points = {{-73, 74}, {-49, 74}}, color = {0, 0, 127}));
  connect(constantVoltage1.n, ground1.p) annotation (
    Line(points = {{-80, -6}, {-82, -6}, {-82, -26}, {-90, -26}, {-90, -26}}, color = {0, 0, 255}));
  annotation (
    Diagram(graphics = {Line(origin = {0, 8}, points = {{0, 0}})}));
end TEST_VSC_without_controls;
