within Groups.PSSE.AVR;
model G1
  extends Support.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROU g1(
    Tpd0=8,
    Tppd0=0.03,
    Tppq0=0.05,
    H=6.5,
    Xd=1.8,
    Xq=1.7,
    Xpd=0.3,
    Xppd=0.25,
    Xppq=0.25,
    Xl=0.2,
    R_a=0.0025,
    D=0.02,
    S12=0.802,
    S10=0.18600,
    M_b=900,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.55,
    Tpq0=0.4) annotation (Placement(transformation(extent={{-4,-18},{36,18}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=1,
    T_B=1,
    K=200,
    T_E=0.01,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{-90,38},{-38,84}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-106,12},{-100,18}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-132,70},{-108,94}})));
equation
  connect(g1.PMECH, g1.PMECH0) annotation (Line(points={{-8,9},{-14,9},{-14,26},
          {42,26},{42,9},{38,9}},                           color={0,0,127}));
  connect(g1.p, pwPin)
    annotation (Line(points={{36,0},{70,0}},        color={0,0,255}));
  connect(sEXS.EFD, g1.EFD) annotation (Line(points={{-36.7,63.5556},{-36.7,-9},
          {-8,-9}},
                color={0,0,127}));
  connect(g1.ETERM, sEXS.ECOMP) annotation (Line(points={{38,-5.4},{54,-5.4},{
          54,-46},{-116,-46},{-116,63.5556},{-90,63.5556}},
                                        color={0,0,127}));
  connect(sEXS.VOTHSG, u) annotation (Line(points={{-90,75.0556},{-102,75.0556},
          {-102,82},{-120,82}}, color={0,0,127}));
  connect(const.y, sEXS.VUEL) annotation (Line(points={{-99.7,15},{-80.9,15},{
          -80.9,38}}, color={0,0,127}));
  connect(sEXS.VOEL, sEXS.VUEL) annotation (Line(points={{-73.1,38},{-73.1,14},
          {-82,14},{-82,15},{-80.9,15},{-80.9,38}}, color={0,0,127}));
  connect(g1.EFD0, sEXS.EFD0) annotation (Line(points={{38,-9},{46,-9},{46,-32},
          {-110,-32},{-110,46.9444},{-90,46.9444}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        initialScale=0.1)),
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
</html>"));
end G1;
