within HVDCcomponents;

model VSC_station_dq0

  parameter Real Rr = 0.0125 "in Ohm";
  parameter Real Lr = 100E-3 "in H";
  parameter Real wg = 314 "2*Pi*f";

Modelica.Electrical.Analog.Sources.SignalCurrent modulated_d_current annotation(
    Placement(visible = true, transformation(origin = {-24, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Sources.SignalCurrent modulated_q_current annotation(
    Placement(visible = true, transformation(origin = {-24, -24}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
Modelica.Electrical.Analog.Sources.SignalVoltage modulated_d_voltage annotation(
    Placement(visible = true, transformation(origin = {64, 70}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
Modelica.Electrical.Analog.Sources.SignalVoltage modulated_q_voltage annotation(
    Placement(visible = true, transformation(origin = {76, -56}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
Modelica.Electrical.Analog.Basic.Resistor resistor1(R = Rr)  annotation(
    Placement(visible = true, transformation(origin = {156, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Resistor resistor2(R = Rr)  annotation(
    Placement(visible = true, transformation(origin = {166, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Inductor inductor1(L = Lr)  annotation(
    Placement(visible = true, transformation(origin = {130, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Inductor inductor2(L = Lr)  annotation(
    Placement(visible = true, transformation(origin = {134, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Sources.SignalVoltage VoltageSource1 annotation(
    Placement(visible = true, transformation(origin = {84, 46}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
Modelica.Electrical.Analog.Sources.SignalVoltage VoltageSource2 annotation(
    Placement(visible = true, transformation(origin = {108, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.ComplexBlocks.ComplexMath.RealToComplex realToComplex1 annotation(
    Placement(visible = true, transformation(origin = {340, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor_id annotation(
    Placement(visible = true, transformation(origin = {102, 80}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
HVDCcomponents.SignalCurrent_phasor signalCurrent_phasor1 annotation(
    Placement(visible = true, transformation(origin = {376, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
HVDCcomponents.Ground_phasor ground_phasor1 annotation(
    Placement(visible = true, transformation(origin = {364, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {410, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor_iq annotation(
    Placement(visible = true, transformation(origin = {134, -72}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput mq annotation(
    Placement(visible = true, transformation(origin = {-218, -82}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-116, -32}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput md annotation(
    Placement(visible = true, transformation(origin = {-216, 106}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {-116, 88}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {-24, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {-24, 72}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {36, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Product product4 annotation(
    Placement(visible = true, transformation(origin = {34, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor_vdc annotation(
    Placement(visible = true, transformation(origin = {8, 12}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
Modelica.Blocks.Sources.Constant const1(k = Lr)  annotation(
    Placement(visible = true, transformation(origin = {222, 2}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
Modelica.Blocks.Math.MultiProduct multiProduct1(nu = 3)  annotation(
    Placement(visible = true, transformation(origin = {175, 21}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
Modelica.Blocks.Math.MultiProduct multiProduct2(nu = 3)  annotation(
    Placement(visible = true, transformation(origin = {175, -11}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const2(k = wg) annotation(
    Placement(visible = true, transformation(origin = {222, -24}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
HVDCcomponents.VSC_station_components.Idq_to_Icomplex idq_to_Icomplex1 annotation(
    Placement(visible = true, transformation(origin = {277, 49}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {176, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(
    Placement(visible = true, transformation(origin = {-204, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(
    Placement(visible = true, transformation(origin = {-204, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-108, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Sources.SignalVoltage vd annotation(
    Placement(visible = true, transformation(origin = {174, 64}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
HVDCcomponents.VSC_station_components.Module_calc module_calc1  annotation(
    Placement(visible = true, transformation(origin = {218, 64}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
Modelica.Electrical.Analog.Sources.SignalVoltage vq annotation(
    Placement(visible = true, transformation(origin = {186, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {230, -56}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {144, 90}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealInput Vb annotation(
    Placement(visible = true, transformation(origin = {280, 142}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {10, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Interfaces.RealInput Ib annotation(
    Placement(visible = true, transformation(origin = {324, 140}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {58, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
Modelica.Blocks.Math.Product product5 annotation(
    Placement(visible = true, transformation(origin = {78, 146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Interaction.Show.RealValue Pd annotation(
    Placement(visible = true, transformation(origin = {166, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {124, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const3(k = 1E6)  annotation(
    Placement(visible = true, transformation(origin = {90, 122}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
Modelica.Blocks.Math.Product product6 annotation(
    Placement(visible = true, transformation(origin = {222, 152}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {256, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const4(k = 1E6) annotation(
    Placement(visible = true, transformation(origin = {224, 132}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
Modelica.Blocks.Interaction.Show.RealValue Pd_g annotation(
    Placement(visible = true, transformation(origin = {294, 162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Product product7 annotation(
    Placement(visible = true, transformation(origin = {298, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Math.Division division3 annotation(
    Placement(visible = true, transformation(origin = {338, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Sources.Constant const5(k = 1E6) annotation(
    Placement(visible = true, transformation(origin = {302, -98}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
Modelica.Blocks.Interaction.Show.RealValue Pq_g annotation(
    Placement(visible = true, transformation(origin = {372, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(division1.u2, const3.y) annotation(
    Line(points = {{112, 134}, {106, 134}, {106, 122}, {97, 122}}, color = {0, 0, 127}));
  connect(division1.u1, product5.y) annotation(
    Line(points = {{112, 146}, {89, 146}}, color = {0, 0, 127}));
  connect(currentSensor_id.i, product5.u2) annotation(
    Line(points = {{102, 92}, {86, 92}, {86, 90}, {66, 90}, {66, 140}}, color = {0, 0, 127}));
  connect(modulated_d_voltage.v, product5.u1) annotation(
    Line(points = {{52, 70}, {52, 105}, {66, 105}, {66, 152}}, color = {0, 0, 127}));
  connect(Pq_g.numberPort, division3.y) annotation(
    Line(points = {{360, -68}, {354, -68}, {354, -64}, {350, -64}, {350, -64}}, color = {0, 0, 127}));
  connect(division3.u2, const5.y) annotation(
    Line(points = {{326, -70}, {316, -70}, {316, -98}, {308, -98}, {308, -98}, {308, -98}}, color = {0, 0, 127}));
  connect(product7.y, division3.u1) annotation(
    Line(points = {{310, -66}, {318, -66}, {318, -58}, {326, -58}, {326, -58}}, color = {0, 0, 127}));
  connect(product7.u1, module_calc1.u_module) annotation(
    Line(points = {{286, -60}, {268, -60}, {268, 30}, {202, 30}, {202, 64}, {206, 64}}, color = {0, 0, 127}));
  connect(product7.u2, currentSensor_iq.i) annotation(
    Line(points = {{286, -72}, {268, -72}, {268, -96}, {134, -96}, {134, -82}, {134, -82}}, color = {0, 0, 127}));
  connect(Pd_g.numberPort, division2.y) annotation(
    Line(points = {{282, 162}, {272, 162}, {272, 158}, {266, 158}, {266, 158}, {268, 158}}, color = {0, 0, 127}));
  connect(Vb, module_calc1.Vb) annotation(
    Line(points = {{280, 142}, {280, 142}, {280, 88}, {232, 88}, {232, 70}, {230, 70}}, color = {0, 0, 127}));
  connect(division2.u2, const4.y) annotation(
    Line(points = {{244, 152}, {240, 152}, {240, 132}, {230, 132}, {230, 132}}, color = {0, 0, 127}));
  connect(division2.u1, product6.y) annotation(
    Line(points = {{244, 164}, {238, 164}, {238, 152}, {234, 152}, {234, 152}}, color = {0, 0, 127}));
  connect(product6.u1, currentSensor_id.i) annotation(
    Line(points = {{210, 158}, {182, 158}, {182, 100}, {114, 100}, {114, 92}, {102, 92}, {102, 92}}, color = {0, 0, 127}));
  connect(product6.u2, module_calc1.u_module) annotation(
    Line(points = {{210, 146}, {192, 146}, {192, 64}, {206, 64}, {206, 64}, {206, 64}}, color = {0, 0, 127}));
  connect(Pd.numberPort, division1.y) annotation(
    Line(points = {{154, 132}, {142, 132}, {142, 140}, {136, 140}, {136, 140}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.Ib, Ib) annotation(
    Line(points = {{260, 60}, {252, 60}, {252, 106}, {324, 106}, {324, 140}, {324, 140}}, color = {0, 0, 127}));
  connect(currentSensor_iq.p, ground4.p) annotation(
    Line(points = {{144, -72}, {176, -72}, {176, -72}, {176, -72}}, color = {0, 0, 255}));
  connect(currentSensor_iq.n, modulated_q_voltage.n) annotation(
    Line(points = {{124, -72}, {76, -72}, {76, -66}, {76, -66}}, color = {0, 0, 255}));
  connect(currentSensor_iq.i, product1.u2) annotation(
    Line(points = {{134, -83}, {134, -84}, {-18, -84}, {-18, -74}}, color = {0, 0, 127}));
  connect(currentSensor_iq.i, multiProduct1.u[2]) annotation(
    Line(points = {{134, -83}, {202, -83}, {202, 18}, {182, 18}, {182, 21}}, color = {0, 0, 127}));
  connect(currentSensor_iq.i, idq_to_Icomplex1.iq) annotation(
    Line(points = {{134, -83}, {244, -83}, {244, 46}, {258, 46}, {258, 44}, {260, 44}}, color = {0, 0, 127}));
  connect(currentSensor_id.n, modulated_d_voltage.n) annotation(
    Line(points = {{92, 80}, {64, 80}, {64, 80}, {64, 80}}, color = {0, 0, 255}));
  connect(currentSensor_id.p, ground2.p) annotation(
    Line(points = {{112, 80}, {144, 80}, {144, 80}, {144, 80}}, color = {0, 0, 255}));
  connect(currentSensor_id.i, product2.u1) annotation(
    Line(points = {{102, 91}, {102, 104}, {-18, 104}, {-18, 84}}, color = {0, 0, 127}));
  connect(currentSensor_id.i, multiProduct2.u[2]) annotation(
    Line(points = {{102, 91}, {102, 104}, {198, 104}, {198, -10}, {182, -10}}, color = {0, 0, 127}));
  connect(currentSensor_id.i, idq_to_Icomplex1.id) annotation(
    Line(points = {{102, 91}, {102, 104}, {244, 104}, {244, 54}, {260, 54}}, color = {0, 0, 127}));
  connect(ground2.p, vd.n) annotation(
    Line(points = {{144, 80}, {174, 80}, {174, 74}, {174, 74}}, color = {0, 0, 255}));
  connect(const2.y, multiProduct2.u[3]) annotation(
    Line(points = {{213, -24}, {190, -24}, {190, -14}, {182, -14}, {182, -10}}, color = {0, 0, 127}));
  connect(const2.y, multiProduct1.u[3]) annotation(
    Line(points = {{213, -24}, {204, -24}, {204, 24}, {182, 24}, {182, 22}}, color = {0, 0, 127}));
  connect(vq.v, const.y) annotation(
    Line(points = {{198, -56}, {222, -56}, {222, -56}, {222, -56}}, color = {0, 0, 127}));
  connect(ground4.p, vq.n) annotation(
    Line(points = {{176, -72}, {186, -72}, {186, -66}, {186, -66}}, color = {0, 0, 255}));
  connect(resistor2.n, vq.p) annotation(
    Line(points = {{176, -38}, {186, -38}, {186, -46}, {186, -46}}, color = {0, 0, 255}));
  connect(module_calc1.u_module, vd.v) annotation(
    Line(points = {{206, 64}, {186, 64}, {186, 64}, {186, 64}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.vi, module_calc1.ui) annotation(
    Line(points = {{282, 68}, {282, 68}, {282, 74}, {234, 74}, {234, 60}, {230, 60}, {230, 60}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.vr, module_calc1.ur) annotation(
    Line(points = {{272, 68}, {232, 68}, {232, 66}, {230, 66}}, color = {0, 0, 127}));
  connect(resistor1.n, vd.p) annotation(
    Line(points = {{166, 46}, {174, 46}, {174, 54}, {174, 54}}, color = {0, 0, 255}));
  connect(pin_n, voltageSensor_vdc.n) annotation(
    Line(points = {{-204, -16}, {8, -16}, {8, 2}, {8, 2}}, color = {0, 0, 255}));
  connect(pin_p, voltageSensor_vdc.p) annotation(
    Line(points = {{-204, 22}, {8, 22}, {8, 22}, {8, 22}}, color = {0, 0, 255}));
  connect(product4.u2, voltageSensor_vdc.v) annotation(
    Line(points = {{22, 64}, {16, 64}, {16, 20}, {20, 20}, {20, 12}, {20, 12}}, color = {0, 0, 127}));
  connect(product4.y, modulated_d_voltage.v) annotation(
    Line(points = {{45, 70}, {51, 70}}, color = {0, 0, 127}));
  connect(product4.u1, md) annotation(
    Line(points = {{22, 76}, {14, 76}, {14, 108}, {-216, 108}, {-216, 106}}, color = {0, 0, 127}));
  connect(modulated_q_current.p, pin_p) annotation(
    Line(points = {{-14, -24}, {-8, -24}, {-8, 20}, {-204, 20}, {-204, 22}}, color = {0, 0, 255}));
  connect(modulated_q_current.n, pin_n) annotation(
    Line(points = {{-34, -24}, {-176, -24}, {-176, -16}, {-204, -16}, {-204, -16}}, color = {0, 0, 255}));
  connect(modulated_d_current.n, pin_n) annotation(
    Line(points = {{-14, 38}, {-14, 38}, {-14, 4}, {-174, 4}, {-174, -14}, {-204, -14}, {-204, -16}}, color = {0, 0, 255}));
  connect(modulated_d_current.p, pin_p) annotation(
    Line(points = {{-34, 38}, {-186, 38}, {-186, 24}, {-204, 24}, {-204, 22}}, color = {0, 0, 255}));
  connect(voltageSensor_vdc.v, product3.u1) annotation(
    Line(points = {{19, 12}, {19, -50}, {24, -50}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.Ii, realToComplex1.im) annotation(
    Line(points = {{294, 46}, {328, 46}, {328, 44}, {328, 44}}, color = {0, 0, 127}));
  connect(idq_to_Icomplex1.Ir, realToComplex1.re) annotation(
    Line(points = {{294, 54}, {328, 54}, {328, 56}, {328, 56}}, color = {0, 0, 127}));
  connect(p.vr, idq_to_Icomplex1.vr) annotation(
    Line(points = {{410, 34}, {414, 34}, {414, 80}, {272, 80}, {272, 68}, {272, 68}}, color = {0, 0, 255}));
  connect(p.vi, idq_to_Icomplex1.vi) annotation(
    Line(points = {{410, 34}, {402, 34}, {402, 76}, {282, 76}, {282, 68}, {282, 68}}, color = {0, 0, 255}));
  connect(signalCurrent_phasor1.p, ground_phasor1.p) annotation(
    Line(points = {{365.8, 32}, {365.8, 23}, {365.8, 23}, {365.8, 14}, {363.8, 14}, {363.8, 6}, {363.8, 6}, {363.8, -2}}, color = {0, 0, 255}));
  connect(realToComplex1.y, signalCurrent_phasor1.i) annotation(
    Line(points = {{351, 50}, {377, 50}, {377, 45}, {375, 45}, {375, 40}}, color = {85, 170, 255}));
  connect(p, signalCurrent_phasor1.n) annotation(
    Line(points = {{410, 34}, {398, 34}, {398, 34}, {386, 34}, {386, 33}, {386, 33}, {386, 32}}, color = {0, 0, 255}));
  connect(md, product2.u2) annotation(
    Line(points = {{-216, 106}, {-30, 106}, {-30, 84}}, color = {0, 0, 127}));
  connect(product1.u1, mq) annotation(
    Line(points = {{-30, -74}, {-30, -82}, {-218, -82}}, color = {0, 0, 127}));
  connect(product3.u2, mq) annotation(
    Line(points = {{24, -62}, {14, -62}, {14, -90}, {-106, -90}, {-106, -82}, {-218, -82}}, color = {0, 0, 127}));
  connect(const1.y, multiProduct2.u[1]) annotation(
    Line(points = {{214, 2}, {188, 2}, {188, -8}, {182, -8}, {182, -10}}, color = {0, 0, 127}));
  connect(multiProduct2.y, VoltageSource2.v) annotation(
    Line(points = {{166, -10}, {110, -10}, {110, -24}, {108, -24}, {108, -26}}, color = {0, 0, 127}));
  connect(multiProduct1.y, VoltageSource1.v) annotation(
    Line(points = {{166, 22}, {84, 22}, {84, 34}, {84, 34}, {84, 34}}, color = {0, 0, 127}));
  connect(const1.y, multiProduct1.u[1]) annotation(
    Line(points = {{214, 2}, {208, 2}, {208, 21}, {182, 21}}, color = {0, 0, 127}));
  connect(VoltageSource1.p, inductor1.p) annotation(
    Line(points = {{94, 46}, {120, 46}}, color = {0, 0, 255}));
  connect(modulated_d_voltage.p, VoltageSource1.n) annotation(
    Line(points = {{64, 60}, {64, 56.5}, {64, 56.5}, {64, 53}, {62, 53}, {62, 46}, {69, 46}, {69, 46}, {71.5, 46}, {71.5, 46}, {74, 46}}, color = {0, 0, 255}));
  connect(inductor1.n, resistor1.p) annotation(
    Line(points = {{140, 46}, {146, 46}}, color = {0, 0, 255}));
  connect(product3.y, modulated_q_voltage.v) annotation(
    Line(points = {{47, -56}, {55, -56}, {55, -56}, {63, -56}, {63, -56}, {63, -56}, {63, -56}, {63, -56}}, color = {0, 0, 127}));
  connect(VoltageSource2.n, inductor2.p) annotation(
    Line(points = {{118, -38}, {124, -38}}, color = {0, 0, 255}));
  connect(modulated_q_voltage.p, VoltageSource2.p) annotation(
    Line(points = {{76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -46}, {76, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}, {98, -38}}, color = {0, 0, 255}));
  connect(inductor2.n, resistor2.p) annotation(
    Line(points = {{144, -38}, {150, -38}, {150, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}, {156, -38}}, color = {0, 0, 255}));
  connect(product2.y, modulated_d_current.i) annotation(
    Line(points = {{-24, 60}, {-24, 60}, {-24, 50}, {-24, 50}}, color = {0, 0, 127}));
  connect(product1.y, modulated_q_current.i) annotation(
    Line(points = {{-24, -50}, {-24, -50}, {-24, -36}, {-24, -36}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -130}, {400, 120}})),
    Icon(coordinateSystem(extent = {{-200, -130}, {400, 120}})),
    __OpenModelica_commandLineOptions = "",
  Documentation);

end VSC_station_dq0;
