package HvdcKundur
  model NetworkSimu
    parameter Real r = 0.0001;
    parameter Real x = 0.001;
    parameter Real b = 0.00175 * 0.5;
    replaceable Data.PF PF_results constrainedby Support.PF_TwoAreas annotation (
       Placement(transformation(extent = {{-220, -40}, {-200, -20}})));
    OpenIPSL.Electrical.Buses.Bus bus3 annotation (
      Placement(transformation(extent = {{170, 20}, {190, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus4 annotation (
      Placement(transformation(extent = {{170, -20}, {190, 0}})));
    OpenIPSL.Electrical.Buses.Bus bus5 annotation (
      Placement(transformation(extent = {{-150, 20}, {-130, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus6 annotation (
      Placement(transformation(extent = {{-110, 20}, {-90, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus8 annotation (
      Placement(transformation(extent = {{-10, 20}, {10, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus10 annotation (
      Placement(transformation(extent = {{90, 20}, {110, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus11 annotation (
      Placement(transformation(extent = {{130, 20}, {150, 40}})));
    Groups.PSSE.AVR.G1 g1(V_0 = PF_results.voltages.V1, angle_0 = PF_results.voltages.A1, P_0 = PF_results.machines.P1_1, Q_0 = PF_results.machines.Q1_1) annotation (
      Placement(transformation(extent = {{-214, 24}, {-202, 36}})));
    Groups.PSSE.AVR.G2 g2(V_0 = PF_results.voltages.V2, angle_0 = PF_results.voltages.A2, P_0 = PF_results.machines.P2_1, Q_0 = PF_results.machines.Q2_1) annotation (
      Placement(transformation(extent = {{-214, -6}, {-202, 6}})));
    Groups.PSSE.AVR.G3 g3(V_0 = PF_results.voltages.V3, angle_0 = PF_results.voltages.A3, P_0 = PF_results.machines.P3_1, Q_0 = PF_results.machines.Q3_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, 30})));
    Groups.PSSE.AVR.G4 g4(V_0 = PF_results.voltages.V4, angle_0 = PF_results.voltages.A4, P_0 = PF_results.machines.P4_1, Q_0 = PF_results.machines.Q4_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, -10})));
    OpenIPSL.Electrical.Branches.PwLine Line6_7(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent = {{-90, 20}, {-70, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_6(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{-130, 20}, {-110, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent={{-36,30},{-16,50}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_2(R = r * 110, X = x * 110, G = 0, B = b * 110,
      t1=5,
      t2=5.3)                                                                                   annotation (
      Placement(transformation(extent={{-36,10},{-16,30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_2(R = r * 110, X = x * 110, G = 0, B = b * 110,
      opening=1)                                                                                annotation (
      Placement(transformation(extent = {{20, 10}, {40, 30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{20, 30}, {40, 50}})));
    OpenIPSL.Electrical.Branches.PwLine Line9_10(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent={{74,20},{94,40}})));
    OpenIPSL.Electrical.Branches.PwLine Line10_11(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{110, 20}, {130, 40}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load7(PQBRAK = 0.7, V_0 = PF_results.voltages.V7, angle_0 = PF_results.voltages.A7, P_0 = PF_results.loads.PL7_1, Q_0 = PF_results.loads.QL7_1) annotation (
      Placement(transformation(extent = {{-78, -26}, {-50, 0}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load9(PQBRAK = 0.7, V_0 = PF_results.voltages.V9, angle_0 = PF_results.voltages.A9, P_0 = PF_results.loads.PL9_1, Q_0 = PF_results.loads.QL9_1) annotation (
      Placement(transformation(extent = {{80, -26}, {50, 0}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_1(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, 20}, {-150, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_2(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, -10}, {-150, 10}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_3(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, 20}, {170, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_4(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, -20}, {170, 0}})));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation (
      Placement(transformation(extent = {{-220, 48}, {-172, 62}})));
    HVDCcomponents.DC_cable dC_cable1(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {-6, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {-52, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {36, 102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
      Placement(visible = true, transformation(origin = {20, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation (
      Placement(visible = true, transformation(origin = {38, 148}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    HVDCcomponents.vdc_control vdc_control1 annotation (
      Placement(visible = true, transformation(origin = {68, 184}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {138, 98}, extent = {{-3.6, -3}, {3.6, 3}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor2(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {-150, 98}, extent = {{3.6, -3}, {-3.6, 3}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step2(height = 0, startTime = 2) annotation (
      Placement(visible = true, transformation(origin = {-50, 174}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step3(height = 400E3, startTime = 0) annotation (
      Placement(visible = true, transformation(origin = {2, 190}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput u annotation (
      Placement(transformation(extent={{-220,142},{-200,162}})));
    Modelica.Blocks.Interfaces.RealOutput y1 annotation (
      Placement(transformation(extent={{-106,-34},{-86,-14}})));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation (
      Placement(transformation(extent={{-132,-30},{-120,-18}})));
    ExcitationGeneration.Bus bus2 annotation (
      Placement(transformation(extent = {{-194, -10}, {-174, 10}})));
    HVDCcomponents.PQ_sensor pQ_sensor3(S_b = 100) annotation (
      Placement(visible = true, transformation(origin={-42,30},    extent = {{-3.6, -3}, {3.6, 3}}, rotation = 180)));
    Modelica.Blocks.Interfaces.RealOutput y3 annotation (
      Placement(transformation(extent={{-16,-12},{-4,0}})));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis1(Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vgd = PF_results.voltages.V7 * 400E3, teta_bus = PF_results.voltages.A7 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {-94, 106}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
  HVDCcomponents.VSC_station_dq0_with_control_PLL_bis vSC_station_dq0_with_control_PLL_bis2(Lr = 0.05, P_ref = 0, Q_ref = 0, Rr = 0.5, Vgd = PF_results.voltages.V9 * 400E3, teta_bus = PF_results.voltages.A9 * Modelica.Constants.pi / 180, tr = 0.003, wg = 2 * Modelica.Constants.pi * 60)  annotation (
      Placement(visible = true, transformation(origin = {90, 112}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction filter1(
      b={1},
      a={0.01,1},
      initType=4,
      y_start=-401.267)                                                       annotation (
      Placement(transformation(extent={{-38,-10},{-30,-2}})));
    LPV.Bus bus9(V_0=PF_results.voltages.V9, angle_0=PF_results.voltages.A9)
      annotation (Placement(transformation(extent={{42,20},{62,40}})));
    LPV.Bus bus7(V_0=PF_results.voltages.V7, angle_0=PF_results.voltages.A7)
      annotation (Placement(transformation(extent={{-70,20},{-50,40}})));

    Modelica.Blocks.Continuous.StateSpace controller(
      A=[-152.0405,156.8325,-173.1547; -236.3337,250.3043,-281.0917; -146.39,
          152.2452,-166.6301],
      B=[2982.4517; 4420.6895; 2191.6908],
      C=[-1.1337,0.88715,-0.63795])
      annotation (Placement(transformation(extent={{14,220},{-6,240}})));
    Modelica.Blocks.Math.Gain switch(k=0)
      annotation (Placement(transformation(extent={{-100,224},{-112,236}})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{136,220},{116,240}})));
    Modelica.Blocks.Sources.Constant const(k=27.466)
      annotation (Placement(transformation(extent={{216,226},{196,246}})));
    Modelica.Blocks.Sources.Step step1(height=0, startTime=2)     annotation (
      Placement(visible = true, transformation(origin={-104,138},   extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    LPV.Bus bus1
      annotation (Placement(transformation(extent={{-196,20},{-176,40}})));
  equation
    connect(vdc_control1.Pref, vSC_station_dq0_with_control_PLL_bis2.Pref) annotation (
      Line(points={{79,185},{86,185},{86,138},{72,138},{72,120},{78.5,120},{
            78.5,120.5}},                                                                          color = {0, 0, 127}));
    connect(step2.y, vSC_station_dq0_with_control_PLL_bis2.Qref) annotation (
      Line(points={{-43.4,174},{-6,174},{-6,126},{62,126},{62,116},{78.5,116},{
            78.5,115.9}},                                                                           color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis2.p, pQ_sensor1.p) annotation (
      Line(points={{101,111.8},{116,111.8},{116,98},{134.4,98},{134.4,98}},    color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis2.pin_n, capacitor2.n) annotation (
      Line(points={{79.2,105.6},{56,105.6},{56,92},{36,92},{36,92}},      color = {0, 0, 255}));
    connect(capacitor2.p, vSC_station_dq0_with_control_PLL_bis2.pin_p) annotation (
      Line(points={{36,112},{58,112},{58,110},{79,110},{79,109.8}},          color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.Qref, step2.y) annotation (
      Line(points={{-62.5,109.9},{-66,109.9},{-66,128},{-32,128},{-32,174},{
            -43.4,174},{-43.4,174}},                                                                      color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis1.p, pQ_sensor2.p) annotation (
      Line(points={{-85,105.8},{-118,105.8},{-118,98},{-146.4,98},{-146.4,98}},     color = {0, 0, 255}));
    connect(capacitor1.n, vSC_station_dq0_with_control_PLL_bis1.pin_n) annotation (
      Line(points={{-52,94},{-66,94},{-66,100},{-63.2,100},{-63.2,99.6}},       color = {0, 0, 255}));
    connect(capacitor1.p, vSC_station_dq0_with_control_PLL_bis1.pin_p) annotation (
      Line(points={{-52,114},{-62,114},{-62,104},{-63,104},{-63,103.8}},          color = {0, 0, 255}));
    connect(vdc_control1.vdcref, step3.y) annotation (
      Line(points = {{56, 188.4}, {12, 188.4}, {12, 190}, {10.8, 190}}, color = {0, 0, 127}));
    connect(vdc_control1.vdc, voltageSensor1.v) annotation (
      Line(points = {{56, 182}, {38, 182}, {38, 159}, {38, 159}}, color = {0, 0, 127}));
    connect(voltageSensor1.n, capacitor2.n) annotation (
      Line(points = {{48, 148}, {48, 148}, {48, 92}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(voltageSensor1.p, capacitor2.p) annotation (
      Line(points = {{28, 148}, {22, 148}, {22, 122}, {36, 122}, {36, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(ground1.p, capacitor2.n) annotation (
      Line(points = {{20, 86}, {36, 86}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(capacitor2.n, dC_cable1.pin_n1) annotation (
      Line(points = {{36, 92}, {12, 92}, {12, 104}, {4.4, 104}, {4.4, 104}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_p1, capacitor2.p) annotation (
      Line(points = {{4.4, 111.8}, {36.4, 111.8}, {36.4, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_n, capacitor1.n) annotation (
      Line(points = {{-16.3, 103.9}, {-32.3, 103.9}, {-32.3, 93.9}, {-52, 93.9}, {-52, 94}}, color = {0, 0, 255}));
    connect(capacitor1.p, dC_cable1.pin_p) annotation (
      Line(points = {{-52, 114}, {-22, 114}, {-22, 112}, {-16.4, 112}, {-16.4, 112}}, color = {0, 0, 255}));
    connect(Line6_7.p, bus6.p) annotation (
      Line(points = {{-89, 30}, {-89, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.n, bus6.p) annotation (
      Line(points = {{-111, 30}, {-111, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.p, bus5.p) annotation (
      Line(points = {{-129, 30}, {-129, 30}, {-140, 30}}, color = {0, 0, 255}));
    connect(Line8_9_2.p, bus8.p) annotation (
      Line(points = {{21, 20}, {6, 20}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line8_9_1.p, bus8.p) annotation (
      Line(points = {{21, 40}, {6, 40}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line7_8_2.n, bus8.p) annotation (
      Line(points={{-17,20},{-6,20},{-6,30},{0,30}},                    color = {0, 0, 255}));
    connect(Line7_8_1.n, bus8.p) annotation (
      Line(points={{-17,40},{-6,40},{-6,30},{0,30}},          color = {0, 0, 255}));
    connect(Line9_10.n, bus10.p) annotation (
      Line(points={{93,30},{100,30}},                color = {0, 0, 255}));
    connect(bus10.p, Line10_11.p) annotation (
      Line(points = {{100, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(Line10_11.n, bus11.p) annotation (
      Line(points = {{129, 30}, {129, 30}, {140, 30}}, color = {0, 0, 255}));
    connect(g4.pwPin, bus4.p) annotation (
      Line(points = {{201.4, -10}, {201.4, -10}, {180, -10}}, color = {0, 0, 255}));
    connect(g3.pwPin, bus3.p) annotation (
      Line(points = {{201.4, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(Load9.p, Line9_10.p) annotation (
      Line(points={{65,0},{66,0},{66,30},{75,30}},          color = {0, 0, 255}));
    connect(bus5.p, Line5_1.n) annotation (
      Line(points = {{-140, 30}, {-151, 30}}, color = {0, 0, 255}));
    connect(Line5_2.n, bus6.p) annotation (
      Line(points = {{-151, 0}, {-104, 0}, {-104, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(bus11.p, Line5_3.p) annotation (
      Line(points = {{140, 30}, {151, 30}}, color = {0, 0, 255}));
    connect(Line5_3.n, bus3.p) annotation (
      Line(points = {{169, 30}, {169, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(bus4.p, Line5_4.n) annotation (
      Line(points = {{180, -10}, {169, -10}}, color = {0, 0, 255}));
    connect(Line5_4.p, Line10_11.p) annotation (
      Line(points = {{151, -10}, {104, -10}, {104, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(g2.pwPin, bus2.p) annotation (
      Line(points = {{-201.4, 0}, {-184, 0}}, color = {0, 0, 255}));
    connect(bus2.p, Line5_2.p) annotation (
      Line(points = {{-184, 0}, {-169, 0}}, color = {0, 0, 255}));
    connect(pQ_sensor3.p, Line7_8_1.p) annotation (
      Line(points={{-38.4,30},{-35,30},{-35,40}},        color = {0, 0, 255}));
    connect(Line7_8_2.p, Line7_8_1.p) annotation (
      Line(points={{-35,20},{-36,20},{-36,30},{-35,30},{-35,40}},            color = {0, 0, 255}));
    connect(y3, filter1.y)
      annotation (Line(points={{-10,-6},{-29.6,-6}}, color={0,0,127}));
    connect(filter1.u, pQ_sensor3.p12) annotation (Line(points={{-38.8,-6},{-46,
            -6},{-46,6},{-45.6,6},{-45.6,27.6}}, color={0,0,127}));
    connect(Line8_9_2.n, bus9.p) annotation (Line(points={{39,20},{44,20},{44,
            30},{52,30}}, color={0,0,255}));
    connect(Line8_9_1.n, bus9.p) annotation (Line(points={{39,40},{44,40},{44,
            30},{52,30}}, color={0,0,255}));
    connect(bus9.p, Line9_10.p)
      annotation (Line(points={{52,30},{75,30}}, color={0,0,255}));
    connect(pQ_sensor1.n, bus9.p) annotation (Line(points={{141.6,98},{158,98},
            {158,58},{52,58},{52,30}}, color={0,0,255}));
    connect(Line6_7.n, bus7.p)
      annotation (Line(points={{-71,30},{-60,30}}, color={0,0,255}));
    connect(bus7.p, pQ_sensor3.n)
      annotation (Line(points={{-60,30},{-45.6,30}}, color={0,0,255}));
    connect(pQ_sensor2.n, bus7.p) annotation (Line(points={{-153.6,98},{-158,98},
            {-158,60},{-60,60},{-60,30}}, color={0,0,255}));
    connect(Load7.p, bus7.p)
      annotation (Line(points={{-64,0},{-64,30},{-60,30}}, color={0,0,255}));
    connect(switch.u, controller.y[1])
      annotation (Line(points={{-98.8,230},{-7,230}}, color={0,0,127}));
    connect(add.y, controller.u[1])
      annotation (Line(points={{115,230},{16,230}}, color={0,0,127}));
    connect(const.y, add.u1)
      annotation (Line(points={{195,236},{138,236}}, color={0,0,127}));
    connect(step1.y, vSC_station_dq0_with_control_PLL_bis1.Pref) annotation (
        Line(points={{-97.4,138},{-94,138},{-94,114.5},{-62.5,114.5}}, color={0,
            0,127}));
    connect(switch.y, g1.u) annotation (Line(points={{-112.6,230},{-232,230},{
            -232,31.2},{-214.48,31.2}}, color={0,0,127}));
    connect(u, g1.u) annotation (Line(points={{-210,152},{-232,152},{-232,31.2},
            {-214.48,31.2}}, color={0,0,127}));
    connect(add1.y, add.u2) annotation (Line(points={{-119.4,-24},{-112,-24},{
            -112,-34},{216,-34},{216,184},{156,184},{156,224},{138,224}}, color=
           {0,0,127}));
    connect(g1.pwPin, bus1.p) annotation (Line(points={{-201.4,30},{-194,30},{
            -194,30},{-186,30}}, color={0,0,255}));
    connect(Line5_1.p, bus1.p)
      annotation (Line(points={{-169,30},{-186,30}}, color={0,0,255}));
    connect(bus1.Angle, add1.u1) annotation (Line(points={{-176.6,35},{-140,35},
            {-140,-20.4},{-133.2,-20.4}}, color={0,0,127}));
    connect(add1.u2, bus2.Angle) annotation (Line(points={{-133.2,-27.6},{-148,
            -27.6},{-148,4.8},{-174,4.8}}, color={0,0,127}));
    connect(y1, add.u2) annotation (Line(points={{-96,-24},{-112,-24},{-112,-34},
            {216,-34},{216,184},{156,184},{156,224},{138,224}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-240,-60},
              {220,220}}),                                                                       graphics={  Text(lineColor = {28, 108, 200}, extent={{
                -72,-44},{50,-52}},                                                                                                                                             textString = "Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
      Icon(coordinateSystem(extent={{-240,-60},{220,220}},      preserveAspectRatio = false)),
      Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
      experiment(
        StopTime=20,
        Interval=0.05,
        __Dymola_Algorithm="Dassl"),
      __OpenModelica_commandLineOptions = "");
  end NetworkSimu;

    model NetworkSysId
    parameter Real r = 0.0001;
    parameter Real x = 0.001;
    parameter Real b = 0.00175 * 0.5;
    replaceable Data.PF PF_results constrainedby Support.PF_TwoAreas annotation (
       Placement(transformation(extent = {{-220, -40}, {-200, -20}})));
    OpenIPSL.Electrical.Buses.Bus bus3 annotation (
      Placement(transformation(extent = {{170, 20}, {190, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus4 annotation (
      Placement(transformation(extent = {{170, -20}, {190, 0}})));
    OpenIPSL.Electrical.Buses.Bus bus5 annotation (
      Placement(transformation(extent = {{-150, 20}, {-130, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus6 annotation (
      Placement(transformation(extent = {{-110, 20}, {-90, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus8 annotation (
      Placement(transformation(extent = {{-10, 20}, {10, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus10 annotation (
      Placement(transformation(extent = {{90, 20}, {110, 40}})));
    OpenIPSL.Electrical.Buses.Bus bus11 annotation (
      Placement(transformation(extent = {{130, 20}, {150, 40}})));
    Groups.PSSE.AVR.G1 g1(V_0 = PF_results.voltages.V1, angle_0 = PF_results.voltages.A1, P_0 = PF_results.machines.P1_1, Q_0 = PF_results.machines.Q1_1) annotation (
      Placement(transformation(extent = {{-214, 24}, {-202, 36}})));
    Groups.PSSE.AVR.G2 g2(V_0 = PF_results.voltages.V2, angle_0 = PF_results.voltages.A2, P_0 = PF_results.machines.P2_1, Q_0 = PF_results.machines.Q2_1) annotation (
      Placement(transformation(extent = {{-214, -6}, {-202, 6}})));
    Groups.PSSE.AVR.G3 g3(V_0 = PF_results.voltages.V3, angle_0 = PF_results.voltages.A3, P_0 = PF_results.machines.P3_1, Q_0 = PF_results.machines.Q3_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, 30})));
    Groups.PSSE.AVR.G4 g4(V_0 = PF_results.voltages.V4, angle_0 = PF_results.voltages.A4, P_0 = PF_results.machines.P4_1, Q_0 = PF_results.machines.Q4_1) annotation (
      Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {208, -10})));
    OpenIPSL.Electrical.Branches.PwLine Line6_7(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent = {{-90, 20}, {-70, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_6(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{-130, 20}, {-110, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
    OpenIPSL.Electrical.Branches.PwLine Line7_8_2(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{-40, 10}, {-20, 30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_2(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{20, 10}, {40, 30}})));
    OpenIPSL.Electrical.Branches.PwLine Line8_9_1(R = r * 110, X = x * 110, G = 0, B = b * 110) annotation (
      Placement(transformation(extent = {{20, 30}, {40, 50}})));
    OpenIPSL.Electrical.Branches.PwLine Line9_10(R = r * 10, X = x * 10, G = 0, B = b * 10) annotation (
      Placement(transformation(extent = {{70, 20}, {90, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line10_11(R = r * 25, X = x * 25, G = 0, B = b * 25) annotation (
      Placement(transformation(extent = {{110, 20}, {130, 40}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load7(PQBRAK = 0.7, V_0 = PF_results.voltages.V7, angle_0 = PF_results.voltages.A7, P_0 = PF_results.loads.PL7_1, Q_0 = PF_results.loads.QL7_1) annotation (
      Placement(transformation(extent = {{-80, -26}, {-52, 0}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load9(PQBRAK = 0.7, V_0 = PF_results.voltages.V9, angle_0 = PF_results.voltages.A9, P_0 = PF_results.loads.PL9_1, Q_0 = PF_results.loads.QL9_1) annotation (
      Placement(transformation(extent = {{80, -26}, {50, 0}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_1(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, 20}, {-150, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_2(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{-170, -10}, {-150, 10}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_3(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, 20}, {170, 40}})));
    OpenIPSL.Electrical.Branches.PwLine Line5_4(G = 0, R = 0, X = 0.01667, B = 0) annotation (
      Placement(transformation(extent = {{150, -20}, {170, 0}})));
    inner OpenIPSL.Electrical.SystemBase SysData(fn = 60) annotation (
      Placement(transformation(extent = {{-220, 48}, {-172, 62}})));
    HVDCcomponents.DC_cable dC_cable1(Vinit = 400E3, length = 200) annotation (
      Placement(visible = true, transformation(origin = {-6, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor1(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {-52, 104}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Capacitor capacitor2(C = 195E-6, v(fixed = true, start = 400E3)) annotation (
      Placement(visible = true, transformation(origin = {36, 102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
      Placement(visible = true, transformation(origin = {20, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor1 annotation (
      Placement(visible = true, transformation(origin = {38, 148}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    HVDCcomponents.vdc_control vdc_control1 annotation (
      Placement(visible = true, transformation(origin = {68, 184}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor1(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {138, 98}, extent = {{-3.6, -3}, {3.6, 3}}, rotation = 0)));
    HVDCcomponents.PQ_sensor pQ_sensor2(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {-150, 98}, extent = {{3.6, -3}, {-3.6, 3}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step2(height = 0, startTime = 2) annotation (
      Placement(visible = true, transformation(origin = {-50, 174}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step3(height = 400E3, startTime = 0) annotation (
      Placement(visible = true, transformation(origin = {2, 190}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    ExcitationGeneration.Bus bus7(V_0 = PF_results.voltages.V7, angle_0 = PF_results.voltages.A7, displayPF = true)  annotation (
      Placement(transformation(extent = {{-72, 20}, {-52, 40}})));
    ExcitationGeneration.Bus bus9(V_0 = PF_results.voltages.V9, angle_0 = PF_results.voltages.A9, displayPF = true)  annotation (
      Placement(transformation(extent = {{48, 20}, {68, 40}})));
    Modelica.Blocks.Interfaces.RealOutput y1 annotation (
      Placement(transformation(extent = {{78, 70}, {98, 90}})));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation (
      Placement(transformation(extent = {{54, 74}, {66, 86}})));
    Modelica.Blocks.Interfaces.RealInput P_ref annotation (
      Placement(transformation(extent = {{-220, 104}, {-180, 144}})));
    Modelica.Blocks.Math.Gain gain(k = 1e6) annotation (
      Placement(transformation(extent = {{-174, 120}, {-166, 128}})));
    HVDCcomponents.PQ_sensor pQ_sensor3(S_b = 100) annotation (
      Placement(visible = true, transformation(origin = {-46, 30}, extent = {{-3.6, -3}, {3.6, 3}}, rotation = 180)));
    Modelica.Blocks.Continuous.TransferFunction filter(b = {1}, a = {0.1, 1}) annotation (
      Placement(transformation(extent = {{-144, 110}, {-134, 120}})));
    Modelica.Blocks.Interfaces.RealOutput y3 annotation (
      Placement(transformation(extent = {{-24, -8}, {-4, 12}})));
    HVDCcomponents.VSC_station_dq0_with_control_PLL_bis
      vSC_station_dq0_with_control_PLL_bis1(
      Lr=0.05,
      P_ref=0,
      Q_ref=0,
      Rr=0.5,
      Vgd=PF_results.voltages.V7*400E3,
      teta_bus=PF_results.voltages.A7*Modelica.Constants.pi/180,
      tr=0.003,
      wg=2*Modelica.Constants.pi*60) annotation (
      Placement(visible = true, transformation(origin = {-88, 106}, extent = {{40, -13}, {-20, 12}}, rotation = 0)));
    HVDCcomponents.VSC_station_dq0_with_control_PLL_bis
      vSC_station_dq0_with_control_PLL_bis2(
      Lr=0.05,
      P_ref=0,
      Q_ref=0,
      Rr=0.5,
      Vgd=PF_results.voltages.V9*400E3,
      teta_bus=PF_results.voltages.A9*Modelica.Constants.pi/180,
      tr=0.003,
      wg=2*Modelica.Constants.pi*60) annotation (
      Placement(visible = true, transformation(origin = {90, 108}, extent = {{-20, -13}, {40, 12}}, rotation = 0)));
      LPV.Bus bus1
        annotation (Placement(transformation(extent={{-190,20},{-170,40}})));
      LPV.Bus bus2
      annotation (Placement(transformation(extent={{-190,-10},{-170,10}})));
      Modelica.Blocks.Math.Add add2(k2=-1)   annotation (
        Placement(transformation(extent={{-130,-44},{-118,-32}})));
      Modelica.Blocks.Sources.Constant const(k=27.466)
        annotation (Placement(transformation(extent={{216,220},{196,240}})));
      Modelica.Blocks.Math.Add add(k1=-1)
        annotation (Placement(transformation(extent={{136,214},{116,234}})));
      Modelica.Blocks.Continuous.StateSpace controller(
      A=[-152.0405,156.8325,-173.1547; -236.3337,250.3043,-281.0917; -146.39,
          152.2452,-166.6301],
      B=[2982.4517; 4420.6895; 2191.6908],
      C=[-1.1337,0.88715,-0.63795])
        annotation (Placement(transformation(extent={{14,214},{-6,234}})));
      Modelica.Blocks.Math.Gain switch(k=0)
        annotation (Placement(transformation(extent={{-100,218},{-112,230}})));
    equation
    connect(vSC_station_dq0_with_control_PLL_bis2.Qref, step2.y) annotation (
      Line(points={{78.5,111.9},{60,111.9},{60,130},{-24,130},{-24,174},{-43.4,
            174},{-43.4,174}},                                                                         color = {0, 0, 127}));
    connect(vdc_control1.Pref, vSC_station_dq0_with_control_PLL_bis2.Pref) annotation (
      Line(points={{79,185},{92,185},{92,132},{72,132},{72,116},{78.5,116},{
            78.5,116.5}},                                                                          color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis2.pin_n, capacitor2.n) annotation (
      Line(points={{79.2,101.6},{60,101.6},{60,92},{36,92},{36,92}},      color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis2.pin_p, capacitor2.p) annotation (
      Line(points={{79,105.8},{60,105.8},{60,112},{36,112},{36,112}},        color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis2.p, pQ_sensor1.p) annotation (
      Line(points={{101,107.8},{116,107.8},{116,98},{134.4,98},{134.4,98}},    color = {0, 0, 255}));
    connect(step2.y, vSC_station_dq0_with_control_PLL_bis1.Qref) annotation (
      Line(points={{-43.4,174},{-34,174},{-34,124},{-68,124},{-68,110},{-56.5,
            110},{-56.5,109.9}},                                                                          color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis1.Pref, filter.y) annotation (
      Line(points={{-56.5,114.5},{-72,114.5},{-72,124},{-122,124},{-122,116},{
            -133.5,116},{-133.5,115}},                                                                        color = {0, 0, 127}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_n, capacitor1.n) annotation (
      Line(points={{-57.2,99.6},{-66,99.6},{-66,94},{-52,94},{-52,94}},        color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.pin_p, capacitor1.p) annotation (
      Line(points={{-57,103.8},{-62,103.8},{-62,114},{-52,114},{-52,114}},        color = {0, 0, 255}));
    connect(vSC_station_dq0_with_control_PLL_bis1.p, pQ_sensor2.p) annotation (
      Line(points={{-79,105.8},{-108,105.8},{-108,98},{-146.4,98},{-146.4,98}},     color = {0, 0, 255}));
    connect(vdc_control1.vdcref, step3.y) annotation (
      Line(points = {{56, 188.4}, {12, 188.4}, {12, 190}, {10.8, 190}}, color = {0, 0, 127}));
    connect(vdc_control1.vdc, voltageSensor1.v) annotation (
      Line(points = {{56, 182}, {38, 182}, {38, 159}, {38, 159}}, color = {0, 0, 127}));
    connect(voltageSensor1.n, capacitor2.n) annotation (
      Line(points = {{48, 148}, {48, 148}, {48, 92}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(voltageSensor1.p, capacitor2.p) annotation (
      Line(points = {{28, 148}, {22, 148}, {22, 122}, {36, 122}, {36, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(ground1.p, capacitor2.n) annotation (
      Line(points = {{20, 86}, {36, 86}, {36, 92}, {36, 92}}, color = {0, 0, 255}));
    connect(capacitor2.n, dC_cable1.pin_n1) annotation (
      Line(points = {{36, 92}, {12, 92}, {12, 104}, {4.4, 104}, {4.4, 104}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_p1, capacitor2.p) annotation (
      Line(points = {{4.4, 111.8}, {36.4, 111.8}, {36.4, 112}, {36, 112}}, color = {0, 0, 255}));
    connect(dC_cable1.pin_n, capacitor1.n) annotation (
      Line(points = {{-16.3, 103.9}, {-32.3, 103.9}, {-32.3, 93.9}, {-52, 93.9}, {-52, 94}}, color = {0, 0, 255}));
    connect(capacitor1.p, dC_cable1.pin_p) annotation (
      Line(points = {{-52, 114}, {-22, 114}, {-22, 112}, {-16.4, 112}, {-16.4, 112}}, color = {0, 0, 255}));
    connect(Line6_7.p, bus6.p) annotation (
      Line(points = {{-89, 30}, {-89, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.n, bus6.p) annotation (
      Line(points = {{-111, 30}, {-111, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(Line5_6.p, bus5.p) annotation (
      Line(points = {{-129, 30}, {-129, 30}, {-140, 30}}, color = {0, 0, 255}));
    connect(Line8_9_2.p, bus8.p) annotation (
      Line(points = {{21, 20}, {6, 20}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line8_9_1.p, bus8.p) annotation (
      Line(points = {{21, 40}, {6, 40}, {6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line7_8_2.n, bus8.p) annotation (
      Line(points = {{-21, 20}, {-6, 20}, {-6, 22}, {-6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line7_8_1.n, bus8.p) annotation (
      Line(points = {{-21, 40}, {-6, 40}, {-6, 30}, {0, 30}}, color = {0, 0, 255}));
    connect(Line9_10.n, bus10.p) annotation (
      Line(points = {{89, 30}, {89, 30}, {100, 30}}, color = {0, 0, 255}));
    connect(bus10.p, Line10_11.p) annotation (
      Line(points = {{100, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(Line10_11.n, bus11.p) annotation (
      Line(points = {{129, 30}, {129, 30}, {140, 30}}, color = {0, 0, 255}));
    connect(g4.pwPin, bus4.p) annotation (
      Line(points = {{201.4, -10}, {201.4, -10}, {180, -10}}, color = {0, 0, 255}));
    connect(g3.pwPin, bus3.p) annotation (
      Line(points = {{201.4, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(Load9.p, Line9_10.p) annotation (
      Line(points = {{65, 0}, {66, 0}, {66, 30}, {71, 30}}, color = {0, 0, 255}));
    connect(bus5.p, Line5_1.n) annotation (
      Line(points = {{-140, 30}, {-151, 30}}, color = {0, 0, 255}));
    connect(Line5_2.n, bus6.p) annotation (
      Line(points = {{-151, 0}, {-104, 0}, {-104, 30}, {-100, 30}}, color = {0, 0, 255}));
    connect(bus11.p, Line5_3.p) annotation (
      Line(points = {{140, 30}, {151, 30}}, color = {0, 0, 255}));
    connect(Line5_3.n, bus3.p) annotation (
      Line(points = {{169, 30}, {169, 30}, {180, 30}}, color = {0, 0, 255}));
    connect(bus4.p, Line5_4.n) annotation (
      Line(points = {{180, -10}, {169, -10}}, color = {0, 0, 255}));
    connect(Line5_4.p, Line10_11.p) annotation (
      Line(points = {{151, -10}, {104, -10}, {104, 30}, {111, 30}}, color = {0, 0, 255}));
    connect(Line6_7.n, bus7.p) annotation (
      Line(points = {{-71, 30}, {-62, 30}}, color = {0, 0, 255}));
    connect(Load7.p, bus7.p) annotation (
      Line(points = {{-66, 0}, {-66, 30}, {-62, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor2.n, bus7.p) annotation (
      Line(points = {{-153.6, 98}, {-162, 98}, {-162, 56}, {-62, 56}, {-62, 30}}, color = {0, 0, 255}));
    connect(Line8_9_1.n, bus9.p) annotation (
      Line(points = {{39, 40}, {44, 40}, {44, 30}, {58, 30}}, color = {0, 0, 255}));
    connect(Line8_9_2.n, bus9.p) annotation (
      Line(points = {{39, 20}, {44, 20}, {44, 30}, {58, 30}}, color = {0, 0, 255}));
    connect(bus9.p, Line9_10.p) annotation (
      Line(points = {{58, 30}, {71, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor1.n, bus9.p) annotation (
      Line(points = {{141.6, 98}, {160, 98}, {160, 56}, {58, 56}, {58, 30}}, color = {0, 0, 255}));
    connect(add1.u1, bus7.Angle) annotation (
      Line(points = {{52.8, 83.6}, {52.8, 84}, {-52, 84}, {-52, 34.8}}, color = {0, 0, 127}));
    connect(add1.u2, bus9.Angle) annotation (
      Line(points = {{52.8, 76.4}, {38, 76.4}, {38, 48}, {68, 48}, {68, 34.8}}, color = {0, 0, 127}));
    connect(add1.y, y1) annotation (
      Line(points = {{66.6, 80}, {88, 80}}, color = {0, 0, 127}));
    connect(P_ref, gain.u) annotation (
      Line(points = {{-200, 124}, {-174.8, 124}}, color = {0, 0, 127}));
    connect(bus7.p, pQ_sensor3.n) annotation (
      Line(points = {{-62, 30}, {-49.6, 30}}, color = {0, 0, 255}));
    connect(pQ_sensor3.p, Line7_8_2.p) annotation (
      Line(points = {{-42.4, 30}, {-39, 30}, {-39, 20}}, color = {0, 0, 255}));
    connect(Line7_8_1.p, Line7_8_2.p) annotation (
      Line(points = {{-39, 40}, {-40, 40}, {-40, 30}, {-39, 30}, {-39, 20}}, color = {0, 0, 255}));
    connect(pQ_sensor3.p12, y3) annotation (
      Line(points = {{-49.6, 27.6}, {-52, 27.6}, {-52, 2}, {-14, 2}}, color = {0, 0, 127}));
    connect(filter.u, gain.y) annotation (
      Line(points = {{-145, 115}, {-156.5, 115}, {-156.5, 124}, {-165.6, 124}}, color = {0, 0, 127}));
    connect(bus1.p, Line5_1.p)
      annotation (Line(points={{-180,30},{-169,30}}, color={0,0,255}));
    connect(g1.pwPin, bus1.p)
      annotation (Line(points={{-201.4,30},{-180,30}}, color={0,0,255}));
    connect(Line5_2.p, bus2.p)
      annotation (Line(points={{-169,0},{-180,0}}, color={0,0,255}));
    connect(g2.pwPin, bus2.p)
      annotation (Line(points={{-201.4,0},{-180,0}}, color={0,0,255}));
    connect(add2.u1, bus1.Angle) annotation (Line(points={{-131.2,-34.4},{-152,
            -34.4},{-152,35},{-170.6,35}}, color={0,0,127}));
    connect(add2.u2, bus2.Angle) annotation (Line(points={{-131.2,-41.6},{
            -131.2,-42},{-160,-42},{-160,5},{-170.6,5}}, color={0,0,127}));
      connect(add.y,controller. u[1])
        annotation (Line(points={{115,224},{16,224}}, color={0,0,127}));
      connect(switch.u,controller. y[1])
        annotation (Line(points={{-98.8,224},{-7,224}}, color={0,0,127}));
      connect(switch.y, g1.u) annotation (Line(points={{-112.6,224},{-232,224},
            {-232,31.2},{-214.48,31.2}},  color={0,0,127}));
    connect(add.u2, add2.y) annotation (Line(points={{138,218},{184,218},{184,
            78},{226,78},{226,-38},{-117.4,-38}}, color={0,0,127}));
    connect(const.y, add.u1) annotation (Line(points={{195,230},{138,230},{138,
            230}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-240, -80}, {220, 220}}), graphics={  Text(lineColor = {28, 108, 200}, extent = {{-72, -66}, {50, -74}}, textString = "Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
      Icon(coordinateSystem(extent = {{-240, -80}, {220, 220}}, preserveAspectRatio = false)),
      Documentation(info = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Klein-Rogers-Kundur power network</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-12-01</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
      experiment(StopTime = 10, Interval = 0.01, Tolerance = 0.001),
      __OpenModelica_commandLineOptions = "");
    end NetworkSysId;
  annotation (
    uses(Modelica(version = "3.2.3"), OpenIPSL(version = "1.5.0"),
      LPV(version="1.5.0"),
      Modelica_LinearSystems2(version="2.3.5")));
end HvdcKundur;
