unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CategoryButtons, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.WinXCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Grids;

type
  TFMenu = class(TForm)
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    SV: TSplitView;
    alAcoes: TActionList;
    aCliente: TAction;
    aSair: TAction;
    ilIcons: TImageList;
    ilBotoes16: TImageList;
    catMenuItems: TCategoryButtons;
    imgLogo: TImage;
    procedure imgMenuClick(Sender: TObject);
    procedure aClienteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ControleCorComponentes(Sender: TObject);
  end;

var
  FMenu: TFMenu;

  // Cores dos componentes
  sCorGradeTitulo      :TColor;
  sCorNormal           :TColor = clWindow;  // Cor natural dos Edits
  sCorcomfoco          :TColor = $C2E6C1;   // Cor quando o cursor estiver sobre o componente
  sCorReadOnly         :TColor = $00ACBBF0; // Cor dos campos somente Leitura exemplo: Codigos identity
  sCorCampoObrigatorio :TColor = $00D7FFFF; // Cor de campo obrigatório

implementation

{$R *.dfm}

uses uCadastroCliente, uLib;

procedure TFMenu.aClienteExecute(Sender: TObject);
begin
  Application.CreateForm(TFCadastroCliente, FCadastroCliente);
  try
    FCadastroCliente.showmodal;
  finally
    FCadastroCliente.Free;
  end;
end;

procedure TFMenu.ControleCorComponentes(Sender: TObject);
var i: integer;
begin
  With Screen.ActiveForm do
  begin
    for i := 0 to ComponentCount -1 do
    begin
      if (Components[I] is TCustomEdit)  or (Components[I] is TCustomCombo)  then
      begin
        if not((Components[I] as TWinControl).TabStop) and ((Components[I] as TWinControl).Tag <> 111) then
          AtribuiProp(Components[I], 'Color', IntToStr(sCorReadOnly))
        else if (Components[I] as TWinControl).Focused then
          AtribuiProp(Components[I], 'Color', IntToStr(sCorComfoco))
        else if (Components[I] as TWinControl).tag = 555 then
          AtribuiProp(Components[I], 'Color', IntToStr(sCorCampoObrigatorio))
        else
          AtribuiProp(Components[I], 'Color', IntToStr(sCorNormal))
      end;

      if (Components[I] is TCustomGrid) then
        AtribuiProp(Components[I], 'Color', IntToStr(sCorNormal));
    end;
  end;
end;

procedure TFMenu.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

end.
