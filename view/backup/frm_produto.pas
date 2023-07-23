unit frm_produto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  u_produto, u_produto_controller;

type

  { TFrmProduto }

  TFrmProduto = class(TForm)
    BtnGravar: TButton;
    EdtCodigo: TEdit;
    EdtEAN: TEdit;
    EdtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BtnGravarClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
  private

  public
    procedure Gravar();
    procedure Buscar();
  end;

var
  FrmProduto: TFrmProduto;

implementation

{$R *.lfm}

{ TFrmProduto }

procedure TFrmProduto.BtnGravarClick(Sender: TObject);
begin
  Gravar();
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

end.

