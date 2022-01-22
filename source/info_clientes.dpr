program info_clientes;

uses
  Vcl.Forms,
  MidasLib,
  uMenu in 'uMenu.pas' {FMenu},
  uDm in 'uDm.pas' {dm: TDataModule},
  uCadastroCliente in 'uCadastroCliente.pas' {FCadastroCliente},
  uLib in '..\lib\uLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMenu, FMenu);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFCadastroCliente, FCadastroCliente);
  Application.Run;
end.
