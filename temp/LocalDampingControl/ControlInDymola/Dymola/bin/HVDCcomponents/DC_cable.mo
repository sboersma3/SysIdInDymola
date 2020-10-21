within HVDCcomponents;
model DC_cable
parameter Real length "line length in km";
parameter Real Vinit "initial voltage for capacitors";
Modelica.Electrical.Analog.Basic.Conductor conductor1(G = 7.63E-11 * length * 0)  annotation (
    Placement(visible = true, transformation(origin = {-76, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 1.91E-7 * length * 0, v(start = Vinit))  annotation (
    Placement(visible = true, transformation(origin = {-52, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
Modelica.Electrical.Analog.Basic.Inductor inductor1(L = 3.29E-3 * length)  annotation (
    Placement(visible = true, transformation(origin = {-20, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Inductor inductor2(L = 1.55E-3 * length)  annotation (
    Placement(visible = true, transformation(origin = {-20, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Inductor inductor3(L = 2.28E-4 * length)  annotation (
    Placement(visible = true, transformation(origin = {-20, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1.17E-1 * length)  annotation (
    Placement(visible = true, transformation(origin = {16, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 8.21E-2 * length)  annotation (
    Placement(visible = true, transformation(origin = {16, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Resistor resistor3(R = 1.19E-2 * length)  annotation (
    Placement(visible = true, transformation(origin = {16, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 1.91E-7 * length * 0, v(start = 230E3))  annotation (
    Placement(visible = true, transformation(origin = {52, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
Modelica.Electrical.Analog.Basic.Conductor conductor2(G = 7.63E-11 * length * 0)  annotation (
    Placement(visible = true, transformation(origin = {74, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (
    Placement(visible = true, transformation(origin = {-104, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-104, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (
    Placement(visible = true, transformation(origin = {-103, -41}, extent = {{-11, -11}, {11, 11}}, rotation = 0), iconTransformation(origin = {-103, -41}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1 annotation (
    Placement(visible = true, transformation(origin = {104, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1 annotation (
    Placement(visible = true, transformation(origin = {104, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(conductor2.p, pin_p1) annotation (
    Line(points = {{74, -4}, {74, -4}, {74, 40}, {104, 40}, {104, 38}}, color = {0, 0, 255}));
  connect(conductor2.n, pin_n1) annotation (
    Line(points = {{74, -24}, {74, -24}, {74, -40}, {104, -40}, {104, -40}}, color = {0, 0, 255}));
  connect(conductor1.p, pin_p) annotation (
    Line(points = {{-76, -4}, {-90, -4}, {-90, 40}, {-104, 40}}, color = {0, 0, 255}));
  connect(conductor1.n, pin_n) annotation (
    Line(points = {{-76, -24}, {-76, -24}, {-76, -40}, {-102, -40}, {-102, -40}}, color = {0, 0, 255}));
  connect(capacitor2.n, conductor2.n) annotation (
    Line(points = {{52, -24}, {74, -24}, {74, -24}, {74, -24}}, color = {0, 0, 255}));
  connect(capacitor1.n, capacitor2.n) annotation (
    Line(points = {{-52, -24}, {52, -24}, {52, -24}, {52, -24}}, color = {0, 0, 255}));
  connect(conductor1.n, capacitor1.n) annotation (
    Line(points = {{-76, -24}, {-52, -24}, {-52, -24}, {-52, -24}}, color = {0, 0, 255}));
  connect(conductor2.p, capacitor2.p) annotation (
    Line(points = {{74, -4}, {52, -4}, {52, -4}, {52, -4}}, color = {0, 0, 255}));
  connect(capacitor2.p, resistor2.n) annotation (
    Line(points = {{52, -4}, {52, -4}, {52, 42}, {26, 42}, {26, 42}}, color = {0, 0, 255}));
  connect(resistor2.n, resistor3.n) annotation (
    Line(points = {{26, 42}, {26, 42}, {26, 22}, {26, 22}}, color = {0, 0, 255}));
  connect(resistor1.n, resistor2.n) annotation (
    Line(points = {{26, 64}, {26, 64}, {26, 42}, {26, 42}}, color = {0, 0, 255}));
  connect(inductor1.n, resistor3.p) annotation (
    Line(points = {{-10, 22}, {6, 22}, {6, 22}, {6, 22}}, color = {0, 0, 255}));
  connect(inductor2.n, resistor2.p) annotation (
    Line(points = {{-10, 42}, {6, 42}, {6, 42}, {6, 42}}, color = {0, 0, 255}));
  connect(inductor3.n, resistor1.p) annotation (
    Line(points = {{-10, 64}, {6, 64}, {6, 64}, {6, 64}}, color = {0, 0, 255}));
  connect(inductor2.p, inductor3.p) annotation (
    Line(points = {{-30, 42}, {-30, 42}, {-30, 64}, {-30, 64}}, color = {0, 0, 255}));
  connect(inductor2.p, inductor1.p) annotation (
    Line(points = {{-30, 42}, {-30, 42}, {-30, 22}, {-30, 22}}, color = {0, 0, 255}));
  connect(capacitor1.p, inductor2.p) annotation (
    Line(points = {{-52, -4}, {-52, -4}, {-52, 42}, {-30, 42}, {-30, 42}}, color = {0, 0, 255}));
  connect(conductor1.p, capacitor1.p) annotation (
    Line(points = {{-76, -4}, {-52, -4}, {-52, -4}, {-52, -4}}, color = {0, 0, 255}));


end DC_cable;
