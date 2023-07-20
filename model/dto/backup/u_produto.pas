unit u_produto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TProduto }

  TProduto = class(TObject)
    private
      FCodigo    : Integer;
      FDescricao : string;
      FEAN       : string;
    public
      property Codigo    : Integer read FCodigo write FCodigo;
      property Descricao : string read FDescricao write FDescricao;
      property EAN       : string read FEAN write FEAN;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin

end;

end.

