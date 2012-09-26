unit DataModule;

interface

uses
  System.SysUtils, System.Classes, JvStringHolder;

type
  TDM = class(TDataModule)
    StringHolder: TJvMultiStringHolder;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
