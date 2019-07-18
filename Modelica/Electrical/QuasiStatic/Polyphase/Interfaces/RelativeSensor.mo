within Modelica.Electrical.QuasiStatic.Polyphase.Interfaces;
partial model RelativeSensor "Partial voltage / current sensor"
  extends Modelica.Icons.RotationalSensor;
  extends TwoPlug;
  Modelica.ComplexBlocks.Interfaces.ComplexOutput y[m] annotation (
      Placement(transformation(
        origin={0,-110},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  annotation (Icon(graphics={
        Line(points={{-70,0},{-94,0}}, color={85,170,255}),
        Line(points={{70,0},{94,0}}, color={85,170,255}),
        Line(points={{0,-70},{0,-80},{0,-90},{0,-100}}, color={85,170,255}),
        Text(
          extent={{150,-100},{-150,-70}},
          textString="m=%m"),
        Text(
          textColor={0,0,255},
          extent={{-150,80},{150,120}},
          textString="%name")}), Documentation(info="<html>
<p>
The relative sensor partial model relies on the
<a href=\"modelica://Modelica.Electrical.QuasiStatic.Polyphase.Interfaces.TwoPlug\">TwoPlug</a> to measure the complex voltages, currents or power. Additionally this model contains a proper icon and a definition of the angular velocity.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStatic.Polyphase.Interfaces.AbsoluteSensor\">AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.AbsoluteSensor\">SinglePhase.Interfaces.AbsoluteSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.RelativeSensor\">SinglePhase.Interfaces.RelativeSensor</a>
</p>

</html>"));

end RelativeSensor;
