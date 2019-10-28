within ;
package ThreeMachineNineBus
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
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
      annotation (Placement(transformation(extent={{80,-300},{180,-260}})));
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
      tstart_1=5000000,
      refdisturb_1=false,
      booleanConstant(k=false),
      step(
        height=0,
        offset=0,
        startTime=0))
      annotation (Placement(transformation(extent={{-180,80},{-160,100}})));
    Modelica.Blocks.Interfaces.RealOutput y1_u
      annotation (Placement(transformation(extent={{-30,126},{-12,144}})));
    Modelica.Blocks.Math.Add add12(k2=-1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-50,-170})));
    Modelica.Blocks.Math.Add add13(k1=-1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-2,-180})));
    Modelica.Blocks.Math.Add add23(k2=-1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={58,-260})));
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
    Modelica.Blocks.Interfaces.RealOutput y_12 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-54,-230})));
    Modelica.Blocks.Interfaces.RealOutput y_13 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-2,-230})));
    Modelica.Blocks.Interfaces.RealOutput y_23 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={58,-290})));
    Modelica.Blocks.Interfaces.RealOutput y_1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-28,-130})));
    Modelica.Blocks.Interfaces.RealOutput y_2 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-200,-140})));
    Modelica.Blocks.Interfaces.RealOutput y_3 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={166,-178})));
    Modelica.Blocks.Math.Add add1         annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=-90,
          origin={-54,-204})));
    Modelica.Blocks.Noise.NormalNoise normalNoise_y(
      enableNoise=true,
      useGlobalSeed=true,
      useAutomaticLocalSeed=true,
      fixedLocalSeed=99)
      annotation (Placement(transformation(extent={{-76,-196},{-66,-186}})));
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
    Modelica.Blocks.Interfaces.RealOutput n_load
      annotation (Placement(transformation(extent={{64,-26},{84,-6}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu
      annotation (Placement(transformation(extent={{-60,134},{-40,154}})));
    ExcitationGeneration.Multisine_Noise_Simu multisine_Noise_Simu_load(
        generateMultiSine_P(M=0))
      annotation (Placement(transformation(extent={{46,-8},{58,4}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(enableNoise=true,
      useAutomaticSeed=false,
      fixedSeed=66)
      annotation (Placement(transformation(extent={{-208,146},{-188,166}})));
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
    connect(add13.u2, add12.u1) annotation (Line(points={{-8,-168},{-8,-140},{
            -44,-140},{-44,-158}}, color={0,0,127}));
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
    connect(add23.u1,add13. u1) annotation (Line(points={{64,-248},{64,-160},{4,
            -160},{4,-168}}, color={0,0,127}));
    connect(twoWindingTransformer.p, B1.p)
      annotation (Line(points={{0,-77},{0,-84}}, color={0,0,255}));
    connect(B1.p, gen3.pwPin)
      annotation (Line(points={{0,-84},{0,-99}}, color={0,0,255}));
    connect(add23.y, y_23)
      annotation (Line(points={{58,-271},{58,-290}}, color={0,0,127}));
    connect(add13.y, y_13)
      annotation (Line(points={{-2,-191},{-2,-230}}, color={0,0,127}));
    connect(y_1, add12.u1) annotation (Line(points={{-28,-130},{-28,-98},{-44,
            -98},{-44,-158}}, color={0,0,127}));
    connect(B2.Angle, y_2) annotation (Line(points={{-118,94.8},{-116,94.8},{
            -116,116},{-200,116},{-200,-140}}, color={0,0,127}));
    connect(add12.u2, y_2) annotation (Line(points={{-56,-158},{-56,-120},{-200,
            -120},{-200,-140}}, color={0,0,127}));
    connect(add23.u2, y_2) annotation (Line(points={{52,-248},{52,-240},{-80,
            -240},{-80,-120},{-200,-120},{-200,-140}}, color={0,0,127}));
    connect(B1.Angle, add12.u1) annotation (Line(points={{4.8,-94},{6,-94},{6,
            -98},{-44,-98},{-44,-158}}, color={0,0,127}));
    connect(y_3, add13.u1) annotation (Line(points={{166,-178},{166,-160},{4,
            -160},{4,-168}}, color={0,0,127}));
    connect(B3.Angle, add13.u1) annotation (Line(points={{126,94.8},{126,108},{
            166,108},{166,-160},{4,-160},{4,-168}}, color={0,0,127}));
    connect(add12.y, add1.u1) annotation (Line(points={{-50,-181},{-50,-196.8},
            {-50.4,-196.8}}, color={0,0,127}));
    connect(add1.y, y_12)
      annotation (Line(points={{-54,-210.6},{-54,-230}}, color={0,0,127}));
    connect(normalNoise_y.y, add1.u2) annotation (Line(points={{-65.5,-191},{-57.6,
            -191},{-57.6,-196.8}}, color={0,0,127}));
    connect(voltDependantLPV.p, line_6_4.p) annotation (Line(points={{109,-6},{
            110,-6},{110,4},{86,4},{86,-12.9}}, color={0,0,255}));
    connect(line_9_6.p, B6.p)
      annotation (Line(points={{86,48.9},{86,20}}, color={0,0,255}));
    connect(B6.p, line_6_4.p)
      annotation (Line(points={{86,20},{86,-12.9}}, color={0,0,255}));
    connect(y1_u, y1_u) annotation (Line(points={{-21,135},{-26.5,135},{-26.5,
            135},{-21,135}}, color={0,0,127}));
    connect(multisine_Noise_Simu.pwPin, line_8_9.n) annotation (Line(points={{
            -41,147},{4,147},{4,90},{30.9,90}}, color={0,0,255}));
    connect(B8.Vr, multisine_Noise_Simu.vr) annotation (Line(points={{8,88.8},{
            20,88.8},{20,168},{-46.4,168},{-46.4,154}}, color={0,0,127}));
    connect(B8.Vi, multisine_Noise_Simu.vi) annotation (Line(points={{8,90.8},{
            14,90.8},{14,164},{-43.6,164},{-43.6,154}}, color={0,0,127}));
    connect(multisine_Noise_Simu.y1_u, y1_u) annotation (Line(points={{-41,139},
            {-38,139},{-38,135},{-21,135}}, color={0,0,127}));
    connect(B6.Vr, multisine_Noise_Simu_load.vr) annotation (Line(points={{84.8,
            10},{54.16,10},{54.16,4}}, color={0,0,127}));
    connect(multisine_Noise_Simu_load.pwPin, line_6_4.p) annotation (Line(
          points={{57.4,-0.2},{66,-0.2},{66,4},{86,4},{86,-12.9}}, color={0,0,
            255}));
    connect(multisine_Noise_Simu_load.y1_u, n_load) annotation (Line(points={{
            57.4,-5},{60,-5},{60,-16},{74,-16}}, color={0,0,127}));
    connect(B6.Vi, multisine_Noise_Simu_load.vi) annotation (Line(points={{86.8,
            10},{86.8,8},{55.84,8},{55.84,4}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},{
              180,180}})),
      Icon(coordinateSystem(extent={{-220,-300},{180,180}})),
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
        StopTime=30,
        Interval=0.001,
        __Dymola_Algorithm="Dassl"),
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
          origin={0,-110})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100, fn=60)
      annotation (Placement(transformation(extent={{80,-300},{180,-260}})));
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
    OpenIPSL.Electrical.Loads.PSAT.VoltDependant PQ1(
      V_b=230,
      V_0=1.012654326639182,
      Sn=100,
      P_0=90,
      Q_0=30,
      angle_0=-3.6874) annotation (Placement(transformation(
          extent={{-7,-7},{7,7}},
          rotation=0,
          origin={109,-13})));
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
      tstart_1=5000000,
      refdisturb_1=false,
      booleanConstant(k=false),
      step(
        height=0,
        offset=0,
        startTime=0))
      annotation (Placement(transformation(extent={{-180,80},{-160,100}})));
    Modelica.Blocks.Math.Add add12(k2=-1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-50,-170})));
    Modelica.Blocks.Math.Add add13(k1=-1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-2,-190})));
    Modelica.Blocks.Math.Add add23(k2=-1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={58,-260})));
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
    Modelica.Blocks.Interfaces.RealOutput y_12 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-50,-202})));
    Modelica.Blocks.Interfaces.RealOutput y_13 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={-2,-220})));
    Modelica.Blocks.Interfaces.RealOutput y_23 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={58,-290})));
    ExcitationGeneration.Multisine_Noise_SysId multisine_Noise_SysId
      annotation (Placement(transformation(extent={{-60,134},{-40,154}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      annotation (Placement(transformation(extent={{-160,140},{-120,180}})));
    Modelica.Blocks.Interfaces.RealInput Q_ref
      annotation (Placement(transformation(extent={{-160,110},{-120,150}})));
    ExcitationGeneration.Multisine_Noise_SysId multisine_Noise_SysId_load
      annotation (Placement(transformation(extent={{50,-10},{64,4}})));
    ExcitationGeneration.Bus B6(
      V_b=230,
      V_0=1.012654326639182,
      angle_0=-3.6874) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={86,20})));
    Modelica.Blocks.Interfaces.RealInput e1
      annotation (Placement(transformation(extent={{20,-4},{34,10}})));
    Modelica.Blocks.Interfaces.RealInput e2
      annotation (Placement(transformation(extent={{20,-14},{34,0}})));
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
    connect(PQ1.p, line_6_4.p) annotation (Line(points={{109,-6},{108,-6},{108,
            4},{86,4},{86,-12.9}}, color={0,0,255}));
    connect(lOADPQ1.p, line_8_9.n) annotation (Line(points={{7,60},{6,60},{6,80},
            {4,80},{4,90},{30.9,90}}, color={0,0,255}));
    connect(add13.u2, add12.u1) annotation (Line(points={{-8,-178},{-8,-140},{
            -44,-140},{-44,-158}}, color={0,0,127}));
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
    connect(add23.u1,add13. u1) annotation (Line(points={{64,-248},{64,-160},{4,
            -160},{4,-178}}, color={0,0,127}));
    connect(twoWindingTransformer.p, B1.p)
      annotation (Line(points={{0,-77},{0,-84}}, color={0,0,255}));
    connect(B1.p, gen3.pwPin)
      annotation (Line(points={{0,-84},{0,-99}}, color={0,0,255}));
    connect(add12.y, y_12)
      annotation (Line(points={{-50,-181},{-50,-202}}, color={0,0,127}));
    connect(add23.y, y_23)
      annotation (Line(points={{58,-271},{58,-290}}, color={0,0,127}));
    connect(add13.y, y_13)
      annotation (Line(points={{-2,-201},{-2,-220}}, color={0,0,127}));
    connect(multisine_Noise_SysId.pwPin, line_8_9.n) annotation (Line(points={{
            -41,147},{4,147},{4,90},{30.9,90}}, color={0,0,255}));
    connect(P_ref, multisine_Noise_SysId.P_ref) annotation (Line(points={{-140,
            160},{-92,160},{-92,147},{-60,147}}, color={0,0,127}));
    connect(Q_ref, multisine_Noise_SysId.Q_ref) annotation (Line(points={{-140,
            130},{-92,130},{-92,143},{-60,143}}, color={0,0,127}));
    connect(B2.Angle, add12.u2) annotation (Line(points={{-118,94.8},{-116,94.8},
            {-116,116},{-200,116},{-200,-120},{-56,-120},{-56,-158}}, color={0,
            0,127}));
    connect(add23.u2, add12.u2) annotation (Line(points={{52,-248},{52,-240},{
            -80,-240},{-80,-120},{-56,-120},{-56,-158}}, color={0,0,127}));
    connect(B1.Angle, add12.u1) annotation (Line(points={{4.8,-94},{4.8,-98},{
            -44,-98},{-44,-158}}, color={0,0,127}));
    connect(B3.Voltage, add13.u1) annotation (Line(points={{126,92.8},{126,108},
            {166,108},{166,-160},{4,-160},{4,-178}}, color={0,0,127}));
    connect(B8.Vi, multisine_Noise_SysId.vi) annotation (Line(points={{8,90.8},
            {16,90.8},{16,166},{-43.6,166},{-43.6,154}}, color={0,0,127}));
    connect(B8.Vr, multisine_Noise_SysId.vr) annotation (Line(points={{8,88.8},
            {20,88.8},{20,170},{-46.4,170},{-46.4,154}}, color={0,0,127}));
    connect(line_9_6.p, B6.p)
      annotation (Line(points={{86,48.9},{86,20}}, color={0,0,255}));
    connect(B6.p, line_6_4.p)
      annotation (Line(points={{86,20},{86,-12.9}}, color={0,0,255}));
    connect(multisine_Noise_SysId_load.pwPin, line_6_4.p) annotation (Line(
          points={{63.3,-0.9},{70,-0.9},{70,4},{86,4},{86,-12.9}}, color={0,0,
            255}));
    connect(B6.Vr, multisine_Noise_SysId_load.vr) annotation (Line(points={{
            84.8,10},{59.52,10},{59.52,4}}, color={0,0,127}));
    connect(B6.Vi, multisine_Noise_SysId_load.vi) annotation (Line(points={{
            86.8,10},{86.8,8},{61.48,8},{61.48,4}}, color={0,0,127}));
    connect(e1, multisine_Noise_SysId_load.P_ref) annotation (Line(points={{27,
            3},{44,3},{44,-0.9},{50,-0.9}}, color={0,0,127}));
    connect(e2, multisine_Noise_SysId_load.Q_ref) annotation (Line(points={{27,
            -7},{44,-7},{44,-3.7},{50,-3.7}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},{
              180,180}})),
      Icon(coordinateSystem(extent={{-220,-300},{180,180}})),
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
        StopTime=30,
        Interval=0.001,
        __Dymola_Algorithm="Dassl"),
      __Dymola_experimentSetupOutput);
  end NetworkSysId;
  annotation (uses(Modelica(version="3.2.3"), OpenIPSL(version="1.5.0"),
      LPV(version="1.5.0")));
end ThreeMachineNineBus;
