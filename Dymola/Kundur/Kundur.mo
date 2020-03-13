within ;
package Kundur
  model NetworkSimu
  parameter Real r=0.0001;
  parameter Real x=0.001;
  parameter Real b=0.00175*0.5;
  replaceable Data.PF PF_results constrainedby Support.PF_TwoAreas
    annotation (Placement(transformation(extent={{-220,-78},{-200,-58}})));
  OpenIPSL.Electrical.Buses.Bus bus5
    annotation (Placement(transformation(extent={{-150,20},{-130,40}})));
  OpenIPSL.Electrical.Buses.Bus bus6
    annotation (Placement(transformation(extent={{-110,20},{-90,40}})));
  OpenIPSL.Electrical.Buses.Bus bus7
    annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
  OpenIPSL.Electrical.Buses.Bus bus8
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  OpenIPSL.Electrical.Buses.Bus bus9
    annotation (Placement(transformation(extent={{50,20},{70,40}})));
  OpenIPSL.Electrical.Buses.Bus bus10
    annotation (Placement(transformation(extent={{90,20},{110,40}})));
  OpenIPSL.Electrical.Buses.Bus bus11
    annotation (Placement(transformation(extent={{130,20},{150,40}})));
  Groups.PSSE.No_Controls.G1 g1(
    V_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    P_0=PF_results.machines.P1_1,
    Q_0=PF_results.machines.Q1_1)
    annotation (Placement(transformation(extent={{-214,42},{-202,54}})));
  Groups.PSSE.No_Controls.G2 g2(
    V_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    P_0=PF_results.machines.P2_1,
    Q_0=PF_results.machines.Q2_1)
    annotation (Placement(transformation(extent={{-214,-26},{-202,-14}})));
  Groups.PSSE.No_Controls.G3 g3(
    V_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    P_0=PF_results.machines.P3_1,
    Q_0=PF_results.machines.Q3_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,66})));
  Groups.PSSE.No_Controls.G4 g4(
    V_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    P_0=PF_results.machines.P4_1,
    Q_0=PF_results.machines.Q4_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,-30})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7(
    R=r*10,
    X=x*10,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_6(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{-130,20},{-110,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,30},{40,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line9_10(
    R=r*10,
    X=x*10,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{70,20},{90,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line10_11(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{110,20},{130,40}})));

  OpenIPSL.Electrical.Loads.PSSE.Load Load7(
    PQBRAK=0.7,
    V_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7,
    P_0=PF_results.loads.PL7_1,
    Q_0=PF_results.loads.QL7_1)
    annotation (Placement(transformation(extent={{-80,-26},{-52,0}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load9(
    PQBRAK=0.7,
    V_0=PF_results.voltages.V9,
    angle_0=PF_results.voltages.A9,
    P_0=PF_results.loads.PL9_1,
    Q_0=PF_results.loads.QL9_1)
    annotation (Placement(transformation(extent={{80,-26},{50,0}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_1(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-170,20},{-150,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_2(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_3(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{150,20},{170,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_4(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{150,-20},{170,0}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-220,80},{-172,94}})));
    ExcitationGeneration.Bus bus1
      annotation (Placement(transformation(extent={{-194,38},{-174,58}})));
    ExcitationGeneration.Bus bus2
      annotation (Placement(transformation(extent={{-192,-30},{-172,-10}})));
    ExcitationGeneration.Bus bus3
      annotation (Placement(transformation(extent={{190,56},{170,76}})));
    ExcitationGeneration.Bus bus4
      annotation (Placement(transformation(extent={{194,-40},{174,-20}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu
      annotation (Placement(transformation(extent={{110,48},{130,68}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu_load(
        generateMultiSine_Q(M=0))
      annotation (Placement(transformation(extent={{-160,-54},{-140,-34}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-80,120},{-60,140}})));
    Modelica.Blocks.Interfaces.RealOutput y1_u
      annotation (Placement(transformation(extent={{142,48},{152,58}})));
    Modelica.Blocks.Interfaces.RealOutput y2
      annotation (Placement(transformation(extent={{-44,124},{-32,136}})));
    Modelica.Blocks.Interfaces.RealOutput n_load
      annotation (Placement(transformation(extent={{-134,-52},{-128,-46}})));
    Modelica.Blocks.Math.Add add1(k2=-1)
      annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
    Modelica.Blocks.Interfaces.RealOutput y3
      annotation (Placement(transformation(extent={{-52,70},{-32,90}})));
    HVDCcomponents.PQ_sensor pQ_sensor
      annotation (Placement(transformation(extent={{-64,28},{-60,32}})));
    Modelica.Blocks.Interfaces.RealOutput y4
      annotation (Placement(transformation(extent={{-52,38},{-32,58}})));
  equation
  connect(Line6_7.p, bus6.p) annotation (
    Line(points={{-89,30},{-89,30},{-100,30}},                  color = {0, 0, 255}));
  connect(Line5_6.n, bus6.p) annotation (
    Line(points={{-111,30},{-111,30},{-100,30}},                color = {0, 0, 255}));
  connect(Line5_6.p, bus5.p) annotation (
    Line(points={{-129,30},{-129,30},{-140,30}},                color = {0, 0, 255}));
  connect(Line8_9_2.n, bus9.p) annotation (
    Line(points={{39,20},{54,20},{54,30},{60,30}},               color = {0, 0, 255}));
  connect(Line8_9_1.n, bus9.p) annotation (
    Line(points={{39,40},{54,40},{54,30},{60,30}},               color = {0, 0, 255}));
  connect(Line8_9_2.p, bus8.p) annotation (
    Line(points={{21,20},{6,20},{6,30},{0,30}},               color = {0, 0, 255}));
  connect(Line8_9_1.p, bus8.p) annotation (
    Line(points={{21,40},{6,40},{6,30},{0,30}},               color = {0, 0, 255}));
  connect(Line7_8_2.n, bus8.p) annotation (
    Line(points={{-21,20},{-6,20},{-6,22},{-6,30},{0,30}},                 color = {0, 0, 255}));
  connect(Line7_8_1.n, bus8.p) annotation (
    Line(points={{-21,40},{-6,40},{-6,30},{0,30}},               color = {0, 0, 255}));
  connect(Line7_8_1.p, bus7.p) annotation (
    Line(points={{-39,40},{-54,40},{-54,30},{-58,30}},               color = {0, 0, 255}));
  connect(Line7_8_2.p, bus7.p) annotation (
    Line(points={{-39,20},{-54,20},{-54,30},{-58,30}},               color = {0, 0, 255}));
  connect(bus9.p, Line9_10.p) annotation (
    Line(points={{60,30},{71,30}},           color = {0, 0, 255}));
  connect(Line9_10.n, bus10.p) annotation (
    Line(points={{89,30},{89,30},{100,30}},                  color = {0, 0, 255}));
  connect(bus10.p, Line10_11.p) annotation (
    Line(points={{100,30},{111,30}},          color = {0, 0, 255}));
  connect(Line10_11.n, bus11.p) annotation (
    Line(points={{129,30},{129,30},{140,30}},                color = {0, 0, 255}));
  connect(Load9.p, Line9_10.p) annotation (
    Line(points={{65,0},{66,0},{66,30},{71,30}},                   color = {0, 0, 255}));
  connect(bus5.p, Line5_1.n) annotation (
    Line(points={{-140,30},{-151,30}},          color = {0, 0, 255}));
  connect(Line5_2.n, bus6.p) annotation (
    Line(points={{-151,0},{-104,0},{-104,30},{-100,30}},              color = {0, 0, 255}));
  connect(bus11.p, Line5_3.p) annotation (
    Line(points={{140,30},{151,30}},          color = {0, 0, 255}));
  connect(Line5_4.p, Line10_11.p) annotation (
    Line(points={{151,-10},{104,-10},{104,30},{111,30}},                  color = {0, 0, 255}));
    connect(bus1.p, bus1.p)
      annotation (Line(points={{-184,48},{-184,48}}, color={0,0,255}));
    connect(bus1.p, Line5_1.p) annotation (Line(points={{-184,48},{-178,48},{
            -178,30},{-169,30}}, color={0,0,255}));
    connect(bus2.p, Line5_2.p) annotation (Line(points={{-182,-20},{-176,-20},{
            -176,0},{-169,0}}, color={0,0,255}));
    connect(g2.pwPin, bus2.p)
      annotation (Line(points={{-201.4,-20},{-182,-20}}, color={0,0,255}));
    connect(g1.pwPin, bus1.p)
      annotation (Line(points={{-201.4,48},{-184,48}}, color={0,0,255}));
    connect(Line5_3.n, bus3.p) annotation (Line(points={{169,30},{174,30},{174,
            66},{180,66}}, color={0,0,255}));
    connect(g3.pwPin, bus3.p)
      annotation (Line(points={{201.4,66},{180,66}}, color={0,0,255}));
    connect(bus4.p, Line5_4.n) annotation (Line(points={{184,-30},{178,-30},{
            178,-10},{169,-10}}, color={0,0,255}));
    connect(bus4.p, g4.pwPin)
      annotation (Line(points={{184,-30},{201.4,-30}}, color={0,0,255}));
    connect(multisine_Noise_Simu.vi, bus3.Vi) annotation (Line(points={{126.4,
            68},{126.4,88},{152,88},{152,66.8},{170,66.8}}, color={0,0,127}));
    connect(bus3.Vr, multisine_Noise_Simu.vr) annotation (Line(points={{170,
            64.8},{148,64.8},{148,86},{123.6,86},{123.6,68}}, color={0,0,127}));
    connect(multisine_Noise_Simu.pwPin, bus3.p) annotation (Line(points={{129,
            61},{174,61},{174,66},{180,66}}, color={0,0,255}));
    connect(bus2.Vi, multisine_Noise_Simu_load.vi) annotation (Line(points={{
            -172,-19.2},{-143.6,-19.2},{-143.6,-34}}, color={0,0,127}));
    connect(bus2.Vr, multisine_Noise_Simu_load.vr) annotation (Line(points={{
            -172,-21.2},{-172,-22},{-146.4,-22},{-146.4,-34}}, color={0,0,127}));
    connect(multisine_Noise_Simu_load.pwPin, Line5_2.p) annotation (Line(points=
           {{-141,-41},{-128,-41},{-128,-68},{-176,-68},{-176,0},{-169,0}},
          color={0,0,255}));
    connect(add.u1, bus1.Angle) annotation (Line(points={{-82,136},{-160,136},{
            -160,55.2},{-174,55.2}}, color={0,0,127}));
    connect(bus4.Angle, add.u2) annotation (Line(points={{174,-22.8},{170,-22.8},
            {170,-24},{168,-24},{168,-66},{242,-66},{242,100},{-112,100},{-112,
            124},{-82,124}}, color={0,0,127}));
    connect(multisine_Noise_Simu.y1_u, y1_u)
      annotation (Line(points={{129,53},{147,53}}, color={0,0,127}));
    connect(add.y, y2)
      annotation (Line(points={{-59,130},{-38,130}}, color={0,0,127}));
    connect(multisine_Noise_Simu_load.y1_u, n_load)
      annotation (Line(points={{-141,-49},{-131,-49}}, color={0,0,127}));
    connect(add1.u1, bus1.Omega) annotation (Line(points={{-82,86},{-120,86},{
            -120,53},{-174,53}}, color={0,0,127}));
    connect(bus4.Omega, add1.u2) annotation (Line(points={{174,-25},{174,-58},{
            234,-58},{234,94},{44,94},{44,56},{-94,56},{-94,74},{-82,74}},
          color={0,0,127}));
    connect(add1.y, y3) annotation (Line(points={{-59,80},{-56,80},{-56,80},{
            -42,80}}, color={0,0,127}));
    connect(Line6_7.n, pQ_sensor.p)
      annotation (Line(points={{-71,30},{-64,30}}, color={0,0,255}));
    connect(pQ_sensor.n, bus7.p)
      annotation (Line(points={{-60,30},{-58,30}}, color={0,0,255}));
    connect(Load7.p, pQ_sensor.p)
      annotation (Line(points={{-66,0},{-66,30},{-64,30}}, color={0,0,255}));
    connect(pQ_sensor.p12, y4) annotation (Line(points={{-60,31.6},{-60,48},{
            -42,48}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240, -100}, {220, 160}}), graphics={Text(lineColor = {28, 108, 200}, extent = {{-70, -30}, {52, -38}}, textString = "Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
    Icon(coordinateSystem(extent = {{-240, -100}, {220, 160}}, preserveAspectRatio = false)),
    Documentation(info="<html>
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
    experiment(StopTime=10, Tolerance=0.001),
  __OpenModelica_commandLineOptions = "");
  end NetworkSimu;

  model NetworkSysId
  parameter Real r=0.0001;
  parameter Real x=0.001;
  parameter Real b=0.00175*0.5;

  replaceable Data.PF PF_results constrainedby Data.PF
    annotation (Placement(transformation(extent={{-220,-78},{-200,-58}})));
  OpenIPSL.Electrical.Buses.Bus bus5
    annotation (Placement(transformation(extent={{-150,20},{-130,40}})));
  OpenIPSL.Electrical.Buses.Bus bus6
    annotation (Placement(transformation(extent={{-110,20},{-90,40}})));
  OpenIPSL.Electrical.Buses.Bus bus7
    annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  OpenIPSL.Electrical.Buses.Bus bus8
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  OpenIPSL.Electrical.Buses.Bus bus9
    annotation (Placement(transformation(extent={{50,20},{70,40}})));
  OpenIPSL.Electrical.Buses.Bus bus10
    annotation (Placement(transformation(extent={{90,20},{110,40}})));
  OpenIPSL.Electrical.Buses.Bus bus11
    annotation (Placement(transformation(extent={{130,20},{150,40}})));
  Groups.PSSE.No_Controls.G1 g1(
      V_0=PF_results.voltages.V1,
      angle_0=PF_results.voltages.A1,
      P_0=PF_results.machines.P1_1,
      Q_0=PF_results.machines.Q1_1)
    annotation (Placement(transformation(extent={{-214,42},{-202,54}})));
  Groups.PSSE.No_Controls.G2 g2(
      V_0=PF_results.voltages.V2,
      angle_0=PF_results.voltages.A2,
      P_0=PF_results.machines.P2_1,
      Q_0=PF_results.machines.Q2_1)
    annotation (Placement(transformation(extent={{-214,-26},{-202,-14}})));
  Groups.PSSE.No_Controls.G3 g3(
      V_0=PF_results.voltages.V3,
      angle_0=PF_results.voltages.A3,
      P_0=PF_results.machines.P3_1,
      Q_0=PF_results.machines.Q3_1)
                                  annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,66})));
  Groups.PSSE.No_Controls.G4 g4(
      V_0=PF_results.voltages.V4,
      angle_0=PF_results.voltages.A4,
      P_0=PF_results.machines.P4_1,
      Q_0=PF_results.machines.Q4_1)
                                  annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,-30})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7(
      R=r*10,
      X=x*10,
      G=0,
      B=b*10)
            annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_6(
      R=r*25,
      X=x*25,
      G=0,
      B=b*25)
            annotation (Placement(transformation(extent={{-130,20},{-110,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_1(
      R=r*110,
      X=x*110,
      G=0,
      B=b*110)
             annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_2(
      R=r*110,
      X=x*110,
      G=0,
      B=b*110)
             annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_2(
      R=r*110,
      X=x*110,
      G=0,
      B=b*110)
             annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_1(
      R=r*110,
      X=x*110,
      G=0,
      B=b*110)
             annotation (Placement(transformation(extent={{20,30},{40,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line9_10(
      R=r*10,
      X=x*10,
      G=0,
      B=b*10)
            annotation (Placement(transformation(extent={{70,20},{90,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line10_11(
      R=r*25,
      X=x*25,
      G=0,
      B=b*25)
            annotation (Placement(transformation(extent={{110,20},{130,40}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load7(
      PQBRAK=0.7,
      V_0=PF_results.voltages.V7,
      angle_0=PF_results.voltages.A7,
      P_0=PF_results.loads.PL7_1,
      Q_0=PF_results.loads.QL7_1)
    annotation (Placement(transformation(extent={{-78,-26},{-50,0}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load9(
      PQBRAK=0.7,
      V_0=PF_results.voltages.V9,
      angle_0=PF_results.voltages.A9,
      P_0=PF_results.loads.PL9_1,
      Q_0=PF_results.loads.QL9_1)
    annotation (Placement(transformation(extent={{80,-26},{50,0}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_1(
      G=0,
      R=0,
      X=0.01667,
      B=0)
         annotation (Placement(transformation(extent={{-170,20},{-150,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_2(
      G=0,
      R=0,
      X=0.01667,
      B=0)
         annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_3(
      G=0,
      R=0,
      X=0.01667,
      B=0)
         annotation (Placement(transformation(extent={{150,20},{170,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_4(
      G=0,
      R=0,
      X=0.01667,
      B=0)
         annotation (Placement(transformation(extent={{150,-20},{170,0}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-220,80},{-172,94}})));
    ExcitationGeneration.Bus bus1
      annotation (Placement(transformation(extent={{-194,38},{-174,58}})));
    ExcitationGeneration.Bus bus2
      annotation (Placement(transformation(extent={{-192,-30},{-172,-10}})));
    ExcitationGeneration.Bus bus3
      annotation (Placement(transformation(extent={{190,56},{170,76}})));
    ExcitationGeneration.Bus bus4
      annotation (Placement(transformation(extent={{194,-40},{174,-20}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-80,120},{-60,140}})));
    Modelica.Blocks.Interfaces.RealOutput y2
      annotation (Placement(transformation(extent={{-44,124},{-32,136}})));
    ExcitationGeneration.Multisine_Noise_SysId multisine_Noise_SysId_load
      annotation (Placement(transformation(extent={{-156,-58},{-136,-38}})));
    ExcitationGeneration.Multisine_Noise_SysId multisine_Noise_SysId
      annotation (Placement(transformation(extent={{112,50},{132,70}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      annotation (Placement(transformation(extent={{70,62},{90,82}})));
    Modelica.Blocks.Interfaces.RealInput Q_ref
      annotation (Placement(transformation(extent={{70,44},{90,64}})));
    Modelica.Blocks.Interfaces.RealInput e1
      annotation (Placement(transformation(extent={{-178,-48},{-166,-36}})));
    Modelica.Blocks.Interfaces.RealInput e2
      annotation (Placement(transformation(extent={{-178,-58},{-166,-46}})));
    Modelica.Blocks.Math.Add add1(k2=-1)
      annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
    Modelica.Blocks.Interfaces.RealOutput y3
      annotation (Placement(transformation(extent={{-52,70},{-32,90}})));
  equation
  connect(Line6_7.n,bus7. p) annotation (
    Line(points={{-71,30},{-71,30},{-60,30}},                  color = {0, 0, 255}));
  connect(Line6_7.p,bus6. p) annotation (
    Line(points={{-89,30},{-89,30},{-100,30}},                  color = {0, 0, 255}));
  connect(Line5_6.n,bus6. p) annotation (
    Line(points={{-111,30},{-111,30},{-100,30}},                color = {0, 0, 255}));
  connect(Line5_6.p,bus5. p) annotation (
    Line(points={{-129,30},{-129,30},{-140,30}},                color = {0, 0, 255}));
  connect(Line8_9_2.n,bus9. p) annotation (
    Line(points={{39,20},{54,20},{54,30},{60,30}},               color = {0, 0, 255}));
  connect(Line8_9_1.n,bus9. p) annotation (
    Line(points={{39,40},{54,40},{54,30},{60,30}},               color = {0, 0, 255}));
  connect(Line8_9_2.p,bus8. p) annotation (
    Line(points={{21,20},{6,20},{6,30},{0,30}},               color = {0, 0, 255}));
  connect(Line8_9_1.p,bus8. p) annotation (
    Line(points={{21,40},{6,40},{6,30},{0,30}},               color = {0, 0, 255}));
  connect(Line7_8_2.n,bus8. p) annotation (
    Line(points={{-21,20},{-6,20},{-6,22},{-6,30},{0,30}},                 color = {0, 0, 255}));
  connect(Line7_8_1.n,bus8. p) annotation (
    Line(points={{-21,40},{-6,40},{-6,30},{0,30}},               color = {0, 0, 255}));
  connect(Line7_8_1.p,bus7. p) annotation (
    Line(points={{-39,40},{-54,40},{-54,30},{-60,30}},               color = {0, 0, 255}));
  connect(Line7_8_2.p,bus7. p) annotation (
    Line(points={{-39,20},{-54,20},{-54,30},{-60,30}},               color = {0, 0, 255}));
  connect(bus9.p,Line9_10. p) annotation (
    Line(points={{60,30},{71,30}},           color = {0, 0, 255}));
  connect(Line9_10.n,bus10. p) annotation (
    Line(points={{89,30},{89,30},{100,30}},                  color = {0, 0, 255}));
  connect(bus10.p,Line10_11. p) annotation (
    Line(points={{100,30},{111,30}},          color = {0, 0, 255}));
  connect(Line10_11.n,bus11. p) annotation (
    Line(points={{129,30},{129,30},{140,30}},                color = {0, 0, 255}));
  connect(Load7.p,bus7. p) annotation (
    Line(points={{-64,0},{-64,0},{-64,30},{-60,30}},              color = {0, 0, 255}));
  connect(Load9.p,Line9_10. p) annotation (
    Line(points={{65,0},{66,0},{66,30},{71,30}},                   color = {0, 0, 255}));
  connect(bus5.p,Line5_1. n) annotation (
    Line(points={{-140,30},{-151,30}},          color = {0, 0, 255}));
  connect(Line5_2.n,bus6. p) annotation (
    Line(points={{-151,0},{-104,0},{-104,30},{-100,30}},              color = {0, 0, 255}));
  connect(bus11.p,Line5_3. p) annotation (
    Line(points={{140,30},{151,30}},          color = {0, 0, 255}));
  connect(Line5_4.p,Line10_11. p) annotation (
    Line(points={{151,-10},{104,-10},{104,30},{111,30}},                  color = {0, 0, 255}));
    connect(bus1.p, bus1.p)
      annotation (Line(points={{-184,48},{-184,48}}, color={0,0,255}));
    connect(bus1.p, Line5_1.p) annotation (Line(points={{-184,48},{-178,48},{
            -178,30},{-169,30}}, color={0,0,255}));
    connect(bus2.p, Line5_2.p) annotation (Line(points={{-182,-20},{-176,-20},{
            -176,0},{-169,0}}, color={0,0,255}));
    connect(g2.pwPin, bus2.p)
      annotation (Line(points={{-201.4,-20},{-182,-20}}, color={0,0,255}));
    connect(g1.pwPin, bus1.p)
      annotation (Line(points={{-201.4,48},{-184,48}}, color={0,0,255}));
    connect(Line5_3.n, bus3.p) annotation (Line(points={{169,30},{174,30},{174,
            66},{180,66}}, color={0,0,255}));
    connect(g3.pwPin, bus3.p)
      annotation (Line(points={{201.4,66},{180,66}}, color={0,0,255}));
    connect(bus4.p, Line5_4.n) annotation (Line(points={{184,-30},{178,-30},{
            178,-10},{169,-10}}, color={0,0,255}));
    connect(bus4.p, g4.pwPin)
      annotation (Line(points={{184,-30},{201.4,-30}}, color={0,0,255}));
    connect(add.u1, bus1.Angle) annotation (Line(points={{-82,136},{-160,136},{
            -160,55.2},{-174,55.2}}, color={0,0,127}));
    connect(bus4.Angle, add.u2) annotation (Line(points={{174,-22.8},{172,-22.8},
            {172,-26},{170,-26},{170,-68},{218,-68},{218,100},{-110,100},{-110,
            124},{-82,124}}, color={0,0,127}));
    connect(add.y, y2)
      annotation (Line(points={{-59,130},{-38,130}}, color={0,0,127}));
    connect(multisine_Noise_SysId.pwPin, bus3.p) annotation (Line(points={{131,
            63},{174,63},{174,66},{180,66}}, color={0,0,255}));
    connect(bus3.Vi, multisine_Noise_SysId.vi) annotation (Line(points={{170,
            66.8},{166,66.8},{166,66},{148,66},{148,76},{128.4,76},{128.4,70}},
          color={0,0,127}));
    connect(bus3.Vr, multisine_Noise_SysId.vr) annotation (Line(points={{170,
            64.8},{168,64.8},{168,64},{144,64},{144,74},{125.6,74},{125.6,70}},
          color={0,0,127}));
    connect(multisine_Noise_SysId_load.pwPin, Line5_2.p) annotation (Line(
          points={{-137,-45},{-122,-45},{-122,-74},{-176,-74},{-176,0},{-169,0}},
          color={0,0,255}));
    connect(bus2.Vi, multisine_Noise_SysId_load.vi) annotation (Line(points={{
            -172,-19.2},{-139.6,-19.2},{-139.6,-38}}, color={0,0,127}));
    connect(bus2.Vr, multisine_Noise_SysId_load.vr) annotation (Line(points={{
            -172,-21.2},{-142.4,-21.2},{-142.4,-38}}, color={0,0,127}));
    connect(P_ref, multisine_Noise_SysId.P_ref) annotation (Line(points={{80,72},
            {102,72},{102,63},{112,63}}, color={0,0,127}));
    connect(Q_ref, multisine_Noise_SysId.Q_ref) annotation (Line(points={{80,54},
            {98,54},{98,59},{112,59}}, color={0,0,127}));
    connect(multisine_Noise_SysId_load.P_ref, e1) annotation (Line(points={{
            -156,-45},{-160,-45},{-160,-42},{-172,-42}}, color={0,0,127}));
    connect(multisine_Noise_SysId_load.Q_ref, e2) annotation (Line(points={{
            -156,-49},{-160,-49},{-160,-52},{-172,-52}}, color={0,0,127}));
    connect(add1.y, y3)
      annotation (Line(points={{-59,80},{-42,80}}, color={0,0,127}));
    connect(bus1.Omega, add1.u1) annotation (Line(points={{-174,53},{-170,53},{
            -170,52},{-120,52},{-120,86},{-82,86}}, color={0,0,127}));
    connect(add1.u2, bus4.Omega) annotation (Line(points={{-82,74},{-96,74},{
            -96,56},{30,56},{30,92},{216,92},{216,-56},{174,-56},{174,-25}},
          color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240, -100}, {220, 160}}),
          graphics={                                                                                  Text(lineColor = {28, 108, 200}, extent = {{-70, -30}, {52, -38}}, textString = "Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
    Icon(coordinateSystem(extent = {{-240, -100}, {220, 160}}, preserveAspectRatio = false)),
    Documentation(info="<html>
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
    experiment(StopTime=10, Tolerance=0.001),
  __OpenModelica_commandLineOptions = "");
  end NetworkSysId;
  annotation (uses(OpenIPSL(version="1.5.0"), Modelica(version="3.2.3"),
      LPV(version="1.5.0")), experiment(Interval=0.01));
end Kundur;
