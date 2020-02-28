within ExcitationGeneration;
model Bus "Bus model"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Interfaces.PwPin p(vr(start=V_0*cos(angle_0*Modelica.Constants.pi/
          180)), vi(start=V_0*sin(angle_0*Modelica.Constants.pi/180)))
    annotation (Placement(
      visible=true,
      transformation(
        origin={0,0},
        extent={{-10.0,-10.0},{10.0,10.0}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Real V(start=V_0) "Bus voltage magnitude (pu)";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle(start=angle_0)
    "Bus voltage angle";
  parameter Boolean displayPF=true "Display voltage values:" annotation (Dialog(
      group="Visualisation",
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(checkBox=true));
  Modelica.Blocks.Interfaces.RealOutput Angle
    annotation (Placement(transformation(extent={{90,62},{110,82}})));
      Modelica.Blocks.Interfaces.RealOutput Omega
    annotation (Placement(transformation(extent={{90,40},{110,60}})));
  Modelica.Blocks.Interfaces.RealOutput Voltage
    annotation (Placement(transformation(extent={{90,18},{110,38}})));
  Modelica.Blocks.Interfaces.RealOutput Vi
    annotation (Placement(transformation(extent={{90,-2},{110,18}})));
  Modelica.Blocks.Interfaces.RealOutput Vr
    annotation (Placement(transformation(extent={{90,-22},{110,-2}})));
equation
  V = sqrt(p.vr^2 + p.vi^2);
  angle = atan2(p.vi, p.vr)*180/Modelica.Constants.pi;
  Angle      = angle;
  Omega      = (Angle);
  Voltage    = V;
  Vi         = p.vi;
  Vr         = p.vr;
  p.ir       = 0;
  p.ii       = 0;
  annotation (Icon(graphics={Rectangle(
          visible=true,
          fillPattern=FillPattern.Solid,
          extent={{-10,-100},{10,100}}),Text(
          visible=true,
          origin={-0.02605,120.133},
          fillPattern=FillPattern.Solid,
          extent={{-100,-20},{100,20}},
          textString="%name"),Text(
          visible=displayPF,
          origin={0,-120},
          extent={{-60,-20},{60,20}},
          lineColor={170,0,0},
          textString=DynamicSelect("Vpu", String(V, significantDigits=3))),Text(
          visible=displayPF,
          origin={0,-160},
          extent={{-60,-20},{60,20}},
          lineColor={170,0,0},
          textString=DynamicSelect("Angle", String(angle, significantDigits=3)
             + "°"))}), Documentation);
end Bus;
