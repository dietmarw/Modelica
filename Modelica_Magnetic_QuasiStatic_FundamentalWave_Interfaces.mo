within ;
encapsulated package Modelica_Magnetic_QuasiStatic_FundamentalWave_Interfaces
  "Interfaces"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Electrical_QuasiStationary;
  import Modelica_ComplexMath;
  import Complex;
  import Modelica_Electrical_Machines;
  import Modelica_Constants;
  import Modelica_Magnetic_FundamentalWave;
  import Modelica_Electrical_Machines_Interfaces;
  import Modelica_Mechanics_Rotational_Interfaces;
  import Modelica_Mechanics_Rotational;
  import Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces;
  import Modelica_Magnetic_QuasiStatic_FundamentalWave;
  import Modelica_Math;
  extends Modelica_Icons.InterfacesPackage;
  connector MagneticPort "Basic quasi static magnet connector"
    Modelica_SIunits.ComplexMagneticPotential V_m
      "Complex magnetic potential at the node";
    flow Modelica_SIunits.ComplexMagneticFlux Phi
      "Complex magnetic flux flowing into the pin";
    annotation (Documentation(info="<html>
<p>Base definition of complex quasi static magnetic port. The potential variable is the complex magnetic potential difference <code>V_m</code> and the flow variable is the complex magnetic flux <code>Phi</code>.</p>
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>
</p>

</html>"));
  end MagneticPort;

  connector PositiveMagneticPort "Positive quasi static magnetic port"
    extends MagneticPort;
    Modelica_Electrical_QuasiStationary.Types.Reference reference "Reference";
    annotation (
      defaultComponentName="port_p",
      Diagram(graphics={Text(
                extent={{-100,100},{100,60}},
                lineColor={255,170,85},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={255,170,85},
                fillColor={255,170,85},
                fillPattern=FillPattern.Solid)}),
      Icon(graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={255,170,85},
                fillColor={255,170,85},
                fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>

<p>
The positive port is based on
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.MagneticPort\">MagneticPort</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angluar velocity of the quasi static voltage and current. The symbol is also designed such way to look different than the
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.MagneticPort\">MagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.NegativeMagneticPort\">NegativeMagneticPort</a>
</p>
</html>"));
  end PositiveMagneticPort;

  connector NegativeMagneticPort "Negative quasi static magnetic port"
    extends MagneticPort;
    Modelica_Electrical_QuasiStationary.Types.Reference reference "Reference";
    annotation (
      defaultComponentName="port_n",
      Diagram(graphics={Text(
                extent={{-100,100},{100,60}},
                lineColor={255,170,85},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),Ellipse(
                extent={{-40,40},{40,-40}},
                lineColor={255,170,85},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
      Icon(graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={255,170,85},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>

<p>
The negative pin is based on <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase_Interfaces.Pin\">Pin</a>.
Additionally the reference angle is specified in the connector. The time derivative of the reference angle is the actual angluar velocity of the quasi static voltage and current. The symbol is also designed such way to look different than the <a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase_Interfaces.PositivePin\">positive pin</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.MagneticPort\">MagneticPort</a>,
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.PositiveMagneticPort\">PositiveMagneticPort</a>
</p>
</html>"));
  end NegativeMagneticPort;

  partial model PartialTwoPort "Partial two port for graphical programming"
    Modelica_SIunits.AngularVelocity omega=der(port_p.reference.gamma);
    PositiveMagneticPort port_p "Positive quasi static magnetic port"
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
            rotation=0)));
    NegativeMagneticPort port_n "Negative quasi static magnetic port"
      annotation (Placement(transformation(extent={{90,-10},{110,10}},
            rotation=0)));
  equation
    Connections.branch(port_p.reference, port_n.reference);
    port_p.reference.gamma = port_n.reference.gamma;
    annotation (
      Documentation(info="<html>
<p>
The partial two port model consists of a positive and a negative magnetic port. The reference angles of the two ports are set equal and connected through <code>Connections.branch</code>.
</p>
</html>"),
      Icon(graphics),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end PartialTwoPort;

  partial model PartialTwoPortExtended
    "Partial two port for graphical programming with additonal variables"
    extends PartialTwoPort;

    Modelica_SIunits.ComplexMagneticPotentialDifference V_m = port_p.V_m - port_n.V_m
      "Complex magnetic potential difference";
    Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
      "Magnitude of complex magnetic potential difference";
    Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
      "Argument of complex magnetic potential difference";
    Modelica_SIunits.ComplexMagneticFlux Phi = port_p.Phi
      "Complex magnetic flux";
    Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
      "Magnitude of complex magnetic flux";
    Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
      "Argument of complex magnetic flux";

    annotation (
      Documentation(info="<html>
<p>
The partial two port model consists of a positive and a negative magnetic port. The reference angles of the two ports are set equal and connected through <code>Connections.branch</code>.
</p>
<p>
This interface model contains an extended set of (output) variables compared to
<a href=\"modelica://Modelica.Magnetic.QuasiStatic.FundamentalWave_Interfaces.PartialTwoPort\">PartialTwoPort</a>.
</p>
</html>"),
      Icon(graphics),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end PartialTwoPortExtended;

  partial model PartialTwoPortElementary
    "Elementary partial two port for textual programming"
    extends PartialTwoPort;
    Modelica_SIunits.ComplexMagneticPotentialDifference V_m
      "Complex magnetic potential difference";
    Modelica_SIunits.MagneticPotentialDifference abs_V_m = Modelica_ComplexMath.'abs'(V_m)
      "Magnitude of complex magnetic potential difference";
    Modelica_SIunits.Angle arg_V_m = Modelica_ComplexMath.arg(V_m)
      "Argument of complex magnetic potential difference";
    Modelica_SIunits.ComplexMagneticFlux Phi "Complex magnetic flux";
    Modelica_SIunits.MagneticPotentialDifference abs_Phi = Modelica_ComplexMath.'abs'(Phi)
      "Magnitude of complex magnetic flux";
    Modelica_SIunits.Angle arg_Phi = Modelica_ComplexMath.arg(Phi)
      "Argument of complex magnetic flux";

  equation
    V_m = port_p.V_m - port_n.V_m;
    Phi = port_p.Phi;
    port_p.Phi + port_n.Phi = Complex(0, 0);
    annotation (
      Documentation(info="<html>
<p>
The partial two port elementary model extends from the partial two port model and adds one equation considering the balance of flow variables, <code>port_p.Phi + port_n.Phi = Complex(0,0)</code>. Additionally, a variable for magnetic potential difference of the two magnetic ports, <code>V_m</code>, and the flux into the positive port, <code>Phi</code>, are defined.
</p>
</html>"),
      Icon(graphics),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end PartialTwoPortElementary;

  partial model PartialBasicMachine
    "Partial model for quasi static multi phase machines"
    extends
      Modelica_Electrical_Machines.Icons.QuasiStaticFundamentalWaveMachine;
    constant Modelica_SIunits.Angle pi=Modelica_Constants.pi;
    parameter Integer m(min=3) = 3 "Number of stator phases";
    // Mechanical parameters
    parameter Modelica_SIunits.Inertia Jr(start=0.29) "Rotor inertia";
    parameter Boolean useSupport=false
      "Enable / disable (=fixed stator) support" annotation (Evaluate=true);
    parameter Modelica_SIunits.Inertia Js(start=Jr) "Stator inertia"
      annotation (Dialog(enable=useSupport));
    parameter Boolean useThermalPort=false
      "Enable / disable (=fixed temperatures) thermal port"
      annotation (Evaluate=true);
    parameter Integer p(min=1, start=2) "Number of pole pairs (Integer)";
    parameter Modelica_SIunits.Frequency fsNominal(start=50)
      "Nominal frequency";
    parameter Modelica_SIunits.Temperature TsOperational(start=293.15)
      "Operational temperature of stator resistance" annotation (Dialog(group=
           "Operational temperatures", enable=not useThermalPort));
    parameter Modelica_SIunits.Resistance Rs(start=0.03)
      "Stator resistance per phase at TRef"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_SIunits.Temperature TsRef(start=293.15)
      "Reference temperature of stator resistance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter
      Modelica_Electrical_Machines.Thermal.LinearTemperatureCoefficient20
      alpha20s(start=0)
      "Temperature coefficient of stator resistance at 20 degC"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Real effectiveStatorTurns=1 "Effective number of stator turns";
    parameter Modelica_SIunits.Inductance Lssigma(start=3*(1 - sqrt(1 -
          0.0667))/(2*pi*fsNominal)) "Stator stray inductance"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_Magnetic_FundamentalWave.Types.SalientInductance L0(d(start=1),
        q(start=1)) "Salient inductance of an unchorded coil"
      annotation (Dialog(tab="Nominal resistances and inductances"));
    parameter Modelica_Electrical_Machines.Losses.FrictionParameters
      frictionParameters(wRef=2*pi*fsNominal/p) "Friction losses"
      annotation (Dialog(tab="Losses"));
    parameter Modelica_Electrical_Machines.Losses.CoreParameters
      statorCoreParameters(
      final m=3,
      wRef=2*pi*fsNominal/p,
      VRef(start=100))
      "Stator core losses; all parameters refer to stator side"
      annotation (Dialog(tab="Losses"));
    parameter Modelica_Electrical_Machines.Losses.StrayLoadParameters
      strayLoadParameters(IRef(start=100), wRef=2*pi*fsNominal/p)
      "Stray load losses" annotation (Dialog(tab="Losses"));
    output Modelica_SIunits.Angle gammas(start=0) = airGap.gammas
      "Angle of stator reference frame";
    output Modelica_SIunits.Angle gammar(start=0) = airGap.gammar
      "Angle of stator reference frame";
    output Modelica_SIunits.Angle gamma(start=0) = airGap.gamma
      "Electrical angle between stator and rotor";
    // Mechanical quantities
    output Modelica_SIunits.Angle phiMechanical=flange.phi - internalSupport.phi
      "Mechanical angle of rotor against stator";
    output Modelica_SIunits.AngularVelocity wMechanical(
      start=0,
      displayUnit="1/min") = der(phiMechanical)
      "Mechanical angular velocity of rotor against stator";
    output Modelica_SIunits.Torque tauElectrical=inertiaRotor.flange_a.tau
      "Electromagnetic torque";
    output Modelica_SIunits.Torque tauShaft=-flange.tau "Shaft torque";
    replaceable output
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialPowerBalanceInductionMachines
      powerBalance(
      final powerStator=
          Modelica_Electrical_QuasiStationary.MultiPhase.Functions.activePower(
          vs, is),
      final powerMechanical=wMechanical*tauShaft,
      final powerInertiaStator=inertiaStator.J*inertiaStator.a*inertiaStator.w,

      final powerInertiaRotor=inertiaRotor.J*inertiaRotor.a*inertiaRotor.w,
      final lossPowerStatorWinding=sum(stator.resistor.resistor.LossPower),
      final lossPowerStatorCore=stator.core.lossPower,
      final lossPowerStrayLoad=strayLoad.lossPower,
      final lossPowerFriction=friction.lossPower) "Power balance";

    // Stator voltages and currents
    output Modelica_SIunits.ComplexVoltage vs[m]=plug_sp.pin.v - plug_sn.pin.v
      "Complex stator voltage";
    Modelica_SIunits.Voltage abs_vs[m] = Modelica_ComplexMath.'abs'(vs)
      "Magnitude of complex stator voltage";
    Modelica_SIunits.Angle arg_vs[m] = Modelica_ComplexMath.arg(vs)
      "Argument of complex stator voltage";

    output Modelica_SIunits.ComplexCurrent is[m]=plug_sp.pin.i
      "Complex stator current";
    Modelica_SIunits.Current abs_is[m] = Modelica_ComplexMath.'abs'(is)
      "Magnitude of complex stator current";
    Modelica_SIunits.Angle arg_is[m] = Modelica_ComplexMath.arg(is)
      "Argument of complex stator current";

    Modelica_SIunits.ActivePower Ps[m] = {Modelica_ComplexMath.real(vs[k]*Modelica_ComplexMath.conj(is[k])) for k in 1:m}
      "Active stator power";
    Modelica_SIunits.ActivePower Ps_total = sum(Ps) "Total active stator power";
    Modelica_SIunits.ReactivePower Qs[m] = {Modelica_ComplexMath.imag(vs[k]*Modelica_ComplexMath.conj(is[k])) for k in 1:m}
      "Reactive stator power";
    Modelica_SIunits.ReactivePower Qs_total = sum(Qs)
      "Total reactive stator power";
    Modelica_SIunits.ApparentPower Ss[m] = {Modelica_ComplexMath.'abs'(vs[k]*Modelica_ComplexMath.conj(is[k])) for k in 1:m}
      "Magnitude of complex stator apparent power";
    Modelica_SIunits.ApparentPower Ss_total=sqrt(Ps_total^2+Qs_total^2)
      "Magntiude of total complex stator apparent power";
    Real pfs[m] = {cos(Modelica_ComplexMath.arg(Complex(Ps[k],Qs[k]))) for k in 1:m}
      "Stator power factor";

    Modelica_Mechanics_Rotational_Interfaces.Flange_a flange "Shaft"
      annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation
            =0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertiaRotor(final J=Jr)
      annotation (Placement(transformation(
          origin={80,0},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Modelica_Mechanics_Rotational_Interfaces.Flange_a support if useSupport
      "Support at which the reaction torque is acting" annotation (Placement(
          transformation(extent={{90,-110},{110,-90}}, rotation=0)));
    Modelica_Mechanics_Rotational.Components.Inertia inertiaStator(final J=Js)
      annotation (Placement(transformation(
          origin={80,-100},
          extent={{10,10},{-10,-10}},
          rotation=180)));
    Modelica_Mechanics_Rotational.Components.Fixed fixed if (not useSupport)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={70,-90})));
    Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces.PositivePlug plug_sp(final m=m)
      "Positive plug of stator" annotation (Placement(transformation(extent={{
              50,90},{70,110}}, rotation=0)));
    Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces.NegativePlug
      plug_sn(final m=m) "Negative plug of stator" annotation (Placement(
          transformation(extent={{-70,90},{-50,110}}, rotation=0)));
    Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.Components.SymmetricMultiPhaseWinding
      stator(
      final useHeatPort=true,
      final m=m,
      final RRef=Rs,
      final TRef=TsRef,
      final Lsigma=Lssigma,
      final effectiveTurns=effectiveStatorTurns,
      final TOperational=TsOperational,
      final GcRef=statorCoreParameters.GcRef,
      final alpha20=alpha20s)
      "Symmetric stator winding including resistances, zero and stray inductances and core losses"
      annotation (Placement(transformation(
          origin={0,40},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    replaceable
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalAmbientInductionMachines
      thermalAmbient(
      final useTemperatureInputs=false,
      final Ts=TsOperational,
      final m=m) if not useThermalPort annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-90})));
    replaceable
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalPortInductionMachines
      thermalPort(final m=m) if useThermalPort
      "Thermal port of induction machines"
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
    Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Ground groundS
      "Ground of stator magnetic circuit" annotation (Placement(transformation(
            extent={{-38,30},{-18,10}}, rotation=0)));
    Modelica_Magnetic_QuasiStatic_FundamentalWave.BasicMachines.Components.RotorSaliencyAirGap
      airGap(final p=p, final L0=L0) annotation (Placement(transformation(
          origin={0,0},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica_Magnetic_QuasiStatic_FundamentalWave.Components.Ground groundR
      "Ground of rotor magnetic circuit" annotation (Placement(transformation(
            extent={{-40,-30},{-20,-10}}, rotation=0)));
    Modelica_Magnetic_QuasiStatic_FundamentalWave.Losses.StrayLoad strayLoad(
      final strayLoadParameters=strayLoadParameters,
      final useHeatPort=true,
      final m=m)
      annotation (Placement(transformation(extent={{60,60},{40,80}})));
    Modelica_Electrical_Machines.Losses.Friction friction(final
        frictionParameters=frictionParameters, final useHeatPort=true)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={90,-30})));
  protected
    replaceable
      Modelica_Electrical_Machines_Interfaces.InductionMachines.PartialThermalPortInductionMachines
      internalThermalPort(final m=m)
      annotation (Placement(transformation(extent={{-44,-94},{-36,-86}})));
    Modelica_Mechanics_Rotational_Interfaces.Support internalSupport
      annotation (Placement(transformation(extent={{56,-104},{64,-96}},
            rotation=0)));
  initial algorithm
    assert(not Modelica_Math.isPowerOf2(m), String(m) +
      " phases are currently not supported in this version of FundametalWave");

  equation
    connect(stator.plug_n, plug_sn) annotation (Line(
        points={{-10,50},{-10,70},{-60,70},{-60,100}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(thermalPort, internalThermalPort) annotation (Line(
        points={{0,-100},{0,-90},{-40,-90}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(thermalAmbient.thermalPort, internalThermalPort) annotation (Line(
        points={{-60,-90},{-40,-90}},
        color={199,0,0},
        smooth=Smooth.None));
    connect(inertiaRotor.flange_b, flange)
      annotation (Line(points={{90,0},{100,0},{100,0}}, color={0,0,0}));
    connect(internalSupport, inertiaStator.flange_a) annotation (Line(
        points={{60,-100},{70,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(internalSupport, fixed.flange) annotation (Line(
        points={{60,-100},{60,-90},{70,-90}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(inertiaStator.flange_b, support) annotation (Line(points={{90,-100},
            {90,-100},{100,-100}}, color={0,0,0}));
    connect(airGap.flange_a, inertiaRotor.flange_a) annotation (Line(
        points={{10,0},{25,0},{25,0},{40,0},{40,0},{70,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(airGap.support, internalSupport) annotation (Line(
        points={{-10,0},{-50,0},{-50,-70},{60,-70},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(groundR.port_p, airGap.port_rn) annotation (Line(points={{-30,-10},
            {-30,-10},{-10,-10}}, color={255,128,0}));
    connect(stator.plug_p, strayLoad.plug_n) annotation (Line(
        points={{10,50},{10,70},{40,70}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(plug_sp, strayLoad.plug_p) annotation (Line(
        points={{60,100},{60,94},{60,94},{60,86},{60,86},{60,70}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(strayLoad.support, internalSupport) annotation (Line(
        points={{50,60},{50,50},{60,50},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(strayLoad.heatPort, internalThermalPort.heatPortStrayLoad)
      annotation (Line(
        points={{60,60},{60,50},{50,50},{50,-80},{-40,-80},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(friction.support, internalSupport) annotation (Line(
        points={{90,-40},{90,-70},{60,-70},{60,-100}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(strayLoad.flange, inertiaRotor.flange_b) annotation (Line(
        points={{50,80},{90,80},{90,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(friction.flange, inertiaRotor.flange_b) annotation (Line(
        points={{90,-20},{90,0}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(friction.heatPort, internalThermalPort.heatPortFriction)
      annotation (Line(
        points={{80,-40},{50,-40},{50,-80},{-40,-80},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(groundS.port_p, airGap.port_sp) annotation (Line(
        points={{-28,10},{-10,10}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(stator.port_n, airGap.port_sp) annotation (Line(
        points={{-10,30},{-10,10}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(stator.port_p, airGap.port_sn) annotation (Line(
        points={{10,30},{10,10}},
        color={255,128,0},
        smooth=Smooth.None));
    connect(stator.heatPortWinding, internalThermalPort.heatPortStatorWinding)
      annotation (Line(
        points={{-10,44},{-40,44},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(stator.heatPortCore, internalThermalPort.heatPortStatorCore)
      annotation (Line(
        points={{-10,36},{-40,36},{-40,-90}},
        color={191,0,0},
        smooth=Smooth.None));
    annotation (
      Documentation(info="<HTML>
<p>This partial model for induction machines contains elements common in all machine models.</p>
</HTML>"),
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}), graphics={
          Rectangle(
            extent={{80,-80},{120,-120}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-50,100},{-20,100},{-20,70}}, color={85,170,255}),
          Line(points={{50,100},{20,100},{20,70}}, color={85,170,255}),
          Text(
            extent={{-150,-120},{150,-180}},
            lineColor={0,0,255},
            textString="%name"),
          Line(
            visible=not useSupport,
            points={{80,-100},{120,-100}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{90,-100},{80,-120}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{100,-100},{90,-120}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{110,-100},{100,-120}},
            color={0,0,0},
            smooth=Smooth.None),
          Line(
            visible=not useSupport,
            points={{120,-100},{110,-120}},
            color={0,0,0},
            smooth=Smooth.None)}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics));
  end PartialBasicMachine;
  annotation (uses(Modelica_Math(version="3.2.2"),
                   Modelica_Magnetic_QuasiStatic_FundamentalWave(version="3.2.2"),
                   Modelica_Electrical_QuasiStationary_MultiPhase_Interfaces(version="3.2.2"),
                   Modelica_Mechanics_Rotational(version="3.2.2"),
                   Modelica_Mechanics_Rotational_Interfaces(version="3.2.2"),
                   Modelica_Electrical_Machines_Interfaces(version="3.2.2"),
                   Modelica_Magnetic_FundamentalWave(version="3.2.2"),
                   Modelica_Constants(version="3.2.2"),
                   Modelica_Electrical_Machines(version="3.2.2"),
                   Modelica_ComplexMath(version="3.2.2"),
                   Modelica_Electrical_QuasiStationary(version="3.2.2"),
                   Modelica_SIunits(version="3.2.2"),
                   Modelica_Icons(version="3.2.2"),
                   Complex(version="3.2.2")),
              version="3.2.2");
end Modelica_Magnetic_QuasiStatic_FundamentalWave_Interfaces;
