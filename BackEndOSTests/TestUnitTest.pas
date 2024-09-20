unit TestUnitTest;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, FireDAC.Phys.Intf, cxLookAndFeels, FireDAC.Comp.Client,
  cxLookAndFeelPainters, System.SysUtils, cxContainer, Vcl.Graphics, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, Vcl.Forms, Winapi.Messages,
  FireDAC.Stan.Async, FireDAC.Stan.Param, Vcl.ExtCtrls, FireDAC.DApt, cxEdit,
  Vcl.Controls, Data.DB, Vcl.Dialogs, FireDAC.DApt.Intf, System.Variants, FireDAC.DatS,
  cxTextEdit, UnitTest, Winapi.Windows, cxControls, FireDAC.Comp.DataSet, Vcl.StdCtrls,
  FireDAC.Stan.Error, cxCurrencyEdit, cxGraphics;

type
  // Test methods for class TFUnitTest

  TestTFUnitTest = class(TTestCase)
  strict private
    FFUnitTest: TFUnitTest;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestfCalcValueTotalOrder;
  end;

implementation

procedure TestTFUnitTest.SetUp;
begin
  FFUnitTest := TFUnitTest.Create;
end;

procedure TestTFUnitTest.TearDown;
begin
  FFUnitTest.Free;
  FFUnitTest := nil;
end;

procedure TestTFUnitTest.TestfCalcValueTotalOrder;
var
  ReturnValue: Double;
  pIDCodeOrder: string;
begin
  // TODO: Setup method call parameters
  ReturnValue := FFUnitTest.fCalcValueTotalOrder(pIDCodeOrder);
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFUnitTest.Suite);
end.

