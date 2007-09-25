// my simple if else example, indented by verilog-mode
if (x == 1) 
  begin
     test1 <= 1;
     test2 <= 2;
  end
else
  begin
     test1 <= 2;
     test2 <= 1;
  end

// code from IEEE spec, pg. 164
class MyBus extends Bus;
   rand AddrType atype;
   constraint addr_range
     {
      (atype == low ) -> addr inside { [0 : 15] };
      (atype == mid ) -> addr inside { [16 : 127]};   
      (atype == high) -> addr inside {[128 : 255]};
   }
endclass // MyBus

// same example, with verilog mode indenting, Cexp indent = 3
class MyBus extends Bus;
   rand AddrType atype;
   constraint addr_range
     {
      (atype == low ) -> addr inside { [0 : 15] };
      (atype == mid ) -> addr inside { [16 : 127]};   
      (atype == high) -> addr inside {[128 : 255]};
   }
endclass // MyBus

// same example, with verilog mode indenting, Cexp indent = 0
class MyBus extends Bus;
   rand AddrType atype;
   constraint addr_range
     {
      (atype == low ) -> addr inside { [0 : 15] };
      (atype == mid ) -> addr inside { [16 : 127]};   
      (atype == high) -> addr inside {[128 : 255]};
   }
endclass // MyBus

// covergroup example from IEEE pg. 317
covergroup cg @(posedge clk);
   a: coverpoint v_a
     {
      bins a1 = { [0:63] };
      bins a2 = { [64:127] };
      bins a3 = { [128:191] };
      bins a4 = { [192:255] };
   }
   b: coverpoint v_b
     {
      bins b1 = {0};
      bins b2 = { [1:84] };
      bins b3 = { [85:169] };
      bins b4 = { [170:255] };
   }   
   c: cross a, b
     {
      bins c1 = ! binsof(a) intersect {[100:200]}; // 4 cross products
      bins c2 = binsof(a.a2) || binsof(b.b2); // 7 cross products
      bins c3 = binsof(a.a1) && binsof(b.b4); // 1 cross product
   }
endgroup

// here is the same code with verilog-mode indenting
// covergroup example from IEEE pg. 317
covergroup cg @(posedge clk);
   a: coverpoint v_a
     {
      bins a1 = { [0:63] };
      bins a2 = { [64:127] };
      bins a3 = { [128:191] };
      bins a4 = { [192:255] };
   }
   
   b: coverpoint v_b
     {
      bins b1 = {0};
      bins b2 = { [1:84] };
      bins b3 = { [85:169] };
      bins b4 = { [170:255] };
   }   
   c: cross a, b
     {
      bins c1 = ! binsof(a) intersect {[100:200]}; // 4 cross products
      bins c2 = binsof(a.a2) || binsof(b.b2); // 7 cross products
      bins c3 = binsof(a.a1) && binsof(b.b4); // 1 cross product
   }
endgroup
