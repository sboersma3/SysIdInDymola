within ExcitationGeneration;
model Multisine_Noise_SysId
  Modelica.Blocks.Math.Sum sum_P(nin=1)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  VSC_inj vSC_inj
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Interfaces.RealInput vr annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={36,100})));
  Modelica.Blocks.Interfaces.RealInput vi annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={64,100})));
  Modelica.Blocks.Interfaces.RealInput P_ref
    annotation (Placement(transformation(extent={{-120,10},{-80,50}})));
  Modelica.Blocks.Math.Sum sum_Q(nin=1)
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Interfaces.RealInput Q_ref
    annotation (Placement(transformation(extent={{-120,-30},{-80,10}})));
equation
  connect(sum_P.y, vSC_inj.Pref)
    annotation (Line(points={{21,30},{38,30}}, color={0,0,127}));
  connect(vSC_inj.p, pwPin) annotation (Line(points={{61.2,34.8},{72.6,34.8},{
          72.6,30},{90,30}}, color={0,0,255}));
  connect(vSC_inj.vr, vr) annotation (Line(points={{45,42},{44,42},{44,60},{36,
          60},{36,100}}, color={0,0,127}));
  connect(vSC_inj.vi, vi) annotation (Line(points={{55,42},{55,60},{64,60},{64,
          100}}, color={0,0,127}));
  connect(P_ref, sum_P.u[1])
    annotation (Line(points={{-100,30},{-2,30}}, color={0,0,127}));
  connect(sum_Q.y, vSC_inj.Qref) annotation (Line(points={{21,-10},{30,-10},{30,
          30},{38,30}}, color={0,0,127}));
  connect(Q_ref, sum_Q.u[1])
    annotation (Line(points={{-100,-10},{-2,-10}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Multisine_Noise_SysId;
