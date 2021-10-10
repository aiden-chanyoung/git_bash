
module integrator #(
    parameter N = 4
)(
    input [N-1:0] data_in,
    input clk,
    input rstb,
    output reg [N-1:0] data_out
);

    wire [N-1:0] data_temp;

    assign data_temp = data_out+data_in;

    always @ (posedge clk or negedge rstb) begin
        if(!rstb) begin
            data_out <= {N{1'b0}};
        end
        else begin
            data_out <= data_temp; 
        end
    end

endmodule    
