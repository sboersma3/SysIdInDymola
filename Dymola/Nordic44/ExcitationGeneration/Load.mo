within ExcitationGeneration;
model Load "PSS/E Load"
  extends OpenIPSL.Electrical.Loads.PSSE.BaseClasses.baseLoad;
  Modelica.Blocks.Interfaces.RealOutput Vr
    annotation (Placement(transformation(extent={{100,34},{120,54}})));
  Modelica.Blocks.Interfaces.RealOutput Vi
    annotation (Placement(transformation(extent={{100,52},{120,72}})));
  Modelica.Blocks.Interfaces.RealInput e
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
equation
  kI*S_I.re*v + S_Y.re*v^2 + kP*S_P.re + e = p.vr*p.ir + p.vi*p.ii;
  kI*S_I.im*v + S_Y.im*v^2 + kP*S_P.im + e = (-p.vr*p.ii) + p.vi*p.ir;
  Vi = p.vi;
  Vr = p.vr;
  annotation (Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS/E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>Unknown</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end Load;
