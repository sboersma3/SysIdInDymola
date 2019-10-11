within Generation_Groups;
model GroupBus1
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=1.122656195484139 "Initial field voltage";
  parameter Real vref0=1.065622531687790 "Reference voltage AVR";
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR1(
    Ta=0.02,
    Kf=0.002,
    Tf=1,
    Ke=1,
    Te=0.2,
    Tr=0.001,
    vrmax=7.32,
    vrmin=0,
    Ka=200,
    v0=V_0) annotation (Placement(transformation(extent={{-70,-6},{-18,42}})));
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 Syn1(
    Sn=615,
    Vn=69,
    V_b=V_b,
    fn=60,
    ra=0,
    xd=0.8979,
    xq=0.646,
    x1d=0.2998,
    x2d=0.23,
    x2q=0.4,
    T1d0=7.4,
    T2d0=0.03,
    T2q0=0.033,
    M=2*5.148,
    D=2,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{16,-32},{70,30}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{82,-12},
            {102,8}}),           iconTransformation(extent={{82,-12},{102,8}})));
equation
  connect(AVR1.vf, Syn1.vf) annotation (Line(points={{-12.8,18},{-6,18},{-6,
          14.5},{10.6,14.5}},
                        color={0,0,127}));
  connect(Syn1.v, AVR1.v) annotation (Line(points={{72.7,8.3},{78,8.3},{78,-56},
          {-100,-56},{-100,4},{-75.2,4},{-75.2,3.6}},
                                                    color={0,0,127}));
  connect(Syn1.p, pwPin) annotation (Line(points={{70,-1},{82.35,-1},{82.35,-2},
          {92,-2}},  color={0,0,255}));
  connect(Syn1.pm0, Syn1.pm) annotation (Line(points={{21.4,-35.1},{21.4,-44},{
          -4,-44},{-4,-16.5},{10.6,-16.5}}, color={0,0,127}));
  connect(AVR1.vref0, AVR1.vref) annotation (Line(points={{-44,46.8},{-46,46.8},
          {-46,70},{-92,70},{-92,32.4},{-75.2,32.4}},          color={0,0,127}));
  connect(AVR1.vf0, Syn1.vf0) annotation (Line(points={{-44,-10.8},{-44,-30},{
          -10,-30},{-10,44},{21.4,44},{21.4,33.1}},
                                              color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=
            false),graphics={Text(
          extent={{-93,6},{-24,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString=""),Ellipse(extent={{-94,68},{98,-84}}, lineColor={28,108,
          200}),Line(points={{-28,-8},{-12,16}}, color={28,108,200}),Line(
          points={{-12,16},{14,-16},{32,10}}, color={28,108,200}),Text(
          extent={{-18,-32},{20,-64}},
          lineColor={28,108,200},
          textString="Gen1 5.2")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;OpenIPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;OpenIPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The OpenIPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The OpenIPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the OpenIPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end GroupBus1;
