within ;
encapsulated package Modelica_Electrical_Digital
  "Library for digital electrical components based on the VHDL standard with 9-valued logic and conversion to 2-,3-,4-valued logic"
  import Modelica_Icons;
  import Modelica_SIunits;
  import Modelica_Electrical_Digital_Interfaces;
  import Modelica_Constants;
  import Modelica_Blocks_Interfaces;
  import Modelica_Utilities;
  extends Modelica_Icons.Package;

    package UsersGuide "User's Guide"
      extends Modelica_Icons.Information;

      class ReleaseNotes "Release notes"
          extends Modelica_Icons.ReleaseNotes;

        annotation (Documentation(info="<html>
<h4>Version 1.0.8, 2009-10-01</h4>
<ul>
<li>Package Register with Flip-Flops and Latches added</li>
<li>InertialDealySensitiveVector added</li>
</ul>
<h4>Version 1.0.7, 2005-07-01</h4>
<ul>
<li>InertialDelaySensitive improved</li>
<li>Minor errors fixed in basic and delay models (final introduced)</li>
<li>Sources.Pulse rewritten to avoid a warning</li>
<li>Minor errors in default values of sources fixed</li>
</ul>
<h4>Version 1.0.6, 2004-10-18</h4>
<ul>
<li> Missing HTML tags added (problems with mismatched pre tags fixed).</li>
<li> CVS ID string deleted.</li>
</ul>
<h4>Version 1.0.5, 2004-10-01</h4>
<ul>
<li> Wrong identifiers x0 and Tdel in HalfAdder example fixed.</li>
<li> Experiment command in FlipFlop example deleted.</li>
<li> Known issue: Pulse source causes a warning in Dymola. It is recommended to use Clock source.</li>
</ul>
<h4>Version 1.0.4, 2004-09-30</h4>
<ul>
<li> Documentation improved.</li>
</ul>
<h4>Version 1.0.3, 2004-09-21</h4>
<ul>
<li> Table names changed from \"map\" to \"Table\".</li>
<li> Icons for converters modified.</li>
<li> LogicValueType renamed to Logic. For the Electrical.Digital library
     the type Logic has a fundamental meaning. Logic is similar to
     Real, Integer or Boolean in other packages. Names for converters
     are now more consistent (LogicToBoolean, RealToLogic etc.).</li>
<li> Icons for gates and sources improved.</li>
<li> New examples added.</li>
<li> Internal names for signals and ports unified.</li>
<li> Simple Clock source added in addition to Pulse source (for convenience reasons).</li>
</ul>
<h4>Version 1.0.2, 2004-09-13</h4>
<ul>
<li> First prerelease for discussions at the 40th Modelica Design Meeting.</li>
</ul>
<h4>Version 1.0.1, 2004-06-01</h4>
<ul>
<li> Packages Tables, Basic, and Gates implemented.</li>
<li> Transport and inertial delay implemented and successfully tested.</li>
</ul>
<h4>Version 1.0.0, 2003-05-01</h4>
<ul>
<li> A first version has been implemented for case studies.</li>
</ul>
</html>"));
      end ReleaseNotes;

      class Literature "Literature"
          extends Modelica_Icons.References;

        annotation (Documentation(info="<html>
<p>
The Electrical.Digital library is based on the following references:
</p>
<dl>
<dt>Ashenden, P. J.:</dt>
<dd> <b>The Designer's Guide to VHDL.</b> San Francisco: Morgan Kaufmann, 1995, 688 p. ISBN 1-55860-270-4.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>IEEE 1076-1993:</dt>
<dd> <b>IEEE Standard VHDL Language Reference Manual (ANSI).</b> 288 p. ISBN 1-55937-376-8. IEEE Ref. SH16840-NYF.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>IEEE 1164-1993:</dt>
<dd> <b>IEEE Standard Multivalue Logic System for VHDL Model Interoperability (Std_logic_1164).</b> 24 p. ISBN 1-55937-299-0. IEEE Ref. SH16097-NYF.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>Lipsett, R.; Schaefer, C.; Ussery, C.:</dt>
<dd> <b>VHDL: Hardware Description and Design.</b> Boston: Kluwer, 1989, 299 p. ISBN 079239030X.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>Navabi, Z:</dt>
<dd> <b>VHDL: Analysis and Modeling of Digital Systems.</b> New York: McGraw-Hill, 1993, 375 p. ISBN 0070464723.
     <br>&nbsp;</dd>
</dl>
</html>"));

      end Literature;

      class Contact "Contact"
        extends Modelica_Icons.Contact;

        annotation (Documentation(info="<html>
<dl>
<dt><b>Main Authors:</b>
<dd>Christoph Clau&szlig;
    &lt;<A HREF=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</A>&gt;<br>
    Andr&eacute; Schneider
    &lt;<A HREF=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</A>&gt;<br>
    Ulrich Donath
    &lt;<A HREF=\"mailto:Ulrich.Donath@eas.iis.fraunhofer.de\">Ulrich.Donath@eas.iis.fraunhofer.de</A>&gt;<br>
    Fraunhofer Institute for Integrated Circuits (IIS)<br>
    Design Automation Department (EAS)<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
    Germany<br>
</dl>
<br>
<br>
<dl>
<dt><b>Acknowledgements:</b></dt>
<dd>
    We thank our students Teresa Schlegel and Enrico Weber for implementing
    and carefully testing many models and examples.<br>
</dd>
</dl>
</html>"));

      end Contact;

      annotation (DocumentationClass=true, Documentation(info="<html>
<p>
Library <b>Electrical.Digital</b> is a <b>free</b> Modelica package providing
components to model <b>digital</b> electronic
systems based on combinational and sequential logic in a convenient
way. This package contains the <b>User's Guide</b> for
the library and has the following content:
</p>
<ol>
<li><a href=\"modelica://Modelica.Electrical.Digital.UsersGuide.ReleaseNotes\">Release Notes</a>
    summarizes the differences between different versions of this library.</li>
<li><a href=\"modelica://Modelica.Electrical.Digital.UsersGuide.Literature\">Literature</a>
    provides references that have been used to design and implement this
    library.</li>
<li><a href=\"modelica://Modelica.Electrical.Digital.UsersGuide.Contact\">Contact</a>
    provides information about the authors of the library as well as
    acknowledgments.</li>
</ol>
</html>"));
    end UsersGuide;

  package Tables "Truth tables for all components of package Digital"
    extends Modelica_Icons.Package;

    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital_Interfaces.Logic;
    import R = Modelica_Electrical_Digital_Interfaces.UX01;
    import S = Modelica_Electrical_Digital_Interfaces.Strength;

    constant L AndTable[L,L]=[L.'U',L.'U',L.'0',L.'U',L.'U',L.'U',L.'0',L.'U',L.
        'U'; L.'U',L.'X',L.'0',L.'X',L.'X',L.'X',L.'0',L.'X',L.'X'; L.'0',L.'0',
        L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0'; L.'U',L.'X',L.'0',L.'1',L.
        'X',L.'X',L.'0',L.'1',L.'X'; L.'U',L.'X',L.'0',L.'X',L.'X',L.'X',L.'0',
        L.'X',L.'X'; L.'U',L.'X',L.'0',L.'X',L.'X',L.'X',L.'0',L.'X',L.'X'; L.
        '0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0'; L.'U',L.'X',L.'0',
        L.'1',L.'X',L.'X',L.'0',L.'1',L.'X'; L.'U',L.'X',L.'0',L.'X',L.'X',L.
        'X',L.'0',L.'X',L.'X'] "9-value logic for 'and'";

    constant L OrTable[L,L]=[L.'U',L.'U',L.'U',L.'1',L.'U',L.'U',L.'U',L.'1',L.
        'U'; L.'U',L.'X',L.'X',L.'1',L.'X',L.'X',L.'X',L.'1',L.'X'; L.'U',L.'X',
        L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X'; L.'1',L.'1',L.'1',L.'1',L.
        '1',L.'1',L.'1',L.'1',L.'1'; L.'U',L.'X',L.'X',L.'1',L.'X',L.'X',L.'X',
        L.'1',L.'X'; L.'U',L.'X',L.'X',L.'1',L.'X',L.'X',L.'X',L.'1',L.'X'; L.
        'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X'; L.'1',L.'1',L.'1',
        L.'1',L.'1',L.'1',L.'1',L.'1',L.'1'; L.'U',L.'X',L.'X',L.'1',L.'X',L.
        'X',L.'X',L.'1',L.'X'] "9-value logic for 'or'";

    constant L NotTable[L]={L.'U',L.'X',L.'1',L.'0',L.'X',L.'X',L.'1',L.'0',L.
        'X'} "9-value logic for 'not'";

    constant L XorTable[L,L]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.
        'U'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X'; L.'U',L.'X',
        L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X'; L.'U',L.'X',L.'1',L.'0',L.
        'X',L.'X',L.'1',L.'0',L.'X'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',
        L.'X',L.'X'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X'; L.
        'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X'; L.'U',L.'X',L.'1',
        L.'0',L.'X',L.'X',L.'1',L.'0',L.'X'; L.'U',L.'X',L.'X',L.'X',L.'X',L.
        'X',L.'X',L.'X',L.'X'] "9-value logic for 'xor'";

    constant L ResolutionTable[L,L]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',
        L.'U',L.'U'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X'; L.
        'U',L.'X',L.'0',L.'X',L.'0',L.'0',L.'0',L.'0',L.'X'; L.'U',L.'X',L.'X',
        L.'1',L.'1',L.'1',L.'1',L.'1',L.'X'; L.'U',L.'X',L.'0',L.'1',L.'Z',L.
        'W',L.'L',L.'H',L.'X'; L.'U',L.'X',L.'0',L.'1',L.'W',L.'W',L.'W',L.'W',
        L.'X'; L.'U',L.'X',L.'0',L.'1',L.'L',L.'W',L.'L',L.'W',L.'X'; L.'U',L.
        'X',L.'0',L.'1',L.'H',L.'W',L.'W',L.'H',L.'X'; L.'U',L.'X',L.'X',L.'X',
        L.'X',L.'X',L.'X',L.'X',L.'X'] "9-value logic for 'wiredX'";
    constant L X01Table[L]={L.'X',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.
        'X'};

    constant L X01ZTable[L]={L.'X',L.'X',L.'0',L.'1',L.'Z',L.'X',L.'0',L.'1',L.
        'Z'};

    constant L UX01Table[L]={L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.
        'X'};

    constant R UX01Conv[L]={R.'U',R.'X',R.'0',R.'1',R.'X',R.'X',R.'0',R.'1',R.
        'X'};

    constant Integer DelayTable[L, L]=[
         0,  0, -1,  1,  0,  0, -1,  1,  0;
         0,  0, -1,  1,  0,  0, -1,  1,  0;
         1,  1,  0,  1,  1,  1,  0,  1,  1;
        -1, -1, -1,  0, -1, -1, -1,  0, -1;
         0,  0, -1,  1,  0,  0, -1,  1,  0;
         0,  0, -1,  1,  0,  0, -1,  1,  0;
         1,  1,  0,  1,  1,  1,  0,  1,  1;
        -1, -1, -1,  0, -1, -1, -1,  0, -1;
         0,  0, -1,  1,  0,  0, -1,  1,  0] "Delay selection for signal change by [old_signal, new_signal] reading:
      -1: High-Low delay |
       0: no delay |
       1: Low-High delay";

    constant Integer ClockMap[L, L]=[
        0, 0, 0, 2, 0, 0, 0, 2, 0;
        0, 0, 0, 2, 0, 0, 0, 2, 0;
        2, 2, 0, 1, 2, 2, 0, 1, 2;
        0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, 0, 0, 2, 0, 0, 0, 2, 0;
        0, 0, 0, 2, 0, 0, 0, 2, 0;
        2, 2, 0, 1, 2, 2, 0, 1, 0;
        0, 0, 0, 0, 0, 0, 0, 0, 0;
        0, 0, 0, 2, 0, 0, 0, 2, 0] "Edge detection by [pre(clock), clock] reading:
    0: 0-Transition |
    1: rising edge  |
    2: X-Transition";

    constant L StrengthMap[L,S]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.
        'U',L.'U',L.'U'; L.'X',L.'X',L.'X',L.'X',L.'X',L.'W',L.'W',L.'W',L.'W',
        L.'W'; L.'0',L.'0',L.'L',L.'0',L.'Z',L.'L',L.'L',L.'Z',L.'0',L.'L'; L.
        '1',L.'H',L.'1',L.'Z',L.'1',L.'H',L.'Z',L.'H',L.'H',L.'1'; L.'X',L.'X',
        L.'X',L.'X',L.'X',L.'W',L.'W',L.'W',L.'W',L.'W'; L.'X',L.'X',L.'X',L.
        'X',L.'X',L.'W',L.'W',L.'W',L.'W',L.'W'; L.'0',L.'0',L.'L',L.'0',L.'Z',
        L.'L',L.'L',L.'Z',L.'0',L.'L'; L.'1',L.'H',L.'1',L.'Z',L.'1',L.'H',L.
        'Z',L.'H',L.'H',L.'1'; L.'X',L.'X',L.'X',L.'X',L.'X',L.'W',L.'W',L.'W',
        L.'W',L.'W'] "Output strength conversion by [signal, strength] reading";

    constant L NXferTable[L,L]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',
        L.'U'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X'; L.'Z',L.
        'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'X',L.'0',L.'1',
        L.'Z',L.'W',L.'L',L.'H',L.'X'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.
        'X',L.'X',L.'X'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X';
        L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'X',L.
        '0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'X'; L.'U',L.'X',L.'X',L.'X',L.'X',
        L.'X',L.'X',L.'X',L.'X'] "NX Transfer by [enable, input] reading";

    constant L NRXferTable[L,L]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.
        'U',L.'U'; L.'U',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W'; L.'Z',
        L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'W',L.'L',L.
        'H',L.'Z',L.'W',L.'L',L.'H',L.'W'; L.'U',L.'W',L.'W',L.'W',L.'W',L.'W',
        L.'W',L.'W',L.'W'; L.'U',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.
        'W'; L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'W',
        L.'L',L.'H',L.'Z',L.'W',L.'L',L.'H',L.'W'; L.'U',L.'W',L.'W',L.'W',L.
        'W',L.'W',L.'W',L.'W',L.'W'] "NRX Transfer by [enable, input] reading";

    constant L PXferTable[L,L]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',
        L.'U'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X'; L.'U',L.
        'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'X'; L.'Z',L.'Z',L.'Z',L.'Z',
        L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.
        'X',L.'X',L.'X'; L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X';
        L.'U',L.'X',L.'0',L.'1',L.'Z',L.'W',L.'L',L.'H',L.'X'; L.'Z',L.'Z',L.
        'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'X',L.'X',L.'X',L.'X',
        L.'X',L.'X',L.'X',L.'X'] "PX Transfer by [enable, input] reading";

    constant L PRXferTable[L,L]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.
        'U',L.'U'; L.'U',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W'; L.'U',
        L.'W',L.'L',L.'H',L.'Z',L.'W',L.'L',L.'H',L.'W'; L.'Z',L.'Z',L.'Z',L.
        'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'W',L.'W',L.'W',L.'W',L.'W',
        L.'W',L.'W',L.'W'; L.'U',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.'W',L.
        'W'; L.'U',L.'W',L.'L',L.'H',L.'Z',L.'W',L.'L',L.'H',L.'W'; L.'Z',L.'Z',
        L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z',L.'Z'; L.'U',L.'W',L.'W',L.'W',L.
        'W',L.'W',L.'W',L.'W',L.'W'] "PRX Transfer by [enable, input] reading";

    constant L Buf3sTable[S,R,R]=[{{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'X',L.
        'X',L.'X'},{L.'Z',L.'Z',L.'Z',L.'Z'},{L.'U',L.'X',L.'0',L.'1'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'X',L.'X',L.'X'},{L.'Z',L.'Z',L.'Z',L.'Z'},
        {L.'U',L.'X',L.'0',L.'H'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'X',L.
        'X',L.'X'},{L.'Z',L.'Z',L.'Z',L.'Z'},{L.'U',L.'X',L.'L',L.'1'}},{{L.'U',
        L.'U',L.'U',L.'Z'},{L.'U',L.'X',L.'X',L.'Z'},{L.'Z',L.'Z',L.'Z',L.'Z'},
        {L.'U',L.'X',L.'0',L.'Z'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'X',L.
        'X',L.'X'},{L.'Z',L.'Z',L.'Z',L.'Z'},{L.'U',L.'X',L.'Z',L.'1'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'W',L.'W',L.'W'},{L.'Z',L.'Z',L.'Z',L.'Z'},
        {L.'U',L.'W',L.'L',L.'H'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'W',L.
        'W',L.'Z'},{L.'Z',L.'Z',L.'Z',L.'Z'},{L.'U',L.'W',L.'L',L.'Z'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'W',L.'W',L.'W'},{L.'Z',L.'Z',L.'Z',L.'Z'},
        {L.'U',L.'W',L.'Z',L.'H'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'W',L.
        'W',L.'W'},{L.'Z',L.'Z',L.'Z',L.'Z'},{L.'U',L.'W',L.'0',L.'H'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'W',L.'W',L.'W'},{L.'Z',L.'Z',L.'Z',L.'Z'},
        {L.'U',L.'W',L.'L',L.'1'}}}]
      "Tristate Table by [strength, enable, input] reading, high-active enable";

    constant L Buf3slTable[S,R,R]=[{{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'X',L.
        'X',L.'X'},{L.'U',L.'X',L.'0',L.'1'},{L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'X',L.'X',L.'X'},{L.'U',L.'X',L.'0',L.'H'},
        {L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'X',L.
        'X',L.'X'},{L.'U',L.'X',L.'L',L.'1'},{L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',
        L.'U',L.'U',L.'Z'},{L.'U',L.'X',L.'X',L.'Z'},{L.'U',L.'X',L.'0',L.'Z'},
        {L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'X',L.
        'X',L.'X'},{L.'U',L.'X',L.'Z',L.'1'},{L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'W',L.'W',L.'W'},{L.'U',L.'W',L.'L',L.'H'},
        {L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'W',L.
        'W',L.'Z'},{L.'U',L.'W',L.'L',L.'Z'},{L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'W',L.'W',L.'W'},{L.'U',L.'W',L.'Z',L.'H'},
        {L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'W',L.
        'W',L.'W'},{L.'U',L.'W',L.'0',L.'H'},{L.'Z',L.'Z',L.'Z',L.'Z'}},{{L.'U',
        L.'U',L.'U',L.'U'},{L.'U',L.'W',L.'W',L.'W'},{L.'U',L.'W',L.'L',L.'1'},
        {L.'Z',L.'Z',L.'Z',L.'Z'}}}]
      "Tristate Table by [strength, enable, input] reading, low-active enable";

    constant L MUX2x1Table[R,R,R]=[{{{L.'U',L.'U',L.'U',L.'U'},{L.'U',L.'U',L.
        'U',L.'U'},{L.'U',L.'X',L.'0',L.'1'},{L.'U',L.'U',L.'U',L.'U'}},{{L.'U',
        L.'X',L.'U',L.'U'},{L.'U',L.'X',L.'X',L.'X'},{L.'U',L.'X',L.'0',L.'1'},
        {L.'X',L.'X',L.'X',L.'X'}},{{L.'U',L.'U',L.'0',L.'U'},{L.'U',L.'X',L.
        '0',L.'X'},{L.'U',L.'X',L.'0',L.'1'},{L.'0',L.'0',L.'0',L.'0'}},{{L.'U',
        L.'U',L.'U',L.'1'},{L.'U',L.'X',L.'X',L.'1'},{L.'U',L.'X',L.'0',L.'1'},
        {L.'1',L.'1',L.'1',L.'1'}}}]
      "Multiplexer Table by [select, input1, input0] reading";

    annotation (                            Documentation(info="<html>

</html>"));
  end Tables;

      package Delay "Delay blocks"
        extends Modelica_Icons.Package;

        partial block DelayParams "Definition of delay parameters"
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          parameter Modelica_SIunits.Time tLH(start=0) "Rise inertial delay";
          parameter Modelica_SIunits.Time tHL(start=0) "Fall inertial delay";
          parameter L y0=L.'U' "Initial value of output";
          annotation (Documentation(info="<html>
<p>DelayParams is a partial model for providing delay times and inertial values. It is used in components of the package Gates which need the same parameters. The partial model does not have any behavior or equations.</p>
</html>"));
        end DelayParams;

        model TransportDelay "Transport delay with initial parameter"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.SISO(x(start=L.'U',
            fixed=true));
          parameter Modelica_SIunits.Time delayTime(start=0) "delay time";
      parameter Modelica_Electrical_Digital_Interfaces.Logic y0=L.'U'
        "initial value of output";
      constant Modelica_Electrical_Digital_Interfaces.Logic LogicValues[:]=L.
          'U':L.'-';
    protected
      Modelica_Electrical_Digital_Interfaces.Logic x_delayed;

        equation
          x_delayed = LogicValues[integer(delay(Integer(pre(x)), delayTime))];
          y = if delayTime > 0 then
                   (if time >= delayTime then x_delayed else y0) else
                     pre(x);
          annotation (Documentation(info="<HTML>
<P>
Provide the input as output exactly delayed by <i>Tdel</i>.
If time less than <i>Tdel</i> the initial value <i>initout</i> holds.
</P>
</html>",       revisions=
                 "<HTML>
<dl>
<dt><i>August 11, 2003</i></dt>
<dd>by Christoph Clauss initially modelled.</dd>
</dl>
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Polygon(points={{-6,60},{-16,40},{4,40},{-6,60}}, lineColor={0,0,0}),
            Line(points={{0,60},{20,60}}, color={0,0,0}),
            Line(points={{10,60},{10,40}}, color={0,0,0}),
            Text(
              extent={{-50,-40},{50,-20}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Transport"),
            Text(
              extent={{-50,-60},{50,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Delay")}));
        end TransportDelay;

        block InertialDelay "Inertial delay with initial parameter"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.SISO;
          parameter Modelica_SIunits.Time delayTime(start=0)
        "Minimum time to hold value";
      parameter Modelica_Electrical_Digital_Interfaces.Logic y0=L.'U'
        "Initial value of output y";
    protected
      Modelica_Electrical_Digital_Interfaces.Logic y_auxiliary(start=y0, fixed=
            true);
      Modelica_Electrical_Digital_Interfaces.Logic x_old(start=y0, fixed=true);
          discrete Modelica_SIunits.Time t_next(start=delayTime, fixed=true);

        algorithm
          when delayTime > 0 and change(x) then
            x_old := x;
            t_next := time + delayTime;
          elsewhen time >= t_next then
            y_auxiliary := x;
          end when;
          y := if delayTime > 0 then y_auxiliary else x;
          annotation (
            Documentation(info="<HTML>
<P>
Provides the input as output delayed by <i>Tdel</i> if the input holds its value for a longer time than <i>Tdel</i>.
If time is less than <i>Tdel</i> the initial value <i>initout</i> holds.
</P>
</html>",       revisions=
                 "<HTML>
<dl>
<dt><i>August 12, 2003</i></dt>
<dd>by Christoph Clauss revised</dd>
<dt><i>March 19, 2003</i></dt>
<dd>by Martin Otter initially modelled.</dd>
</dl>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Polygon(points={{-6,60},{-16,40},{4,40},{-6,60}}, lineColor={0,0,0}),
            Line(points={{10,60},{10,40}}, color={0,0,0}),
            Line(points={{0,60},{20,60}}, color={0,0,0}),
            Text(
              extent={{-50,-40},{50,-20}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Inertial"),
            Text(
              extent={{-50,-60},{50,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Delay")}));
        end InertialDelay;

        model InertialDelaySensitive
      "Provide the input as output if it holds its value for a specific amount of time"

          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.SISO(
                                    x(start=L.'U',fixed=true),y(start=y0, fixed=true));
          parameter Modelica_SIunits.Time tLH(start=0) "rise inertial delay";
          parameter Modelica_SIunits.Time tHL(start=0) "fall inertial delay";
      parameter Modelica_Electrical_Digital_Interfaces.Logic y0=L.'U'
        "initial value of output";
    protected
          constant Integer delayTable[L,L]=D.Tables.DelayTable
        "specification of delay according to signal change";
          Modelica_SIunits.Time delayTime;
      Modelica_Electrical_Digital_Interfaces.Logic y_auxiliary(start=y0, fixed=
            true);
      Modelica_Electrical_Digital_Interfaces.Logic y_old(start=y0, fixed=true);
          Integer lh;
          discrete Modelica_SIunits.Time t_next;

        algorithm
          when {initial(),(tLH > 0 or tHL > 0) and change(x) and not initial()} then
            y_old := if initial() or pre(y) == L.'U' then y0 else pre(y);
            lh := delayTable[y_old, x];
            delayTime := if (lh > 0) then tLH else (if (lh < 0) then tHL else 0);
            t_next := time + delayTime;
        if (lh == 0 or abs(delayTime) < Modelica_Constants.small) then
              y_auxiliary := x;
            end if;
         elsewhen time >= t_next then
            y_auxiliary := x;
         end when;
         y := if ((tLH > 0 or tHL > 0)) then y_auxiliary else x;
          annotation (
            Documentation(info="<HTML>
<P>
Provides the input as output delayed by <i>Tdel</i> if the input holds its value for a longer time than <i>Tdel</i>.
If the time is less than <i>Tdel</i> the initial value <i>initout</i> holds.<br>
The delay <i>Tdel</i> depends on the values of the signal change. To calculate <i>Tdel</i>, the delaymap specified in
Digital.Tables is used. If the corresponding value is 1, then <i>tLH</i> is used, if it is -1, then <i>tHL</i>
is used, if it is zero, the input is not delayed.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>January 24, 2013  </i> Initial value for y set to y0
       by Kristin Majetta and Christoph Clauss<br>
       </li>
<li><i>September 8, 2009  </i> pre(y) and x are used to select <i>tHL</i> or <i>tLH</i>
       by Ulrich Donath<br>
       </li>
<li><i>January 13, 2005  </i> improved when-conditions and declaration of delayTable
       by Dynasim<br>
       </li>
<li><i>September 15, 2004  </i> color changed, names changed
       by Christoph Clauss<br>
       </li>
<li><i>May 12, 2004  </i> test <i>if Tdel=0</i> replaced
       by Christoph Clauss<br>
       </li>
<li><i>February 5, 2004 </i> handling of <i>tHL=0</i> or <i>tLH=0</i> revised
       by Christoph Clauss<br>
       </li>
<li><i>October 12, 2003   </i>
       by Christoph Clauss<br>
       initially modelled</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,-40},{50,-20}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Inertial"),
            Text(
              extent={{-50,-60},{50,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Delay"),
            Text(
              extent={{-50,-80},{50,-60}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="sensitive"),
            Polygon(points={{-6,60},{-16,40},{4,40},{-6,60}}, lineColor={0,0,0}),
            Line(points={{10,60},{10,40}}, color={0,0,0}),
            Line(points={{0,60},{20,60}}, color={0,0,0})}));
        end InertialDelaySensitive;

        model InertialDelaySensitiveVector
      "Delay of a vector of digital signals"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
          parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
          parameter Integer n(min=1) = 1 "Data width";
      Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-100,-12},{-76,12}}),
            iconTransformation(extent={{-100,-15},{-72,14}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
          Placement(transformation(extent={{72,-14},{100,14}}),
            iconTransformation(extent={{72,-14},{100,14}})));
          D.Delay.InertialDelaySensitive inertialDelaySensitive[n](each tLH=tLH,
          each tHL=tHL);
        equation
          for i in 1:n loop
            connect(x[i], inertialDelaySensitive[i].x);
            connect(inertialDelaySensitive[i].y, y[i]);
          end for;
          annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-50,54},{48,-54}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-80,0},{-50,0}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{48,0},{80,0}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Text(
              extent={{-40,52},{38,-20}},
              lineColor={127,33,107},
              textString="DELAY"),
            Text(
              extent={{-26,12},{18,-32}},
              lineColor={127,0,127},
              textString="signal "),
            Text(
              extent={{-32,0},{28,-62}},
              lineColor={127,0,127},
              textString="sensitive")}),            Documentation(info="<html>

<p>
The delay element <b>Inertial Delay Sensitive</b> is applied to a vector of n signals.
The parameters <i>tLH</i> and <i>tHL</i> are valid for each of the n signals.
</p>
</html>",     revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"));
        end InertialDelaySensitiveVector;
        annotation (                                Documentation(info="<html>
<p>The Delay package collects the delay blocks which are used in many components. Both transport and inertial delay are offered for scalar connectors. The most advanced component is the sensitive inertial delay the delay time of which is chosen in dependency of the signal values. This component is also available for vector valued input.</p>
</html>"));
      end Delay;

      package Basic "Basic logic blocks without delays"
        extends Modelica_Icons.Package;

        model Not "Not logic component without delay"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.SISO;
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary(start=L.'0', fixed
          =true);
        equation
      auxiliary = Modelica_Electrical_Digital.Tables.NotTable[x];
          y = pre(auxiliary);
          annotation (
            Documentation(info="<html>
<p>Not component with 1 input value, without delay.</p>
<p>According to the standard logic not table (Tables.NotTable) the output value is calculated.</p>
<p>To avoid loops in the numerical treatment, the pre operator is applied to the output.</p>
</html>",  revisions=
                 "<HTML>
<dl>
<dt><i>August 14, 2003</i></dt>
<dd>by Teresa Schlegel initially modelled.</dd>
</dl>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="1"),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Ellipse(
              extent={{50,6},{62,-6}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
        end Not;

        model And "And logic component with multiple input and one output"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary[n](each start=L.
            'U');
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary_n(start=L.'U',
          fixed=true);
        equation
          auxiliary[1] = x[1];
          for i in 1:n - 1 loop
        auxiliary[i + 1] = Modelica_Electrical_Digital.Tables.AndTable[
          auxiliary[i], x[i + 1]];
          end for;
          auxiliary_n = auxiliary[n];
          y = pre(auxiliary_n);
          annotation (
            Documentation(info="<html>
<p>And component with multiple input values and one output.</p>
<p>According to the standard logic and table (Tables.AndTable) the output value is calculated.</p>
<p>To avoid loops in the numerical treatment, the pre operator is applied to the output.</p>
</html>",  revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by  Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="&"), Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name")}));
        end And;

        model Nand "Nand logic component with multiple input and one output"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary[n](each start=L.
            'U');
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary_n(start=L.'U',
          fixed=true);
        equation
          auxiliary[1] = x[1];
          for i in 1:n - 1 loop
        auxiliary[i + 1] = Modelica_Electrical_Digital.Tables.AndTable[
          auxiliary[i], x[i + 1]];
          end for;
      auxiliary_n = Modelica_Electrical_Digital.Tables.NotTable[auxiliary[n]];
          y = pre(auxiliary_n);
          annotation (
            Documentation(info="<html>
<p>Nand component with multiple input values and one output.</p>
<p>According to the standard logic and table (Tables.AndTable) an intermediate value is calculated, to which the not table (Tables.NotTable) is applied.</p>
<p>To avoid loops in the numerical treatment, the pre operator is applied to the output.</p>
</html>",  revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by  Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="&"),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Ellipse(
              extent={{50,6},{62,-6}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
        end Nand;

        model Or "Or logic component with multiple input and one output"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary[n](each start=L.
            'U');
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary_n(start=L.'U',
          fixed=true);
        equation
          auxiliary[1] = x[1];
          for i in 1:n - 1 loop
        auxiliary[i + 1] = Modelica_Electrical_Digital.Tables.OrTable[auxiliary[
          i], x[i + 1]];
          end for;
          auxiliary_n = auxiliary[n];
          y = pre(auxiliary_n);
          annotation (
            Documentation(info="<html>
<p>Or component with multiple input values and one output.</p>
<p>According to the standard logic or table (Tables.OrTable) the output value is calculated.</p>
<p>To avoid loops in the numerical treatment, the pre operator is applied to the output.</p>
</html>",  revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by  Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString=">=1"), Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name")}));
        end Or;

        model Nor "Nor logic component with multiple input and one output"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
        //  D.Interfaces.Logic auxiliary[n](each start=L.'U', each fixed=true);
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary[n](each start=L.
            'U');
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary_n(start=L.'U',
          fixed=true);
        equation
          auxiliary[1] = x[1];
          for i in 1:n - 1 loop
        auxiliary[i + 1] = Modelica_Electrical_Digital.Tables.OrTable[auxiliary[
          i], x[i + 1]];
          end for;
      auxiliary_n = Modelica_Electrical_Digital.Tables.NotTable[auxiliary[n]];
          y = pre(auxiliary_n);
          annotation (
            Documentation(info="<html>
<p>Nor component with multiple input values and one output.</p>
<p>According to the standard logic or table (Tables.OrTable) an intermediate value is calculated, to which the not table (Tables.NotTable) is applied.</p>
<p>To avoid loops in the numerical treatment, the pre operator is applied to the output.</p>
</html>",  revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString=">=1"),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Ellipse(
              extent={{50,6},{62,-6}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
        end Nor;

        model Xor "Xor logic component with multiple input and one output"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary[n](each start=L.
            'U');
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary_n(start=L.'U',
          fixed=true);
        equation
          auxiliary[1] = x[1];
          for i in 1:n - 1 loop
        auxiliary[i + 1] = Modelica_Electrical_Digital.Tables.XorTable[
          auxiliary[i], x[i + 1]];
          end for;
          auxiliary_n = auxiliary[n];
          y = pre(auxiliary_n);
          annotation (
            Documentation(info="<html>
<p>Xor component with multiple input values and one output.</p>
<p>According to the standard logic xor table (Tables.XorTable) the output value is calculated.</p>
<p>To avoid loops in the numerical treatment, the pre operator is applied to the output.</p>
</html>",  revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="=1"), Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name")}));
        end Xor;

        model Xnor "Xnor logic component with multiple input and one output"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary[n](each start=L.
            'U');
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary_n(start=L.'U',
          fixed=true);
        equation
          auxiliary[1] = x[1];
          for i in 1:n - 1 loop
        auxiliary[i + 1] = Modelica_Electrical_Digital.Tables.XorTable[
          auxiliary[i], x[i + 1]];
          end for;
      auxiliary_n = Modelica_Electrical_Digital.Tables.NotTable[auxiliary[n]];
          y = pre(auxiliary_n);
          annotation (
            Documentation(info="<html>
<p>Xnor component with multiple input values and one output.</p>
<p>According to the standard logic xor table (Tables.XorTable)an intermediate value is calculated, to which the not table (Tables.NotTable) is applied.</p>
<p>To avoid loops in the numerical treatment, the pre operator is applied to the output.</p>
</html>",  revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="="), Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name")}));
        end Xnor;
        annotation (                                Documentation(info="<html>
<p>Basic contains the basic gates according to standard logic. The components of Basic calculate their results using the corresponding truth tables. They do not contain any delay components.</p>
</html>"));
      end Basic;

      package Gates "Logic gates including delays"
        extends Modelica_Icons.Package;

        model InvGate
      "InvGate with 1 input value, composed by Not and sensitive inertial delay"
      import D = Modelica_Electrical_Digital;
          extends D.Delay.DelayParams;
          extends Modelica_Electrical_Digital_Interfaces.SISO;
          D.Basic.Not G1 annotation (Placement(transformation(extent={{-60,-20},
                {-20,20}}, rotation=0)));
          D.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL) annotation (
          Placement(transformation(extent={{20,-20},{60,20}}, rotation=0)));
        equation
          connect(G2.y, y)                      annotation (Line(points={{60,0},{
                  100,0}}, color={127,0,127}));
          connect(G1.x, x)   annotation (Line(points={{-52,0},{-60,0}}, color={127,
                  0,127}));
          connect(G1.y, G2.x)
            annotation (Line(points={{-20,0},{28,0}}, color={127,0,127}));
          annotation (
            Documentation(info="<html>
<p>The InvGate model has a single valued input, and a single valued output. It is composed by a Basic Not and an InertialDelaySensitive. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>", revisions=
                 "<HTML>
<dl>
<dt><i>August 14, 2003</i></dt>
<dd>by Teresa Schlegel initially modelled.</dd>
</dl>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,80},{50,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,191,127},
              fillPattern=FillPattern.Solid,
              textString="1"),
            Text(
              extent={{-18,-60},{20,-100}},
              lineColor={0,0,0},
              textString="Gate"),
            Ellipse(
              extent={{50,6},{62,-6}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
        end InvGate;

        model AndGate "AndGate with multiple input"
      import D = Modelica_Electrical_Digital;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
          extends D.Delay.DelayParams;
          D.Basic.And G1(final n=n) annotation (Placement(transformation(extent
              ={{-40,-20},{0,20}}, rotation=0)));
          D.Delay.InertialDelaySensitive G2(
        tLH=tLH,
        tHL=tHL,
        y0=y0) annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
        equation
          connect(x, G1.x)
            annotation (Line(points={{-60,0},{-32,0}}, color={127,0,127}));
          connect(y, G2.y)
            annotation (Line(points={{100,0},{60,0}}, color={127,0,127}));
          connect(G1.y, G2.x)
            annotation (Line(points={{0,0},{28,0}}, color={127,0,127}));
          annotation (
            Documentation(info="<html>
<p>The AndGate model has a multiple valued (n) input vector, and a single valued output. It is composed by a Basic And and an InertialDelaySensitive. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>", revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,80},{50,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="&"),
            Text(
              extent={{-20,-60},{20,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Gate")}));
        end AndGate;

        model NandGate "NandGate with multiple input"
      import D = Modelica_Electrical_Digital;
          extends D.Delay.DelayParams;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
          D.Basic.Nand G1(final n=n) annotation (Placement(transformation(
              extent={{-40,-20},{0,20}}, rotation=0)));
          D.Delay.InertialDelaySensitive G2(
        tLH=tLH,
        tHL=tHL,
        y0=y0) annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
        equation
          connect(x, G1.x)
            annotation (Line(points={{-60,0},{-32,0}}, color={127,0,127}));
          connect(G1.y, G2.x)
            annotation (Line(points={{0,0},{28,0}}, color={127,0,127}));
          connect(G2.y, y)
            annotation (Line(points={{60,0},{100,0}}, color={127,0,127}));
          annotation (            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                             graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-40,40},{40,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="&"),
            Text(
              extent={{-50,-64},{50,-86}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Gate"),
            Ellipse(
              extent={{50,6},{62,-6}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
            Documentation(revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>",     info="<html>
<p>The NandGate model has a multiple valued (n) input vector, and a single valued output. It is composed by a Basic Nand and an InertialDelaySensitive. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>"));
        end NandGate;

        model OrGate "OrGate with multiple input"
      import D = Modelica_Electrical_Digital;
          extends D.Delay.DelayParams;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
          D.Basic.Or G1(final n=n) annotation (Placement(transformation(extent=
                {{-40,-20},{0,20}}, rotation=0)));
          D.Delay.InertialDelaySensitive G2(
        tLH=tLH,
        tHL=tHL,
        y0=y0) annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
        equation
          connect(G1.y, G2.x)
            annotation (Line(points={{0,0},{28,0}}, color={127,0,127}));
          connect(x,G1. x)
            annotation (Line(points={{-60,0},{-32,0}}, color={127,0,127}));
          connect(y, G2.y)
            annotation (Line(points={{100,0},{60,0}}, color={127,0,127}));
          annotation (
            Documentation(info="<html>
<p>The OrGate model has a multiple valued (n) input vector, and a single valued output. It is composed by a Basic Or and an InertialDelaySensitive. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>", revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,80},{50,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString=">=1"),
            Text(
              extent={{-20,-60},{20,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Gate")}));
        end OrGate;

        model NorGate "NorGate with multiple input"
      import D = Modelica_Electrical_Digital;
          extends D.Delay.DelayParams;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
          D.Basic.Nor G1(final n=n) annotation (Placement(transformation(extent
              ={{-40,-20},{0,20}}, rotation=0)));
          D.Delay.InertialDelaySensitive G2(
        tLH=tLH,
        tHL=tHL,
        y0=y0) annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
        equation
          connect(G1.y, G2.x)
            annotation (Line(points={{0,0},{28,0}}, color={127,0,127}));
          connect(x, G1.x)
            annotation (Line(points={{-60,0},{-32,0}}, color={127,0,127}));
          connect(y, G2.y)
            annotation (Line(points={{100,0},{60,0}}, color={127,0,127}));
          annotation (
            Documentation(info="<html>
<p>The NorGate model has a multiple valued (n) input vector, and a single valued output. It is composed by a Basic Nor and an InertialDelaySensitive. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>", revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,80},{50,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString=">=1"),
            Text(
              extent={{-20,-60},{20,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Gate"),
            Ellipse(
              extent={{50,6},{62,-6}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
        end NorGate;

        model XorGate "XorGate with multiple input"
      import D = Modelica_Electrical_Digital;
          extends D.Delay.DelayParams;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
          D.Basic.Xor G1(final n=n) annotation (Placement(transformation(extent
              ={{-40,-20},{0,20}}, rotation=0)));
          D.Delay.InertialDelaySensitive G2(
        tLH=tLH,
        tHL=tHL,
        y0=y0) annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
        equation
          connect(x, G1.x)
            annotation (Line(points={{-60,0},{-32,0}}, color={127,0,127}));
          connect(G1.y, G2.x)
            annotation (Line(points={{0,0},{28,0}}, color={127,0,127}));
          connect(G2.y, y)
            annotation (Line(points={{60,0},{100,0}}, color={127,0,127}));
          annotation (
            Documentation(info="<html>
<p>The XorGate model has a multiple valued (n) input vector, and a single valued output. It is composed by a Basic Xor and an InertialDelaySensitive. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>", revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,80},{50,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="=1"),
            Text(
              extent={{-20,-60},{20,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Gate")}));
        end XorGate;

        model XnorGate "XnorGate with multiple input"
      import D = Modelica_Electrical_Digital;
          extends D.Delay.DelayParams;
          extends Modelica_Electrical_Digital_Interfaces.MISO;
          D.Basic.Xnor G1(final n=n) annotation (Placement(transformation(
              extent={{-40,-20},{0,20}}, rotation=0)));
          D.Delay.InertialDelaySensitive G2(
        tLH=tLH,
        tHL=tHL,
        y0=y0) annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
        equation
          connect(x, G1.x)
            annotation (Line(points={{-60,0},{-32,0}}, color={127,0,127}));
          connect(G2.y, y)
            annotation (Line(points={{60,0},{100,0}}, color={127,0,127}));
          connect(G1.y, G2.x)
            annotation (Line(points={{0,0},{28,0}}, color={127,0,127}));
          annotation (
            Documentation(info="<html>
<p>The XnorGate model has a multiple valued (n) input vector, and a single valued output. It is composed by a Basic Xnor and an InertialDelaySensitive. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>", revisions=
                 "<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-40,80},{40,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="="),
            Text(
              extent={{-20,-60},{20,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Gate")}));
        end XnorGate;

        model BufGate
      "BufGate with 1 input value, composed by Not and sensitive inertial delay"
      import D = Modelica_Electrical_Digital;
          extends D.Delay.DelayParams;
          extends Modelica_Electrical_Digital_Interfaces.SISO;
          D.Delay.InertialDelaySensitive G1(tLH=tLH, tHL=tHL) annotation (
          Placement(transformation(extent={{-30,-20},{10,20}}, rotation=0)));
        equation
          connect(G1.y, y)                      annotation (Line(points={{10,0},{
                  100,0}}, color={127,0,127}));
          connect(G1.x, x) annotation (Line(points={{-22,0},{-60,0}}, color={127,0,
                  127}));
          annotation (
            Documentation(info="<html>
<p>The BufGate model has a single valued input, and a single valued output. It consists of an InertialDelaySensitive only. Its parameters are the delay parameters (rise and fall inertial delay time, and initial value).</p>
</html>", revisions=
                 "<HTML>
<dl>
<dt><i>September 21, 2004</i></dt>
<dd>by Andre Schneider initially modelled.</dd>
</dl>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-18,-60},{20,-100}},
              lineColor={0,0,0},
              textString="Gate"),
            Text(
              extent={{-50,80},{50,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={255,191,127},
              fillPattern=FillPattern.Solid,
              textString="1")}));
        end BufGate;
        annotation (                                Documentation(info="<html>
<p>Gates contains the basic gates according to standard logic as they are provided in the Basic package. Additionally they contain an InertialDelaySensitive component They are composed graphically, not using any equations.</p>
</html>"));
      end Gates;

      package Sources "Time-dependent digital signal sources"
        extends Modelica_Icons.SourcesPackage;

        block Set "Digital Set Source"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
      parameter Modelica_Electrical_Digital_Interfaces.Logic x(start=L.'1')
        "Logic value to be set";
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
        algorithm
          y := x;
          annotation (Documentation(info="<HTML>
<P>
Sets a nine valued digital signal, which is specified by the <i>setval</i> parameter.
</P>
<P>
To specify <i>setval</i>, the integer code has to be used.
</P>
<p><b>Code Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Logic value</b></td>
      <td valign=\"top\"><b>Integer code</b></td>
      <td valign=\"top\"><b>Meaning</b></td>
  </tr>

  <tr><td valign=\"top\">'U'</td> <td valign=\"top\">1</td> <td valign=\"top\">Uninitialized</td></tr>
  <tr><td valign=\"top\">'X'</td> <td valign=\"top\">2</td> <td valign=\"top\">Forcing Unknown</td></tr>
  <tr><td valign=\"top\">'0'</td> <td valign=\"top\">3</td> <td valign=\"top\">Forcing 0</td></tr>
  <tr><td valign=\"top\">'1'</td> <td valign=\"top\">4</td> <td valign=\"top\">Forcing 1</td></tr>
  <tr><td valign=\"top\">'Z'</td> <td valign=\"top\">5</td> <td valign=\"top\">High Impedance</td></tr>
  <tr><td valign=\"top\">'W'</td> <td valign=\"top\">6</td> <td valign=\"top\">Weak Unknown</td></tr>
  <tr><td valign=\"top\">'L'</td> <td valign=\"top\">7</td> <td valign=\"top\">Weak 0</td></tr>
  <tr><td valign=\"top\">'H'</td> <td valign=\"top\">8</td> <td valign=\"top\">Weak 1</td></tr>
  <tr><td valign=\"top\">'-'</td> <td valign=\"top\">9</td> <td valign=\"top\">Do not care</td></tr>
</table>

<P>
If the logic values are imported by <br><b>import L = Digital.Interfaces.Logic;</b><br>
they can be used to specify the parameter, e.g., <b>L.'0'</b> for forcing 0.
</P>
</html>",       revisions=
                 "<HTML>
<dl>
<dt><i>August 20, 2003</i></dt>
<dd>by Teresa Schlegel initially modelled.</dd>
</dl>
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="SET"),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Line(points={{50,0},{90,0}}, color={127,0,127})}));
        end Set;

        block Step "Digital Step Source"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      parameter Modelica_Electrical_Digital_Interfaces.Logic before(start=L.'0')
        "Logic value before step";
      parameter Modelica_Electrical_Digital_Interfaces.Logic after(start=L.'1')
        "Logic value after step";
          parameter Real stepTime(start=1) "step time";
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
        algorithm
          // assert(before >= L.min and before <= L.max, "Parameter is no logic value");
          // assert(after >= L.min and after <= L.max, "Parameter is no logic value");
          if time >= stepTime then
            y := after;
          else
            y := before;
          end if;
          annotation (
            Documentation(info="<HTML>
<P>
The step source output signal steps from the value <i>before</i> to the value <i>after</i>
at the time <i>stepTime</i>.
</P>
<P>
To specify the logic value parameters, the integer code has to be used.
</P>
<p><b>Code Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Logic value</b></td>
      <td valign=\"top\"><b>Integer code</b></td>
      <td valign=\"top\"><b>Meaning</b></td>
  </tr>

  <tr><td valign=\"top\">'U'</td> <td valign=\"top\">1</td> <td valign=\"top\">Uninitialized</td></tr>
  <tr><td valign=\"top\">'X'</td> <td valign=\"top\">2</td> <td valign=\"top\">Forcing Unknown</td></tr>
  <tr><td valign=\"top\">'0'</td> <td valign=\"top\">3</td> <td valign=\"top\">Forcing 0</td></tr>
  <tr><td valign=\"top\">'1'</td> <td valign=\"top\">4</td> <td valign=\"top\">Forcing 1</td></tr>
  <tr><td valign=\"top\">'Z'</td> <td valign=\"top\">5</td> <td valign=\"top\">High Impedance</td></tr>
  <tr><td valign=\"top\">'W'</td> <td valign=\"top\">6</td> <td valign=\"top\">Weak Unknown</td></tr>
  <tr><td valign=\"top\">'L'</td> <td valign=\"top\">7</td> <td valign=\"top\">Weak 0</td></tr>
  <tr><td valign=\"top\">'H'</td> <td valign=\"top\">8</td> <td valign=\"top\">Weak 1</td></tr>
  <tr><td valign=\"top\">'-'</td> <td valign=\"top\">9</td> <td valign=\"top\">Do not care</td></tr>
</table>
<P>
If the logic values are imported by <br><b>import L = Digital.Interfaces.Logic;</b><br>
they can be used to specify the parameter, e.g., <b>L.'0'</b> for forcing 0.
</P>
</html>",       revisions=
                 "<HTML>
<dl>
<dt><i>August 20, 2003</i></dt>
<dd>by Teresa Schlegel initially modelled.</dd>
</dl>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Line(points={{-30,40},{0,40},{0,80},{30,80}}, color={0,0,0}),
            Line(points={{50,0},{90,0}}, color={127,0,127})}));
        end Step;

        block Table "Digital Tabular Source"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      parameter Modelica_Electrical_Digital_Interfaces.Logic x[:]={L.'1'}
        "vector of values";
          parameter Real t[size(x, 1)]={1}
        "vector of corresponding time points";
      parameter Modelica_Electrical_Digital_Interfaces.Logic y0=L.'U'
        "initial output value";
          final parameter Integer n=size(x, 1) "table size";
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
        algorithm
          if initial() then
            // assert(y0 >= L.min and y0 <= L.max, "Parameter y0 is not of type Logic");
            assert(n > 0, "Invalid size of table (n < 1)");
            for i in 1:n loop
              // assert(x[i] >= L.min and x[i] <= L.max, "Table element is not of type Logic");
            end for;
          end if;
          y := y0;
          for i in 1:n loop
            if time >= t[i] then
              y := x[i];
            end if;
          end for;
          annotation (
            Documentation(info="<HTML>
<P>
The table source output signal <i>y</i> steps to the values of the  <i>x</i> table at the corresponding
timepoints in the <i>t</i> table. <br>The initial value is specified by <i>y0</i>.
</P>
<P>
To specify the logic value parameters, the integer code has to be used.
</P>
<p><b>Code Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Logic value</b></td>
      <td valign=\"top\"><b>Integer code</b></td>
      <td valign=\"top\"><b>Meaning</b></td>
  </tr>

  <tr><td valign=\"top\">'U'</td> <td valign=\"top\">1</td> <td valign=\"top\">Uninitialized</td></tr>
  <tr><td valign=\"top\">'X'</td> <td valign=\"top\">2</td> <td valign=\"top\">Forcing Unknown</td></tr>
  <tr><td valign=\"top\">'0'</td> <td valign=\"top\">3</td> <td valign=\"top\">Forcing 0</td></tr>
  <tr><td valign=\"top\">'1'</td> <td valign=\"top\">4</td> <td valign=\"top\">Forcing 1</td></tr>
  <tr><td valign=\"top\">'Z'</td> <td valign=\"top\">5</td> <td valign=\"top\">High Impedance</td></tr>
  <tr><td valign=\"top\">'W'</td> <td valign=\"top\">6</td> <td valign=\"top\">Weak Unknown</td></tr>
  <tr><td valign=\"top\">'L'</td> <td valign=\"top\">7</td> <td valign=\"top\">Weak 0</td></tr>
  <tr><td valign=\"top\">'H'</td> <td valign=\"top\">8</td> <td valign=\"top\">Weak 1</td></tr>
  <tr><td valign=\"top\">'-'</td> <td valign=\"top\">9</td> <td valign=\"top\">Do not care</td></tr>
</table>
<P>
If the logic values are imported by <br><b>import L = Digital.Interfaces.Logic;</b><br>
they can be used to specify the parameter, e.g., <b>L.'0'</b> for forcing 0.
</P>
</html>",         revisions="<HTML>
<dl>
<dt><i>August 20, 2003</i></dt>
<dd>by Teresa Schlegel initially modelled.</dd>
</dl>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Line(points={{50,0},{90,0}}, color={127,0,127}),
            Rectangle(
              extent={{-30,80},{32,70}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-30,70},{32,40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{0,80},{0,40}}, color={0,0,0}),
            Line(points={{-30,60},{32,60}}, color={0,0,0}),
            Line(points={{-30,50},{32,50}}, color={0,0,0})}));
        end Table;

        model Pulse "Digital Pulse Source"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          parameter Real width(
            final min=Modelica_Constants.small,
            final max=100, start=50) "Widths of pulses in % of periods";
          parameter Modelica_SIunits.Time period(final min=Modelica_Constants.small, start=1)
        "Time for one period";
          parameter Modelica_SIunits.Time startTime(start=0)
        "Output = quiet for time < startTime";
      parameter Modelica_Electrical_Digital_Interfaces.Logic pulse(start=L.'0')
        "pulsed value";
      parameter Modelica_Electrical_Digital_Interfaces.Logic quiet(start=L.'1')
        "quiet value";
          Modelica_SIunits.Time T0(final start=startTime)
        "Start time of current period";
          parameter Integer nperiod(start=-1)
        "Number of periods (< 0 means infinite number of periods)";
          Integer np(start=0, fixed=true);
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
    protected
          Boolean sampling;

        equation
          sampling = nperiod <> 0 and (nperiod >= pre(np) or nperiod < 0);

          when sampling and sample(startTime, period) then
             T0 = time;
             np = if nperiod > 0 then pre(np) + 1 else pre(np);
          end when;

          if sampling then
             y = if time < startTime or time >= T0 + ((width*period)/100) then quiet else pulse;
          else
             y = quiet;
          end if;
          annotation (Documentation(info="<HTML>
<P>
The pulse source forms pulses between the  <i>quiet</i> value and the <i>pulse</i> value.
The pulse length <i>width</i> is specified in percent of the period length <i>period</i>.
The number of periods is specified by <i>nperiod</i>. If <i>nperiod</i> is less than zero,
the number of periods is unlimited.
</P>
<P>
To specify the logic value parameters, the integer code has to be used.
</P>
<p><b>Code Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Logic value</b></td>
      <td valign=\"top\"><b>Integer code</b></td>
      <td valign=\"top\"><b>Meaning</b></td>
  </tr>

  <tr><td valign=\"top\">'U'</td> <td valign=\"top\">1</td> <td valign=\"top\">Uninitialized</td></tr>
  <tr><td valign=\"top\">'X'</td> <td valign=\"top\">2</td> <td valign=\"top\">Forcing Unknown</td></tr>
  <tr><td valign=\"top\">'0'</td> <td valign=\"top\">3</td> <td valign=\"top\">Forcing 0</td></tr>
  <tr><td valign=\"top\">'1'</td> <td valign=\"top\">4</td> <td valign=\"top\">Forcing 1</td></tr>
  <tr><td valign=\"top\">'Z'</td> <td valign=\"top\">5</td> <td valign=\"top\">High Impedance</td></tr>
  <tr><td valign=\"top\">'W'</td> <td valign=\"top\">6</td> <td valign=\"top\">Weak Unknown</td></tr>
  <tr><td valign=\"top\">'L'</td> <td valign=\"top\">7</td> <td valign=\"top\">Weak 0</td></tr>
  <tr><td valign=\"top\">'H'</td> <td valign=\"top\">8</td> <td valign=\"top\">Weak 1</td></tr>
  <tr><td valign=\"top\">'-'</td> <td valign=\"top\">9</td> <td valign=\"top\">Do not care</td></tr>
</table>
<P>
If the logic values are imported by <br><b>import L = Digital.Interfaces.Logic;</b><br>
they can be used to specify the parameter, e.g., <b>L.'0'</b> for forcing 0.
</P>
</html>",         revisions=
                 "<HTML>
<dl>
<dt><i>September 2, 2003</i></dt>
<dd>by Christoph Clauss initially modelled.</dd>
</dl>
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Line(points={{50,0},{90,0}}, color={127,0,127}),
            Line(points={{-36,40},{-30,40},{-30,40},{-18,40},{-18,40},{-14,40},
                  {-14,80},{14,80},{14,40},{14,40},{14,40},{28,40},{30,40},{36,
                  40}}, color={0,0,0})}));
        end Pulse;

        model Clock "Digital Clock Source"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          parameter Modelica_SIunits.Time startTime(start=0)
        "Output = offset for time < startTime";
          parameter Modelica_SIunits.Time period(
            final min=Modelica_Constants.small, start=1) "Time for one period";
          parameter Real width(
            final min=Modelica_Constants.small,
            final max=100, start=50) "Width of pulses in % of period";
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y
        "Connector of Digital output signal" annotation (Placement(
            transformation(extent={{90,-10},{110,10}}, rotation=0)));
    protected
          Modelica_SIunits.Time t_i(final start=startTime)
        "Start time of current period";
          Modelica_SIunits.Time t_width=period*width/100;
        equation
          when sample(startTime, period) then
            t_i =  time;
          end when;
          y =  if (not time>=startTime) or time >= t_i + t_width then L.'0' else L.'1';
          annotation (Documentation(info="<HTML>
<P>
The clock source forms pulses between the  <i>'0'</i> value (forcing 0) and the <i>'1'</i> value (forcing 1).
The pulse length <i>width</i> is specified in percent of the period length <i>period</i>.
The number of periods is unlimited. The first pulse starts at startTime.
</P>
<P> The clock source is a special but often used variant of the pulse source.
</P>
</html>",         revisions="<HTML>
<dl>
<dt><i>September 18, 2004</i></dt>
<dd>by Andre Schneider initially modelled.</dd>
</dl>
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-50,100},{50,-100}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name"),
            Line(points={{50,0},{90,0}}, color={127,0,127}),
            Line(points={{-36,40},{-30,40},{-30,80},{-18,80},{-18,40},{-6,40},{
                  -6,80},{6,80},{6,40},{18,40},{18,80},{30,80},{30,40},{36,40}},
                color={0,0,0})}));
        end Clock;
        annotation (                                Documentation(info="<html>
<p>The sources are not taken from Standard Logic. They were added since they turned out to be quite useful, since such sources are often needed. For a better optical overview the colour green was chosen for the sources.</p>
</html>"));
      end Sources;

      package Converters "Converters between 2-,3-,4- and 9-valued logic"
        extends Modelica_Icons.Package;

        block LogicToX01 "Conversion to X01"
      import D = Modelica_Electrical_Digital;
      import T = Modelica_Electrical_Digital.Tables;
      Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
        algorithm
          for i in 1:n loop
            y[i] := T.X01Table[x[i]];
          end for;
          annotation (
            Documentation(info="<HTML>
<P>
Conversion of a nine valued digital input into a X01 digital output without
any delay according to IEEE 1164 To_X01 function.
</p>
<p><b>Conversion Table:</b></p>
<pre>
  input                  output
  'U' (coded by 1)       'X'  (coded by 2)
  'X' (coded by 2)       'X'  (coded by 2)
  '0' (coded by 3)       '0'  (coded by 3)
  '1' (coded by 4)       '1'  (coded by 4)
  'Z' (coded by 5)       'X'  (coded by 2)
  'W' (coded by 6)       'X'  (coded by 2)
  'L' (coded by 7)       '0'  (coded by 3)
  'H' (coded by 8)       '1'  (coded by 4)
  '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_x01 into LogicToX01<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</html>"),         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-40,-40},{-40,40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,-40},{40,-40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-20},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="X01"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end LogicToX01;

        block LogicToX01Z "Conversion to X01Z"
      import D = Modelica_Electrical_Digital;
      import T = Modelica_Electrical_Digital.Tables;
      Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
        algorithm
          for i in 1:n loop
            y[i] := T.X01ZTable[x[i]];
          end for;
          annotation (
            Documentation(info="<HTML>
<P>
Conversion of a nine valued digital input into a X01Z digital output without
any delay according to IEEE 1164 To_X01Z function.
</P>
<p><b>Conversion Table:</b></p>
<pre>
 input                  output
 'U' (coded by 1)       'X'  (coded by 2)
 'X' (coded by 2)       'X'  (coded by 2)
 '0' (coded by 3)       '0'  (coded by 3)
 '1' (coded by 4)       '1'  (coded by 4)
 'Z' (coded by 5)       'Z'  (coded by 5)
 'W' (coded by 6)       'X'  (coded by 2)
 'L' (coded by 7)       '0'  (coded by 3)
 'H' (coded by 8)       '1'  (coded by 4)
 '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_x01z into LogicToX01Z<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-40,-40},{-40,40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,-40},{40,-40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-20},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="X01Z"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end LogicToX01Z;

        block LogicToUX01 "Conversion to UX01"
          import D = Modelica_Electrical_Digital;
          import T = Modelica_Electrical_Digital.Tables;
      Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
        algorithm
          for i in 1:n loop
            y[i] := T.UX01Table[x[i]];
          end for;
          annotation (
            Documentation(info="<HTML>
<P>
Conversion of a nine valued digital input into a UX01 digital output without
any delay according to IEEE 1164 To_UX01 function.
</P>
<p><b>Conversion Table:</b></p>
<pre>
 input                  output
 'U' (coded by 1)       'U'  (coded by 1)
 'X' (coded by 2)       'X'  (coded by 2)
 '0' (coded by 3)       '0'  (coded by 3)
 '1' (coded by 4)       '1'  (coded by 4)
 'Z' (coded by 5)       'X'  (coded by 2)
 'W' (coded by 6)       'X'  (coded by 2)
 'L' (coded by 7)       '0'  (coded by 3)
 'H' (coded by 8)       '1'  (coded by 4)
 '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_ux01 into LogicToUX01<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-40,-40},{-40,40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,-40},{40,-40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-20},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="UX01"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end LogicToUX01;

        block BooleanToLogic "Boolean to Logic converter"
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          Modelica_Blocks_Interfaces.BooleanInput x[n] annotation (Placement(
            transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
          Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
         Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
        equation
          for i in 1:n loop
            y[i] = if x[i] then L.'1' else L.'0';
          end for;
          annotation (
            Documentation(info="<HTML>
<P>
Conversion of a Boolean input into a digital output without any delay according to:
</P>
<pre>
 input      output
 true       '1'  (coded by 4)
 false      '0'  (coded by 3)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 4, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Polygon(
              points={{-40,-40},{40,40},{40,-40},{-40,-40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,40},{40,40},{-40,-40},{-40,40}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end BooleanToLogic;

        block LogicToBoolean "Logic to Boolean converter"
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
          Modelica_Blocks_Interfaces.BooleanOutput y[n]
            annotation (Placement(transformation(extent={{40,-10},{60,10}},
                  rotation=0)));
          parameter Integer n(final min=1, start=2) "signal width";
        equation
          for i in 1:n loop
            y[i] = if x[i] == L.'1' or x[i] == L.'H' then true else false;
          end for;
          annotation (Documentation(info="<HTML>
<P>
Conversion of a digital input into a Boolean output without any delay according to:
</P>
<pre>
 input                 output
 'U'  (coded by 1)     false
 'X'  (coded by 2)     false
 '0'  (coded by 3)     false
 '1'  (coded by 4)     true
 'Z'  (coded by 5)     false
 'W'  (coded by 6)     false
 'L'  (coded by 7)     false
 'H'  (coded by 8)     true
 '-'  (coded by 9)     false
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 4, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Polygon(
              points={{-40,40},{40,40},{-40,-40},{-40,40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-40,-40},{40,-40},{40,40},{-40,-40}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end LogicToBoolean;

        block RealToLogic "Real to Logic converter"
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          Modelica_Blocks_Interfaces.RealInput x[n]
            annotation (Placement(transformation(extent={{-60,-10},{-40,10}},
                  rotation=0)));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
          parameter Real upper_limit(start=1) "upper limit";
          parameter Real lower_limit(start=0) "lower limit";
          parameter L upper_value(start=L.'1') "output if input > upper_limit";
          parameter L lower_value(start=L.'0') "output if input < lower_limit";
          parameter L middle_value(start=L.'X') "output else";
        equation
          for i in 1:n loop
            y[i] = if x[i] > upper_limit then upper_value else
              if x[i] < lower_limit then lower_value else middle_value;
          end for;
          annotation (
            Documentation(info="<HTML>
<P>
Conversion of a real input into a digital output without any delay according to:
</P>
<pre>
                                 condition            output
      first check:               input greater upp    lupp
      second check:              input larger low     llow
                                 else                 lmid
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Polygon(
              points={{-40,-40},{40,40},{40,-40},{-40,-40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(points={{-40,40},{40,40},{-40,-40},{-40,40}}, lineColor={0,
                  0,255}),
            Text(
              extent={{148,-100},{-152,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end RealToLogic;

        block LogicToReal "Logic to Real converter"
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
          Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
          Modelica_Blocks_Interfaces.RealOutput y[n]
            annotation (Placement(transformation(extent={{40,-10},{60,10}},
                  rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
          parameter Real value_U(start=0.5)
        "value for digital U (uninitialized)";
          parameter Real value_X(start=0.5)
        "value for digital X (Forcing Unknown)";
          parameter Real value_0(start=0) "value for digital 0 (Forcing 0)";
          parameter Real value_1(start=1) "value for digital 1 (Forcing 1)";
          parameter Real value_Z(start=0.5)
        "value for digital Z (High Impedance)";
          parameter Real value_W(start=0.5)
        "value for digital W (Weak    Unknown)";
          parameter Real value_L(start=0) "value for digital L (Weak 0)";
          parameter Real value_H(start=1) "value for digital H (Weak 1)";
          parameter Real value_m(start=0.5) "value for digital m (Do not care)";
        equation
          for i in 1:n loop
           y[i]= if x[i] == L.'U' then value_U else
                    if x[i] == L.'X' then value_X else if
              x[i] == L.'0' then value_0 else if x[i] == L.'1' then
                   value_1 else if x[i] == L.
              'Z' then value_Z else if x[i] == L.'W' then value_W else
                    if x[i] == L.'L' then value_L else if
              x[i] == L.'H' then value_H else value_m;
          end for;
          annotation (Documentation(info="<HTML>
<P>
Conversion of a digital input into a Real output without any delay according to:
</P>
<pre>
  input                 output
  'U'  (coded by 1)     val_U
  'X'  (coded by 2)     val_X
  '0'  (coded by 3)     val_0
  '1'  (coded by 4)     val_1
  'Z'  (coded by 5)     val_Z
  'W'  (coded by 6)     val_W
  'L'  (coded by 7)     val_L
  'H'  (coded by 8)     val_H
  '-'  (coded by 9)     val_m
</pre>
<P>
The values val... are given by parameters.</P>
<P>If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Polygon(
              points={{-40,40},{40,40},{-40,-40},{-40,40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(points={{-40,-40},{40,-40},{40,40},{-40,-40}}, lineColor={0,
                  0,255}),
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end LogicToReal;

        block LogicToXO1
      "This model will be removed in future Modelica versions, use 'LogicToX01' instead!"
          // extends Modelica.Icons.ObsoleteModel;
          import D = Modelica_Electrical_Digital;
          import T = Modelica_Electrical_Digital.Tables;
      Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
        algorithm
          for i in 1:n loop
            y[i] := T.X01Table[x[i]];
          end for;
          annotation (
            Documentation(info="<HTML>
<h4>Obsoletion Note</h4>
<p>This model will be removed in future versions of the Modelica Standard Library. Instead the model <a href=\"modelica://Modelica.Electrical.Digital.Converters.LogicToX01\">LogicToX01</a> shall be used.</p>
<hr>
<P>
Conversion of a nine valued digital input into a X01 digital output without
any delay according to IEEE 1164 To_X01 function.
</p>
<p><b>Conversion Table:</b></p>
<pre>
  input                  output
  'U' (coded by 1)       'X'  (coded by 2)
  'X' (coded by 2)       'X'  (coded by 2)
  '0' (coded by 3)       '0'  (coded by 3)
  '1' (coded by 4)       '1'  (coded by 4)
  'Z' (coded by 5)       'X'  (coded by 2)
  'W' (coded by 6)       'X'  (coded by 2)
  'L' (coded by 7)       '0'  (coded by 3)
  'H' (coded by 8)       '1'  (coded by 4)
  '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_x01 into LogicToX01<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</html>"),         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-40,-40},{-40,40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,-40},{40,-40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-20},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="X01"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end LogicToXO1;

        block LogicToXO1Z
      "This model will be removed in future Modelica versions, use 'LogicToX01Z' instead!"
          // extends Modelica.Icons.ObsoleteModel;
          import D = Modelica_Electrical_Digital;
          import T = Modelica_Electrical_Digital.Tables;
      Modelica_Electrical_Digital_Interfaces.DigitalInput x[n] annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y[n] annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
          parameter Integer n(final min=1, start=1) "signal width";
        algorithm
          for i in 1:n loop
            y[i] := T.X01ZTable[x[i]];
          end for;
          annotation (
            Documentation(info="<HTML>
<h4>Obsoletion Note</h4>
<p>This model will be removed in future versions of the Modelica Standard Library. Instead the model <a href=\"modelica://Modelica.Electrical.Digital.Converters.LogicToX01Z\">LogicToX01Z</a> shall be used.</p>
<hr>
<P>
Conversion of a nine valued digital input into a X01Z digital output without
any delay according to IEEE 1164 To_X01Z function.
</P>
<p><b>Conversion Table:</b></p>
<pre>
 input                  output
 'U' (coded by 1)       'X'  (coded by 2)
 'X' (coded by 2)       'X'  (coded by 2)
 '0' (coded by 3)       '0'  (coded by 3)
 '1' (coded by 4)       '1'  (coded by 4)
 'Z' (coded by 5)       'Z'  (coded by 5)
 'W' (coded by 6)       'X'  (coded by 2)
 'L' (coded by 7)       '0'  (coded by 3)
 'H' (coded by 8)       '1'  (coded by 4)
 '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</html>",         revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_x01z into LogicToX01Z<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"),  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={
            Text(
              extent={{152,-100},{-148,-40}},
              lineColor={0,0,255},
              textString="%name"),
            Polygon(
              points={{-40,-40},{-40,40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-40,-40},{40,-40},{40,40},{-40,-40}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-20},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="X01Z"),
            Rectangle(
              extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
              lineThickness=0.5)}));
        end LogicToXO1Z;
        annotation (                                Documentation(info="<html>
<p>The Converter BooleanToLogic, LogicToBoolean, RealToLogic, and LogicTo Real components are not standard logic components. They were designed to easily convert from or to Boolean or Real valued signals. The LogicToX01, LogicToX01Z and LogicTo UX01 converters correspond to standard logic functions. They transform 9-valued logic to 3- or 4-valued logic.</p>
</html>"));
      end Converters;

      package Registers "Registers with N-bit input data and output data"
        extends Modelica_Icons.Package;

        model DFFR "Edge triggered register bank with reset"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Integer ResetMap[L] = {1, 4, 3, 2, 4, 4, 3, 2, 4}
        "function selection, defaults for high active reset";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";

      Modelica_Electrical_Digital_Interfaces.DigitalInput reset annotation (
          Placement(transformation(extent={{-10,-100},{10,-80}}),
            iconTransformation(extent={{-10,-100},{10,-80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput clock annotation (
          Placement(transformation(extent={{-90,-30},{-70,-10}}),
            iconTransformation(extent={{-90,-30},{-70,-10}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n] annotation
        (Placement(transformation(extent={{-90,20},{-70,40}}),
            iconTransformation(extent={{-90,20},{-70,40}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{64,26},{84,46}}),
            iconTransformation(extent={{69,20},{89,40}})));
    protected
                  Integer clock_flag(start=0);
                    // 0: 0-Transition
                    // 1: rising edge
                    // 2: X-Transition

                   Integer reset_flag(start=1);
                    // 1: output := U
                    // 2: output := 0
                    // 3: output := -dataInUX
                    // 4: output := U-0X
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate[n](start=fill(L.
            'U', n));
      Modelica_Electrical_Digital_Interfaces.Logic next_assign_val[n](start=
            fill(L.'U', n));

        algorithm
        if change(clock) or change(reset) then

          if change(clock) then
            if initial() then
              clock_flag := T.ClockMap[L.'U',clock];
            else
              clock_flag := T.ClockMap[pre(clock),clock];
            end if;
          end if;

          reset_flag :=  ResetMap[reset];
          for i in 1:n loop
            if reset_flag == 1 then
              nextstate[i] := L.'U';
            elseif reset_flag == 2 then
              nextstate[i] := T.StrengthMap[L.'0', strength];
            elseif reset_flag == 3 then
              if clock_flag == 0 then
                break;
              elseif clock_flag == 1 then
                nextstate[i] := T.StrengthMap[dataIn[i], strength];
              else
                if (next_assign_val[i] == T.StrengthMap[dataIn[i], strength])
                  or (next_assign_val[i] == L.'U') then
                    break;
                elseif dataIn[i] == L.'U' then
                    nextstate[i] := L.'U';
                else
                    nextstate[i] := T.StrengthMap[L.'X', strength];
                end if;
              end if;
            elseif reset_flag == 4 then
              if (next_assign_val[i] == T.StrengthMap[L.'0', strength])
                and (dataIn[i] == L.'0' or dataIn[i] == L.'L' or clock_flag == 0) then
                  break;
              elseif (dataIn[i] == L.'0' or dataIn[i] == L.'L') and (clock_flag == 1) then
                  nextstate[i] := T.StrengthMap[L.'0', strength];
              elseif ((next_assign_val[i] == L.'U') and not (clock_flag == 1))
                or ((dataIn[i] == L.'U') and not (clock_flag == 0)) then
                  nextstate[i] := L.'U';
              else
                nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            end if;
          end for;
        end if;
        next_assign_val := nextstate;
        dataOut := nextstate;
          annotation (   Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,60},{50,-60}},
              lineColor={127,33,107},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-70,30},{-50,30}},
              color={127,33,107},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{50,30},{76,30}},
              color={127,33,107},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-20},{-50,-20}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{0,-84},{0,-60}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{-50,-8},{-34,-20},{-50,-32}},
              color={127,33,107},
              smooth=Smooth.None),
            Text(
              extent={{-30,54},{20,8}},
              lineColor={127,33,107},
              textString="DFFR"),
            Text(
              extent={{-32,-14},{-6,-26}},
              lineColor={127,33,107},
              textString="clock"),
            Text(
              extent={{-14,-44},{12,-56}},
              lineColor={127,33,107},
              textString="reset")}),
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities</p>
<p><b>Truth Table for high active reset:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td > <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">DataIn</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">X or U or NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">4</td> </tr>
</table>

<p><b>Truth Table for low active reset:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td > <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">DataIn</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">X or U or NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">4</td> </tr>
</table>

<PRE>

  *  = do not care
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change

Clock transition definitions:
  1-Trns: 0 -> 1
  0-Trns: ~ -> 0 or 1 -> * or X -> X|U or U -> X|U
  X-Trns: 0 -> X|U or X|U -> 1
</PRE>
</html>",         revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"));
        end DFFR;

        model DFFREG "Edge triggered register bank with high active reset"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
          parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";
    protected
          constant Integer ResetMap[L] = {1, 4, 3, 2, 4, 4, 3, 2, 4};
              // Function selection by [reset] reading
              // 1: output := U
              // 2: output := 0
              // 3: output := -dataInUX
              // 4: output := U-0X

    public
          D.Delay.InertialDelaySensitiveVector delay(
        tHL=tHL,
        tLH=tLH,
        n=n) annotation (Placement(transformation(extent={{22,11},{79,69}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput reset annotation (
          Placement(transformation(extent={{-100,-68},{-84,-52}}),
            iconTransformation(extent={{-100,-68},{-84,-52}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput clock
        annotation (Placement(transformation(extent={{-100,-28},{-84,-12}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n]
        annotation (Placement(transformation(extent={{-100,32},{-84,48}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{84,32},{100,48}}),
            iconTransformation(extent={{84,32},{100,48}})));

          D.Registers.DFFR dFFR(
        n=n,
        ResetMap=ResetMap,
        strength=strength)
        annotation (Placement(transformation(extent={{-78,-23},{18,74}})));
        equation
          connect(delay.y, dataOut) annotation (Line(
              points={{75.01,40},{92,40}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1));
          connect(dataIn, dFFR.dataIn) annotation (Line(
              points={{-92,40},{-68.4,40},{-68.4,40.05}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(dFFR.dataOut, delay.x) annotation (Line(
              points={{7.92,40.05},{25.99,39.855}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(clock, dFFR.clock) annotation (Line(
              points={{-92,-20},{-68.4,-20},{-68.4,15.8}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(reset, dFFR.reset) annotation (Line(
              points={{-92,-60},{-30,-60},{-30,-18.15}},
              color={127,0,127},
              smooth=Smooth.None));
          annotation (   Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,70},{50,-50}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-86,40},{-50,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-84,-20},{-50,-20}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{-84,-60},{0,-60},{0,-50}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{50,40},{84,40}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{-50,-10},{-36,-20},{-50,-30}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-32,70},{30,10}},
              lineColor={127,33,107},
              textString="DFFREG"),
            Text(
              extent={{-14,-34},{12,-46}},
              lineColor={127,33,107},
              textString="reset"),
            Text(
              extent={{-28,-14},{-2,-26}},
              lineColor={127,33,107},
              textString="clock"),
            Text(
              extent={{-26,44},{26,2}},
              lineColor={127,33,107},
              textString="high active")}),
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td > <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
</table>

<PRE>
  *  = do not care
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change

Clock transition definitions:
  1-Trns: 0 -> 1
  0-Trns: ~ -> 0 or 1 -> * or X -> X|U or U -> X|U
  X-Trns: 0 -> X|U or X|U -> 1
</PRE>
</html>",         revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"));
        end DFFREG;

        model DFFREGL "Edge triggered register bank with low active reset"
          extends DFFREG(final ResetMap = {1, 4, 2, 3, 4, 4, 2, 3, 4});
              // Function selection by [reset] reading
              // 1: output := U
              // 2: output := 0
              // 3: output := -dataInUX
              // 4: output := U-0X;
          annotation (Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td > <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
</table>

<PRE>
  *  = do not care
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change

Clock transition definitions:
  1-Trns: 0 -> 1
  0-Trns: ~ -> 0 or 1 -> * or X -> X|U or U -> X|U
  X-Trns: 0 -> X|U or X|U -> 1
</PRE>
</html>",         revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),         Icon(graphics={Rectangle(
              extent={{-30,30},{28,16}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-28,48},{24,-1}},
              lineColor={127,33,107},
              textString="low active")}));
        end DFFREGL;

        model DFFSR "Edge triggered register bank with set and reset"
      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Integer ResetSetMap[L, L]=[
                     1,  1,  1,  1,  1,  1,  1,  1,  1;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4]
        "function selection by [reset, set] reading";
            /* Defaults for set and reset are active high */
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";

      Modelica_Electrical_Digital_Interfaces.DigitalInput set
        annotation (Placement(transformation(extent={{-10,100},{10,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput reset annotation (
          Placement(transformation(extent={{-10,-100},{10,-80}}),
            iconTransformation(extent={{-10,-100},{10,-80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput clock annotation (
          Placement(transformation(extent={{-90,-20},{-70,0}}),
            iconTransformation(extent={{-90,-30},{-70,-10}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n] annotation
        (Placement(transformation(extent={{-90,20},{-70,40}}),
            iconTransformation(extent={{-90,20},{-70,40}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{68,20},{88,40}}),
            iconTransformation(extent={{69,20},{89,40}})));

    protected
                  Integer clock_flag(start=0);
                    // 0: 0-Transition
                    // 1: rising edge
                    // 2: X-Transition

                  Integer reset_set_flag(start=1);
                    // 1: output := U
                    // 2: output := 1
                    // 3: output := 0
                    // 4: output := UX
                    // 5: output := -1UX
                    // 6: output := X
                    // 7: output := -0UX
                    // 8: output := -dataInUX

      Modelica_Electrical_Digital_Interfaces.Logic nextstate[n](start=fill(L.
            'U', n));
      Modelica_Electrical_Digital_Interfaces.Logic next_assign_val[n](start=
            fill(L.'U', n));

        algorithm
        if change(clock) or change(reset) or change(set) then

          if change(clock) then
            if initial() then
              clock_flag := T.ClockMap[L.'U',clock];
            else
              clock_flag := T.ClockMap[pre(clock),clock];
            end if;
          end if;

          reset_set_flag := ResetSetMap[reset, set];
          for i in 1:n loop
            if reset_set_flag == 1 then
                  nextstate[i] := L.'U';
            elseif reset_set_flag == 2 then
                  nextstate[i] := T.StrengthMap[L.'1', strength];
            elseif reset_set_flag == 3 then
                  nextstate[i] := T.StrengthMap[L.'0', strength];
            elseif reset_set_flag == 4 then
              if (next_assign_val[i] == L.'U' and clock_flag <> 1)
                or (dataIn[i] == L.'U' and clock_flag <> 0) then
                  nextstate[i] := L.'U';
              else
                  nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            elseif reset_set_flag == 5 then
              if next_assign_val[i] == T.StrengthMap[L.'1', strength]
                and (dataIn[i] == L.'1' or dataIn[i] == L.'H' or clock_flag == 0) then
                  break;
              elseif (dataIn[i] == L.'1' or dataIn[i] == L.'H')  and clock_flag == 1 then
                  nextstate[i] := T.StrengthMap[L.'1', strength];
              elseif (next_assign_val[i] == L.'U' and clock_flag <> 1)
                or (dataIn[i] == L.'U' and clock_flag <> 0) then
                  nextstate[i] := L.'U';
              else
                  nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            elseif reset_set_flag == 6 then
                  nextstate[i] := T.StrengthMap[L.'X', strength];
            elseif reset_set_flag == 7 then
              if next_assign_val[i] == T.StrengthMap[L.'0', strength]
                and (dataIn[i] == L.'0' or dataIn[i] == L.'L' or clock_flag == 0) then
                  break;
              elseif (dataIn[i] == L.'0' or dataIn[i] == L.'L') and clock_flag == 1 then
                  nextstate[i] :=  T.StrengthMap[L.'0', strength];
              elseif (next_assign_val[i] == L.'U' and clock_flag <> 1)
                or (dataIn[i] == L.'U' and clock_flag <> 0) then
                  nextstate[i] := L.'U';
              else
                  nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            elseif reset_set_flag == 8 then
              if clock_flag == 0 then
                  break;
              elseif clock_flag == 1 then
                  nextstate[i] := T.StrengthMap[dataIn[i], strength];
              else
                if next_assign_val[i] == T.StrengthMap[dataIn[i],strength]
                or next_assign_val[i] == L.'U' then
                    break;
                elseif (dataIn[i] == L.'U') then
                    nextstate[i] := L.'U';
                else
                    nextstate[i] := T.StrengthMap[L.'X', strength];
                end if;
               end if;
              end if;
            end for;
          end if;

        next_assign_val := nextstate;
        dataOut := nextstate;
          annotation (   Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,60},{50,-60}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-80,30},{-50,30}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{50,30},{80,30}},
              color={127,33,107},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-20},{-50,-20}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{0,-84},{0,-60}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{-50,-8},{-34,-20},{-50,-32}},
              color={127,33,107},
              smooth=Smooth.None),
            Text(
              extent={{-36,66},{34,-8}},
              lineColor={127,33,107},
              textString="DFFSR"),
            Text(
              extent={{-28,-14},{-2,-26}},
              lineColor={127,33,107},
              textString="clock"),
            Text(
              extent={{-14,-44},{12,-56}},
              lineColor={127,33,107},
              textString="reset"),
            Line(
              points={{0,80},{0,60}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-13,56},{13,44}},
              lineColor={127,33,107},
              textString="set")}),
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table for high active set and reset</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">1</td> <td valign=\"top\">1</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> <td valign=\"top\">0</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">6</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> <td valign=\"top\">4</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> <td valign=\"top\">5</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">7</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">X or U or NC</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">DataIn</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">NC</td> <td valign=\"top\">8</td> </tr>

</table>

<p><b>Truth Table for low active set and reset </b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">0</td> <td valign=\"top\">1</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">1</td> <td valign=\"top\">0</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">6</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> <td valign=\"top\">4</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> <td valign=\"top\">5</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">7</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">X or U or NC</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">NC</td> <td valign=\"top\">8</td> </tr>
</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change

Clock transition definitions:
  1-Trns: 0 -> 1
  0-Trns: ~ -> 0 or 1 -> * or X -> X|U or U -> X|U
  X-Trns: 0 -> X|U or X|U -> 1
</PRE>
</html>",         revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"));
        end DFFSR;

        model DFFREGSRH
      "Edge triggered register bank with high active set and reset"
          import D = Modelica_Electrical_Digital;
          import L = Modelica_Electrical_Digital_Interfaces.Logic;
          import S = Modelica_Electrical_Digital_Interfaces.Strength;
          import T = Modelica_Electrical_Digital.Tables;
          parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
          parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";

    protected
          constant Integer ResetSetMap[L, L]=[
                     1,  1,  1,  1,  1,  1,  1,  1,  1;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4];
                    // Function selection by [reset, set] reading, active high;

    protected
          D.Delay.InertialDelaySensitiveVector delay(
        tHL=tHL,
        tLH=tLH,
        n=n,
        inertialDelaySensitive(each y(start=L.'U', fixed=true)))
        annotation (Placement(transformation(extent={{23,12},{79,68}})));

          D.Registers.DFFSR dFFSR(
        strength=strength,
        n=n,
        ResetSetMap=ResetSetMap,
        clock(start=L.'U', fixed=true),
        reset(start=L.'U', fixed=true),
        set(start=L.'U', fixed=true))
        annotation (Placement(transformation(extent={{-80,-25},{20,75}})));
    public
      Modelica_Electrical_Digital_Interfaces.DigitalInput set
        annotation (Placement(transformation(extent={{-100,72},{-84,88}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput reset
        annotation (Placement(transformation(extent={{-100,-68},{-84,-52}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput clock
        annotation (Placement(transformation(extent={{-100,-28},{-84,-12}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n]
        annotation (Placement(transformation(extent={{-100,32},{-84,48}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{84,32},{100,48}})));
        equation
          connect(dFFSR.dataOut, delay.x) annotation (Line(
              points={{9.5,40},{26.92,40},{26.92,39.86}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(set, dFFSR.set) annotation (Line(
              points={{-92,80},{-30,80},{-30,70}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(reset, dFFSR.reset) annotation (Line(
              points={{-92,-60},{-30,-60},{-30,-20}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(clock, dFFSR.clock) annotation (Line(
              points={{-92,-20},{-70,-20},{-70,15}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(dataIn, dFFSR.dataIn) annotation (Line(
              points={{-92,40},{-70,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(delay.y, dataOut) annotation (Line(
              points={{75.08,40},{92,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          annotation (   Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,70},{52,-50}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-86,40},{-50,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-84,-20},{-50,-20}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{52,40},{84,40}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{-50,-10},{-36,-20},{-50,-30}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-44,94},{38,-14}},
              lineColor={127,33,107},
              textString="DFFREGSR"),
            Text(
              extent={{-14,-32},{12,-44}},
              lineColor={127,33,107},
              textString="reset"),
            Text(
              extent={{-33,-13},{-7,-25}},
              lineColor={127,33,107},
              textString="clock"),
            Line(
              points={{-84,80},{0,80},{0,70}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{-84,-60},{0,-60},{0,-50}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-14,66},{12,54}},
              lineColor={127,33,107},
              textString="set"),
            Text(
              extent={{-32,38},{26,10}},
              lineColor={127,0,127},
              textString="high active")}),
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">*</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">1</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">NC</td> </tr>
</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change

Clock transition definitions:
  1-Trns: 0 -> 1
  0-Trns: ~ -> 0 or 1 -> * or X -> X|U or U -> X|U
  X-Trns: 0 -> X|U or X|U -> 1
</PRE>
</html>",     revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"));
        end DFFREGSRH;

        model DFFREGSRL
      "Edge triggered register bank with low active set and reset"
          extends DFFREGSRH(final ResetSetMap=[1,1,1,1,1,1,1,1,1; 1,4,2,7,4,4,2,
            7,4; 1,6,2,3,6,6,2,3,6; 1,5,2,8,5,5,2,8,5; 1,4,2,7,4,4,2,7,4; 1,4,2,
            7,4,4,2,7,4; 1,6,2,3,6,6,2,3,6; 1,5,2,8,5,5,2,8,5; 1,4,2,7,4,4,2,7,
            4]);
                   // Function selection by [reset, set] reading;
          annotation (Icon(graphics={Rectangle(
              extent={{-36,30},{28,16}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Text(
              extent={{-30,38},{24,12}},
              lineColor={127,0,127},
              textString="low active")}),     Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>

<p><b>Truth Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Clock</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">*</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">0</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">1</td> <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0-Trns</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">NC</td> </tr>
</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change

Clock transition definitions:
  1-Trns: 0 -> 1
  0-Trns: ~ -> 0 or 1 -> * or X -> X|U or U -> X|U
  X-Trns: 0 -> X|U or X|U -> 1
</PRE>
</html>",     revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"));
        end DFFREGSRL;

        model DLATR "Level sensitive register bank with reset"

      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Integer ResetMap[L] = {1, 4, 3, 2, 4, 4, 3, 2, 4}
        "function selection, defaults for high active reset";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";

      Modelica_Electrical_Digital_Interfaces.DigitalInput reset annotation (
          Placement(transformation(extent={{-10,-100},{10,-80}}),
            iconTransformation(extent={{-10,-100},{10,-80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-90,-20},{-70,0}}),
            iconTransformation(extent={{-90,-30},{-70,-10}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n] annotation
        (Placement(transformation(extent={{-90,20},{-70,40}}),
            iconTransformation(extent={{-90,20},{-70,40}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{66,24},{86,44}}),
            iconTransformation(extent={{69,20},{89,40}})));

    protected
                   Integer enable_flag(start=0);
                    // 0: low level
                    // 1: high level
                    // 2: unknown
                    // 3: uninitialized

                   Integer reset_flag(start=1);
                    // 1: output := U
                    // 2: output := 0
                    // 3: output := -UdataIn
                    // 4: output := U-0X

      Modelica_Electrical_Digital_Interfaces.Logic nextstate[n](start=fill(L.
            'U', n));
      Modelica_Electrical_Digital_Interfaces.Logic next_assign_val[n](start=
            fill(L.'U', n));
        algorithm
          if enable == L.'1' or enable == L.'H' then
            enable_flag := 1;
          elseif enable == L.'0' or enable == L.'L' then
            enable_flag := 0;
          elseif enable == L.'U' then
            enable_flag := 3;
          else
            enable_flag := 2;
          end if;

          reset_flag :=  ResetMap[reset];
          for i in 1:n loop
            if reset_flag == 1 then
                  nextstate[i] := L.'U';
            elseif reset_flag == 2 then
                  nextstate[i] := T.StrengthMap[L.'0', strength];
            elseif reset_flag == 3 then
              if enable_flag == 0 then
                  break;
              elseif enable_flag == 3 then
                  nextstate[i] := L.'U';
              elseif enable_flag == 1 then
                  nextstate[i] := T.StrengthMap[dataIn[i], strength];
              else
                if next_assign_val[i] == T.StrengthMap[dataIn[i],strength]
                or next_assign_val[i] == L.'U' then
                    break;
                elseif dataIn[i] == L.'U' then
                    nextstate[i] := L.'U';
                else
                    nextstate[i] := T.StrengthMap[L.'X', strength];
                end if;
              end if;
            elseif reset_flag == 4 then
             if enable_flag == 3
                or (next_assign_val[i] == L.'U' and enable_flag <> 1)
                or (dataIn[i] == L.'U' and enable_flag <> 0) then
                  nextstate[i] := L.'U';
              elseif next_assign_val[i] == T.StrengthMap[L.'0', strength]
                and (dataIn[i] == L.'0' or dataIn[i] == L.'L' or enable_flag == 0) then
                  break;
              elseif (dataIn[i] == L.'0' or dataIn[i] == L.'L') and enable_flag == 1 then
                  nextstate[i] :=  T.StrengthMap[L.'0', strength];
              else
                  nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            end if;
          end for;
          next_assign_val := nextstate;
          dataOut := nextstate;
           annotation (
            Documentation(info="<html>

<p> Description in VHDL is given by <a href=\"http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd\">http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</a></p>
<p><b>Truth Table for high active reset:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td > <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">0</td>  <td valign=\"top\">NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">0</td>  <td valign=\"top\">DataIn</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td>  <td valign=\"top\">X or U or NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~1</td> <td valign=\"top\">U</td> <td valign=\"top\">4</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">4</td> </tr>
</table>

<p><b>Truth Table for low active reset:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">0</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">1</td> <td valign=\"top\">NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td> <td valign=\"top\">X or U or NC</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~0</td> <td valign=\"top\">U</td> <td valign=\"top\">4</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">4</td> </tr>
</table>

<PRE>

  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change
</PRE>
</HTML>", revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),  Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,60},{50,-60}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-80,30},{-50,30}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{50,30},{80,30}},
              color={127,33,107},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-20},{-50,-20}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{0,-84},{0,-60}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{-50,-8},{-34,-20},{-50,-32}},
              color={127,33,107},
              smooth=Smooth.None),
            Text(
              extent={{-30,58},{26,2}},
              lineColor={127,33,107},
              textString="DLATR"),
            Text(
              extent={{-29,-8},{6,-32}},
              lineColor={127,33,107},
              textString="enable"),
            Text(
              extent={{-14,-44},{12,-56}},
              lineColor={127,33,107},
              textString="reset")}));
        end DLATR;

        model DLATREG "Level sensitive register bank with reset active high"

      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
          parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";

    protected
          constant Integer ResetMap[L] = {1, 4, 3, 2, 4, 4, 3, 2, 4};
              // Function selection by [reset] reading
              // 1: output := U
              // 2: output := 0
              // 3: output := -UdataIn
              // 4: output := U-0X

    public
          D.Delay.InertialDelaySensitiveVector delay(
        tHL=tHL,
        tLH=tLH,
        n=n) annotation (Placement(transformation(extent={{20,12},{76,68}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput reset
        annotation (Placement(transformation(extent={{-100,-68},{-84,-52}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable
        annotation (Placement(transformation(extent={{-100,-28},{-84,-12}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n]
        annotation (Placement(transformation(extent={{-100,32},{-84,48}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{84,32},{100,48}}),
            iconTransformation(extent={{84,32},{100,48}})));
          D.Registers.DLATR dLATR(
        n=n,
        strength=strength,
        ResetMap=ResetMap)
        annotation (Placement(transformation(extent={{-78,-23},{18,74}})));
        equation

          connect(delay.y, dataOut) annotation (Line(
              points={{72.08,40},{92,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(dLATR.dataOut, delay.x) annotation (Line(
              points={{7.92,40.05},{15.96,39.86},{23.92,39.86}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(dataIn, dLATR.dataIn) annotation (Line(
              points={{-92,40},{-80.2,40},{-80.2,40.05},{-68.4,40.05}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(enable, dLATR.enable) annotation (Line(
              points={{-92,-20},{-68.4,-20},{-68.4,15.8}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(reset, dLATR.reset) annotation (Line(
              points={{-92,-60},{-30,-60},{-30,-18.15}},
              color={127,0,127},
              smooth=Smooth.None));
           annotation (
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td > <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">0</td>  <td valign=\"top\">NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">0</td>  <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td>  <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~1</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change
</PRE>
</HTML>", revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),  Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,70},{52,-50}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-86,40},{-50,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-84,-20},{-50,-20}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{52,40},{84,40}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{-50,-10},{-36,-20},{-50,-30}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-32,82},{32,-2}},
              lineColor={127,0,127},
              textString="DLATREG"),
            Text(
              extent={{-14,-33},{12,-45}},
              lineColor={127,33,107},
              textString="reset"),
            Text(
              extent={{-33,-7},{-1,-32}},
              lineColor={127,33,107},
              textString="enable"),
            Line(
              points={{-84,-60},{0,-60},{0,-50}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-26,44},{26,2}},
              lineColor={127,33,107},
              textString="high active")}));
        end DLATREG;

        model DLATREGL "Level sensitive register bank with reset active low"

          extends DLATREG(final ResetMap = {1, 4, 2, 3, 4, 4, 2, 3, 4});
              // Function selection by [reset] reading
              // 1: output := U
              // 2: output := 0
              // 3: output := -UdataIn
              // 4: output := U-0X

           annotation (
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">1</td> <td valign=\"top\">NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td> <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~0</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change
</PRE>
</HTML>", revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),            Icon(graphics={Rectangle(
              extent={{-28,30},{30,18}},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-26,48},{26,-1}},
              lineColor={127,33,107},
              textString="low active")}));
        end DLATREGL;

        model DLATSR "Level sensitive register bank with set and reset"

      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Integer ResetSetMap[L, L]=[
                     1,  1,  1,  1,  1,  1,  1,  1,  1;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4]
        "function selection by [reset, set] reading";
            /* Defaults for set and reset are active high */
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";

      Modelica_Electrical_Digital_Interfaces.DigitalInput set
        annotation (Placement(transformation(extent={{-10,100},{10,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput reset annotation (
          Placement(transformation(extent={{-10,-100},{10,-80}}),
            iconTransformation(extent={{-10,-100},{10,-80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-90,-20},{-70,0}}),
            iconTransformation(extent={{-90,-30},{-70,-10}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n] annotation
        (Placement(transformation(extent={{-90,20},{-70,40}}),
            iconTransformation(extent={{-90,20},{-70,40}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{68,20},{88,40}}),
            iconTransformation(extent={{69,20},{89,40}})));

    protected
                  Integer enable_flag(start=0);
                    // 0: low level
                    // 1: high level
                    // 2: unknown
                    // 3: uninitialized

                  Integer reset_set_flag(start=1);
                    // 1: output := U
                    // 2: output := 1
                    // 3: output := 0
                    // 4: output := UX
                    // 5: output := U-1X
                    // 6: output := X
                    // 7: output := U-0X
                    // 8: output := -UdataInX

      Modelica_Electrical_Digital_Interfaces.Logic nextstate[n](start=fill(L.
            'U', n));
      Modelica_Electrical_Digital_Interfaces.Logic next_assign_val[n](start=
            fill(L.'U', n));

        algorithm
          if enable == L.'1' or enable == L.'H' then
            enable_flag := 1;
          elseif enable == L.'0' or enable == L.'L' then
            enable_flag := 0;
          elseif enable == L.'U' then
            enable_flag := 3;
          else
            enable_flag := 2;
          end if;

          reset_set_flag :=  ResetSetMap[reset, set];
          for i in 1:n loop
            if reset_set_flag == 1 then
                  nextstate[i] := L.'U';
            elseif reset_set_flag == 2 then
                  nextstate[i] := T.StrengthMap[L.'1', strength];
            elseif reset_set_flag == 3 then
                  nextstate[i] := T.StrengthMap[L.'0', strength];
            elseif reset_set_flag == 4 then
              if enable_flag == 3
                or (next_assign_val[i] == L.'U' and enable_flag <> 1)
                or (dataIn[i] == L.'U' and enable_flag <> 0) then
                  nextstate[i] := L.'U';
              else
                  nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            elseif reset_set_flag == 5 then
              if enable_flag == 3
                or (next_assign_val[i] == L.'U' and enable_flag <> 1)
                or (dataIn[i] == L.'U' and enable_flag <> 0) then
                  nextstate[i] := L.'U';
              elseif next_assign_val[i] == T.StrengthMap[L.'1', strength]
                and (dataIn[i] == L.'1' or dataIn[i] == L.'H' or enable_flag == 0) then
                  break;
              elseif (dataIn[i] == L.'1' or dataIn[i] == L.'H')  and enable_flag == 1 then
                  nextstate[i] := T.StrengthMap[L.'1', strength];
              else
                  nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            elseif reset_set_flag == 6 then
                  nextstate[i] := T.StrengthMap[L.'X', strength];
            elseif reset_set_flag == 7 then
              if enable_flag == 3
                or (next_assign_val[i] == L.'U' and enable_flag <> 1)
                or (dataIn[i] == L.'U' and enable_flag <> 0) then
                  nextstate[i] := L.'U';
              elseif next_assign_val[i] == T.StrengthMap[L.'0', strength]
                and (dataIn[i] == L.'0' or dataIn[i] == L.'L' or enable_flag == 0) then
                  break;
              elseif (dataIn[i] == L.'0' or dataIn[i] == L.'L') and enable_flag == 1 then
                  nextstate[i] :=  T.StrengthMap[L.'0', strength];
              else
                  nextstate[i] := T.StrengthMap[L.'X', strength];
              end if;
            elseif reset_set_flag == 8 then
              if enable_flag == 0 then
                  break;
              elseif enable_flag == 3 then
                  nextstate[i] := L.'U';
              elseif enable_flag == 1 then
                  nextstate[i] := T.StrengthMap[dataIn[i], strength];
              else
                if next_assign_val[i] == T.StrengthMap[dataIn[i],strength]
                or next_assign_val[i] == L.'U' then
                    break;
                elseif dataIn[i] == L.'U' then
                    nextstate[i] := L.'U';
                else
                    nextstate[i] := T.StrengthMap[L.'X', strength];
                end if;
              end if;
            end if;
          end for;
          next_assign_val := nextstate;
          dataOut := nextstate;
           annotation (
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table for high active set and reset</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">~1</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">1</td> <td valign=\"top\">1</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> <td valign=\"top\">0</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">6</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~1</td> <td valign=\"top\">~1</td> <td valign=\"top\">U</td> <td valign=\"top\">4,5,7,8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> <td valign=\"top\">4</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">0</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> <td valign=\"top\">5</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">7</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">X or U or NC</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">DataIn</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">NC</td> <td valign=\"top\">8</td> </tr>

</table>

<p><b>Truth Table for low active set and reset </b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
      <td valign=\"top\">Map</td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">~0</td> <td valign=\"top\">U</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">0</td> <td valign=\"top\">1</td> <td valign=\"top\">2</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">1</td> <td valign=\"top\">0</td> <td valign=\"top\">3</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">6</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~0</td> <td valign=\"top\">~0</td> <td valign=\"top\">U</td> <td valign=\"top\">4,5,7,8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> <td valign=\"top\">4</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">1</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> <td valign=\"top\">5</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td> <td valign=\"top\">X or U or 0 or NC</td> <td valign=\"top\">7</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">X or U or NC</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td> <td valign=\"top\">8</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">NC</td> <td valign=\"top\">8</td> </tr>

</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change
</PRE>
</HTML>", revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),  Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,60},{50,-60}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-80,30},{-50,30}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{50,30},{80,30}},
              color={127,33,107},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-20},{-50,-20}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{0,-84},{0,-60}},
              color={127,33,107},
              smooth=Smooth.None),
            Line(
              points={{-50,-8},{-34,-20},{-50,-32}},
              color={127,33,107},
              smooth=Smooth.None),
            Text(
              extent={{-34,60},{32,-6}},
              lineColor={127,33,107},
              textString="DLATSR"),
            Text(
              extent={{-29,-8},{5,-30}},
              lineColor={127,33,107},
              textString="enable"),
            Text(
              extent={{-14,-44},{12,-56}},
              lineColor={127,33,107},
              textString="reset"),
            Line(
              points={{0,80},{0,60}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-13,56},{13,44}},
              lineColor={127,33,107},
              textString="set")}));
        end DLATSR;

        model DLATREGSRH
      "Level sensitive register bank with set and reset, active high"

      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
          parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
          parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
          parameter Integer n(min=1) = 1 "data width";

    protected
          constant Integer ResetSetMap[L, L]=[
                     1,  1,  1,  1,  1,  1,  1,  1,  1;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  4,  7,  2,  4,  4,  7,  2,  4;
                     1,  5,  8,  2,  5,  5,  8,  2,  5;
                     1,  6,  3,  2,  6,  6,  3,  2,  6;
                     1,  4,  7,  2,  4,  4,  7,  2,  4];
                    // Function selection by [reset, set] reading, active high;

    public
          D.Delay.InertialDelaySensitiveVector delay(
        tHL=tHL,
        tLH=tLH,
        n=n) annotation (Placement(transformation(extent={{20,12},{76,68}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput set
        annotation (Placement(transformation(extent={{-100,72},{-84,88}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput reset
        annotation (Placement(transformation(extent={{-100,-68},{-84,-52}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable
        annotation (Placement(transformation(extent={{-100,-28},{-84,-12}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n]
        annotation (Placement(transformation(extent={{-100,32},{-84,48}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n]
        annotation (Placement(transformation(extent={{84,32},{100,48}}),
            iconTransformation(extent={{84,32},{100,48}})));
          D.Registers.DLATSR dLATSR(
        n=n,
        ResetSetMap=ResetSetMap,
        strength=strength)
        annotation (Placement(transformation(extent={{-78,-23},{18,74}})));
        equation

          connect(delay.y, dataOut) annotation (Line(
              points={{72.08,40},{92,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(set, dLATSR.set) annotation (Line(
              points={{-92,80},{-30,80},{-30,69.15}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(reset, dLATSR.reset) annotation (Line(
              points={{-92,-60},{-30,-60},{-30,-18.15}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(enable, dLATSR.enable) annotation (Line(
              points={{-92,-20},{-68.4,-20},{-68.4,15.8}},
              color={127,0,127},
              smooth=Smooth.None));
          connect(dataIn, dLATSR.dataIn) annotation (Line(
              points={{-92,40},{-80.2,40},{-80.2,40.05},{-68.4,40.05}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
          connect(dLATSR.dataOut, delay.x) annotation (Line(
              points={{7.92,40.05},{23.92,40.05},{23.92,39.86}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None));
           annotation (
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">~1</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">1</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">0</td> <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">1</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~1</td> <td valign=\"top\">~1</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">0</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">0</td>  <td valign=\"top\">0</td> <td valign=\"top\">NC</td> </tr>

</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change
</PRE>
</HTML>", revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),  Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={
            Rectangle(
              extent={{-50,70},{52,-50}},
              lineColor={127,0,127},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Line(
              points={{-86,40},{-50,40}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-84,-20},{-50,-20}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{52,40},{84,40}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{-50,-10},{-36,-20},{-50,-30}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-46,96},{46,-18}},
              lineColor={127,0,127},
              textString="DLATREGSR"),
            Text(
              extent={{-14,-32},{14,-45}},
              lineColor={127,33,107},
              textString="reset"),
            Text(
              extent={{-33,-7},{-1,-32}},
              lineColor={127,33,107},
              textString="enable"),
            Line(
              points={{-84,80},{0,80},{0,70}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{-84,-60},{0,-60},{0,-50}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-14,67},{12,53}},
              lineColor={127,33,107},
              textString="set"),
            Text(
              extent={{-28,38},{30,10}},
              lineColor={127,0,127},
              textString="high active")}));
        end DLATREGSRH;

        model DLATREGSRL
      "Level sensitive register bank with set and reset, active low"

          extends DLATREGSRH(final ResetSetMap=[1,1,1,1,1,1,1,1,1; 1,4,2,7,4,4,
            2,7,4; 1,6,2,3,5,5,2,3,6; 1,5,2,8,6,6,2,8,5; 1,4,2,7,4,4,2,7,4; 1,4,
            2,7,4,4,2,7,4; 1,6,2,3,5,5,2,3,6; 1,5,2,8,6,6,2,8,5; 1,4,2,7,4,4,2,
            7,4]);
                   // Function selection by [reset, set] reading;
           annotation (
            Documentation(info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>Reset</b></td>
      <td valign=\"top\"><b>Set</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">U</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">U</td>  <td valign=\"top\">~0</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">*</td>  <td valign=\"top\">0</td> <td valign=\"top\">1</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">1</td> <td valign=\"top\">0</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">*</td> <td valign=\"top\">0</td>  <td valign=\"top\">X</td> <td valign=\"top\">X</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">~0</td> <td valign=\"top\">~0</td> <td valign=\"top\">U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">1</td> <td valign=\"top\">X</td> <td valign=\"top\">X or U or 1 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">~U</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td> <td valign=\"top\">X or U or 0 or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">X or U or NC</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td> </tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">1</td>  <td valign=\"top\">1</td> <td valign=\"top\">NC</td> </tr>
</table>

<PRE>
  *  = do not care
  ~  = not equal
  U  = L.'U'
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-'
  NC = no change
</PRE>
</HTML>", revisions="<html>
<ul>
<li><i>September 11, 2009 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),            Icon(graphics={Rectangle(
              extent={{-40,30},{40,16}},
              pattern=LinePattern.None,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-30,30},{30,16}},
              lineColor={127,0,127},
              textString="low active")}));
        end DLATREGSRL;

        annotation (Documentation(info=
                                   "<html>
<p>Registers is a collection of flipflops and latches. In the opposite to the Examples.Utilities models the Register models are a series of assignments in the algorithm part of the model. The model text is taken nearly identical from the standard logic text.</p>
</html>"));
      end Registers;

  package Tristates "Transfergates, Buffers, Inverters, and WiredX"
      extends Modelica_Icons.Package;
    import D = Modelica_Electrical_Digital;
    import L = Modelica_Electrical_Digital_Interfaces.Logic;
    import T = Modelica_Electrical_Digital.Tables;
    import S = Modelica_Electrical_Digital_Interfaces.Strength;

    model NXFERGATE "Transfergate with enable active high"
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(
        tLH=tLH,
        tHL=tHL,
        y(start=L.'U', fixed=true));
    algorithm
      nextstate := T.NXferTable[enable, x];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-20}},
              lineColor={127,0,127},
              fillPattern=FillPattern.Solid,
              fillColor={213,170,255},
              lineThickness=0.5),
            Line(
              points={{-33,16},{31,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-10},{-32,-10},{-32,10},{30,10},{30,-10},{80,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Text(
              extent={{-7,46},{39,18}},
              lineColor={127,0,127},
              lineThickness=1,
              textString="N"),
            Line(
              points={{-82,70},{0,70},{0,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Text(
              extent={{-44,-24},{30,-46}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 15, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UX</td></tr>
</table>

<PRE>
  UX: if dataIn == U then U else X
</PRE>
</html>"));
    end NXFERGATE;

    model NRXFERGATE
      "Transfergate with enable active high. Output strength reduced."
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(
        tLH=tLH,
        tHL=tHL,
        y(start=L.'U', fixed=true));
    algorithm
      nextstate := T.NRXferTable[enable, x];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-20}},
              lineColor={127,0,127},
              fillPattern=FillPattern.Solid,
              fillColor={213,170,255},
              lineThickness=0.5),
            Line(
              points={{-33,16},{31,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-10},{-32,-10},{-32,10},{30,10},{30,-10},{80,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Text(
              extent={{-2,46},{44,18}},
              lineColor={127,0,127},
              lineThickness=1,
              textString="NR"),
            Line(
              points={{-82,70},{0,70},{0,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Text(
              extent={{-36,-24},{38,-46}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 15, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UW</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">DataIn, Strength Reduced</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UW</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UW</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">DataIn, Strength Reduced</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UW</td></tr>
</table>

<PRE>
  UW: if dataIn == U then U else W
  Strength Reduced: 0 -> L, 1 -> H, X -> W
</PRE>
</html>"));
    end NRXFERGATE;

    model PXFERGATE "Transfergate with enable active low"
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(tLH=tLH,
          tHL=tHL);
    algorithm
      nextstate := T.PXferTable[enable, x];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-20}},
              lineColor={127,0,127},
              fillPattern=FillPattern.Solid,
              fillColor={213,170,255},
              lineThickness=0.5),
            Line(
              points={{-33,16},{31,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-10},{-32,-10},{-32,10},{30,10},{30,-10},{80,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Text(
              extent={{-7,46},{39,18}},
              lineColor={127,0,127},
              lineThickness=1,
              textString="P"),
            Line(
              points={{-82,70},{0,70},{0,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Text(
              extent={{-36,-24},{38,-46}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 15, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UX</td></tr>
</table>

<PRE>
  UX: if dataIn == U then U else X
</PRE>
</html>"));
    end PXFERGATE;

    model PRXFERGATE
      "Transfergate with enable active low. Output strength reduced."
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(tLH=tLH,
          tHL=tHL);
    algorithm
      nextstate := T.PRXferTable[enable, x];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-60,60},{60,-20}},
              lineColor={127,0,127},
              fillPattern=FillPattern.Solid,
              fillColor={213,170,255},
              lineThickness=0.5),
            Line(
              points={{-33,16},{31,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-10},{-32,-10},{-32,10},{30,10},{30,-10},{80,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Text(
              extent={{-2,46},{44,18}},
              lineColor={127,0,127},
              lineThickness=1,
              textString="PR"),
            Line(
              points={{-82,70},{0,70},{0,16}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Text(
              extent={{-40,-24},{34,-46}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 15, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UW</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">DataIn, Strength Reduced</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UW</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UW</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">DataIn, Strength Reduced</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UW</td></tr>
</table>
<p>
  UW: if dataIn == U then U else W
  Strength Reduced: 0 -> L, 1 -> H, X -> W
</p>
</html>"));
    end PRXFERGATE;

    model BUF3S "Tristate buffer with enable active high"
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(
        tLH=tLH,
        tHL=tHL,
        y(start=L.'U', fixed=true));
    algorithm
      nextstate := T.Buf3sTable[strength, T.UX01Conv[enable], T.UX01Conv[x]];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Line(
              points={{-80,70},{0,70},{0,14}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Polygon(
              points={{-40,40},{-40,-60},{40,-10},{-40,40}},
              lineColor={127,0,127},
              smooth=Smooth.None,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-10},{-40,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{40,-10},{82,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Text(
              extent={{-54,-62},{20,-84}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 22, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p>and for tristate table http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_misc.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut*</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UX</td></tr>
</table>

<PRE>
  UX: if dataIn == U then U else X
  DataOut*: Strength map for DataOut according to tristate table Buf3sTable
</PRE>
</html>"));
    end BUF3S;

    model BUF3SL "Tristate buffer with enable active low"
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(tLH=tLH,
          tHL=tHL);
    algorithm
      nextstate := T.Buf3slTable[strength, T.UX01Conv[enable], T.UX01Conv[x]];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Line(
              points={{-80,70},{0,70},{0,14}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Polygon(
              points={{-40,40},{-40,-60},{40,-10},{-40,40}},
              lineColor={127,0,127},
              smooth=Smooth.None,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-10},{-40,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{40,-10},{82,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Text(
              extent={{-54,-62},{20,-84}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 22, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p>and for tristate table http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_misc.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut*</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UX</td></tr>
</table>

<PRE>
  UX: if dataIn == U then U else X
  DataOut*: Strength map for DataOut according to tristate table Buf3slTable
</PRE>
</html>"));
    end BUF3SL;

    model INV3S "Tristate Inverter with enable active high"
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(
        tLH=tLH,
        tHL=tHL,
        y(start=L.'U', fixed=true));
    algorithm
      nextstate := T.Buf3sTable[strength, T.UX01Conv[enable], T.UX01Conv[T.NotTable[x]]];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Line(
              points={{-80,70},{0,70},{0,14}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Polygon(
              points={{-40,40},{-40,-60},{40,-10},{-40,40}},
              lineColor={127,0,127},
              smooth=Smooth.None,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,-10},{-40,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{40,-10},{82,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Ellipse(
              extent={{40,-3},{54,-17}},
              lineColor={127,0,127},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-54,-62},{20,-84}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 22, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p>and for tristate table http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_misc.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut*</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">Not DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">Not DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UX</td></tr>
</table>

<PRE>
  UX: if dataIn == U then U else X
  DataOut*: Strength map for DataOut according to tristate table Buf3sTable
</PRE>
</html>"));
    end INV3S;

    model INV3SL "Tristate inverter with enable active low"
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
      Modelica_Electrical_Digital_Interfaces.DigitalInput enable annotation (
          Placement(transformation(extent={{-100,60},{-80,80}}),
            iconTransformation(extent={{-100,60},{-80,80}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput x annotation (
          Placement(transformation(extent={{-100,-20},{-80,0}}),
            iconTransformation(extent={{-100,-20},{-80,0}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput y annotation (
          Placement(transformation(extent={{80,-20},{100,0}}),
            iconTransformation(extent={{80,-20},{100,0}})));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(tLH=tLH,
          tHL=tHL);
    algorithm
      nextstate := T.Buf3sTable[strength, T.UX01Conv[T.NotTable[enable]], T.UX01Conv[T.NotTable[x]]];
      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, y);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Polygon(
              points={{-40,40},{-40,-60},{40,-10},{-40,40}},
              lineColor={127,0,127},
              smooth=Smooth.None,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-80,70},{0,70},{0,14}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-80,-10},{-40,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{40,-10},{82,-10}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Ellipse(
              extent={{40,-3},{54,-17}},
              lineColor={127,0,127},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-54,-62},{20,-84}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(revisions="<html>
<ul>
<li><i>January 22, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>", info="<html>
<p>Description in VHDL is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</p>
<p>and for tristate table http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_misc.vhd</p>
<p><b>Truth Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>DataIn</b></td>
      <td valign=\"top\"><b>Enable</b></td>
      <td valign=\"top\"><b>DataOut*</b></td>
  </tr>

  <tr><td valign=\"top\">*</td> <td valign=\"top\">U</td> <td valign=\"top\">U</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">X</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">0</td> <td valign=\"top\">Not DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">1</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">Z</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">W</td> <td valign=\"top\">UX</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">L</td> <td valign=\"top\">Not DataIn</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">H</td> <td valign=\"top\">Z</td></tr>
  <tr><td valign=\"top\">*</td> <td valign=\"top\">-</td> <td valign=\"top\">UX</td></tr>
</table>

<PRE>
  UX: if dataIn == U then U else X
  DataOut*: Strength map for DataOut according to tristate table Buf3slTable
</PRE>
</html>"));
    end INV3SL;

    model WiredX "Wired node with multiple input and one output"
      extends Modelica_Electrical_Digital_Interfaces.MISO;
    protected
      Modelica_Electrical_Digital_Interfaces.Logic auxiliary[n](each start=L.
            'Z', each fixed=true);
    equation
      auxiliary[1] = x[1];
      for i in 1:n - 1 loop
        auxiliary[i + 1] = D.Tables.ResolutionTable[auxiliary[i], x[i + 1]];
      end for;
      y = pre(auxiliary[n]);
      annotation (
        Documentation(info="<HTML>
<P>
Wires n input signals in one output signal, without delay.
</P>
<p>Resolution table is given by http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_misc.vhd</p>
</HTML>", revisions=
          "<html>
<ul>
<li><i>January 22, 2010 </i> created by Ulrich Donath<br>
       </li>
</ul>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{-50,40},{50,80}},
              lineColor={0,0,0},
              lineThickness=0.5,
              textString="Wire"), Text(
              extent={{152,-160},{-148,-100}},
              lineColor={0,0,255},
              textString="%name")}));
    end WiredX;
  end Tristates;

  package Memories
    extends Modelica_Icons.Package;

    model DLATRAM "Level sensitive Random Access Memory"

      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;

      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
      parameter Integer n_addr(min=1) = 2 "addr width";
      parameter Integer n_data(min=1) = 2 "data width";
      parameter String fileName = Modelica_Utilities.Files.loadResource(
            "modelica://Modelica/Resources/Data/Electrical/Digital/Memory_Matrix.txt")
        annotation(Dialog(group="table data definition", enable = tableOnFile,
                             loadSelector(filter="Text files (*.txt);;Matlab files (*.mat)",
                             caption="Open file in which table is present")));

      Modelica_Electrical_Digital_Interfaces.DigitalInput RE "read enable"
        annotation (Placement(transformation(extent={{-100,-30},{-84,-14}}),
            iconTransformation(extent={{-100,-28},{-84,-12}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput WE "write enable"
        annotation (Placement(transformation(extent={{-100,-60},{-84,-44}}),
            iconTransformation(extent={{-100,-58},{-84,-42}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput addr[n_addr]
        "address" annotation (Placement(transformation(extent={{-100,50},{-80,
                70}}), iconTransformation(extent={{-100,50},{-80,70}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput dataIn[n_data]
        "data input"
        annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n_data]
        "data output" annotation (Placement(transformation(extent={{80,10},{100,
                30}}), iconTransformation(extent={{80,10},{100,30}})));

    function getMemory
      extends Modelica_Icons.Function;
      input String filename;
      input Integer n_addr "addr width";
      input Integer n_data "data width";
        output Modelica_Electrical_Digital_Interfaces.Logic m[integer(2^n_addr),
          n_data] "memory with data, lowest bit on left side";
      output String data;
      output Integer bit;
    algorithm
      for i in 1:(2^n_addr) loop
        data :=Modelica_Utilities.Streams.readLine(filename,
          integer(i));
        for j in 1:n_data loop
          bit := Modelica_Utilities.Strings.scanInteger( data,
              (2*j-1));
          if bit == 1 then
            m[integer(i),j]:=L.'1';
          elseif bit == 0 then
            m[integer(i),j]:=L.'0';
          else
            m[integer(i),j]:=L.'X';
          end if;

           end for;
      end for;
    end getMemory;

    public
      Modelica_Electrical_Digital_Interfaces.Logic mem[integer(2^n_addr),n_data](
         start=fill(
                L.'U',
                integer(2^n_addr),
                n_data));
    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate[n_data](start=fill(
            L.'U', n_data));
      Modelica_Electrical_Digital_Interfaces.Logic mem_word[n_data](start=fill(
            L.'U', n_data));
      Integer int_addr;
      // Boolean addr_change;

      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy[n_data](start=
            fill(L.'U', n_data));
      D.Delay.InertialDelaySensitive inertialDelaySensitive[n_data](each tLH=
            tLH, each tHL=tHL);

    function address
      // compute memory address
      extends Modelica_Icons.Function;
      input Integer n_addr;
      input L addr[n_addr];
      output Integer int_addr;
      protected
      L addr_bit;
    algorithm
      int_addr := 1;
      for i in 1:n_addr loop
        addr_bit := T.X01Table[addr[i]];
        if addr_bit == L.'1' then
           int_addr := int_addr + integer(2^(i-1));
        elseif addr_bit == L.'X' then
           int_addr := 0;
           break;
        end if;
      end for;
    end address;

    algorithm
    if initial() then
      mem := getMemory(fileName, n_addr, n_data);
    end if;

    /* assert: no address change during write
addr_change := false;
for i in 1:n_addr loop
    if change(addr[i]) then
      addr_change := true;
    end if;
end for;

if WE == L.'1' or WE == L.'H' then
  assert(not addr_change, "Address lines changed while RAM is Write Enabled");
end if;
*/

    /* write into memory */
    if WE == L.'1' or WE == L.'H' then
      // write data
      int_addr := address(n_addr, addr);
      //assert(int_addr > 0, "Attempted write to bad RAM address");
      if int_addr > 0 then
        for i in 1:n_data loop
          mem_word[i] := T.X01Table[dataIn[i]];
        end for;
        mem[int_addr,1:n_data] := mem_word;
      end if;
    elseif WE == L.'X' or WE == L.'W' or WE == L.'Z' or WE == L.'U' or WE == L.'-' then
      // write X
      int_addr := address(n_addr, addr);
      //assert(int_addr > 0, "Attempted write to bad RAM address");
      if int_addr > 0 then
        mem_word :=fill(L.'X',n_data);
        mem[int_addr,1:n_data] := mem_word;
      end if;
    end if;

    /* read from memory */
    if RE == L.'0' or RE == L.'L' then
      nextstate := fill(L.'Z',n_data);
    elseif RE == L.'1' or RE == L.'H' then
      int_addr := address(n_addr, addr);
      // read data
      if int_addr > 0 then
        mem_word := mem[int_addr,1:n_data];
        for i in 1:n_data loop
          nextstate[i] := T.StrengthMap[mem_word[i], strength];
        end for;
      else
        nextstate := fill(T.StrengthMap[L.'X', strength],n_data);
      end if;
    else
      nextstate := fill(T.StrengthMap[L.'X', strength],n_data);
    end if;
    yy := nextstate;

    equation
      for i in 1:n_data loop
        connect(yy[i], inertialDelaySensitive[i].x);
        connect(inertialDelaySensitive[i].y, dataOut[i]);
      end for;

       annotation (
        Documentation(info="<html>
<p>
Description in VHDL is given by <a href=\"http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd\">http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</a>
</p>

<p><b>Truth Table for high active read enable RE:</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>RE</b></td>
      <td valign=\"top\"><b>Addr</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>
  <tr><td valign=\"top\">0</td>  <td valign=\"top\">*</td>              <td valign=\"top\">Z over all</td>  </tr>
  <tr><td valign=\"top\">1</td>  <td valign=\"top\">  no X in Addr</td> <td valign=\"top\">DataOut=m(Addr)</td>     </tr>
  <tr><td valign=\"top\">1</td>  <td valign=\"top\">X in Addr</td>      <td valign=\"top\">X over all</td>  </tr>
  <tr><td valign=\"top\">X</td>  <td valign=\"top\">*</td>              <td valign=\"top\">X over all</td>  </tr>
</table>
<p><b>Truth Table for high active write enable WE:</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>WE</b></td>
      <td valign=\"top\"><b>Addr</b></td>
      <td valign=\"top\"><b>Memory</b></td>
  </tr>
  <tr><td valign=\"top\">0</td>  <td valign=\"top\">*</td>              <td valign=\"top\">no write</td>           </tr>
  <tr><td valign=\"top\">1</td>  <td valign=\"top\">no X in Addr</td>   <td valign=\"top\">m(Addr)=DataIn</td>     </tr>
  <tr><td valign=\"top\">1</td>  <td valign=\"top\">X in Addr</td>      <td valign=\"top\">no write</td>  </tr>
  <tr><td valign=\"top\">X</td>  <td valign=\"top\">no X in Addr</td>   <td valign=\"top\">m(Addr)=X over all</td> </tr>
  <tr><td valign=\"top\">X</td>  <td valign=\"top\">X in Addr</td>      <td valign=\"top\">no write</td>  </tr>
</table>

<PRE>

  *  = do not care
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-' or L.'U'
  Z  = L.'Z'
</PRE>

<p><b>Simultaneous read/write operations are allowed.
Firstly Write is carried out, then Read.</b></p>
</html>",     revisions="<html>
<dl>
<dt><i>November 9, 2010 </i></dt>
<dd>created by Ulrich Donath</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,80},{60,-80}},
              lineColor={127,0,127},
              lineThickness=0.5),
            Text(
              extent={{-46,102},{46,-2}},
              lineColor={127,33,107},
              textString="DLATRAM"),
            Line(
              points={{-84,60},{-60,60}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{60,20},{84,20}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-84,-20},{-60,-20}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{-60,-10},{-46,-20},{-60,-30}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-41,-5},{-24,-34}},
              lineColor={127,33,107},
              textString="RE"),
            Line(
              points={{-60,-40},{-46,-50},{-60,-60}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-41,-35},{-24,-62}},
              lineColor={127,33,107},
              textString="WE"),
            Line(
              points={{-84,-50},{-60,-50}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{-80,20},{-60,20}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1)}));
    end DLATRAM;

    model DLATROM "Level sensitive Read Only Memory"

      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;

      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
      parameter Integer n_addr(min=1) = 2 "addr width";
      parameter Integer n_data(min=1) = 2 "data width";
      parameter String fileName=Modelica_Utilities.Files.loadResource(
            "modelica://Modelica/Resources/Data/Electrical/Digital/Memory_Matrix.txt")
        "File where matrix for memory is stored"
        annotation(Dialog(group="table data definition", enable = tableOnFile,
                             loadSelector(filter="Text files (*.txt);;Matlab files (*.mat)",
                             caption="Open file in which table is present")));

      Modelica_Electrical_Digital_Interfaces.DigitalInput RE "read enable"
        annotation (Placement(transformation(extent={{-100,-30},{-80,-10}}),
            iconTransformation(extent={{-100,-27},{-86,-13}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput addr[n_addr]
        "address" annotation (Placement(transformation(extent={{-100,50},{-80,
                70}}), iconTransformation(extent={{-100,52},{-84,68}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput dataOut[n_data]
        "data output" annotation (Placement(transformation(extent={{80,8},{100,
                28}}), iconTransformation(extent={{84,12},{100,29}})));

    function getMemory
      extends Modelica_Icons.Function;
      input String filename;
      input Integer n_addr "addr width";
      input Integer n_data "data width";
        output Modelica_Electrical_Digital_Interfaces.Logic m[integer(2^n_addr),
          n_data] "memory with data, lowest bit on left side";
      output String data;
      output Integer bit;
    algorithm
      for i in 1:(2^n_addr) loop
        data :=Modelica_Utilities.Streams.readLine(filename,
          integer(i));
        for j in 1:n_data loop
          bit := Modelica_Utilities.Strings.scanInteger( data,
              (2*j-1));
          if bit == 1 then
            m[integer(i),j]:=L.'1';
          elseif bit == 0 then
            m[integer(i),j]:=L.'0';
          else
            m[integer(i),j]:=L.'X';
          end if;

           end for;
      end for;
    end getMemory;

    protected
      Modelica_Electrical_Digital_Interfaces.Logic m[integer(2^n_addr),n_data](
          start=fill(
                L.'U',
                integer(2^n_addr),
                n_data)) "memory with data, lowest bit on left side";
      Modelica_Electrical_Digital_Interfaces.Logic nextstate[n_data](start=fill(
            L.'U', n_data));
      //D.Interfaces.Logic mem[integer(2^n_addr),n_data](start=fill(L.'U',integer(2^n_addr),n_data));
      Modelica_Electrical_Digital_Interfaces.Logic mem_word[n_data](start=fill(
            L.'U', n_data));
      Modelica_Electrical_Digital_Interfaces.Logic addr_bit;
      Integer int_addr;

      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy[n_data](start=
            fill(L.'U', n_data));
      D.Delay.InertialDelaySensitive inertialDelaySensitive[n_data](each tLH=
            tLH, each tHL=tHL);

    algorithm
    if initial() then
      m := getMemory(fileName, n_addr, n_data);
    end if;

    if RE == L.'0' or RE == L.'L' then
      nextstate := fill(L.'Z',n_data);
    elseif RE == L.'1' or RE == L.'H' then
      // compute memory address
      int_addr := 1;
      for i in 1:n_addr loop
        addr_bit :=T.X01Table[addr[i]];
        if addr_bit == L.'1' then
           int_addr := int_addr + integer(2^(i-1));
        elseif addr_bit == L.'X' then
           int_addr := 0;
           break;
        end if;
      end for;
      // read data
      if int_addr > 0 then
         mem_word := m[int_addr,1:n_data];
         for i in 1:n_data loop
            nextstate[i] := T.StrengthMap[mem_word[i], strength];
         end for;
      else
         nextstate := fill(T.StrengthMap[L.'X', strength],n_data);
      end if;
    else
      nextstate := fill(T.StrengthMap[L.'X', strength],n_data);
    end if;
    yy := nextstate;

    equation

      for i in 1:n_data loop
        connect(yy[i], inertialDelaySensitive[i].x);
        connect(inertialDelaySensitive[i].y, dataOut[i]);
      end for;

       annotation (
        Documentation(info="<html>
<p>
Description in VHDL is given by <a href=\"http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd\">http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</a>
</p>
<p><b>Truth Table for high active read enable RE:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>RE</b></td>
      <td valign=\"top\"><b>Addr</b></td>
      <td valign=\"top\"><b>DataOut</b></td>
  </tr>

  <tr><td valign=\"top\">0</td> <td valign=\"top\">*</td> <td valign=\"top\">Z over all</td>  </tr>
  <tr><td valign=\"top\">1</td> <td valign=\"top\">  no X in Addr</td> <td valign=\"top\">DataOut=m(Addr)</td>  </tr>
  <tr><td valign=\"top\">1</td> <td valign=\"top\">X in Addr</td> <td valign=\"top\">X over all</td> </tr>
  <tr><td valign=\"top\">X</td> <td valign=\"top\">*</td> <td valign=\"top\">X over all</td> </tr>
</table>

<PRE>

  *  = do not care
  0  = L.'0' or L.'L'
  1  = L.'1' or L.'H'
  X  = L.'X' or L.'W' or L.'Z' or L.'-' or L.'U'
  Z  = L.'Z'
</PRE>

</html>",     revisions="<html>
<dl>
<dt><i>October 19, 2010</i></dt>
<dd>created by Ulrich Donath</dd>
</dl>
</html>"),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-60,80},{60,-80}},
              lineColor={127,0,127},
              lineThickness=0.5),
            Text(
              extent={{-46,102},{46,-2}},
              lineColor={127,33,107},
              textString="DLATROM"),
            Line(
              points={{-84,60},{-60,60}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{60,20},{84,20}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{-88,-20},{-60,-20}},
              color={127,0,127},
              smooth=Smooth.None),
            Line(
              points={{-60,-10},{-46,-20},{-60,-30}},
              color={127,0,127},
              smooth=Smooth.None),
            Text(
              extent={{-41,-5},{-24,-34}},
              lineColor={127,33,107},
              textString="RE")}));
    end DLATROM;
  end Memories;

  package Multiplexers
    extends Modelica_Icons.Package;
    model MUX2x1 "A two inputs MULTIPLEXER for multiple value logic
(2 data inputs, 1 select input, 1 output)"

      import D = Modelica_Electrical_Digital;
      import L = Modelica_Electrical_Digital_Interfaces.Logic;
      import S = Modelica_Electrical_Digital_Interfaces.Strength;
      import T = Modelica_Electrical_Digital.Tables;
      parameter Modelica_SIunits.Time tHL=0 "High->Low delay";
      parameter Modelica_SIunits.Time tLH=0 "Low->High delay";
      parameter Modelica_Electrical_Digital_Interfaces.Strength strength=S.
          'S_X01' "output strength";
      Modelica_Electrical_Digital_Interfaces.DigitalInput in1 "data input 1"
        annotation (Placement(transformation(extent={{-100,40},{-80,60}}),
            iconTransformation(extent={{-100,40},{-80,60}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput in0 "data input 0"
        annotation (Placement(transformation(extent={{-100,-60},{-80,-40}}),
            iconTransformation(extent={{-100,-60},{-80,-40}})));
      Modelica_Electrical_Digital_Interfaces.DigitalInput sel "select input"
        annotation (Placement(transformation(extent={{-10,80},{10,100}}),
            iconTransformation(extent={{-10,80},{10,100}})));
      Modelica_Electrical_Digital_Interfaces.DigitalOutput out "output"
        annotation (Placement(transformation(extent={{80,-10},{100,10}}),
            iconTransformation(extent={{80,-10},{100,10}})));

    protected
      Modelica_Electrical_Digital_Interfaces.Logic nextstate(start=L.'U');
      Modelica_Electrical_Digital_Interfaces.DigitalOutput yy(start=L.'U');
              D.Delay.InertialDelaySensitive inertialDelaySensitive(
        tLH=tLH,
        tHL=tHL,
        y(start=L.'U', fixed=true));

    algorithm
      nextstate := T.MUX2x1Table[T.UX01Conv[in1], T.UX01Conv[sel], T.UX01Conv[in0]];

      nextstate := T.StrengthMap[nextstate, strength];

      yy := nextstate;
    equation
      connect(yy, inertialDelaySensitive.x);
      connect(inertialDelaySensitive.y, out);

      annotation (        Icon(graphics={
            Line(
              points={{-80,50},{-40,50}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{-62,-50},{-62,-50}},
              color={127,0,127},
              smooth=Smooth.None,
              thickness=1),
            Line(
              points={{-80,-50},{-40,-50}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{0,60},{0,80}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Line(
              points={{40,0},{80,0}},
              color={127,0,127},
              thickness=1,
              smooth=Smooth.None),
            Polygon(
              points={{-40,80},{-40,-80},{40,-40},{40,40},{-40,80}},
              lineColor={213,170,255},
              lineThickness=1,
              smooth=Smooth.None,
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-36,-70},{38,-92}},
              lineColor={0,0,255},
              fillColor={213,170,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-38,10},{38,-10}},
              lineColor={127,0,127},
              lineThickness=1,
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid,
              textString="MUX2x1")}),
        Documentation(info="<html>
<p>Description in VHDL is given by <a href=\"http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd\">http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_entities.vhd</a></p>
<p>and for Multiplexer table <a href=\"http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_misc.vhd\">http://www.cs.sfu.ca/~ggbaker/reference/std_logic/src/std_logic_misc.vhd</a></p>
<h4>Truth Table</h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><h4>DataIn</h4></td>
<td valign=\"top\"><h4>Select</h4></td>
<td valign=\"top\"><h4>DataOut</h4></td>
</tr>
<tr>
<td valign=\"top\"><p>*</p></td>
<td valign=\"top\"><p>0</p></td>
<td valign=\"top\"><p>Input0</p></td>
</tr>
<tr>
<td valign=\"top\"><p>*</p></td>
<td valign=\"top\"><p>1</p></td>
<td valign=\"top\"><p>Input1</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Inputs equal</p></td>
<td valign=\"top\"><p>U</p></td>
<td valign=\"top\"><p>Input</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Inputs not equal</p></td>
<td valign=\"top\"><p>U</p></td>
<td valign=\"top\"><p>U</p></td>
</tr>
<tr>
<td valign=\"top\"><p>U in Input</p></td>
<td valign=\"top\"><p>X</p></td>
<td valign=\"top\"><p>U</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Inputs equal</p></td>
<td valign=\"top\"><p>X</p></td>
<td valign=\"top\"><p>Input</p></td>
</tr>
<tr>
<td valign=\"top\"><p>no U in Input and Inputs not equal</p></td>
<td valign=\"top\"><p>X</p></td>
<td valign=\"top\"><p>X</p></td>
</tr>
</table>
<pre>

  *  = don&apos;t care
  0  = L.&apos;0&apos; or L.&apos;L&apos;
  1  = L.&apos;1&apos; or L.&apos;H&apos;
  X  = L.&apos;X&apos; or L.&apos;W&apos; or L.&apos;Z&apos; or L.&apos;-&apos;
  U  = L.&apos;U&apos; </pre>
</html>",     revisions="<html>
<dl>
<dt><i>January 24, 2011</i></dt>
<dd>created by Christian G&uuml;nther</dd>
</dl>
</html>"));
    end MUX2x1;
  end Multiplexers;
      annotation (
        Documentation(info="<html>
<p>
This library contains packages for digital electrical components. Both, type system
and models are based on the VHDL standard (IEEE Std 1076-1987 VHDL, IEEE Std 1076-1993 VHDL,
IEEE Std 1164 Multivalue Logic System):
</p>

<ul>
<li>Interfaces: Definition of signals and interfaces</li>
<li>Tables: All truth tables needed</li>
<li>Delay: Transport and inertial delay</li>
<li>Basic: Basic logic without delay</li>
<li>Gates: Basic gates composed by basic components and inertial delay</li>
<li>Tristate: (not yet available)</li>
<li>FlipFlops: D-Flip-Flops</li>
<li>Latches: D-Latches</li>
<li>TransferGates: (not yet available)</li>
<li>Multiplexers (not yet available)</li>
<li>Memory: Ram, Rom, (not yet available)</li>
<li>Sources: Time-dependent signal sources</li>
<li>Converters</li>
<li>Examples</li>
</ul>

<p>
The logic values are coded by integer values. The following code table is necessary
for both setting of input and interpreting the output values.
</p>

<p><b>Code Table:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Logic value</b></td>
      <td valign=\"top\"><b>Integer code</b></td>
      <td valign=\"top\"><b>Meaning</b></td>
  </tr>

  <tr><td valign=\"top\">'U'</td> <td valign=\"top\">1</td> <td valign=\"top\">Uninitialized</td></tr>
  <tr><td valign=\"top\">'X'</td> <td valign=\"top\">2</td> <td valign=\"top\">Forcing Unknown</td></tr>
  <tr><td valign=\"top\">'0'</td> <td valign=\"top\">3</td> <td valign=\"top\">Forcing 0</td></tr>
  <tr><td valign=\"top\">'1'</td> <td valign=\"top\">4</td> <td valign=\"top\">Forcing 1</td></tr>
  <tr><td valign=\"top\">'Z'</td> <td valign=\"top\">5</td> <td valign=\"top\">High Impedance</td></tr>
  <tr><td valign=\"top\">'W'</td> <td valign=\"top\">6</td> <td valign=\"top\">Weak Unknown</td></tr>
  <tr><td valign=\"top\">'L'</td> <td valign=\"top\">7</td> <td valign=\"top\">Weak 0</td></tr>
  <tr><td valign=\"top\">'H'</td> <td valign=\"top\">8</td> <td valign=\"top\">Weak 1</td></tr>
  <tr><td valign=\"top\">'-'</td> <td valign=\"top\">9</td> <td valign=\"top\">Do not care</td></tr>
</table>

<p>
The library will be developed in two main steps. The first step contains the basic components and
the gates. In the next step the more complicated devices will be added. Currently the first step of
the library is implemented and released for public use.
</p>

<p>
Copyright &copy; 1998-2013, Modelica Association and Fraunhofer-Gesellschaft.
</p>

<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}, graphics={
          Line(
            origin={7,47},
            points={{-84,-6},{-52,-6}}),
          Rectangle(
            origin={59,53},
            fillColor=  {255,255,255},
            fillPattern=  FillPattern.Solid,
            extent={{-104,-63},{-64,7}}),
          Rectangle(
            origin={146,34},
            fillColor=  {255,255,255},
            fillPattern=  FillPattern.Solid,
            extent={{-104,-63},{-64,7}}),
          Line(
            origin={7,15},
            points={{-84,-6},{-52,-6}}),
          Line(
            origin={79,30},
            points={{-84,-6},{-37,-6}}),
        Line(
          points={{42,-12},{17,-12},{17,-54},{-71,-54}},
          color={0,0,0},
          smooth=Smooth.None)})),
    uses(Modelica(version="3.2.1")));
end Modelica_Electrical_Digital;