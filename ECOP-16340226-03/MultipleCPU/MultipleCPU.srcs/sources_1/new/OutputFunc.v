`timescale 1ns / 1ps

`include "head.v"

module OutputFunc(
    input [2:0] NowStateIn, // ��ǰ״̬����
    input [5:0] op,         // ָ�������
    input zero,             // ALU���������־
    input sign,             // ALU����������λ
    output reg PCWre,       // PCֵ���¿����ź�
    output reg ExtSel,          // ��������չ�����ź�
    output reg InsMemRW,        // ָ��洢��дʹ���ź�
    output reg IRWre,           // ָ��Ĵ���дʹ���ź�
    output reg WrRegDSrc,       // д��Ĵ�������Դѡ���ź�
    output reg [1:0] RegDst,    // д��Ĵ���ѡ���ź�
    output reg RegWre,          // �Ĵ�����дʹ���ź�
    output reg ALUSrcA,         // A����������Դѡ���ź�
    output reg ALUSrcB,         // B����������Դѡ���ź�
    output reg [1:0] PCSrc,     // ��һ��ָ���ַ��ѡ���ź�
    output reg [2:0] ALUOp,     // ALU����ѡ���ź�
    output reg mRD,             // ���ݴ洢����ʹ���ź�
    output reg mWR,             // ���ݴ洢��дʹ���ź�
    output reg DBDataSrc        // DB����Դѡ���ź�

    );
    
    always@(NowStateIn) begin
        PCWre = (NowStateIn == `sIF && op != `opHalt) ? 1: 0;
        ExtSel = (NowStateIn == `sEXE) ? ((op == `opOri || op == `opSltiu) ? 0 : 1) : 1;
        InsMemRW = (NowStateIn == `sIF) ? 1 : 0;
        IRWre = (NowStateIn == `sIF) ? 1 : 0;
        WrRegDSrc = (NowStateIn == `sID && op == `opJal) ? 0 : 1;
        RegDst[1] = (NowStateIn == `sWB) ? ((op == `opAddi || op == `opOri || op == `opSltiu || op == `opLw) ? 0 : 1) : 0;
        RegDst[0] = (NowStateIn == `sWB) ? ((op == `opAddi || op == `opOri || op == `opSltiu || op == `opLw) ? 1 : 0) : 0;
        RegWre = (NowStateIn == `sWB) ? 1 : ((NowStateIn == `sID && op == `opJal) ? 1 : 0);
        ALUSrcA = (NowStateIn == `sEXE && op == `opSll) ? 1 : 0;
        ALUSrcB = (NowStateIn == `sEXE) ? ((op == `opAddi || op == `opOri || op == `opSltiu || op == `opSw || op == `opLw) ? 1 : 0) : 0;
        ALUOp[2] = (NowStateIn == `sEXE) ? ((op == `opOr || op == `opAnd || op == `opOri || op == `opSll) ? 1 : 0) : 0;
        ALUOp[1] = (NowStateIn == `sEXE) ? ((op == `opAnd || op == `opSlt || op == `opSltiu || op == `opBltz)) : 0;
        ALUOp[0] = (NowStateIn == `sEXE) ? ((op == `opSub || op == `opOr || op == `opOri || op == `opSlt || op == `opBeq || op == `opBltz) ? 1 : 0) : 0;
        mRD = (NowStateIn == `sMEM && op == `opLw) ? 1 : 0;
        mWR = (NowStateIn == `sMEM && op == `opSw) ? 1 : 0;
        DBDataSrc = (NowStateIn == `sMEM && op == `opLw) ? 1 : 0;
    end
    
    always@(NowStateIn or zero) begin
        PCSrc[1] = (NowStateIn == `sID) ? 1 : 0;
        PCSrc[0] = (NowStateIn == `sID) ? ((op == `opJ || op == `opJal) ? 1 : 0) : ((NowStateIn == `sEXE) ? (((op == `opBeq && zero == 1) || (op == `opBltz && zero == 0)) ? 1 : 0): 0);
        
    end
    
endmodule