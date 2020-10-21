package LPV "Linear Parameter Varying System Library"
  model VoltDependantLPV "Voltage Dependent Load"
    extends OpenIPSL.Electrical.Loads.PSAT.BaseClasses.baseLoad;
    parameter Real alphap=2.0 "Active power exponent";
    parameter Real alphaq=2.0 "Reactive power exponent";
protected
    Real a "Auxiliary variable, voltage division";
  equation
    a = V/V_0;
    P = P_0/S_b*a^alphap;
    Q = Q_0/S_b*a^alphaq;
    annotation (Icon(coordinateSystem(
          extent={{-100.0,-100.0},{100.0,100.0}},
          preserveAspectRatio=true,
          initialScale=0.1,
          grid={12,12})), Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Voltage Dependent Load, PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
  end VoltDependantLPV;

annotation (
  uses(Modelica(version="3.2.3"), Complex(version="3.2.3"),
    OpenIPSL(version="1.5.0"),
    Modelica_LinearSystems2(version="2.3.5")),
  version="1.5.0",
  conversion(noneFromVersion={"0.8","0.8.1","1.0.0"}),
  Documentation,
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://LPV/Resources/Images/blockscheme.png")}));
end LPV;
