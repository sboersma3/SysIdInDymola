within HVDCcomponents;

model DynamicLine
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-100,
            -10},{-80,10}}), iconTransformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Interfaces.PwPin n annotation (Placement(transformation(extent={{80,
            -10},{100,10}}), iconTransformation(extent={{80,-10},{100,10}})));
  parameter Modelica.SIunits.PerUnit R "Resistance (pu)"
    annotation (Dialog(group="Line parameters"));
  parameter Modelica.SIunits.PerUnit X "Reactance (pu)"
    annotation (Dialog(group="Line parameters"));
  parameter Modelica.SIunits.PerUnit G "Shunt half conductance (pu)"
    annotation (Dialog(group="Line parameters"));
  parameter Modelica.SIunits.PerUnit B "Shunt half susceptance (pu)"
    annotation (Dialog(group="Line parameters"));
  parameter Real fn=SysData.fn "frequency (Hz)";
  parameter Real S_b=SysData.S_b "System base power (MVA)";
    annotation (Dialog(group="Line parameters", enable=false));
  parameter Boolean displayPF=false "Display power flow results:" annotation (
      Dialog(
      group="Visualisation",
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(checkBox=true));
//  OpenIPSL.Types.ActivePowerMega P12;
//  OpenIPSL.Types.ActivePowerMega P21;
//  OpenIPSL.Types.ReactivePowerMega Q12;
//  OpenIPSL.Types.ReactivePowerMega Q21;
//  Complex vs(re=p.vr, im=p.vi);
//  Complex is(re=p.ir, im=p.ii);
//  Complex vr(re=n.vr, im=n.vi);
//  Complex ir(re=n.ir, im=n.ii);
  
  constant Real pi=2*Modelica.Math.asin(1.0);
  
  parameter Real V10;
  parameter Real angle10;
  parameter Real V20;
  parameter Real angle20;
  
  Real w=2*pi*fn;
  Real V1r0=V10*cos(angle10*pi/180);
  Real V1i0=V10*sin(angle10*pi/180);
  Real V2r0=V20*cos(angle20*pi/180);
  Real V2i0=V20*sin(angle20*pi/180);
  Real L=X;
  Real Rc=1/G;
  Real C=B;
  Real I1r=p.ir;
  Real I1i=p.ii;
  Real I2r=n.ir;
  Real I2i=n.ii;
  Real V1r (start=V10*cos(angle10*pi/180));
  Real V1i (start=V10*sin(angle10*pi/180));
  Real V2r (start=V20*cos(angle20*pi/180));
  Real V2i (start=V20*sin(angle20*pi/180));
  Real ILr;
  Real ILi;
//  Real ILr0;
//  Real ILi0;
  
//  Real I1r0;
//  Real I1i0;
//  Real I2r0;
//  Real I2i0;
  

  
  
initial equation

// ILr=ILr0;
// ILi=ILi0;
// I1r=I1r0;
// I1i=I1i0;
// I2r=I2r0;
// I2i=I2i0;
// V1r=V1r0;
// V1i=V1i0;
// V2r=V2r0;
// V2i=V2i0;

//  V1r=p.vr;
//  V1i=p.vi;
//  V2r=n.vr;
//  V2i=n.vi;
 
0 = (-R*w/L)*ILr + w*ILi + (w/L)*V1r - (w/L)*V2r;
0 = -w*ILr - (R*w/L)*ILi + (w/L)*V1i - (w/L)*V2i;
0 = (-w/(Rc*C))*V1r + w*V1i + (w/C)*(ILr-I1r);// - (w/C)*ILr;
0 = -w*V1r - (w/(Rc*C))*V1i + (w/C)*(ILi-I1i);// - (w/C)*ILi;
0 = (-w/(Rc*C))*V2r + w*V2i - (w/C)*(I2r-ILr);// + (w/C)*ILr;
0 = -w*V2r - (w/(Rc*C))*V2i - (w/C)*(I2i-ILi);// + (w/C)*ILi;
 
equation
//Calculations for the power flow display
//  P12 = real(vs*conj(is))*S_b;
//  P21 = -real(vr*conj(ir))*S_b;
//  Q12 = imag(vs*conj(is))*S_b;
//  Q21 = -imag(vr*conj(ir))*S_b;


//0 = (-R*w/L)*ILr0 + w*ILi0 + (w/L)*V1r0 - (w/L)*V2r0;
//0 = -w*ILr0 - (R*w/L)*ILi0 + (w/L)*V1i0 - (w/L)*V2i0;
//0 = (-w/(Rc*C))*V1r0 + w*V1i0 + (w/C)*(ILr0-I1r0);// - (w/C)*ILr;
//0 = -w*V1r0 - (w/(Rc*C))*V1i0 + (w/C)*(ILi0-I1i0);// - (w/C)*ILi;
//0 = (-w/(Rc*C))*V2r0 + w*V2i0 - (w/C)*(I2r0-ILr0);// + (w/C)*ILr;
//0 = -w*V2r0 - (w/(Rc*C))*V2i0 - (w/C)*(I2i0-ILi0);// + (w/C)*ILi; 
 
V1r=p.vr;
V1i=p.vi;
V2r=n.vr;
V2i=n.vi;  
  
//PI model 
der(ILr) = (-R*w/L)*ILr + w*ILi + (w/L)*V1r - (w/L)*V2r;
der(ILi) = -w*ILr - (R*w/L)*ILi + (w/L)*V1i - (w/L)*V2i;
der(V1r) = (-w/(Rc*C))*V1r + w*V1i + (w/C)*(ILr-I1r);// - (w/C)*ILr;
der(V1i) = -w*V1r - (w/(Rc*C))*V1i + (w/C)*(ILi-I1i);// - (w/C)*ILi;
der(V2r) = (-w/(Rc*C))*V2r + w*V2i - (w/C)*(I2r-ILr);// + (w/C)*ILr ;
der(V2i) = -w*V2r - (w/(Rc*C))*V2i - (w/C)*(I2i-ILi);// + (w/C)*ILi ; 

//V1r + ILr*R - ILi*X = V2r;
//V1i + ILr*X + ILi*R = V2i;
//V1r*G - V1i*B + I1r = ILr;
//V1i*G + V1r*B + I1i = ILi;
//ILr + V2r*G - V2i*B = I2r;
//ILi + V2r*B + V2i*G = I2i;


  annotation (Icon(coordinateSystem(preserveAspectRatio=true, initialScale=0.1),
        graphics={Rectangle(
          extent={{-80,40},{80,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{-60,20},{60,-20}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-200,160},{-20,40}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P12, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-120,70},{-120,50},{-80,60},{-120,70}}, if P12
             >= 0 then {{-120,70},{-120,50},{-80,60},{-120,70}} else {{-80,70},
            {-80,50},{-120,60},{-80,70}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{20,160},{200,40}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P21, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{80,70},{80,50},{120,60},{80,70}}, if P21 >= 0
             then {{80,70},{80,50},{120,60},{80,70}} else {{120,70},{120,50},{
            80,60},{120,70}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-200,-40},{-20,-160}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q12, " Mvar"))),
          Polygon(
          visible=displayPF,
          points=DynamicSelect({{-120,-70},{-120,-50},{-80,-60},{-120,-70}},
            if Q12 >= 0 then {{-120,-70},{-120,-50},{-80,-60},{-120,-70}} else
            {{-80,-70},{-80,-50},{-120,-60},{-80,-70}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{20,-40},{200,-160}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q21, " Mvar"))),
          Polygon(
          visible=displayPF,
          points=DynamicSelect({{80,-70},{80,-50},{120,-60},{80,-70}}, if Q21
             >= 0 then {{80,-70},{80,-50},{120,-60},{80,-70}} else {{120,-70},{
            120,-50},{80,-60},{120,-70}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Text(
          extent={{-60,20},{60,-20}},
          lineColor={255,255,0},
          textString="%name")}), Documentation);

end DynamicLine;