`timescale 1ns / 1ps

module ControlUnit(
    input CLK,              // ʱ���ź�
    input RST,              // �����ź�
    input [5:0] op,         // ָ�������
    input zero,             // ALU���������־
    input sign,             // ALU����������λ
    output PCWre,           // PCֵ���¿����ź�
    output ExtSel,          // ��������չ�����ź�
    output InsMemRW,        // ָ��洢��дʹ���ź�
    output IRWre,           // ָ��Ĵ���дʹ���ź�
    output WrRegDSrc,       // д��Ĵ�������Դѡ���ź�
    output [1:0] RegDst,    // д��Ĵ���ѡ���ź�
    output RegWre,          // �Ĵ�����дʹ���ź�
    output ALUSrcA,         // A����������Դѡ���ź�
    output ALUSrcB,         // B����������Դѡ���ź�
    output [1:0] PCSrc,     // ��һ��ָ���ַ��ѡ���ź�
    output [2:0] ALUOp,     // ALU����ѡ���ź�
    output mRD,             // ���ݴ洢����ʹ���ź�
    output mWR,             // ���ݴ洢��дʹ���ź�
    output DBDataSrc,       // DB����Դѡ���ź�
    output [2:0] StateIn,
    output [2:0] StateOut
    );


    DFlipFlop dff(.StateIn(StateIn), .CLK(CLK), .RST(RST), 
        .StateOut(StateOut));
    NextState ns(.NowStateIn(StateOut), .op(op), 
        .NextStateOut(StateIn));
    OutputFunc opf(.NowStateIn(StateOut), .op(op), .zero(zero), .sign(sign), 
        .PCWre(PCWre), .ExtSel(ExtSel), .InsMemRW(InsMemRW), .IRWre(IRWre), 
        .WrRegDSrc(WrRegDSrc), .RegDst(RegDst), .RegWre(RegWre), .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB), .PCSrc(PCSrc), .ALUOp(ALUOp), .mRD(mRD), .mWR(mWR), 
        .DBDataSrc(DBDataSrc)
        );


endmodule

