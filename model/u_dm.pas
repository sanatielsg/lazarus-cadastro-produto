unit u_dm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    Con: TZConnection;
    Qry: TZQuery;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

