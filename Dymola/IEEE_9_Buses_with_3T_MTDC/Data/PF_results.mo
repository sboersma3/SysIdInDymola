within Data;

record PF_results
  record Voltages
     extends Modelica.Icons.Record;
  // Bus number 1
     parameter Real V1 = 1.040000; 
     parameter Real A1 = 0.000000; 
  // Bus number 2
     parameter Real V2 = 1.025000; 
     parameter Real A2 = 9.350700; 
  // Bus number 3
     parameter Real V3 = 1.025000; 
     parameter Real A3 = 5.142000; 
  // Bus number 4
     parameter Real V4 = 1.025310; 
     parameter Real A4 = -2.217400; 
  // Bus number 5
     parameter Real V5 = 0.999720; 
     parameter Real A5 = -3.680200; 
  // Bus number 6
     parameter Real V6 = 1.012250; 
     parameter Real A6 = -3.566601; 
  // Bus number 7
     parameter Real V7 = 1.026830; 
     parameter Real A7 = 3.796100; 
  // Bus number 8
     parameter Real V8 = 1.017270; 
     parameter Real A8 = 1.337300; 
  // Bus number 9
     parameter Real V9 = 1.032690; 
     parameter Real A9 = 2.444800; 
   
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
     parameter Real Q3_1 = -11.449000; 
  // Machine 2_1
     parameter Real P2_1 = 163.000000; 
     parameter Real Q2_1 = 4.903000; 
  // Machine 1_1
     parameter Real P1_1 = 71.626999; 
     parameter Real Q1_1 = 27.915001; 
  
  end Machines;

  record Trafos
     extends Modelica.Icons.Record;
  // 2WindingTrafo 3_9
     parameter Real t1_3_9 = 1.000000; 
     parameter Real t2_3_9 = 1.000000; 
  // 2WindingTrafo 1_4
     parameter Real t1_1_4 = 1.000000; 
     parameter Real t2_1_4 = 1.000000; 
  // 2WindingTrafo 2_7
     parameter Real t1_2_7 = 1.000000; 
     parameter Real t2_2_7 = 1.000000; 
  
  end Trafos;
end PF_results;
