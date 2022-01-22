unit uDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageXML;

type
  Tdm = class(TDataModule)
    mtCliente: TFDMemTable;
    mtClientenome: TStringField;
    mtClientecpf: TStringField;
    mtClienterg: TStringField;
    mtClientetelefone: TStringField;
    mtClienteemail: TStringField;
    mtClientecep: TStringField;
    mtClientelogradouro: TStringField;
    mtClientenumero: TStringField;
    mtClientecomplemento: TStringField;
    mtClientebairro: TStringField;
    mtClientecidade: TStringField;
    mtClienteestado: TStringField;
    mtClientepais: TStringField;
    mtClienteid_cliente: TUnsignedAutoIncField;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    procedure mtClienteAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  function EnviaEmailLib(vsServidorSMTP,vsUsuarioContaEmail,vsSenhaContaEmail, vsEmailOrigem, vsNomeEmailOrigem,
                         vsPara, vsAssunto, vsContextoEmail, vsAnexo, viPortaServidorSMTP: string; UsarTLS, UsarSSL: Boolean): boolean;
  end;

var
  dm: Tdm;

implementation

uses
  uLib;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function Tdm.EnviaEmailLib(vsServidorSMTP, vsUsuarioContaEmail,
  vsSenhaContaEmail, vsEmailOrigem, vsNomeEmailOrigem, vsPara, vsAssunto,
  vsContextoEmail, vsAnexo, viPortaServidorSMTP: string; UsarTLS,
  UsarSSL: Boolean): boolean;
begin
  // Configuração Padrão
  if vsServidorSMTP = '' then // servidor
  begin
    vsServidorSMTP := 'smtp.gmail.com';
  end;

  if vsUsuarioContaEmail = '' then // conta de e-mail
  begin
    vsUsuarioContaEmail := 'emailinfoclientes@gmail.com';
  end;

  if vsSenhaContaEmail = '' then // pswd
  begin
    vsSenhaContaEmail := '#emailinfoclientes#';
  end;

  if vsEmailOrigem = '' then // e-mail origem
  begin
    vsEmailOrigem := 'emailinfoclientes@gmail.com';
  end;

  if vsNomeEmailOrigem = '' then // nome e-mail origem
  begin
    vsNomeEmailOrigem := 'info Clientes';
  end;

  if viPortaServidorSMTP = '' then // Porta (25 SEM SSL)
  begin
    viPortaServidorSMTP := '465';
  end;

  try
    Result := EnviaEmail(vsServidorSMTP,vsUsuarioContaEmail,vsSenhaContaEmail, vsEmailOrigem, vsNomeEmailOrigem,
                   vsPara, vsAssunto, vsContextoEmail, vsAnexo, viPortaServidorSMTP, UsarTLS, UsarSSL);
  finally

  end;
end;

procedure Tdm.mtClienteAfterInsert(DataSet: TDataSet);
begin
  mtClientepais.AsString := 'Brasil';
end;

end.
