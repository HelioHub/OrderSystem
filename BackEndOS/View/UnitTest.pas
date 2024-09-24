unit UnitTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, FireDAC.Comp.UI;

type
  TFUnitTest = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxCurrencyEdit2: TcxCurrencyEdit;
    cxCurrencyEdit3: TcxCurrencyEdit;
    cxCurrencyEdit4: TcxCurrencyEdit;
    cxCurrencyEdit5: TcxCurrencyEdit;
    FDQueryTeste: TFDQuery;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    FDQueryOrderTotalValue: TFDQuery;
    OSConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    BAllTest: TButton;
    MemoTest: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BAllTestClick(Sender: TObject);
  private
    { Private declarations }
    function fTestValueTotalText(const sOrder: String; fTotal: Double) : String;
    function fTest1() : String;
    function fTest2() : String;
    function fTest3() : String;
    function fTest4() : String;
    function fTest5() : String;
    function fTestAll() : String;

    procedure fMemoTest;
  public
    { Public declarations }
    function fCalcValueTotalOrder(pIDCodeOrder: String) : Double;
  end;

var
  FUnitTest: TFUnitTest;

implementation

{$R *.dfm}

procedure TFUnitTest.Button1Click(Sender: TObject);
begin
  fMemoTest;
  MemoTest.Lines.Add(Edit1.Text+' >>> '+fTest1);
end;

procedure TFUnitTest.Button2Click(Sender: TObject);
begin
  fMemoTest;
  MemoTest.Lines.Add(Edit2.Text+' >>> '+fTest2);
end;

procedure TFUnitTest.Button3Click(Sender: TObject);
begin
  fMemoTest;
  MemoTest.Lines.Add(Edit3.Text+' >>> '+fTest3);
end;

procedure TFUnitTest.Button4Click(Sender: TObject);
begin
  fMemoTest;
  MemoTest.Lines.Add(Edit4.Text+' >>> '+fTest4);
end;

procedure TFUnitTest.Button5Click(Sender: TObject);
begin
  fMemoTest;
  MemoTest.Lines.Add(Edit5.Text+' >>> '+fTest5);
end;

procedure TFUnitTest.BAllTestClick(Sender: TObject);
begin
  fTestAll;
end;

function TFUnitTest.fCalcValueTotalOrder(pIDCodeOrder: String): Double;
begin
  FDQueryTeste.Close;
  FDQueryTeste.Params[0].AsString := pIDCodeOrder;
  FDQueryTeste.Open;

  Result := FDQueryTeste.FieldByName('valuetotal').AsFloat;
end;

procedure TFUnitTest.fMemoTest;
begin
  MemoTest.Clear;
  MemoTest.Lines.Add('--------------------------------------------------------------------------');
  MemoTest.Lines.Add('TEST FUNCTION T-SQL VALUE TOTAL ORDER');
  MemoTest.Lines.Add('--------------------------------------------------------------------------');
  MemoTest.Lines.Add(' ');
end;

procedure TFUnitTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

function TFUnitTest.fTest1: String;
begin
  Result := fTestValueTotalText(Edit1.Text,cxCurrencyEdit1.Value);
end;

function TFUnitTest.fTest2: String;
begin
  Result := fTestValueTotalText(Edit2.Text,cxCurrencyEdit2.Value);
end;

function TFUnitTest.fTest3: String;
begin
  Result := fTestValueTotalText(Edit3.Text,cxCurrencyEdit3.Value);
end;

function TFUnitTest.fTest4: String;
begin
  Result := fTestValueTotalText(Edit4.Text,cxCurrencyEdit4.Value);
end;

function TFUnitTest.fTest5: String;
begin
  Result := fTestValueTotalText(Edit5.Text,cxCurrencyEdit5.Value);
end;

function TFUnitTest.fTestAll: String;
begin
  fMemoTest;
  MemoTest.Lines.Add(Edit1.Text+' >>> '+fTest1);
  MemoTest.Lines.Add(Edit2.Text+' >>> '+fTest2);
  MemoTest.Lines.Add(Edit3.Text+' >>> '+fTest3);
  MemoTest.Lines.Add(Edit4.Text+' >>> '+fTest4);
  MemoTest.Lines.Add(Edit5.Text+' >>> '+fTest5);
end;

function TFUnitTest.fTestValueTotalText(const sOrder: String; fTotal: Double) : String;
var fCalcValueTotal : Double;
begin
  fCalcValueTotal := fCalcValueTotalOrder(sOrder);
  if fCalcValueTotal = fTotal then
    Result := 'OK TEST.       '+FloatToStr(fCalcValueTotal)+' = '+FloatToStr(fTotal)
  else
    Result := 'FAILED TEST!!! '+FloatToStr(fCalcValueTotal)+' <> '+FloatToStr(fTotal);
end;

end.
