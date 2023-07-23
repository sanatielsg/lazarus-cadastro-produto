unit frm_produto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  u_produto, u_produto_controller;

type

  { TFrmProduto }

  TFrmProduto = class(TForm)
    BtnNovo: TButton;
    BtnInclusao: TButton;
    BtnExcluir: TButton;
    BtnSair: TButton;
    EdtCodigo: TEdit;
    EdtEAN: TEdit;
    EdtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BtnInclusaoClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
  private

  public
    procedure Gravar();
    procedure Buscar();
    procedure Alterar();
  end;

var
  FrmProduto: TFrmProduto;

implementation

{$R *.lfm}

{ TFrmProduto }

procedure TFrmProduto.BtnNovoClick(Sender: TObject);
begin
  if (Btnnovo.Caption = 'Cancelar') then
  begin
    BtnNovo.Caption     := 'Novo';
    BtnInclusao.Enabled := False;
    BtnExcluir.Enabled  := False;
    EdtCodigo.Text    := '';
    EdtDescricao.Text := '';
    EdtEAN.Text       := '';
    EdtDescricao.Enabled := False;
    EdtEAN.Enabled       := False;
    BtnInclusao.Caption  := 'Inclusão';
  end else
  if (Btnnovo.Caption = 'Novo') then
  begin
    BtnNovo.Caption     := 'Cancelar';
    BtnInclusao.Enabled := True;
    BtnExcluir.Enabled  := False;
    EdtDescricao.Enabled := True;
    EdtEAN.Enabled       := True;
  end;
end;

procedure TFrmProduto.BtnInclusaoClick(Sender: TObject);
begin
  if (BtnInclusao.Caption = 'Inclusão') then
    Gravar()
  else if (BtnInclusao.Caption = 'Alteração ') then
    Alterar()
end;

procedure TFrmProduto.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmProduto.EdtCodigoExit(Sender: TObject);
begin
  if (EdtCodigo.Text <> '') then
  begin
    Buscar();
  end;
end;

procedure TFrmProduto.Gravar;
  var Produto : TProduto;
      ProdutoController : TProdutoController;
      NovoProduto : Integer;
begin
  Produto           := TProduto.Create;
  ProdutoController := TProdutoController.Create;
  try
    try
      Produto.Codigo:= -1;
      Produto.Descricao:= EdtDescricao.Text;
      Produto.EAN:= EdtEAN.Text;
      NovoProduto := ProdutoController.Creating(Produto);
      ShowMessage('Produto '+ IntToStr(NovoProduto) + ' cadastrado!' );
      EdtCodigo.Text := IntToStr(NovoProduto);
    except
     On E:Exception do
        ShowMessage('Ocorreu um erro:: '+ E.Message);
    end;
  finally
    FreeAndNil(Produto);
    FreeAndNil(ProdutoController);
  end;
end;

procedure TFrmProduto.Buscar;
  var Produto : TProduto;
      ProdutoController : TProdutoController;
begin
  ProdutoController := TProdutoController.Create;
  try
    try
      Produto := ProdutoController.Read( StrToInt(EdtCodigo.Text));
      if (Produto <> nil) then
      begin
        EdtCodigo.Text    := IntToStr(Produto.Codigo);
        EdtDescricao.Text := Produto.Descricao;
        EdtEAN.Text       := Produto.EAN;

        BtnExcluir.Enabled   := True;
        BtnNovo.Caption      := 'Cancelar';
        BtnInclusao.Caption  := 'Alterar';
        BtnInclusao.Enabled  := True;
        EdtDescricao.Enabled := True;
        EdtEAN.Enabled       := True;

      end else
      ShowMessage('Produto não encontrado!');
    except
       on E:Exception do
          ShowMessage('Ocorreu um erro ao buscar:: '+E.Message);
    end;
  finally
    FreeAndNil(ProdutoController);
  end;
end;

procedure TFrmProduto.Alterar;
begin

end;

end.

