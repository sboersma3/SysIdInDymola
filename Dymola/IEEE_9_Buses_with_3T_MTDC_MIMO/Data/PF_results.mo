within Data;

record PF_results
  record Voltages
     extends Modelica.Icons.Record;
  // Bus number 1
     parameter Real V1 = 1.040000; 
     parameter Real A1 = 0.000000; 
  // Bus number 2
     parameter Real V2 = 1.025000; 
     parameter Real A2 = 9.28; 
  // Bus number 3
     parameter Real V3 = 1.025000; 
     parameter Real A3 = 4.6648; 
  // Bus number 4
     parameter Real V4 = 1.0258; 
     parameter Real A4 = -2.2168; 
  // Bus number 5
     parameter Real V5 = 0.995630859628167; 
     parameter Real A5 = -3.9888; 
  // Bus number 6
     parameter Real V6 = 1.012654326639182; 
     parameter Real A6 = -3.6874; 
  // Bus number 7
     parameter Real V7 = 1.0258; 
     parameter Real A7 = 3.7197; 
  // Bus number 8
     parameter Real V8 = 1.015882581760390; 
     parameter Real A8 = 0.72754; 
  // Bus number 9
     parameter Real V9 = 1.0324; 
     parameter Real A9 = 1.9667; 
   
  end Voltages;

  record Loads
     extends Modelica.Icons.Record;
  // Load 5_1
     parameter Real PL5_1 = 125.000000; 
     parameter Real QL5_1 = 50.000000; 
  // Load 6_1
     parameter Real PL6_1 = 90.000000; 
     parameter Real QL6_1 = 30.000002; 
  // Load 8_1
     parameter Real PL8_1 = 100.000000; 
     parameter Real QL8_1 = 35.000000; 
  
  end Loads;

  record Machines
     extends Modelica.Icons.Record;
  // Machine 3_1
     parameter Real P3_1 = 85.000000; 
     parameter Real Q3_1 = -10.8597088920594; 
  // Machine 2_1
     parameter Real P2_1 = 163.000000; 
     parameter Real Q2_1 = 6.6536560198189; 
  // Machine 1_1
     parameter Real P1_1 = 71.6410214993680; 
     parameter Real Q1_1 = 27.0459279594234; 
  
  end Machines;
end PF_results;
