within HVDCcomponents;

model DCgrid
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 7.8125e-04, v(start = 1)) annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-2, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vdc annotation(
    Placement(visible = true, transformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.Pin idc annotation(
    Placement(visible = true, transformation(origin = {-106, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-106, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(idc, capacitor1.p) annotation(
    Line(points = {{-106, 10}, {-2, 10}}, color = {0, 0, 255}));
  connect(capacitor1.p.v, vdc) annotation(
    Line(points = {{-2, 10}, {104, 10}, {104, 10}, {110, 10}}, color = {0, 0, 255}));
  connect(capacitor1.n, ground1.p) annotation(
    Line(points = {{-2, -10}, {-2, -10}, {-2, -30}, {-2, -30}}, color = {0, 0, 255}));


end DCgrid;
