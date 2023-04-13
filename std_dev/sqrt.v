module sqrt(input [31:0] in, output [31:0] out);

reg [31:0] i, m, l, r;

assign out = m[15:0];

always @(*) begin
  l = 0;
  r = in;
  for (i = 0; i < 16; i = i + 1) begin
    m = (l + r) / 2;
    if (m * m <= in) begin
      l = m;
    end else begin
      r = m;
    end
  end
end

endmodule
