unit UOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBar, dxRibbonBackstageView, cxClasses,
  dxRibbon, Vcl.ImgList, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, IWSystem,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, dxRibbonSkins,
  dxGDIPlusClasses, dxBevel, dxSkinsCore, dxSkinBlue, dxSkinsdxRibbonPainter,
  dxSkinsdxBarPainter, dxSkinDevExpressStyle, dxSkinOffice2013White,
  cxContainer, cxEdit, cxImage, dxRibbonCustomizationForm, MidasLib,
  cxImageList;

type
  TFOS = class(TForm)
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    ImageList: TImageList;
    cxILImageGrande: TcxImageList;
    dxBarManager: TdxBarManager;
    dxBMBLancamentos: TdxBar;
    dxBarCalculo: TdxBar;
    dxBarMMenu: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarBClose: TdxBarButton;
    dxBarSeparator1: TdxBarSeparator;
    dxBarLargeButton5: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarBCloseClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FOS: TFOS;

implementation

{$R *.dfm}

procedure TFOS.dxBarBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFOS.dxBarLargeButton3Click(Sender: TObject);
begin
  Beep;
  ShowMessage('Em desenvolvimento!');
end;

procedure TFOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.


