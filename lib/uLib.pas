unit uLib;

interface

uses
  Vcl.Forms, Winapi.Windows,System.Classes, System.TypInfo, System.SysUtils,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, System.IniFiles,
  IdTCPConnection,IdSSLOpenSSL, System.JSON, IdHTTP,Vcl.DBCtrls, StrUtils,
  Xml.XMLDoc, DB, Xml.XMLIntf, ACBrMail;


type TLib = (TuLib);

  procedure Aviso(Msg: String; BotoesIcones: LongInt = MB_ICONINFORMATION);
  procedure ValidaCampoObrigatorio(Campo: TComponent; Mensagem: String; UtilizaMascara: Boolean);
  procedure AtribuiProp(Comp: TComponent; Const PropName: string; Val: string);
  procedure BuscaCEPViaCep(CEP: String; var logradouro,complemento, NomeBairro,localidade, uf: string);
  procedure ExpXML(DataSet: TDataSet; Arq: string);
  function ValidaEmail(Email: string): Boolean;
  function CPFValido(NumCPF: String):Boolean;
  function CompletaCaracterD(pString: string; pNumCasas: Integer; pCarac: Char): string;
  function StrVazio(InValue: String): Boolean;
  function SomenteNumero(InValue: String):String;
  function CaminhoEXE:String;
  function SomenteLetraNumero(InValue: String): String;
  function Digito(Campo : String): Boolean;
  function Letra(Campo : String): Boolean;
  function Msg(Titulo: string; Msg: string; BotoesIcones: LongInt = mb_yesno + MB_ICONQUESTION):Boolean;
  function EnviaEmail(vsServidorSMTP,vsUsuarioContaEmail,vsSenhaContaEmail, vsEmailOrigem, vsNomeEmailOrigem,
                    vsPara, vsAssunto, vsContextoEmail, vsAnexo, viPortaServidorSMTP: string; UsarTLS, UsarSSL: Boolean): boolean;

implementation

function Msg(Titulo: string; Msg: string; BotoesIcones: LongInt = mb_yesno + MB_ICONQUESTION):Boolean;
begin
  Result := (Application.MessageBox(PCHar(Msg),PChar(Titulo), BotoesIcones) = idyes);
end;

procedure Aviso(Msg: String; BotoesIcones: LongInt = MB_ICONINFORMATION);
begin
   Application.MessageBox(PCHar(Msg),'Aviso', BotoesIcones);
end;



procedure AtribuiProp(Comp: TComponent; Const PropName: string; Val: string);
var PInfo: PPropInfo;
begin
  PInfo := GetPropInfo(Comp.ClassInfo, PropName);        // Pega informações de tipo da propriedade
  if PInfo <> nil then
  begin                             // Achou?
    case PInfo^.Proptype^.Kind of                        // Trata conforme o tipo
      tkInteger: SetOrdProp(Comp, PInfo, StrToInt(Val));
      tkChar, tkWChar: SetOrdProp(Comp, PInfo, ord(Val[1]));
      tkEnumeration: SetOrdProp(Comp, PInfo, GetEnumValue(PInfo^.PropType^, Val));
      tkFloat: SetFloatProp(Comp, PInfo, StrToFloat(Val));
      tkString, tkLString, tkWString: SetStrProp(Comp, PInfo, Val);
      tkVariant: SetVariantProp(Comp, PInfo, Val);
      tkInt64: SetInt64Prop(Comp, PInfo, StrToInt64(Val));
    else
        ShowMessage('Este tipo não é suportado por este programa');
    end;
  end
  else
    ShowMessage('Propriedade não encontrada');
end;

procedure ValidaCampoObrigatorio(Campo: TComponent;
  Mensagem: String; UtilizaMascara: Boolean);
begin
  if (Campo is TEdit) then
  begin
    if ((UtilizaMascara) and (Trim(SomenteLetraNumero(TEdit(Campo).Text)) = '')) or
       (Trim(TEdit(Campo).Text) = '') then
    begin
      Aviso(Mensagem);

      if TEdit(Campo).CanFocus then
          TEdit(Campo).SetFocus;
      Abort;
    end;
  end
  else if (Campo is TComboBox) then
  begin
    if Trim(TComboBox(Campo).Text) = '' then
    begin
      Aviso(Mensagem);
      if TComboBox(Campo).CanFocus then
          TComboBox(Campo).SetFocus;
      Abort;
    end;
  end
  else if (Campo is TDateTimePicker) then
  begin
    if ((DateToStr(TDateTimePicker(Campo).DateTime) = '30/12/1899')) then
    begin
      Aviso(Mensagem);
      if TDateTimePicker(Campo).CanFocus then
          TDateTimePicker(Campo).SetFocus;
      Abort;
    end;
  end
  else if (Campo is TMaskEdit) then
  begin
    if Trim(TMaskEdit(Campo).Text) = '' then
    begin
      Aviso(Mensagem);
      if TMaskEdit(Campo).CanFocus then
          TMaskEdit(Campo).SetFocus;
      Abort;
    end;

    if TMaskEdit(Campo).Text = '  /  /    ' then
    begin
      Aviso(Mensagem);
      if TMaskEdit(Campo).CanFocus then
          TMaskEdit(Campo).SetFocus;
      Abort;
    end;
  end
  else if (Campo is TEdit) then
  begin
    if Trim(TEdit(Campo).Text) = '' then
    begin
      Aviso(Mensagem);
      if TEdit(Campo).CanFocus then
          TEdit(Campo).SetFocus;
      Abort;
    end;
  end
  else if (Campo is TDBEdit) then
  begin
    if Trim(TDBEdit(Campo).Text) = '' then
    begin
      Aviso(Mensagem);
      if TDBEdit(Campo).CanFocus then
          TDBEdit(Campo).SetFocus;
      Abort;
    end;
  end
  else if (Campo is TMemo) then
  begin
    if Trim(TMemo(Campo).Text) = '' then
    begin
      Aviso(Mensagem);
      if TMemo(Campo).CanFocus then
          TMemo(Campo).SetFocus;
      Abort;
    end;
  end
  else if (Campo is TCustomMemo) then
  begin
    if Trim(TCustomMemo(Campo).Text) = '' then
    begin
      Aviso(Mensagem);
      if TCustomMemo(Campo).CanFocus then
          TCustomMemo(Campo).SetFocus;
      Abort;
    end;
  end
  else
  begin
    Aviso('Tipo de componente não implementado na validação de campos!');
    Abort;
  end;
end;

function SomenteLetraNumero(InValue: String): String;
var i   : Integer;
    Tmp : String;
begin
  Tmp := '';

  for i := 1 to Length(InValue) do
    if Digito(InValue[i]) then
      Tmp := Tmp + InValue[i]
    else if letra(InValue[i]) then
      Tmp := Tmp + InValue[i];

  Result := Tmp;
end;

function SomenteNumero(InValue: String):String;
var i   : Integer;
    Tmp : String;
begin
  Tmp := '';

  for i := 1 to Length(InValue) do
    if Digito(InValue[i]) then
      Tmp := Tmp + InValue[i];

  Result := Tmp;
end;

function Digito(Campo : String) : Boolean;
begin
  Digito := (Pos(Campo, '0123456789') > 0);
end;

function Letra(Campo: String): Boolean;
begin
  Letra := (Pos(UpperCase(Campo), 'ABCDEFGHIJKLMNOPQRSTUVWXYZÇç') > 0);
end;

function CaminhoEXE:String;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
end;
procedure BuscaCEPViaCep(CEP: String; var logradouro,complemento, NomeBairro,
  localidade, uf: string);
var
  HTTP: TIdHTTP;
  IDSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  Response: TStringStream;
  JSON: TJSONObject;
begin
  HTTP := TIdHTTP.Create;
  IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
  try
    try
      HTTP.IOHandler := IDSSLHandler;
      Response := TStringStream.Create('');
      HTTP.Get('http://viacep.com.br/ws/' + CEP + '/json', Response);
      if (HTTP.ResponseCode = 200) and not (UTF8ToString(Response.DataString) = '{'#10'  "erro": true'#10'}') then
      begin
        JSON        := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(UTF8ToString(Response.DataString)), 0) as TJSONObject;
        logradouro  := JSON.Get('logradouro').JsonValue.Value;
        NomeBairro  := JSON.Get('bairro').JsonValue.Value;
        complemento := JSON.Get('complemento').JsonValue.Value;
        localidade  := JSON.Get('localidade').JsonValue.Value;
        uf          := JSON.Get('uf').JsonValue.Value;
      end
      else
        Abort;
    except
    end;
  finally
    FreeAndNil(HTTP);
    FreeAndNil(IDSSLHandler);
    Response.Destroy;
  end;
end;

function ValidaEmail(Email: string): Boolean;
begin
  Email := Trim(UpperCase(Email));

  if Pos('@', Email) > 1 then
  begin
    Delete(Email, 1, pos('@', Email));
    Result := (Length(Email) > 0) and (Pos('.', Email) > 2);
  end
  else
    Result := False;
end;

function CPFValido(NumCPF: String):Boolean;
var WCpfCalc  : String;
    WSomaCpf,
    WCpfDigit : Integer;
    WSx1      : ShortInt;
begin
  NumCPF := SomenteNumero(NumCPF);

  //Inválidos
  case AnsiIndexStr(NumCPF,['00000000000','11111111111','22222222222','33333333333','44444444444',
                            '55555555555','66666666666','77777777777','88888888888','99999999999']) of 0..9:
    Exit;
  end;

  if StrVazio(NumCpf) then
    exit;

  NumCpf   := CompletaCaracterD(SomenteNumero(NumCpf),11,'0');
  WSomaCpf := 0;
  WCpfCalc := Copy(NumCpf, 1, 9);

  for WSx1 := 1 to 9 do
    WSomaCpf := WSomaCpf + StrToInt(Copy(WCpfCalc, WSx1, 1)) * (11 - WSx1);

  WCpfDigit := 11 - WSomaCpf Mod 11;

  if WCpfDigit In [10, 11] then
    WCpfCalc := WCpfCalc + '0'
  else
    WCpfCalc := WCpfCalc + IntToStr(WCpfDigit);

  WSomaCpf := 0;

  for WSx1 := 1 to 10 do
    WSomaCpf := WSomaCpf + StrToInt(Copy(WCpfCalc, WSx1, 1)) * (12 - WSx1);

  WCpfDigit := 11 - WSomaCpf Mod 11;

  if WCpfDigit In [10, 11] then
    WCpfCalc := WCpfCalc + '0'
  else
    WCpfCalc := WCpfCalc + IntToStr(WCpfDigit);

  Result := NOT (NumCpf <> WCpfCalc);
end;

function CompletaCaracterD(pString: string; pNumCasas: Integer; pCarac: Char): string;
var   RestLen: Integer;
begin   Result  := pString;
  RestLen := pNumCasas - Length(pString);
  if RestLen < 1 then Exit;
    Result := StringOfChar(pCarac, RestLen) + pString;
end;

function StrVazio(InValue: String):Boolean;
  var Index : Byte;
begin
  Index  := 1;
  Result := True;

  if Length(InValue) > 0 then
  begin
    while (Index <= Length(InValue)) and (Index <> 0) do
    begin
      if InValue[Index] = ' ' then
        Inc(Index)
      else
      begin
        Result := False;
        Index  := 0;
      end;
    end;
  end;
end;

procedure ExpXML(DataSet : TDataSet; Arq : string);
var
  i: integer;
  xml: TXMLDocument;
  reg, campo: IXMLNode;
begin
  xml := TXMLDocument.Create(nil);
  try
    xml.Active := True;
    DataSet.First;
    xml.DocumentElement :=
      xml.CreateElement('DataSet','');
    DataSet.First;
    while not DataSet.Eof do
    begin
      reg := xml.DocumentElement.AddChild('row');
      for i := 0 to DataSet.Fields.Count - 1 do
      begin
        campo := reg.AddChild(
          DataSet.Fields[i].DisplayLabel);
        campo.Text := DataSet.Fields[i].DisplayText;
      end;
      DataSet.Next;
    end;
    xml.SaveToFile(Arq);
  finally
    xml.free;
  end;
end;

function EnviaEmail(vsServidorSMTP,vsUsuarioContaEmail,vsSenhaContaEmail, vsEmailOrigem, vsNomeEmailOrigem,
                    vsPara, vsAssunto, vsContextoEmail, vsAnexo, viPortaServidorSMTP: string; UsarTLS, UsarSSL: Boolean): boolean;
var
  AcbrMail : TACBrMail;
begin
  AcbrMail := TACBrMail.Create(nil);
  AcbrMail.Clear;

  //Informações básicas para uma conexão
  AcbrMail.Host           := vsServidorSMTP;
  AcbrMail.Port           := viPortaServidorSMTP;

  AcbrMail.Username       := vsUsuarioContaEmail;
  AcbrMail.Password       := vsSenhaContaEmail;
  AcbrMail.SetTLS         := UsarTLS;
  AcbrMail.SetSSL         := UsarSSL;
  AcbrMail.DefaultCharset := TMailCharset(0); //UTF_8
  AcbrMail.IDECharset     := TMailCharset(0);  //CP 1252;

  //Nome e endereço de quem está enviando
  AcbrMail.From           := vsEmailOrigem;
  AcbrMail.FromName       := vsNomeEmailOrigem;

  //Destinatários
  AcbrMail.AddAddress(vsPara, vsPara);

  //Assunto da mensagem
  AcbrMail.Subject := vsAssunto;

  //Corpo da mensagem, isto é, o texto dela
  AcbrMail.IsHTML       := True;
  AcbrMail.Body.Text := vsContextoEmail;

  //Anexa o arquivo ao email
  if vsAnexo <> '' then
  begin
    AcbrMail.AddAttachment(vsAnexo);
  end;

  try
    //Envia o e-mail
    AcbrMail.Send(True);

    Result := True;

  except on e:Exception do
    begin
      ShowMessage(e.Message);
      Result := False;
    end;
  end;
  FreeAndNil(AcbrMail);
end;

end.
