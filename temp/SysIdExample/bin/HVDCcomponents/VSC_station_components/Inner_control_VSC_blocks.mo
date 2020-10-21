within HVDCcomponents.VSC_station_components;

model Inner_control_VSC_blocks
parameter Real wg;
parameter Real Lr;
parameter Real Rr;
parameter Real tr;
Modelica.Blocks.Interfaces.RealInput igd annotation(
    Placement(visible = true, transformation(origin = {-117, 19}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-117, 61}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput igq annotation(
    Placement(visible = true, transformation(origin = {-117, -153}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-117, 19}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vgd annotation(
    Placement(visible = true, transformation(origin = {107, 119}, extent = {{-17, -17}, {17, 17}}, rotation = -90), iconTransformation(origin = {-117, -35}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput vgq annotation(
    Placement(visible = true, transformation(origin = {109, -217}, extent = {{-17, -17}, {17, 17}}, rotation = 90), iconTransformation(origin = {-117, -75}, extent = {{17, -17}, {-17, 17}}, rotation = 180)));
Modelica.Blocks.Interfaces.RealInput igdref annotation(
    Placement(visible = true, transformation(origin = {-117, 61}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {-37, 117}, extent = {{-17, -17}, {17, 17}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealInput igqref annotation(
    Placement(visible = true, transformation(origin = {-117, -115}, extent = {{-17, -17}, {17, 17}}, rotation = 0), iconTransformation(origin = {15, 117}, extent = {{-17, -17}, {17, 17}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealOutput vmd annotation(
    Placement(visible = true, transformation(origin = {216, 22}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, 18}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput vmq annotation(
    Placement(visible = true, transformation(origin = {216, -102}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {116, -68}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Math.Add add1(k1 = +1, k2 = -1)  annotation(
    Placement(visible = true, transformation(origin = {-48, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Continuous.Integrator integrator1(k = Rr / tr)  annotation(
    Placement(visible = true, transformation(origin = {18, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Gain gain1(k = Lr / tr)  annotation(
    Placement(visible = true, transformation(origin = {18, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add add2(k2 = +1) annotation(
    Placement(visible = true, transformation(origin = {78, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add3 add31(k3 = -1)  annotation(
    Placement(visible = true, transformation(origin = {144, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-32, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const(k = wg * Lr)  annotation(
    Placement(visible = true, transformation(origin = {-110, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {-32, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add add3(k1 = +1, k2 = -1) annotation(
    Placement(visible = true, transformation(origin = {-34, -132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Continuous.Integrator integrator2(k = Rr / tr) annotation(
    Placement(visible = true, transformation(origin = {22, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Gain gain2(k = Lr / tr) annotation(
    Placement(visible = true, transformation(origin = {24, -158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add add4(k2 = +1) annotation(
    Placement(visible = true, transformation(origin = {74, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Add3 add32(k1 = +1, k3 = +1) annotation(
    Placement(visible = true, transformation(origin = {142, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  igdref - igd = 0;
  igqref - igq = 0;
equation
  connect(igq, product2.u2) annotation(
    Line(points = {{-116, -152}, {-66, -152}, {-66, -84}, {-44, -84}, {-44, -84}}, color = {0, 0, 127}));
  connect(add32.y, vmq) annotation(
    Line(points = {{154, -130}, {174, -130}, {174, -102}, {208, -102}, {208, -102}, {216, -102}}, color = {0, 0, 127}));
  connect(product1.y, add32.u1) annotation(
    Line(points = {{-20, -12}, {104, -12}, {104, -122}, {130, -122}, {130, -122}}, color = {0, 0, 127}));
  connect(add31.u1, vgd) annotation(
    Line(points = {{132, 56}, {108, 56}, {108, 120}, {108, 120}}, color = {0, 0, 127}));
  connect(add32.u3, vgq) annotation(
    Line(points = {{130, -138}, {108, -138}, {108, -216}, {110, -216}}, color = {0, 0, 127}));
  connect(add4.y, add32.u2) annotation(
    Line(points = {{86, -130}, {130, -130}}, color = {0, 0, 127}));
  connect(gain2.y, add4.u2) annotation(
    Line(points = {{36, -158}, {46, -158}, {46, -136}, {62, -136}, {62, -136}}, color = {0, 0, 127}));
  connect(integrator2.y, add4.u1) annotation(
    Line(points = {{34, -106}, {48, -106}, {48, -124}, {62, -124}, {62, -124}}, color = {0, 0, 127}));
  connect(add3.y, gain2.u) annotation(
    Line(points = {{-22, -132}, {-4, -132}, {-4, -158}, {12, -158}, {12, -158}}, color = {0, 0, 127}));
  connect(add3.y, integrator2.u) annotation(
    Line(points = {{-22, -132}, {-6, -132}, {-6, -108}, {8, -108}, {8, -106}, {10, -106}}, color = {0, 0, 127}));
  connect(add3.u2, igq) annotation(
    Line(points = {{-46, -138}, {-74, -138}, {-74, -152}, {-116, -152}, {-116, -152}}, color = {0, 0, 127}));
  connect(igqref, add3.u1) annotation(
    Line(points = {{-116, -114}, {-56, -114}, {-56, -126}, {-46, -126}, {-46, -126}}, color = {0, 0, 127}));
  connect(product2.y, add31.u3) annotation(
    Line(points = {{-20, -78}, {74, -78}, {74, 12}, {120, 12}, {120, 40}, {132, 40}, {132, 40}}, color = {0, 0, 127}));
  connect(product2.u1, const.y) annotation(
    Line(points = {{-44, -72}, {-60, -72}, {-60, -44}, {-98, -44}, {-98, -44}}, color = {0, 0, 127}));
  connect(add31.y, vmd) annotation(
    Line(points = {{156, 48}, {174, 48}, {174, 22}, {216, 22}, {216, 22}}, color = {0, 0, 127}));
  connect(add2.y, add31.u2) annotation(
    Line(points = {{90, 48}, {132, 48}}, color = {0, 0, 127}));
  connect(product1.u2, const.y) annotation(
    Line(points = {{-44, -18}, {-70, -18}, {-70, -44}, {-98, -44}, {-98, -44}}, color = {0, 0, 127}));
  connect(igd, product1.u1) annotation(
    Line(points = {{-116, 20}, {-68, 20}, {-68, -6}, {-44, -6}, {-44, -6}}, color = {0, 0, 127}));
  connect(gain1.y, add2.u1) annotation(
    Line(points = {{30, 78}, {52, 78}, {52, 54}, {66, 54}, {66, 54}}, color = {0, 0, 127}));
  connect(integrator1.y, add2.u2) annotation(
    Line(points = {{30, 40}, {64, 40}, {64, 42}, {66, 42}}, color = {0, 0, 127}));
  connect(gain1.u, add1.y) annotation(
    Line(points = {{6, 78}, {-32, 78}, {-32, 40}, {-36, 40}, {-36, 40}}, color = {0, 0, 127}));
  connect(add1.y, integrator1.u) annotation(
    Line(points = {{-36, 40}, {6, 40}, {6, 40}, {6, 40}}, color = {0, 0, 127}));
  connect(igd, add1.u2) annotation(
    Line(points = {{-116, 20}, {-80, 20}, {-80, 34}, {-60, 34}, {-60, 34}}, color = {0, 0, 127}));
  connect(igdref, add1.u1) annotation(
    Line(points = {{-116, 62}, {-82, 62}, {-82, 46}, {-60, 46}, {-60, 46}}, color = {0, 0, 127}));
annotation(
    Diagram(coordinateSystem(extent = {{-100, -200}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -200}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");

end Inner_control_VSC_blocks;
