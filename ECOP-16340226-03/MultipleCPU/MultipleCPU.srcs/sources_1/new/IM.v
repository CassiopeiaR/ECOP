`timescale 1ns / 1ps

module IM(
    input InsMemRW,                 // ??��?????0=>��??1=>??
    input [31:0] IAddr,             // ??????????????????????????????????????? IDataOut
    input [31:0] IDataIn,           // ??????????32��???????????????????????��?????
    
    output reg [31:0] IDataOut      // ???????????32��?????
    );

    reg [7:0] Memory[0:127];        // 8��???????��???????128??

    initial begin
        $readmemb("C:\\Users\\dell\\Desktop\\MultipleCPU\\instuction.txt.txt", Memory);
    end

    // ???????????????��??????? IDataIn??????? IDataIn ???��?????????
    // ?????????? IDataIn?????? IM ???��??��?????? InsMemRW ??? 1
    always@(IAddr or InsMemRW)
    begin
        if(InsMemRW) begin
            // ???????????????��????????????��????????
            IDataOut[31:24] = Memory[IAddr];
            IDataOut[23:16] = Memory[IAddr + 1];
            IDataOut[15:8] = Memory[IAddr + 2];
            IDataOut[7:0] = Memory[IAddr + 3];
        end
    end

endmodule
