within ;
package ThreeMachineNineBus_omega
  model NetworkSimu
    import Modelica.Constants.pi;
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
      kT=16.5/230,
      x=0.0576,
      r=0,
      V_b=16.5,
      Vn=16.5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-66})));
    OpenIPSL.Electrical.Branches.PwLine line_6_4(
      R=0.017,
      X=0.092,
      G=0,
      B=0.079) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=270,
          origin={86,-21})));
    OpenIPSL.Electrical.Branches.PwLine line_9_6(
      G=0,
      R=0.039,
      X=0.170,
      B=0.179) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=90,
          origin={86,57})));
    OpenIPSL.Electrical.Branches.PwLine line_5_7(
      G=0,
      R=0.032,
      X=0.161,
      B=0.153) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=90,
          origin={-72,53})));
    OpenIPSL.Electrical.Branches.PwLine line_8_9(
      G=0,
      R=0.0119,
      X=0.1008,
      B=0.1045) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=180,
          origin={39,90})));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
      twoWindingTransformer1(
      r=0,
      kT=13.8/230,
      x=0.0586,
      V_b=13.8,
      Vn=13.8) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={102,90})));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
      twoWindingTransformer2(
      r=0,
      kT=18/230,
      x=0.0625,
      Sn=100,
      V_b=18,
      Vn=18) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-102,90})));
    OpenIPSL.Electrical.Buses.Bus B7(
      V_b=230,
      V_0=1.015882581760390,
      angle_0=3.7197)
      annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
    OpenIPSL.Electrical.Buses.Bus B9(
      V_b=230,
      V_0=1.0324,
      angle_0=1.9667)
      annotation (Placement(transformation(extent={{70,80},{90,100}})));
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
      angle_0=-2.2168) annotation (Placement(transformation(
          extent={{-12,-12},{12,12}},
          rotation=-90,
          origin={0,-46})));
    Generation_Groups.Gen2 gen2(
      V_b=13.8,
      V_0=1.025,
      height_2=0,
      tstart_2=0,
      refdisturb_2=false,
      vref0=1.097573933623472,
      vf0=1.402994304406186,
      P_0=85,
      Q_0=-10.8597088920594,
      angle_0=4.6648)
      annotation (Placement(transformation(extent={{160,80},{140,100}})));
    Generation_Groups.Gen3 gen3(
      V_0=1.040000000000000,
      angle_0=0,
      height_3=0,
      tstart_3=0,
      refdisturb_3=false,
      V_b=16.5,
      vref0=1.095242742681042,
      vf0=1.082148046273888,
      P_0=71.6410214993680,
      Q_0=27.0459279594234) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-110})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b(displayUnit="MVA") = 100,
                                                          fn=60)
      annotation (Placement(transformation(extent={{200,-140},{300,-100}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(
      R=0.0085,
      X=0.072,
      G=0,
      B=0.0745)
      annotation (Placement(transformation(extent={{-50,84},{-32,96}})));
    ExcitationGeneration.Bus B2(
      V_b=18,
      V_0=1.025,
      angle_0=9.28)
      annotation (Placement(transformation(extent={{-138,80},{-118,100}})));
    ExcitationGeneration.Bus B8(
      V_b=230,
      V_0=1.015882581760390,
      angle_0=0.72754)
      annotation (Placement(transformation(extent={{-12,80},{8,100}})));
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
    OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ1(
      V_b=230,
      V_0=1.015882581760390,
      Sn=100,
      P_0=100,
      Q_0=35,
      angle_0=0.72754) annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=0,
          origin={7,53})));
    Generation_Groups.Gen1 gen1_1(
      V_b=18,
      V_0=1.025,
      angle_0=0.161966652912444*180/pi,
      P_0=163,
      Q_0=6.6536560198189,
      vf0=1.789323314329606,
      vref0=1.120103884682511,
      height_1=0,
      tstart_1=0,
      refdisturb_1=false,
      booleanConstant(k=false),
      step(
        height=0,
        offset=0,
        startTime=0))
      annotation (Placement(transformation(extent={{-180,80},{-160,100}})));
    LPV.PwLine line_4_5(
      R=0.01,
      X=0.085,
      G=0,
      B=0.088,
      t1=5,
      t2=100)  annotation (Placement(transformation(
          extent={{-8,-8},{8,8}},
          rotation=-90,
          origin={-72,-22})));
    ExcitationGeneration.Bus B3(
      V_b=13.8,
      V_0=1.025,
      angle_0=4.6648)
      annotation (Placement(transformation(extent={{106,80},{126,100}})));
    ExcitationGeneration.Bus B1(
      V_b=16.5,
      V_0=1.04,
      angle_0=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={0,-84})));
    LPV.VoltDependantLPV voltDependantLPV(
      V_b=230,
      V_0=1.012654326639182,
      angle_0=-3.6874,
      P_0=90,
      Q_0=30,
      Sn=100)
      annotation (Placement(transformation(extent={{102,-20},{116,-6}})));
    ExcitationGeneration.Bus B6(
      V_b=230,
      V_0=1.012654326639182,
      angle_0=-3.6874) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={86,20})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(enableNoise=true,
      useAutomaticSeed=false,
      fixedSeed=66)
      annotation (Placement(transformation(extent={{-174,120},{-154,140}})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{68,130},{88,150}})));
    Modelica.Blocks.Noise.NormalNoise normalNoise_y1(sigma=0)
      annotation (Placement(transformation(extent={{102,158},{116,170}})));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{132,138},{142,148}})));
    Modelica.Blocks.Noise.NormalNoise normalNoise_y2(sigma=0)
      annotation (Placement(transformation(extent={{198,12},{212,24}})));
    Modelica.Blocks.Math.Add add2
      annotation (Placement(transformation(extent={{228,-8},{238,2}})));
    Modelica.Blocks.Math.Add add3(k1=-1)
      annotation (Placement(transformation(extent={{164,-16},{184,4}})));
    Modelica.Blocks.Noise.NormalNoise normalNoise_y3(sigma=0)
      annotation (Placement(transformation(extent={{-150,-70},{-164,-58}})));
    Modelica.Blocks.Math.Add add4
      annotation (Placement(transformation(extent={{-186,-40},{-196,-30}})));
    Modelica.Blocks.Math.Add add5(k1=-1)
      annotation (Placement(transformation(extent={{-140,-42},{-160,-22}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu
      annotation (Placement(transformation(extent={{26,-20},{46,0}})));
    Modelica.Blocks.Interfaces.RealOutput y1_u
      annotation (Placement(transformation(extent={{58,-30},{78,-10}})));
    Modelica.Blocks.Interfaces.RealOutput delta_omega1
      annotation (Placement(transformation(extent={{158,134},{178,154}})));
    Modelica.Blocks.Interfaces.RealOutput delta_omega2
      annotation (Placement(transformation(extent={{252,-14},{272,6}})));
    Modelica.Blocks.Interfaces.RealOutput delta_omega3
      annotation (Placement(transformation(extent={{-216,-46},{-236,-26}})));
  equation
    connect(line_5_7.n, B7.p) annotation (Line(
        points={{-72,61.1},{-72,90},{-80,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(twoWindingTransformer1.n, B9.p) annotation (Line(
        points={{91,90},{80,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_9_6.n, B9.p) annotation (Line(
        points={{86,65.1},{86,90},{80,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5_7.p, B5.p) annotation (Line(
        points={{-72,44.9},{-72,20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(twoWindingTransformer2.n, B7.p)
      annotation (Line(points={{-91,90},{-80,90}},          color={0,0,255}));
    connect(B4.p, twoWindingTransformer.n)
      annotation (Line(points={{0,-46},{0,-55}}, color={0,0,255}));
    connect(line_8_9.p, B9.p)
      annotation (Line(points={{47.1,90},{80,90}},           color={0,0,255}));
    connect(B4.p, line_6_4.n) annotation (Line(points={{0,-46},{0,-42},{86,-42},
            {86,-29.1}},          color={0,0,255}));
    connect(B7.p, pwLine2Openings.p)
      annotation (Line(points={{-80,90},{-49.1,90}}, color={0,0,255}));
    connect(B2.p, twoWindingTransformer2.p)
      annotation (Line(points={{-128,90},{-113,90}}, color={0,0,255}));
    connect(B8.p, line_8_9.n)
      annotation (Line(points={{-2,90},{30.9,90}},color={0,0,255}));
    connect(pwLine2Openings.n, B8.p)
      annotation (Line(points={{-32.9,90},{-2,90}},color={0,0,255}));
    connect(B2.p, gen1_1.pwPin)
      annotation (Line(points={{-128,90},{-159,90}}, color={0,0,255}));
    connect(lOADPQ1.p, line_8_9.n) annotation (Line(points={{7,60},{6,60},{6,80},
            {4,80},{4,90},{30.9,90}}, color={0,0,255}));
    connect(line_4_5.p, B5.p)
      annotation (Line(points={{-72,-14.8},{-72,20}}, color={0,0,255}));
    connect(lOADPQ.p, B5.p) annotation (Line(points={{-99,-4},{-98,-4},{-98,4},
            {-72,4},{-72,20}}, color={0,0,255}));
    connect(line_4_5.n, line_6_4.n) annotation (Line(points={{-72,-29.2},{-72,
            -42},{86,-42},{86,-29.1}}, color={0,0,255}));
    connect(twoWindingTransformer1.p, B3.p)
      annotation (Line(points={{113,90},{116,90}}, color={0,0,255}));
    connect(gen2.pwPin, B3.p)
      annotation (Line(points={{139,90},{116,90}}, color={0,0,255}));
    connect(twoWindingTransformer.p, B1.p)
      annotation (Line(points={{0,-77},{0,-84}}, color={0,0,255}));
    connect(B1.p, gen3.pwPin)
      annotation (Line(points={{0,-84},{0,-99}}, color={0,0,255}));
    connect(voltDependantLPV.p, line_6_4.p) annotation (Line(points={{109,-6},{
            112,-6},{112,0},{86,0},{86,-12.9}}, color={0,0,255}));
    connect(line_9_6.p, B6.p)
      annotation (Line(points={{86,48.9},{86,20}}, color={0,0,255}));
    connect(B6.p, line_6_4.p)
      annotation (Line(points={{86,20},{86,-12.9}}, color={0,0,255}));
    connect(gen1_1.omega, add.u1) annotation (Line(points={{-160,94.6},{-138,
            94.6},{-138,146},{66,146}}, color={0,0,127}));
    connect(gen2.omega, add.u2) annotation (Line(points={{140,94.6},{132,94.6},
            {132,116},{40,116},{40,134},{66,134}}, color={0,0,127}));
    connect(add1.u2, add.y)
      annotation (Line(points={{131,140},{89,140}}, color={0,0,127}));
    connect(normalNoise_y1.y, add1.u1) annotation (Line(points={{116.7,164},{
            124,164},{124,146},{131,146}}, color={0,0,127}));
    connect(add3.u1, add.u2) annotation (Line(points={{162,0},{156,0},{156,6},{
            132,6},{132,116},{40,116},{40,134},{66,134}}, color={0,0,127}));
    connect(gen3.omega, add3.u2) annotation (Line(points={{-4.6,-100},{-16,-100},
            {-16,-128},{62,-128},{62,-58},{154,-58},{154,-12},{162,-12}}, color=
           {0,0,127}));
    connect(add3.y, add2.u2)
      annotation (Line(points={{185,-6},{227,-6}}, color={0,0,127}));
    connect(normalNoise_y2.y, add2.u1) annotation (Line(points={{212.7,18},{218,
            18},{218,0},{227,0}}, color={0,0,127}));
    connect(add5.y, add4.u1)
      annotation (Line(points={{-161,-32},{-185,-32}}, color={0,0,127}));
    connect(normalNoise_y3.y, add4.u2) annotation (Line(points={{-164.7,-64},{
            -168,-64},{-168,-56},{-185,-56},{-185,-38}}, color={0,0,127}));
    connect(add5.u1, add.u1) annotation (Line(points={{-138,-26},{-138,58},{
            -188,58},{-188,108},{-148,108},{-148,94.6},{-138,94.6},{-138,146},{
            66,146}}, color={0,0,127}));
    connect(add5.u2, add3.u2) annotation (Line(points={{-138,-38},{-106,-38},{
            -106,-100},{-16,-100},{-16,-128},{62,-128},{62,-58},{154,-58},{154,
            -12},{162,-12}}, color={0,0,127}));
    connect(multisine_Noise_Simu.pwPin, line_6_4.p) annotation (Line(points={{
            45,-7},{66,-7},{66,0},{86,0},{86,-12.9}}, color={0,0,255}));
    connect(multisine_Noise_Simu.y1_u, y1_u) annotation (Line(points={{45,-15},
            {52.5,-15},{52.5,-20},{68,-20}}, color={0,0,127}));
    connect(B6.Vr, multisine_Noise_Simu.vr) annotation (Line(points={{84.8,10},
            {84,10},{84,12},{39.6,12},{39.6,0}}, color={0,0,127}));
    connect(multisine_Noise_Simu.vi, B6.Vi) annotation (Line(points={{42.4,0},{
            42.4,8},{50,8},{50,6},{86.8,6},{86.8,10}}, color={0,0,127}));
    connect(add1.y, delta_omega1) annotation (Line(points={{142.5,143},{152.25,
            143},{152.25,144},{168,144}}, color={0,0,127}));
    connect(add2.y, delta_omega2) annotation (Line(points={{238.5,-3},{247.25,
            -3},{247.25,-4},{262,-4}}, color={0,0,127}));
    connect(add4.y, delta_omega3) annotation (Line(points={{-196.5,-35},{
            -208.25,-35},{-208.25,-36},{-226,-36}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,-140},{
              300,180}})),
      Icon(coordinateSystem(extent={{-260,-140},{300,180}})),
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
      experiment(StopTime=20, Interval=0.05),
      __Dymola_experimentSetupOutput);
  end NetworkSimu;

  model NetworkSysId
    import Modelica.Constants.pi;
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
      kT=16.5/230,
      x=0.0576,
      r=0,
      V_b=16.5,
      Vn=16.5) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-66})));
    OpenIPSL.Electrical.Branches.PwLine line_6_4(
      R=0.017,
      X=0.092,
      G=0,
      B=0.079) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=270,
          origin={86,-21})));
    OpenIPSL.Electrical.Branches.PwLine line_9_6(
      G=0,
      R=0.039,
      X=0.170,
      B=0.179) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=90,
          origin={86,57})));
    OpenIPSL.Electrical.Branches.PwLine line_5_7(
      G=0,
      R=0.032,
      X=0.161,
      B=0.153) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=90,
          origin={-72,53})));
    OpenIPSL.Electrical.Branches.PwLine line_8_9(
      G=0,
      R=0.0119,
      X=0.1008,
      B=0.1045) annotation (Placement(transformation(
          extent={{-9,-6},{9,6}},
          rotation=180,
          origin={39,90})));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
      twoWindingTransformer1(
      r=0,
      kT=13.8/230,
      x=0.0586,
      V_b=13.8,
      Vn=13.8) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={102,90})));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer
      twoWindingTransformer2(
      r=0,
      kT=18/230,
      x=0.0625,
      Sn=100,
      V_b=18,
      Vn=18) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={-102,90})));
    OpenIPSL.Electrical.Buses.Bus B7(
      V_b=230,
      V_0=1.015882581760390,
      angle_0=3.7197)
      annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
    OpenIPSL.Electrical.Buses.Bus B9(
      V_b=230,
      V_0=1.0324,
      angle_0=1.9667)
      annotation (Placement(transformation(extent={{70,80},{90,100}})));
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
      angle_0=-2.2168) annotation (Placement(transformation(
          extent={{-12,-12},{12,12}},
          rotation=-90,
          origin={0,-46})));
    Generation_Groups.Gen2 gen2(
      V_b=13.8,
      V_0=1.025,
      height_2=0,
      tstart_2=0,
      refdisturb_2=false,
      vref0=1.097573933623472,
      vf0=1.402994304406186,
      P_0=85,
      Q_0=-10.8597088920594,
      angle_0=4.6648)
      annotation (Placement(transformation(extent={{160,80},{140,100}})));
    Generation_Groups.Gen3 gen3(
      V_0=1.040000000000000,
      angle_0=0,
      height_3=0,
      tstart_3=0,
      refdisturb_3=false,
      V_b=16.5,
      vref0=1.095242742681042,
      vf0=1.082148046273888,
      P_0=71.6410214993680,
      Q_0=27.0459279594234) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={2,-110})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b(displayUnit="MVA") = 100,
                                                          fn=60)
      annotation (Placement(transformation(extent={{200,-140},{300,-100}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine2Openings(
      R=0.0085,
      X=0.072,
      G=0,
      B=0.0745)
      annotation (Placement(transformation(extent={{-50,84},{-32,96}})));
    ExcitationGeneration.Bus B2(
      V_b=18,
      V_0=1.025,
      angle_0=9.28)
      annotation (Placement(transformation(extent={{-138,80},{-118,100}})));
    ExcitationGeneration.Bus B8(
      V_b=230,
      V_0=1.015882581760390,
      angle_0=0.72754)
      annotation (Placement(transformation(extent={{-12,80},{8,100}})));
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
    OpenIPSL.Electrical.Loads.PSAT.VoltDependant lOADPQ1(
      V_b=230,
      V_0=1.015882581760390,
      Sn=100,
      P_0=100,
      Q_0=35,
      angle_0=0.72754) annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=0,
          origin={7,53})));
    Generation_Groups.Gen1 gen1_1(
      V_b=18,
      V_0=1.025,
      angle_0=0.161966652912444*180/pi,
      P_0=163,
      Q_0=6.6536560198189,
      vf0=1.789323314329606,
      vref0=1.120103884682511,
      height_1=0,
      tstart_1=0,
      refdisturb_1=false,
      booleanConstant(k=false),
      step(
        height=0,
        offset=0,
        startTime=0))
      annotation (Placement(transformation(extent={{-180,80},{-160,100}})));
    LPV.PwLine line_4_5(
      R=0.01,
      X=0.085,
      G=0,
      B=0.088) annotation (Placement(transformation(
          extent={{-8,-8},{8,8}},
          rotation=-90,
          origin={-72,-22})));
    ExcitationGeneration.Bus B3(
      V_b=13.8,
      V_0=1.025,
      angle_0=4.6648)
      annotation (Placement(transformation(extent={{106,80},{126,100}})));
    ExcitationGeneration.Bus B1(
      V_b=16.5,
      V_0=1.04,
      angle_0=0) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={0,-84})));
    LPV.VoltDependantLPV voltDependantLPV(
      V_b=230,
      V_0=1.012654326639182,
      angle_0=-3.6874,
      P_0=90,
      Q_0=30,
      Sn=100)
      annotation (Placement(transformation(extent={{102,-20},{116,-6}})));
    ExcitationGeneration.Bus B6(
      V_b=230,
      V_0=1.012654326639182,
      angle_0=-3.6874) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={86,20})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{68,130},{88,150}})));
    Modelica.Blocks.Interfaces.RealOutput delta_omega1
      annotation (Placement(transformation(extent={{114,130},{134,150}})));
    Modelica.Blocks.Math.Add add3(k1=-1)
      annotation (Placement(transformation(extent={{164,-16},{184,4}})));
    Modelica.Blocks.Math.Add add5(k1=-1)
      annotation (Placement(transformation(extent={{-140,-42},{-160,-22}})));
    Modelica.Blocks.Interfaces.RealOutput delta_omega2
      annotation (Placement(transformation(extent={{200,-16},{220,4}})));
    Modelica.Blocks.Interfaces.RealOutput delta_omega3
      annotation (Placement(transformation(extent={{-186,-42},{-206,-22}})));
    ExcitationGeneration.Multisine_Noise_SysId multisine_Noise_SysId
      annotation (Placement(transformation(extent={{36,-22},{56,-2}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      annotation (Placement(transformation(extent={{-12,-12},{12,12}})));
    Modelica.Blocks.Interfaces.RealInput Q_ref
      annotation (Placement(transformation(extent={{-14,-40},{14,-12}})));
  equation
    connect(line_5_7.n, B7.p) annotation (Line(
        points={{-72,61.1},{-72,90},{-80,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(twoWindingTransformer1.n, B9.p) annotation (Line(
        points={{91,90},{80,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_9_6.n, B9.p) annotation (Line(
        points={{86,65.1},{86,90},{80,90}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5_7.p, B5.p) annotation (Line(
        points={{-72,44.9},{-72,20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(twoWindingTransformer2.n, B7.p)
      annotation (Line(points={{-91,90},{-80,90}},          color={0,0,255}));
    connect(B4.p, twoWindingTransformer.n)
      annotation (Line(points={{0,-46},{0,-55}}, color={0,0,255}));
    connect(line_8_9.p, B9.p)
      annotation (Line(points={{47.1,90},{80,90}},           color={0,0,255}));
    connect(B4.p, line_6_4.n) annotation (Line(points={{0,-46},{0,-42},{86,-42},
            {86,-29.1}},          color={0,0,255}));
    connect(B7.p, pwLine2Openings.p)
      annotation (Line(points={{-80,90},{-49.1,90}}, color={0,0,255}));
    connect(B2.p, twoWindingTransformer2.p)
      annotation (Line(points={{-128,90},{-113,90}}, color={0,0,255}));
    connect(B8.p, line_8_9.n)
      annotation (Line(points={{-2,90},{30.9,90}},color={0,0,255}));
    connect(pwLine2Openings.n, B8.p)
      annotation (Line(points={{-32.9,90},{-2,90}},color={0,0,255}));
    connect(B2.p, gen1_1.pwPin)
      annotation (Line(points={{-128,90},{-159,90}}, color={0,0,255}));
    connect(lOADPQ1.p, line_8_9.n) annotation (Line(points={{7,60},{6,60},{6,80},
            {4,80},{4,90},{30.9,90}}, color={0,0,255}));
    connect(line_4_5.p, B5.p)
      annotation (Line(points={{-72,-14.8},{-72,20}}, color={0,0,255}));
    connect(lOADPQ.p, B5.p) annotation (Line(points={{-99,-4},{-98,-4},{-98,4},
            {-72,4},{-72,20}}, color={0,0,255}));
    connect(line_4_5.n, line_6_4.n) annotation (Line(points={{-72,-29.2},{-72,
            -42},{86,-42},{86,-29.1}}, color={0,0,255}));
    connect(twoWindingTransformer1.p, B3.p)
      annotation (Line(points={{113,90},{116,90}}, color={0,0,255}));
    connect(gen2.pwPin, B3.p)
      annotation (Line(points={{139,90},{116,90}}, color={0,0,255}));
    connect(twoWindingTransformer.p, B1.p)
      annotation (Line(points={{0,-77},{0,-84}}, color={0,0,255}));
    connect(B1.p, gen3.pwPin)
      annotation (Line(points={{0,-84},{0,-99},{2,-99}},
                                                 color={0,0,255}));
    connect(voltDependantLPV.p, line_6_4.p) annotation (Line(points={{109,-6},{
            112,-6},{112,0},{86,0},{86,-12.9}}, color={0,0,255}));
    connect(line_9_6.p, B6.p)
      annotation (Line(points={{86,48.9},{86,20}}, color={0,0,255}));
    connect(B6.p, line_6_4.p)
      annotation (Line(points={{86,20},{86,-12.9}}, color={0,0,255}));
    connect(gen1_1.omega, add.u1) annotation (Line(points={{-160,94.6},{-138,
            94.6},{-138,146},{66,146}}, color={0,0,127}));
    connect(gen2.omega, add.u2) annotation (Line(points={{140,94.6},{132,94.6},
            {132,116},{40,116},{40,134},{66,134}}, color={0,0,127}));
    connect(add3.u1, add.u2) annotation (Line(points={{162,0},{156,0},{156,6},{
            132,6},{132,116},{40,116},{40,134},{66,134}}, color={0,0,127}));
    connect(gen3.omega, add3.u2) annotation (Line(points={{-4.6,-100},{-16,-100},
            {-16,-128},{62,-128},{62,-58},{154,-58},{154,-12},{162,-12}}, color=
           {0,0,127}));
    connect(add5.u1, add.u1) annotation (Line(points={{-138,-26},{-138,58},{
            -188,58},{-188,108},{-148,108},{-148,94.6},{-138,94.6},{-138,146},{
            66,146}}, color={0,0,127}));
    connect(add5.u2, add3.u2) annotation (Line(points={{-138,-38},{-106,-38},{
            -106,-100},{-16,-100},{-16,-128},{62,-128},{62,-58},{154,-58},{154,
            -12},{162,-12}}, color={0,0,127}));
    connect(add5.y, delta_omega3)
      annotation (Line(points={{-161,-32},{-196,-32}}, color={0,0,127}));
    connect(add3.y, delta_omega2)
      annotation (Line(points={{185,-6},{210,-6}}, color={0,0,127}));
    connect(add.y, delta_omega1)
      annotation (Line(points={{89,140},{124,140}}, color={0,0,127}));
    connect(multisine_Noise_SysId.pwPin, line_6_4.p) annotation (Line(points={{
            55,-9},{72,-9},{72,0},{86,0},{86,-12.9}}, color={0,0,255}));
    connect(B6.Vr, multisine_Noise_SysId.vr) annotation (Line(points={{84.8,10},
            {84,10},{84,6},{49.6,6},{49.6,-2}}, color={0,0,127}));
    connect(B6.Vi, multisine_Noise_SysId.vi) annotation (Line(points={{86.8,10},
            {86,10},{86,2},{52.4,2},{52.4,-2}}, color={0,0,127}));
    connect(P_ref, multisine_Noise_SysId.P_ref) annotation (Line(points={{0,0},
            {18,0},{18,-9},{36,-9}}, color={0,0,127}));
    connect(Q_ref, multisine_Noise_SysId.Q_ref) annotation (Line(points={{
            1.77636e-15,-26},{18,-26},{18,-13},{36,-13}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-260,-140},{
              300,180}})),
      Icon(coordinateSystem(extent={{-260,-140},{300,180}})),
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
      experiment(StopTime=20, Interval=0.05),
      __Dymola_experimentSetupOutput);
  end NetworkSysId;
  annotation (uses(Modelica(version="3.2.3"), OpenIPSL(version="1.5.0"),
      LPV(version="1.5.0")));
end ThreeMachineNineBus_omega;
