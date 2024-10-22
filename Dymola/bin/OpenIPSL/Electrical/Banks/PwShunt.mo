within OpenIPSL.Electrical.Banks;
model PwShunt "Thyristor controlled Shunt reactor/capacitor"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Blocks.Interfaces.RealInput Q
    "Reactive power produced by the shunt (pu)"
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  constant Real pi=Modelica.Constants.pi;
  parameter Real fn=50 "Frequency rating, Hz";
  Real C "Capacitance in p.u";
  Real L "Inductance in p.u";
  Real v;
  Real anglev;
  Real i;
  Real anglei;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  i = sqrt(p.ir^2 + p.ii^2);
  anglei = atan2(p.ii, p.ir);
  if Q >= 0 then
    C = Q/(v^2*2*pi*fn);
    L = 0;
    anglei = anglev + pi/2;
    i = v*2*pi*fn*C;
  else
    L = v^2/(2*pi*fn*(-Q));
    C = 0;
    anglei = anglev - pi/2;
    i = v/(2*pi*fn*L);
  end if;
  //p.u
  //p.u
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          initialScale=0.1), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-94,8},{-84,-6}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={51,49.5},
          rotation=90),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={51,21.5},
          rotation=90),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={51,-6.5},
          rotation=90),Line(
          points={{-15.5,-9},{-15.5,-1},{-11.5,7},{-3.5,11},{6.5,9},{12.5,1},{
            12.5,-9}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          origin={51,-34.5},
          rotation=90),Line(points={{-80,-30},{-20,-30}}, color={0,0,255}),Line(
          points={{-70,-70},{-30,-70}}, color={0,0,255}),Line(points={{-60,-80},
          {-40,-80}}, color={0,0,255}),Line(points={{-80,-20},{-20,-20}}, color=
           {0,0,255}),Line(points={{-80,0},{-20,0}}, color={0,0,255}),Line(
          points={{-80,10},{-20,10}}, color={0,0,255}),Line(points={{-80,30},{-20,
          30}}, color={0,0,255}),Line(points={{-80,40},{-20,40}}, color={0,0,
          255}),Line(points={{40,-70},{80,-70}}, color={0,0,255}),Line(points={
          {50,-80},{70,-80}}, color={0,0,255}),Line(points={{-50,30},{-50,10}},
          color={0,0,255}),Line(points={{-50,0},{-50,-20}}, color={0,0,255}),
          Line(points={{-50,-30},{-50,-70}}, color={0,0,255}),Line(points={{60,
          -50},{60,-70}}, color={0,0,255}),Line(points={{-50,40},{-50,80},{0,80},
          {0,100}}, color={0,0,255}),Line(points={{60,62},{60,80},{0,80}},
          color={0,0,255}),Text(
          extent={{-100,-100},{100,-140}},
          lineColor={0,0,255},
          textString="%name")}), Documentation);
end PwShunt;
