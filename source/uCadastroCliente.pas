unit uCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ExtCtrls, DB, ADODB, StdCtrls, Mask,
  ImgList, System.Actions,
  Vcl.ActnList, Vcl.Buttons, JvExMask, JvToolEdit, JvComponentBase, JvEnterTab,
  Vcl.Imaging.pngimage, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Menus,
  System.ImageList, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin;

type

  TOperacao = (OpInsert, OpEdit, OpBrowse);

  TFCadastroCliente = class(TForm)
    Panel1: TPanel;
    PnTopo: TPanel;
    Dados: TPanel;
    dsDados: TDataSource;
    BtnNovo: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnCancelar: TBitBtn;
    alActions: TActionList;
    ANovo: TAction;
    AAlterar: TAction;
    AExcluir: TAction;
    ASalvar: TAction;
    ACancelar: TAction;
    LbDescricaoFormulario: TLabel;
    PcPrincipal: TPageControl;
    TsCadastro: TTabSheet;
    TsConsulta: TTabSheet;
    lblLb1: TLabel;
    EdPesquisa: TEdit;
    lblLb2: TLabel;
    CbFiltro: TComboBox;
    Grid: TDBGrid;
    PnRegistros: TPanel;
    aSair: TAction;
    lbCodigo: TLabel;
    lbNome: TLabel;
    BtnSair: TBitBtn;
    btnControles: TBitBtn;
    btnRelatorios: TBitBtn;
    aControles: TAction;
    ARelatorios: TAction;
    pmControles: TPopupMenu;
    btnPrior: TSpeedButton;
    AFirst: TAction;
    APrior: TAction;
    ANext: TAction;
    ALast: TAction;
    btnFirst: TSpeedButton;
    btnNext: TSpeedButton;
    btnLast: TSpeedButton;
    TmFecharForm: TTimer;
    Label1: TLabel;
    Label12: TLabel;
    edid_cliente: TDBEdit;
    ednome: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    edemail: TDBEdit;
    edtelefone: TDBEdit;
    Label3: TLabel;
    lbRG: TLabel;
    edrg: TDBEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    edlogradouro: TDBEdit;
    ednumero: TDBEdit;
    edcomplemento: TDBEdit;
    edcidade: TDBEdit;
    edestado: TDBEdit;
    edcep: TDBEdit;
    edbairro: TDBEdit;
    lb1: TLabel;
    edcpf: TDBEdit;
    Label5: TLabel;
    edpais: TDBEdit;
    aGerarXML: TAction;
    aEnviarEmail: TAction;
    EnviarEmail1: TMenuItem;
    procedure ControlChange(Sender: Tobject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsDadosStateChange(Sender: TObject);
    procedure ANovoExecute(Sender: TObject);
    procedure AAlterarExecute(Sender: TObject);
    procedure ASalvarExecute(Sender: TObject);
    procedure ACancelarExecute(Sender: TObject);
    procedure AExcluirExecute(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure CbFiltroChange(Sender: TObject);
    procedure Pesquisar(Sender: TObject);
    procedure dsDadosDataChange(Sender: TObject; Field: TField);
    procedure aSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CarregaItensCombo;
    procedure qryDadosAfterDelete(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PcPrincipalChange(Sender: TObject);
    procedure aControlesExecute(Sender: TObject);
    procedure AFirstExecute(Sender: TObject);
    procedure APriorExecute(Sender: TObject);
    procedure ANextExecute(Sender: TObject);
    procedure ALastExecute(Sender: TObject);
    procedure TmFecharFormTimer(Sender: TObject);
    procedure btnOrdenarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edcepExit(Sender: TObject);
    procedure edcpfExit(Sender: TObject);
    procedure edemailExit(Sender: TObject);
    procedure aGerarXMLExecute(Sender: TObject);
    procedure aEnviarEmailExecute(Sender: TObject);
  private
    { Private declarations }
    FieldsGrid: TStringList;
    procedure HabilitaBotoes;
    procedure ConfiguracaoInicial;
    procedure ValidaCamposObrigatorio;
    procedure CarregarTitulo;
    procedure ValidaCPFPrivate;
    procedure ValidaEmailPrivate;

  public
    { Public declarations }
    procedure LimpaFiltro(ModificaCBFiltro: Boolean = True);
  end;

var
  FCadastroCliente : TFCadastroCliente;

implementation

uses
  uLib, uMenu, uDm;


{$R *.dfm}

procedure TFCadastroCliente.AAlterarExecute(Sender: TObject);
begin
  CarregarTitulo;
  dsDados.DataSet.Edit;
  HabilitaBotoes;

  if TsCadastro.CanFocus then
    TsCadastro.SetFocus;

  {Next no 1° componente do TabSheet}
  SelectNext(Self.ActiveControl, true, true);
end;

procedure TFCadastroCliente.ACancelarExecute(Sender: TObject);
begin
  if dsDados.DataSet.State in [dsInsert] then
    ConfiguracaoInicial;

  HabilitaBotoes;
  if BtnNovo.CanFocus then
    BtnNovo.SetFocus;
end;

procedure TFCadastroCliente.aControlesExecute(Sender: TObject);
begin
  pmControles.Popup(btnControles.ClientOrigin.X,btnControles.ClientOrigin.Y+btnControles.Height);
end;

procedure TFCadastroCliente.AExcluirExecute(Sender: TObject);
begin
  if Msg('Confirmação','Deseja realmente excluir esse registro?') then
  begin
    if ((dsDados.DataSet.Active) and (dsDados.DataSet.RecordCount >0)) then
    begin
      dsDados.DataSet.Delete;
    end
    else
      Aviso('Não possui registro a ser excluido');
  end;
end;

procedure TFCadastroCliente.AFirstExecute(Sender: TObject);
begin
  dsDados.DataSet.First;
  CarregarTitulo;
end;

procedure TFCadastroCliente.aGerarXMLExecute(Sender: TObject);
var
  arquivo : string;
begin
  if ((dsDados.DataSet.Active) and (dsDados.DataSet.RecordCount >0)) then
  begin
    arquivo := CaminhoEXE + dsDados.DataSet.FieldByName('id_cliente').AsString + '.xml';

    if FileExists(arquivo) then
      DeleteFile(arquivo);

    TFDMemTable(dsDados.DataSet).Filtered := False;
    TFDMemTable(dsDados.DataSet).Filter := 'id_cliente = ' + dsDados.DataSet.FieldByName('id_cliente').AsString;
    TFDMemTable(dsDados.DataSet).Filtered := true;

    ExpXML(dsDados.DataSet, arquivo);

    TFDMemTable(dsDados.DataSet).Filtered := False;
    TFDMemTable(dsDados.DataSet).Filter := '';
  end;
end;

procedure TFCadastroCliente.ALastExecute(Sender: TObject);
begin
  dsDados.DataSet.Last;
  CarregarTitulo;
end;

procedure TFCadastroCliente.ANextExecute(Sender: TObject);
begin
  dsDados.DataSet.Next;
  CarregarTitulo;
end;

procedure TFCadastroCliente.ANovoExecute(Sender: TObject);
begin
  dsDados.DataSet.Insert;

  LimpaFiltro;

  if TsCadastro.CanFocus then
    TsCadastro.SetFocus;

  {Next no 1° componente do TabSheet}
  SelectNext(Self.ActiveControl, true, true);
end;

procedure TFCadastroCliente.APriorExecute(Sender: TObject);
begin
  dsDados.DataSet.Prior;
  CarregarTitulo;
end;

procedure TFCadastroCliente.aSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFCadastroCliente.ASalvarExecute(Sender: TObject);
var
  sOperacao : string;
begin
  ValidaCamposObrigatorio;
  try

    case dsDados.DataSet.State of
      dsEdit: sOperacao   := 'E';
      dsInsert: sOperacao := 'I';
    end;

    dsDados.DataSet.Post;
    HabilitaBotoes;

    if sOperacao = 'I' then
    begin    
      if MessageDlg('Confirma o envio do e-mail?', mtConfirmation, [mbYes, mbno],0) = mrYes then
      begin
       aEnviarEmail.Execute;
      end;
    end;

    if BtnNovo.CanFocus then
      BtnNovo.SetFocus;

  except on E : Exception do
    begin
      raise Exception.Create('Erro ao gravar o registro!'+#13+
                             'Detalhe técnico'+#13+
                             E.Message);
    end;
  end;
end;

procedure TFCadastroCliente.CarregaItensCombo;
  var I: Integer;
begin
  CbFiltro.Clear;

  FieldsGrid := TStringList.Create;

  with Grid do
  begin
    for I := 0 to Columns.Count - 1 do
    begin
      //se a coluna estiver visível, ele adiciona no filtro
      if Columns.Items[I].Visible then
      begin
        //Obtem o caption de todas as colunas da grid, e armazena no combobox
        CbFiltro.Items.Add(Columns.Items[I].Title.Caption);
        //Obtem o nome da field que está relacionado a coluna da grid, e armazena no Array (seguindo o Indice do combo)
        FieldsGrid.Add(Columns.Items[I].Field.FieldName);
      end;
    end;
  end;

  CbFiltro.ItemIndex := 0;
end;

procedure TFCadastroCliente.CarregarTitulo;
begin
  if not dsDados.DataSet.Active then Exit;
  if dsDados.DataSet.IsEmpty then Exit;

  try
    lbCodigo.Caption := 'Código: ' + dsDados.DataSet.FieldByName('id_cliente').AsString;
    lbNome.Caption := 'Nome: ' + dsDados.DataSet.FieldByName('nome').AsString;
  except
  end;
end;

procedure TFCadastroCliente.CbFiltroChange(Sender: TObject);
begin
  LimpaFiltro(False);
end;

procedure TFCadastroCliente.ControlChange(Sender: Tobject);
begin
  FMenu.ControleCorComponentes(ActiveControl);
end;

procedure TFCadastroCliente.FormShow(Sender: TObject);
begin
  ConfiguracaoInicial;

  if BtnNovo.CanFocus then
    BtnNovo.SetFocus;
end;

procedure TFCadastroCliente.GridDblClick(Sender: TObject);
begin
  TsCadastro.Show;
  CarregarTitulo;
end;

procedure TFCadastroCliente.LimpaFiltro(ModificaCBFiltro: Boolean = True);
begin
  dsDados.DataSet.Filtered := False;

  EdPesquisa.Clear;
  if ModificaCBFiltro then
    CbFiltro.ItemIndex := 0;

  dsDadosStateChange(Self);
end;

procedure TFCadastroCliente.ValidaEmailPrivate;
begin
  if (Trim(edemail.Text) <> '') and not(ValidaEmail(edemail.Text)) then
  begin
    Aviso('O e-mail digitado é inválido, verifique!');
    if edemail.CanFocus then
      edemail.SetFocus;
    Exit;
  end;
end;

procedure TFCadastroCliente.ValidaCPFPrivate;
begin
  if (Trim(edcpf.Text) <> '') and not(CPFValido(SomenteNumero(edcpf.Text))) then
  begin
    Aviso('O CPF informado é inválido, verifique!');

    if edcpf.CanFocus then
      edcpf.SetFocus;
    Exit;
  end;
end;

procedure TFCadastroCliente.ValidaCamposObrigatorio;
begin
  ValidaCampoObrigatorio(ednome, 'Informe o nome para continuar!',False);
  ValidaCampoObrigatorio(edcpf, 'Informe o CPF para continuar!',False);
  ValidaCampoObrigatorio(edtelefone, 'Informe o telefone para continuar!',False);

  ValidaCPFPrivate;
  ValidaEmailPrivate;
end;



procedure TFCadastroCliente.ConfiguracaoInicial;
begin
  btnFirst.Flat := True;
  btnPrior.Flat := True;
  btnNext.Flat := True;
  btnLast.Flat := True;

  dsDados.DataSet.Close;
  dsDados.DataSet.Open;

  Self.Caption := '';

  TsCadastro.Show;

  try
    CarregaItensCombo;
  except
    Aviso('Erro ao abrir o formulário!'+#13+'Detalhe técnico:'+#13+
          'Não foi possível carregar os itens da grid no combobox'+#13+
          'Verifique se os fieldName da grid estão corretos');
    TmFecharForm.Enabled := True;
    Exit;
  end;

  PcPrincipalChange(Self);
end;

procedure TFCadastroCliente.btnOrdenarClick(Sender: TObject);
begin
  if PcPrincipal.ActivePage = TsConsulta then
  begin
    if PcPrincipal.ActivePage.CanFocus then
    begin
      PcPrincipal.ActivePage := TsConsulta;
    end;
  end;
end;

procedure TFCadastroCliente.PcPrincipalChange(Sender: TObject);
begin
  HabilitaBotoes;
end;

procedure TFCadastroCliente.Pesquisar(Sender: TObject);
begin
  if not(EdPesquisa.Focused) then
    Exit;

  with TFDMemTable(dsDados.DataSet) do
  begin
    if Trim(EdPesquisa.Text) <> '' then
    begin
      try
        //Se for string, é utilizado "like '%%'", se não, é utilizado =
        if FieldByName(FieldsGrid[CbFiltro.ItemIndex]).DataType in [ftString, ftWideString] then
          Filter := 'upper(' + FieldsGrid[CbFiltro.ItemIndex] + ') LIKE ''%' + AnsiUpperCase(Trim(EdPesquisa.Text)) + '%'''
        else
          Filter := FieldsGrid[CbFiltro.ItemIndex] + ' = ' + EdPesquisa.Text;
        Filtered := True;
      except
        Aviso('Valor inválido para a filtragem atual!',MB_ICONWARNING);
        if EdPesquisa.CanFocus then
        begin
          EdPesquisa.SetFocus;
          EdPesquisa.SelectAll;
        end;
      end;
    end
    else
      Filtered := False;
  end;

  dsDadosStateChange(Self);
end;

procedure TFCadastroCliente.qryDadosAfterDelete(DataSet: TDataSet);
begin
  LimpaFiltro;
end;

procedure TFCadastroCliente.TmFecharFormTimer(Sender: TObject);
begin
  Close;
end;

procedure TFCadastroCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.OnActiveControlChange := nil;

  if dsDados.DataSet.State in [dsEdit, dsInsert] then
  begin
    if Msg('Confirmação','Deseja cancelar a operação atual?') then
    begin
      btnCancelar.Click;
      Close;
    end
    else
    begin
      Screen.OnActiveControlChange := ControlChange;
      Action := caNone;
    end;
  end;

  FieldsGrid.Free;
  FieldsGrid := nil;
end;

procedure TFCadastroCliente.FormCreate(Sender: TObject);
begin
  Screen.OnActiveControlChange := ControlChange;
end;

procedure TFCadastroCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (dsDados.DataSet.State = dsBrowse) then
  begin
    if (Key = VK_DELETE) then Abort;
  end;
end;


procedure TFCadastroCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFCadastroCliente.dsDadosDataChange(Sender: TObject; Field: TField);
begin
  pnRegistros.Caption := 'Registros: ' + dsDados.DataSet.RecordCount.ToString;
  CarregarTitulo;
end;

procedure TFCadastroCliente.dsDadosStateChange(Sender: TObject);
begin
  HabilitaBotoes;
end;

procedure TFCadastroCliente.edcepExit(Sender: TObject);
 var
  logradouro,complemento, NomeBairro,
  localidade,uf: string;
begin
  if dsDados.DataSet.State in [dsBrowse] then Exit;
  if Trim(TDBEdit(sender).Text) = '' then Exit;

  Screen.Cursor := crHourGlass;

  BuscaCEPViaCep(TDBEdit(sender).Text,logradouro,complemento, NomeBairro,localidade,uf);

  if Trim(edlogradouro.Text) = '' then
    Self.dsDados.DataSet.FieldByName('logradouro').AsString := logradouro;

  if Trim(edcomplemento.Text) = '' then
      Self.dsDados.DataSet.FieldByName('complemento').AsString := complemento;

  if Trim(edbairro.Text) = '' then
      Self.dsDados.DataSet.FieldByName('bairro').AsString := NomeBairro;

  if Trim(edcidade.Text) = '' then
      Self.dsDados.DataSet.FieldByName('cidade').AsString :=  localidade;

  if Trim(edestado.Text) = '' then
      Self.dsDados.DataSet.FieldByName('estado').AsString := uf;
  Screen.Cursor := crDefault;
end;

procedure TFCadastroCliente.edcpfExit(Sender: TObject);
begin
  ValidaCPFPrivate;
end;

procedure TFCadastroCliente.edemailExit(Sender: TObject);
begin
  ValidaEmailPrivate;
end;

procedure TFCadastroCliente.aEnviarEmailExecute(Sender: TObject);
var
  sArquivo, sEmail, sAssuntoEmail, sConteudoEmail : string;
begin
  sConteudoEmail := '';
  sAssuntoEmail  := '';

  sAssuntoEmail  := 'Informações cadastrais - info Clientes';
  sConteudoEmail := '<html><body><b>Assunto:</b> Dados Cadastrais<br/> ' +
                    '<br/> ' +
                    'Caro (a), <b>' + dsDados.DataSet.FieldByName('nome').AsString + '</b>, segue abaixo os dados: <br/> ' +
                    '<br/> ' +
                    '<br/> ' +
                    'CPF: <b>' + dsDados.DataSet.FieldByName('cpf').AsString + '</b><br/> ' +
                    'RG: <b>' + dsDados.DataSet.FieldByName('rg').AsString + '</b><br/> ' +
                    'Telefone: <b>' + dsDados.DataSet.FieldByName('telefone').AsString + '</b><br/> ' +
                    'E-mail: <b>' + dsDados.DataSet.FieldByName('email').AsString + '</b><br/> ' +
                    '<br/>' +
                    '<b>' + 'Endereço </b>' +
                    '<br/>' +
                    'CEP: <b>' + dsDados.DataSet.FieldByName('cep').AsString + '</b><br/> ' +
                    'Logradouro: <b>' + dsDados.DataSet.FieldByName('logradouro').AsString + '</b><br/> ' +
                    'Número: <b>' + dsDados.DataSet.FieldByName('numero').AsString + '</b><br/> ' +
                    'Complemento: <b>' + dsDados.DataSet.FieldByName('complemento').AsString + '</b><br/> ' +
                    'Bairro: <b>' + dsDados.DataSet.FieldByName('bairro').AsString + '</b><br/> ' +
                    'Cidade: <b>' + dsDados.DataSet.FieldByName('cidade').AsString + '</b><br/> ' +
                    'UF: <b>' + dsDados.DataSet.FieldByName('estado').AsString + '</b><br/> ' +
                    'Pais: <b>' + dsDados.DataSet.FieldByName('pais').AsString + '</b><br/></body></html> ';

  sEmail := '';
  sEmail := InputBox('Informação','Informe o e-mail para envio!', dsDados.DataSet.FieldByName('email').AsString);

  if Trim(sEmail) <> '' then
  begin
    if not(ValidaEmail(sEmail)) then
    begin
      Aviso('O e-mail digitado é inválido, verifique!');
      Exit;
    end;

    Screen.Cursor := crHourGlass;
    try
      aGerarXML.Execute;
      sArquivo := CaminhoEXE + dsDados.DataSet.FieldByName('id_cliente').AsString + '.xml';

      if dm.EnviaEmailLib('','','','','',sEmail,sAssuntoEmail,sConteudoEmail,sArquivo,'',False,True) then
      begin
        Screen.Cursor := crDefault;
        ShowMessage('E-mail enviado com sucesso!');
      end;
    finally
      DeleteFile(sArquivo);
      Screen.Cursor := crDefault;
    end;
  end
  else
    ShowMessage('Não foi possível enviar o e-mail!');
end;

procedure TFCadastroCliente.HabilitaBotoes;
begin
  if ((PcPrincipal.ActivePage = TsCadastro) or (PcPrincipal.ActivePage = TsConsulta)) then
  begin
    ANovo.Enabled       := (dsDados.DataSet.State = dsBrowse) and (ANovo.Tag <> 9);
    AAlterar.Enabled    := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0) and (AAlterar.Tag <> 9);
    AExcluir.Enabled    := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0) and (AExcluir.Tag <> 9);
    ASalvar.Enabled     := dsDados.DataSet.State in [dsEdit, dsInsert];
    ACancelar.Enabled   := dsDados.DataSet.State in [dsEdit, dsInsert];
    aControles.Enabled  := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0);
    aRelatorios.Enabled := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0);

    AFirst.Enabled := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0);
    APrior.Enabled := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0);
    ALast.Enabled  := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0);
    ANext.Enabled  := (dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0);
  end
  else
  begin
    ANovo.Enabled     := False;
    AAlterar.Enabled  := False;
    AExcluir.Enabled  := False;
    ASalvar.Enabled   := False;
    ACancelar.Enabled := False;
  end;

  TsConsulta.TabVisible := (
                            ((dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.RecordCount > 0) and not(dsDados.DataSet.Filtered))
                            or
                            ((dsDados.DataSet.State = dsBrowse) and (dsDados.DataSet.Filtered))
                           );
end;

end.
