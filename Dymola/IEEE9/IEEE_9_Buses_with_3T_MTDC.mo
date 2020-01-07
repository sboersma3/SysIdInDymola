within IEEE9;
model IEEE_9_Buses_with_3T_MTDC
  import Modelica.Constants.pi;
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    kT=16.5/230,
    x=0.0576,
    r=0,
    V_b=16.5,
    Vn=16.5) annotation (Placement(visible = true, transformation(origin = {84, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OpenIPSL.Electrical.Branches.PwLine line_6_4(
    R=0.017,
    X=0.092,
    G=0,
    B=0.079) annotation (Placement(visible = true, transformation(origin = {224, -27}, extent = {{-9, -6}, {9, 6}}, rotation = 270)));
  OpenIPSL.Electrical.Branches.PwLine line_4_5(
    G=0,
    R=0.01,
    X=0.085,
    B=0.088) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=270,
        origin={-72,-21})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ(
    V_b=230,
    V_0=0.995630859628167,
    Sn=100,
    P_0=125,
    Q_0=50,
    angle_0=-3.9888) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-99,-11})));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant PQ1(
    V_b=230,
    V_0=1.012654326639182,
    Sn=100,
    P_0=90,
    Q_0=30,
    angle_0=-3.6874) annotation (Placement(visible = true, transformation(origin = {247, -19}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine line_9_6(
    G=0,
    R=0.039,
    X=0.170,
    B=0.179) annotation (Placement(visible = true, transformation(origin = {224, 105}, extent = {{-9, -6}, {9, 6}}, rotation = 90)));
  OpenIPSL.Electrical.Branches.PwLine line_5_7(
    G=0,
    R=0.032,
    X=0.161,
    B=0.153) annotation (Placement(visible = true, transformation(origin = {-72, 117}, extent = {{-9, -6}, {9, 6}}, rotation = 90)));
  OpenIPSL.Electrical.Branches.PwLine line_8_9(
    G=0,
    R=0.0119,
    X=0.1008,
    B=0.1045) annotation (Placement(visible = true, transformation(origin = {175, 302}, extent = {{-9, -6}, {9, 6}}, rotation = 180)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer1(
    r=0,
    kT=13.8/230,
    x=0.0586,
    V_b=13.8,
    Vn=13.8) annotation (Placement(visible = true, transformation(origin = {240, 250}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
    twoWindingTransformer2(
    r=0,
    kT=18/230,
    x=0.0625,
    Sn=100,
    V_b=18,
    Vn=18) annotation (Placement(visible = true, transformation(origin = {-102, 256}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ1(
    V_b=230,
    V_0=1.015882581760390,
    Sn=100,
    P_0=100,
    Q_0=35,
    angle_0=0.72754) annotation (Placement(visible = true, transformation(origin = {83, 271}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B2(
    V_0=1.025,
    V_b=18,
    angle_0=9.28)
    annotation (Placement(visible = true, transformation(extent = {{-130, 246}, {-110, 266}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B7(
    V_b=230,
    V_0=1.0258,
    angle_0=3.7197)
    annotation (Placement(visible = true, transformation(extent = {{-90, 246}, {-70, 266}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B8(
    V_0=1.015882581760390,
    V_b=230,
    angle_0=0.72754) annotation (Placement(visible = true, transformation(origin = {76, 308}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B9(
    V_b=230,
    V_0=1.0324,
    angle_0=1.9667)
    annotation (Placement(visible = true, transformation(extent = {{208, 240}, {228, 260}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B3(
    V_0=1.025,
    V_b=13.8,
    angle_0=4.6648)
    annotation (Placement(visible = true, transformation(extent = {{248, 240}, {268, 260}}, rotation = 0)));
  OpenIPSL.Electrical.Buses.Bus B6(
    V_0=1.012654326639182,
    V_b=230,
    angle_0=-3.6874) annotation (Placement(visible = true, transformation(origin = {224, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  OpenIPSL.Electrical.Buses.Bus B5(
    V_0=0.995630859628167,
    V_b=230,
    angle_0=-3.9888) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-72,20})));
  OpenIPSL.Electrical.Buses.Bus B4(
    V_0=1.0258,
    V_b=230,
    angle_0=-2.2168) annotation (Placement(visible = true, transformation(origin = {84, -68}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
  OpenIPSL.Electrical.Buses.Bus B1(
    angle_0=0,
    V_0=1.04,
    V_b=16.5) annotation (Placement(visible = true, transformation(origin = {84, -108}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
  IEEE9.Generation_Groups.Gen1 gen1(
    V_b=18,
    V_0=1.025,
    height_1=0.05,
    tstart_1=2,
    refdisturb_1=false,
    vref0=1.120103884682511,
    vf0=1.789323314329606,
    angle_0=0.161966652912444*180/pi,
    P_0=163,
    Q_0=6.6536560198189)
    annotation (Placement(visible = true, transformation(extent = {{-160, 246}, {-140, 266}}, rotation = 0)));
  IEEE9.Generation_Groups.Gen2 gen2(
    V_b=13.8,
    V_0=1.025,
    height_2=0.05,
    tstart_2=2,
    refdisturb_2=false,
    vref0=1.097573933623472,
    vf0=1.402994304406186,
    P_0=85,
    Q_0=-10.8597088920594,
    angle_0=4.6648)
    annotation (Placement(visible = true, transformation(extent = {{298, 240}, {278, 260}}, rotation = 0)));
  IEEE9.Generation_Groups.Gen3 gen3(
    V_0=1.040000000000000,
    angle_0=0,
    height_3=0.05,
    tstart_3=2,
    refdisturb_3=false,
    V_b=16.5,
    vref0=1.095242742681042,
    vf0=1.082148046273888,
    P_0=71.6410214993680,
    Q_0=27.0459279594234) annotation (Placement(visible = true, transformation(origin = {84, -126}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
    annotation (Placement(visible = true, transformation(extent = {{-180, -140}, {-80, -100}}, rotation = 0)));
  OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(
    R=0.0085,
    X=0.072,
    G=0,
    B=0.0745)
    annotation (Placement(visible = true, transformation(extent = {{-14, 302}, {4, 314}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor1 annotation (
    Placement(visible = true, transformation(origin = {-39.4, 215.833}, extent = {{6.2, -5.16667}, {-6.2, 5.16667}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL vSC_station_dq0_with_control_PLL1(Ib = 435,Vb = 230E3, wg = 376.8)  annotation (
    Placement(visible = true, transformation(origin = {0, 178}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor2 annotation (
    Placement(visible = true, transformation(origin = {186.2, 208.833}, extent = {{-7.4, -6.16667}, {7.4, 6.16667}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL vSC_station_dq0_with_control_PLL2(Ib = 435, Vb = 230E3, wg = 376.8)  annotation (
    Placement(visible = true, transformation(origin = {152, 176}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  HVDCcomponents.PQ_sensor pQ_sensor3 annotation (
    Placement(visible = true, transformation(origin = {71.6, -21}, extent = {{-7.2, -6}, {7.2, 6}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL vSC_station_dq0_with_control_PLL3(Ib = 435, Vb = 230E3, wg = 376.8)  annotation (
    Placement(visible = true, transformation(origin = {26, 10}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 230E3))  annotation (
    Placement(visible = true, transformation(origin = {46, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 230E3))  annotation (
    Placement(visible = true, transformation(origin = {116, 160}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor3(C = 195E-6, v(fixed = true, start = 230E3))  annotation (
    Placement(visible = true, transformation(origin = {-18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HVDCcomponents.DC_cable dC_cable1(Vinit = 230E3, length = 200)  annotation (
    Placement(visible = true, transformation(origin = {80, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {108, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor4(C = 195E-6, v(fixed = true, start = 230E3))  annotation (
    Placement(visible = true, transformation(origin = {38, 124}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HVDCcomponents.DC_cable dC_cable2(Vinit = 230E3, length = 200)  annotation (
    Placement(visible = true, transformation(origin = {36, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation (
    Placement(visible = true, transformation(origin = {106, 192}, extent = {{-8, 8}, {8, -8}}, rotation = 0)));
  HVDCcomponents.vdc_control vdc_control1 annotation (
    Placement(visible = true, transformation(origin = {126, 222}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 230E3)  annotation (
    Placement(visible = true, transformation(origin = {84, 226}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation (
    Placement(visible = true, transformation(origin = {64, 208}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const2(k = 0)  annotation (
    Placement(visible = true, transformation(origin = {58, 36}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
equation
  connect(const2.y, vSC_station_dq0_with_control_PLL3.Pref) annotation (
    Line(points={{51.4,36},{10,36},{10,18},{14.5,18},{14.5,18.5}},    color = {0, 0, 127}));
  connect(const2.y, vSC_station_dq0_with_control_PLL3.Qref) annotation (
    Line(points={{51.4,36},{8,36},{8,14},{14.5,14},{14.5,13.9}},    color = {0, 0, 127}));
  connect(const1.y, vSC_station_dq0_with_control_PLL1.Pref) annotation (
    Line(points={{70.6,208},{76,208},{76,186},{31.5,186},{31.5,186.5}},    color = {0, 0, 127}));
  connect(const1.y, vSC_station_dq0_with_control_PLL1.Qref) annotation (
    Line(points={{70.6,208},{76,208},{76,182},{31.5,182},{31.5,181.9}},    color = {0, 0, 127}));
  connect(const1.y, vSC_station_dq0_with_control_PLL2.Qref) annotation (
    Line(points={{70.6,208},{76,208},{76,180},{140.5,180},{140.5,179.9}},    color = {0, 0, 127}));
  connect(vdc_control1.Pref, vSC_station_dq0_with_control_PLL2.Pref) annotation (
    Line(points={{137,223},{144,223},{144,198},{134,198},{134,184},{140.5,184},
          {140.5,184.5}},                                                                               color = {0, 0, 127}));
  connect(const.y, vdc_control1.vdcref) annotation (
    Line(points={{90.6,226},{114,226},{114,226.4},{114,226.4}},    color = {0, 0, 127}));
  connect(vdc_control1.vdc, voltageSensor1.v) annotation (
    Line(points={{114,220},{106,220},{106,200.8}},      color = {0, 0, 127}));
  connect(pQ_sensor2.p, vSC_station_dq0_with_control_PLL2.p) annotation (
    Line(points={{178.8,208.833},{166,208.833},{166,175.8},{163,175.8}},
                                                                    color = {0, 0, 255}));
  connect(pQ_sensor2.n, B9.p) annotation (
    Line(points={{193.6,208.833},{200,208.833},{200,250},{218,250}},color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control_PLL2.pin_n, capacitor2.n) annotation (
    Line(points={{141.2,169.6},{134,169.6},{134,150},{116,150}},    color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control_PLL2.pin_p, capacitor2.p) annotation (
    Line(points={{141,173.8},{126,173.8},{126,170},{116,170}},      color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control_PLL1.pin_p, capacitor4.p) annotation (
    Line(points={{31,175.8},{34,175.8},{34,136},{48,136},{48,124}},        color = {0, 0, 255}));
  connect(capacitor4.n, vSC_station_dq0_with_control_PLL1.pin_n) annotation (
    Line(points={{28,124},{24,124},{24,171.6},{30.8,171.6}},    color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control_PLL1.pin_n, capacitor1.n) annotation (
    Line(points={{30.8,171.6},{26,171.6},{26,150},{46,150}},    color = {0, 0, 255}));
  connect(vSC_station_dq0_with_control_PLL1.pin_p, capacitor1.p) annotation (
    Line(points={{31,175.8},{30,175.8},{30,170},{46,170}},      color = {0, 0, 255}));
  connect(pQ_sensor1.p, vSC_station_dq0_with_control_PLL1.p) annotation (
    Line(points={{-33.2,215.833},{-26,215.833},{-26,177.8},{9,177.8}},
                                                                    color = {0, 0, 255}));
  connect(voltageSensor1.p, capacitor2.p) annotation (
    Line(points = {{98, 192}, {94, 192}, {94, 176}, {116, 176}, {116, 170}, {116, 170}}, color = {0, 0, 255}));
  connect(voltageSensor1.n, capacitor2.n) annotation (
    Line(points = {{114, 192}, {122, 192}, {122, 150}, {116, 150}, {116, 150}}, color = {0, 0, 255}));
  connect(B7.p, pwLine2Openings.p) annotation (
    Line(points={{-80,256},{-46.5,256},{-46.5,308},{-13.1,308}},        color = {0, 0, 255}));
  connect(B8.p, pwLine2Openings.n) annotation (
    Line(points={{76,308},{3.1,308}},    color = {0, 0, 255}));
  connect(B8.p, lOADPQ1.p) annotation (
    Line(points = {{76, 308}, {79, 308}, {79, 308}, {82, 308}, {82, 306}, {83, 306}, {83, 292}, {83, 292}, {83, 278}}, color = {0, 0, 255}));
  connect(B8.p, line_8_9.n) annotation (
    Line(points={{76,308},{83.75,308},{83.75,308},{91.5,308},{91.5,302},{128.25,
          302},{128.25,302},{166.9,302}},                                                                                      color = {0, 0, 255}));
  connect(line_8_9.p, B9.p) annotation (
    Line(points={{183.1,302},{200.5,302},{200.5,250},{218,250}},        color = {0, 0, 255}));
  connect(dC_cable2.pin_n1, capacitor3.n) annotation (
    Line(points={{32,69.6},{32,60},{-32,60},{-32,20},{-18,20}},          color = {0, 0, 255}));
  connect(dC_cable2.pin_p1, capacitor3.p) annotation (
    Line(points={{39.8,69.6},{39.8,69.6},{39.8,50},{-26,50},{-26,40},{-18,40},{
          -18,40}},                                                                           color = {0, 0, 255}));
  connect(dC_cable2.pin_p, capacitor4.p) annotation (
    Line(points={{40,90.4},{40,90.4},{40,110},{48,110},{48,124},{48,124}},          color = {0, 0, 255}));
  connect(capacitor4.n, dC_cable2.pin_n) annotation (
    Line(points={{28,124},{28,124},{28,96},{32,96},{32,90.3},{31.9,90.3}},        color = {0, 0, 255}));
  connect(capacitor2.n, ground1.p) annotation (
    Line(points = {{116, 150}, {116, 150}, {116, 142}, {108, 142}, {108, 140}, {108, 140}}, color = {0, 0, 255}));
  connect(dC_cable1.pin_n1, capacitor2.n) annotation (
    Line(points={{90.4,154},{104,154},{104,150},{116,150},{116,150}},          color = {0, 0, 255}));
  connect(dC_cable1.pin_p1, capacitor2.p) annotation (
    Line(points={{90.4,161.8},{100,161.8},{100,170},{116,170},{116,170}},      color = {0, 0, 255}));
  connect(capacitor1.n, dC_cable1.pin_n) annotation (
    Line(points={{46,150},{60,150},{60,154},{69.7,154},{69.7,153.9}},      color = {0, 0, 255}));
  connect(capacitor1.p, dC_cable1.pin_p) annotation (
    Line(points={{46,170},{58,170},{58,162},{69.6,162},{69.6,162}},        color = {0, 0, 255}));
  connect(capacitor3.n, vSC_station_dq0_with_control_PLL3.pin_n) annotation (
    Line(points={{-18,20},{-10,20},{-10,4},{15.2,4},{15.2,3.6}},      color = {0, 0, 255}));
  connect(capacitor3.p, vSC_station_dq0_with_control_PLL3.pin_p) annotation (
    Line(points={{-18,40},{-2,40},{-2,8},{15,8},{15,7.8}},          color = {0, 0, 255}));
  connect(pQ_sensor3.p, vSC_station_dq0_with_control_PLL3.p) annotation (
    Line(points={{64.4,-21},{50,-21},{50,10},{37,10},{37,9.8}},         color = {0, 0, 255}));
  connect(pQ_sensor3.n, B4.p) annotation (
    Line(points={{78.8,-21},{84,-21},{84,-68}},      color = {0, 0, 255}));
  connect(pQ_sensor1.n, B7.p) annotation (
    Line(points={{-45.6,215.833},{-62,215.833},{-62,256},{-80,256},{-80,256}},  color = {0, 0, 255}));
  connect(B6.p, line_9_6.p) annotation (
    Line(points={{224,14},{224,96.9}},    color = {0, 0, 255}));
  connect(line_9_6.n, B9.p) annotation (
    Line(points={{224,113.1},{224,250},{218,250}},      color = {0, 0, 255}));
  connect(line_5_7.p, B5.p) annotation (
    Line(points={{-72,108.9},{-72,20}},    color = {0, 0, 255}));
  connect(line_5_7.n, B7.p) annotation (
    Line(points={{-72,125.1},{-72,256},{-80,256}},      color = {0, 0, 255}));
  connect(B4.p, line_4_5.n) annotation (
    Line(points = {{84, -68}, {84, -55}, {72, -55}, {72, -42}, {-72, -42}, {-72, -29.1}}, color = {0, 0, 255}));
  connect(B4.p, line_6_4.n) annotation (
    Line(points={{84,-68},{83,-68},{83,-62},{98,-62},{98,-40},{224,-40},{224,
          -35.1}},                                                                                 color = {0, 0, 255}));
  connect(gen3.pwPin, B1.p) annotation (
    Line(points = {{84, -115}, {84, -108}}, color = {0, 0, 255}));
  connect(twoWindingTransformer.p, B1.p) annotation (
    Line(points = {{84, -99}, {84, -108}}, color = {0, 0, 255}));
  connect(B4.p, twoWindingTransformer.n) annotation (
    Line(points = {{84, -68}, {84, -77}}, color = {0, 0, 255}));
  connect(gen2.pwPin, B3.p) annotation (
    Line(points = {{277, 250}, {272.25, 250}, {272.25, 250}, {267.5, 250}, {262.75, 252}, {262.75, 252}, {258, 250}}, color = {0, 0, 255}));
  connect(B2.p, gen1.pwPin) annotation (
    Line(points = {{-120, 256}, {-139, 256}}, color = {0, 0, 255}));
  connect(twoWindingTransformer1.p, B3.p) annotation (
    Line(points = {{251, 250}, {258, 250}}, color = {0, 0, 255}));
  connect(twoWindingTransformer1.n, B9.p) annotation (
    Line(points = {{229, 250}, {218, 250}}, color = {0, 0, 255}));
  connect(twoWindingTransformer2.n, B7.p) annotation (
    Line(points = {{-91, 256}, {-91, 256}, {-80, 256}}, color = {0, 0, 255}));
  connect(B2.p, twoWindingTransformer2.p) annotation (
    Line(points = {{-120, 256}, {-115, 256}, {-115, 256}, {-110, 256}, {-111.5, 258}, {-111.5, 258}, {-113, 256}}, color = {0, 0, 255}));
  connect(B6.p, PQ1.p) annotation (
    Line(points = {{224, 14}, {224, 14}, {224, 14}, {224, 14}, {224, -4}, {224, -2}, {247, -2}, {249, -7}, {249, -7}, {247, -12}}, color = {0, 0, 255}));
  connect(B6.p, line_6_4.p) annotation (
    Line(points = {{224, 14}, {224, -18.9}}, color = {0, 0, 255}));
  connect(lOADPQ.p, B5.p) annotation (
    Line(points = {{-99, -4}, {-99, 4}, {-72, 4}, {-72, 20}}, color = {0, 0, 255}));
  connect(B5.p, line_4_5.p) annotation (
    Line(points = {{-72, 20}, {-72, -12.9}}, color = {0, 0, 255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180, -140}, {300, 320}})),
    Icon(coordinateSystem(extent = {{-180, -140}, {300, 320}}, preserveAspectRatio = false)),
    Documentation(info="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>15/07/2015</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
    experiment(
      StopTime=50,
      Interval=0.001,
      Tolerance=1e-05,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
  __OpenModelica_commandLineOptions = "");
end IEEE_9_Buses_with_3T_MTDC;
