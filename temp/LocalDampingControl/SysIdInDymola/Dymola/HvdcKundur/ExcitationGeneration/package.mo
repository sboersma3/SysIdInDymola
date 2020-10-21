package ExcitationGeneration
  model SignalCurrent_phasor "Generic current source using the input signal as complex source current"
    import Modelica.ComplexMath.conj;
    import Modelica.ComplexMath.real;
    import Modelica.ComplexMath.imag;
    import Modelica.ComplexMath.j;
    OpenIPSL.Interfaces.PwPin p annotation (
      Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    OpenIPSL.Interfaces.PwPin n annotation (
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.ComplexBlocks.Interfaces.ComplexInput i "unit = A" annotation (
      Placement(visible = true, transformation(origin = {0, 78}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 78}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Complex zero(re = 0, im = 0);
    Complex vs(re = p.vr, im = p.vi);
    Complex is(re = p.ir, im = p.ii);
    Complex vr(re = n.vr, im = n.vi);
    Complex ir(re = n.ir, im = n.ii);
    Complex v;
    Modelica.SIunits.Voltage V "Voltage drop between the two pins (= p.v - n.v)";
  equation
    v = vs - vr;
    V = sqrt(real(v) ^ 2 + imag(v) ^ 2);
    zero = is + ir;
    i = is;
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255},
              fillPattern =                                                                                                                                                                                            FillPattern.Solid), Line(points = {{-90, 0}, {-50, 0}}, color = {0, 0, 255}), Line(points = {{50, 0}, {90, 0}}, color = {0, 0, 255}), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-150, -120}, {150, -80}}, textString = "%name", lineColor = {0, 0, 255}), Polygon(points = {{90, 0}, {60, 10}, {60, -10}, {90, 0}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid)}),
      Diagram(coordinateSystem(initialScale = 0.1), graphics={  Ellipse(lineColor = {0, 0, 255}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                   FillPattern.Solid, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{0, -50}, {0, 50}}, color = {0, 0, 255})}),
      Documentation(revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>", info = "<html>
<p>The signal current source is a parameterless converter of real valued signals into a the source current. No further effects are modeled. The real valued signal has to be provided by components of the blocks library. It can be regarded as the &quot;Opposite&quot; of a current sensor.</p>
</html>"));
  end SignalCurrent_phasor;

  model Ground_phasor "Ground node"
    import Modelica.ComplexMath.conj;
    import Modelica.ComplexMath.real;
    import Modelica.ComplexMath.imag;
    import Modelica.ComplexMath.j;
    OpenIPSL.Interfaces.PwPin p annotation (
      Placement(visible = true, transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Complex vs(re = p.vr, im = p.vi);
  equation
    vs = Complex(re = 0, im = 0);
    annotation (
      Documentation(info = "<html>
<p>Ground of an electrical circuit. The potential at the ground node is zero. Every electrical circuit has to contain at least one ground object.</p>
</html>", revisions = "<html>
<ul>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"),
      Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-60, 50}, {60, 50}}, color = {0, 0, 255}), Line(points = {{-40, 30}, {40, 30}}, color = {0, 0, 255}), Line(points = {{-20, 10}, {20, 10}}, color = {0, 0, 255}), Line(points = {{0, 90}, {0, 50}}, color = {0, 0, 255}), Text(extent = {{-144, -19}, {156, -59}}, textString = "%name", lineColor = {0, 0, 255})}),
      Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-60, 50}, {60, 50}}, thickness = 0.5, color = {0, 0, 255}), Line(points = {{-40, 30}, {40, 30}}, thickness = 0.5, color = {0, 0, 255}), Line(points = {{-20, 10}, {20, 10}}, thickness = 0.5, color = {0, 0, 255}), Line(points = {{0, 96}, {0, 50}}, thickness = 0.5, color = {0, 0, 255}), Text(extent = {{-24, -38}, {22, -6}}, textString = "p.v=0", lineColor = {0, 0, 255})}));
  end Ground_phasor;

  model Iref_calc
    import Modelica.ComplexMath.conj;
    import Modelica.ComplexMath.real;
    import Modelica.ComplexMath.imag;
    import Modelica.ComplexMath.j;
protected
    Modelica.Blocks.Interfaces.RealInput P annotation (
      Placement(visible = true, transformation(origin = {-122, 68}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 72}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Q annotation (
      Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-112, -64}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput vr annotation (
      Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput vi annotation (
      Placement(visible = true, transformation(origin = {60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealOutput ir annotation (
      Placement(visible = true, transformation(origin = {110, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput ii annotation (
      Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    ir = 1 / (vr ^ 2 + vi ^ 2) * (vr * P + vi * Q);
    ii = 1 / (vr ^ 2 + vi ^ 2) * (vi * P - vr * Q);
  end Iref_calc;


  model angle_derivator
    OpenIPSL.Interfaces.PwPin p "the positive direction of the current is from connector p ..." annotation (
      Placement(visible = true, transformation(extent = {{-92, -10}, {-72, 10}}, rotation = 0), iconTransformation(extent = {{-92, -10}, {-72, 10}}, rotation = 0)));
    Real angle = atan2(p.vi, p.vr) * 180 / Modelica.Constants.pi;
    Modelica.Blocks.Continuous.Derivative derivative1(T = 0.01, initType = Modelica.Blocks.Types.Init.NoInit, k = 1, x_start = 0, y_start = 50) annotation (
      Placement(visible = true, transformation(origin = {48, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression realExpression1(y = angle) annotation (
      Placement(visible = true, transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput out annotation (
      Placement(visible = true, transformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(derivative1.y, out) annotation (
      Line(points={{59,0},{84,0},{84,0},{94,0}},          color = {0, 0, 127}));
    p.ir = 0;
    p.ii = 0;
    connect(derivative1.u, realExpression1.y) annotation (
      Line(points={{36,0},{2,0},{2,0},{3,0}},          color = {0, 0, 127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics={  Rectangle(lineColor = {0, 0, 255}, fillColor = {95, 95, 95},
              fillPattern =                                                                                                                                          FillPattern.Solid, extent = {{-60, 20}, {60, -20}}), Text(lineColor = {255, 255, 0}, extent = {{-60, 20}, {60, -20}}, textString = "%name"), Rectangle(origin = {4, 28}, extent = {{-76, 12}, {80, -68}})}),
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end angle_derivator;

  model PMU
    OpenIPSL.Interfaces.PwPin p "the positive direction of the current is from connector p ..." annotation (
      Placement(visible = true, transformation(extent = {{-92, -10}, {-72, 10}}, rotation = 0), iconTransformation(extent = {{-92, -10}, {-72, 10}}, rotation = 0)));
    outer OpenIPSL.Electrical.SystemBase SysData;
    parameter Modelica.SIunits.Frequency f = SysData.fn;
    Real angle = atan2(p.vi, p.vr) * 180 / Modelica.Constants.pi;
    Real magnitude = sqrt(p.vi ^ 2 + p.vr ^ 2);
    Modelica.Blocks.Continuous.Derivative derivative1(T = 0.01, initType = Modelica.Blocks.Types.Init.NoInit, k = 1, x_start = 0, y_start = 50) annotation (
      Placement(visible = true, transformation(origin = {-42, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression realExpression1(y = angle) annotation (
      Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput phase annotation (
      Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant const(k = f) annotation (
      Placement(visible = true, transformation(origin = {-42, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k1 = +1) annotation (
      Placement(visible = true, transformation(origin = {-8, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Discrete.TransferFunction transferFunction1(a = {0.7139, -1.648, 1}, b = {4.574, 0.02006, 0}, samplePeriod = 0.01, startTime = 0) annotation (
      Placement(visible = true, transformation(origin = {26, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput freq annotation (
      Placement(visible = true, transformation(origin = {100, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {84, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Discrete.TransferFunction transferFunction2(a = {-0.04303, 0.4617, -0.05691, 1}, b = {1.356, 0.03749, -0.02081}, samplePeriod = 0.01, startTime = 0, x(start = 0)) annotation (
      Placement(visible = true, transformation(origin = {26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression realExpression2(y = angle) annotation (
      Placement(visible = true, transformation(origin = {-42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression realExpression3(y = magnitude) annotation (
      Placement(visible = true, transformation(origin = {-42, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Discrete.TransferFunction transferFunction3(a = {0.001701, -0.004658, 1}, b = {0.9952, 0.001746, 0}, samplePeriod = 0.01, startTime = 0, x(start = 0)) annotation (
      Placement(visible = true, transformation(origin = {26, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput mag annotation (
      Placement(visible = true, transformation(origin = {100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {84, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(freq, transferFunction1.y) annotation (
      Line(points = {{100, -68}, {36, -68}, {36, -68}, {38, -68}}, color = {0, 0, 127}));
    connect(transferFunction2.u, realExpression2.y) annotation (
      Line(points = {{14, 0}, {-32, 0}, {-32, 0}, {-30, 0}}, color = {0, 0, 127}));
    connect(phase, transferFunction2.y) annotation (
      Line(points = {{100, 0}, {38, 0}, {38, 0}, {38, 0}}, color = {0, 0, 127}));
    connect(mag, transferFunction3.y) annotation (
      Line(points = {{100, 60}, {36, 60}, {36, 60}, {38, 60}}, color = {0, 0, 127}));
    connect(transferFunction3.u, realExpression3.y) annotation (
      Line(points = {{14, 60}, {-32, 60}, {-32, 60}, {-30, 60}}, color = {0, 0, 127}));
    connect(transferFunction1.u, add1.y) annotation (
      Line(points = {{14, -68}, {4, -68}, {4, -68}, {4, -68}}, color = {0, 0, 127}));
    connect(derivative1.y, add1.u2) annotation (
      Line(points = {{-30, -80}, {-28, -80}, {-28, -74}, {-20, -74}, {-20, -74}}, color = {0, 0, 127}));
    connect(const.y, add1.u1) annotation (
      Line(points = {{-30, -52}, {-24, -52}, {-24, -62}, {-20, -62}, {-20, -62}}, color = {0, 0, 127}));
    connect(derivative1.u, realExpression1.y) annotation (
      Line(points = {{-54, -80}, {-68, -80}}, color = {0, 0, 127}));
    p.ir = 0;
    p.ii = 0;
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics={  Ellipse(extent = {{-18, 64}, {-18, 64}}, endAngle = 360), Polygon(points = {{158, -36}, {158, -36}, {158, -36}}), Polygon(fillColor = {254, 214, 214},
              fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{0, 100}, {80, 80}, {80, -80}, {0, -100}, {-80, -22}, {-80, 20}, {0, 100}, {0, 100}}), Text(origin = {6, 2}, extent = {{-52, 22}, {52, -22}}, textString = "%name")}),
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
      Dialog(group = "Power flow data", enable = false));
  end PMU;

  model VSC_inj "Partial model containing the network elements"
    parameter Real t_Pstart=0;
    parameter Real t_Qstart=0;
    parameter Real Qinj=0;
    parameter Modelica.SIunits.Frequency f1 = 0.1 "min frequency range of the signal";
    parameter Modelica.SIunits.Frequency f2 = 1.5 "max frequency range of the signal";
    parameter Real G(final unit = "") = 0.1 "Gain";
    import Modelica.Constants.pi;
    import Modelica.ComplexMath.real;
    import Modelica.ComplexMath.imag;
    ExcitationGeneration.SignalCurrent_phasor signalCurrent_phasor1 annotation (
      Placement(visible = true, transformation(origin={68,4},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    ExcitationGeneration.Ground_phasor ground_phasor1 annotation (
      Placement(visible = true, transformation(origin = {68, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput vr annotation (
      Placement(visible = true, transformation(origin = {-50, 114}, extent = {{-14, -14}, {14, 14}}, rotation = -90), iconTransformation(origin = {-50, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    Modelica.Blocks.Interfaces.RealInput vi annotation (
      Placement(visible = true, transformation(origin = {47, 113}, extent = {{-13, -13}, {13, 13}}, rotation = -90), iconTransformation(origin = {50, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
    OpenIPSL.Interfaces.PwPin p annotation (
      Placement(visible = true, transformation(origin={112,48},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={112,48},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.ComplexBlocks.ComplexMath.RealToComplex realToComplex1 annotation (
      Placement(visible = true, transformation(origin = {42, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Pref annotation (
      Placement(visible = true, transformation(origin={-114,28},    extent = {{-14, -14}, {14, 14}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput Qref annotation (Placement(
        visible=true,
        transformation(
          origin={-114,-12},
          extent={{-14,-14},{14,14}},
          rotation=0),
        iconTransformation(
          origin={-120,0},
          extent={{-20,-20},{20,20}},
          rotation=0)));
    Iref_calc iref_calc
      annotation (Placement(transformation(extent={{-14,0},{6,20}})));
  equation
    connect(signalCurrent_phasor1.n, p) annotation (
      Line(points={{68.2,14.4},{68,14.4},{68,48},{112,48}},  color = {0, 0, 255}));
    connect(ground_phasor1.p, signalCurrent_phasor1.p) annotation (
      Line(points={{68,-16.2},{68,-6.2}},  color = {0, 0, 255}));
    connect(realToComplex1.y, signalCurrent_phasor1.i) annotation (
      Line(points={{53,4},{60.2,4}},    color = {85, 170, 255}));
    connect(Qref, iref_calc.Q) annotation (Line(points={{-114,-12},{-28,-12},{
          -28,3.6},{-15.2,3.6}},   color={0,0,127}));
    connect(iref_calc.vr, vr) annotation (Line(points={{-10,22},{-10,40},{-50,
            40},{-50,114}}, color={0,0,127}));
    connect(iref_calc.vi, vi) annotation (Line(points={{2,22},{2,64},{47,64},{
            47,113}}, color={0,0,127}));
    connect(iref_calc.ir, realToComplex1.re) annotation (Line(points={{7,17.2},
            {20,17.2},{20,10},{30,10}}, color={0,0,127}));
    connect(iref_calc.ii, realToComplex1.im) annotation (Line(points={{7,4},{16,
            4},{16,-2},{30,-2}}, color={0,0,127}));
  connect(Pref, iref_calc.P) annotation (Line(points={{-114,28},{-66,28},{-66,
          17.2},{-15,17.2}}, color={0,0,127}));
  end VSC_inj;

  block GenerateMultiSine  "Multisinegenerator generator"
    parameter Real h;
    parameter Real ll;
    parameter Integer M;
    parameter Integer L;
    parameter Real A[L, M]=ones(L, M)
      "Matrix A with excitation amplitudes (e.g., A=[A1(t1), A2(t1); A1(t2), A2(t2)])";
    parameter Real B[M, L]=ones(M,L)
      "Matrix B with excitation frequencies (e.g., B=[w1(t1) w1(t2) ; w2(t1) w2(t2)])";
    parameter Real C[M,L]=zeros(M,L)
      "Matrix C with phase shifts (e.g., C=[phi1(t1) phi1(t2) ; phi2(t1) phi2(t2)])";

    Modelica.Blocks.Interfaces.RealVectorOutput Vecy[M,1]
      annotation (Placement(transformation(extent={{70,16},{110,56}})));
    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{90,-4},{110,16}})));

  equation



   for i in 1:M loop
     Vecy[i, 1] = A[1, i]*Modelica.Math.sin(B[i, 1]*time+C[i, 1]);
   end for;


  y = sum(Vecy);

  end GenerateMultiSine;

  annotation (experiment(__Dymola_NumberOfIntervals=100, Tolerance=0.001), uses(
        Modelica(version="3.2.3"), OpenIPSL(version="1.5.0"),
    Complex(version="3.2.3")));
end ExcitationGeneration;
