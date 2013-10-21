unit About;

interface

uses
  System.SysUtils, Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage, BCDialogs.Dlg;

type
  TAboutDialog = class(TDialog)
    CopyrightLabel: TLabel;
    GrayLinePanel: TPanel;
    LinkRow1Label: TLinkLabel;
    LinkRow2Label: TLinkLabel;
    LinkRow3Label: TLinkLabel;
    MemoryAvailableLabel: TLabel;
    OKButton: TButton;
    OraBoneImage: TImage;
    OSLabel: TLabel;
    ProgramNameiLabel: TLabel;
    ThanksToLabel: TLabel;
    TopPanel: TPanel;
    VersionLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
  private
    function GetVersion: string;
  public
    procedure Open;
    property Version: string read GetVersion;
  end;

function AboutDialog: TAboutDialog;

implementation

{$R *.dfm}

uses
  BCCommon.Lib, BCCommon.StyleUtils, BCCommon.FileUtils;

var
  FAboutDialog: TAboutDialog;

function AboutDialog: TAboutDialog;
begin
  if not Assigned(FAboutDialog) then
    Application.CreateForm(TAboutDialog, FAboutDialog);
  Result := FAboutDialog;
  SetStyledFormSize(Result);
end;

procedure TAboutDialog.Open;
var
  MemoryStatus: TMemoryStatusEx;
begin
  VersionLabel.Caption := Format(VersionLabel.Caption, [BCCommon.FileUtils.GetFileVersion(Application.ExeName),
    {$IFDEF WIN64}64{$ELSE}32{$ENDIF}]);
  { initialize the structure }
  FillChar(MemoryStatus, SizeOf(MemoryStatus), 0);
  MemoryStatus.dwLength := SizeOf(MemoryStatus);
  { check return code for errors }
  {$WARNINGS OFF}
  Win32Check(GlobalMemoryStatusEx(MemoryStatus));
  {$WARNINGS ON}
  OSLabel.Caption := GetOSInfo;
  MemoryAvailableLabel.Caption := Format(MemoryAvailableLabel.Caption, [FormatFloat('#,###" KB"', MemoryStatus.ullAvailPhys div 1024)]);
  ShowModal;
end;

procedure TAboutDialog.LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  BrowseURL(Link);
end;

procedure TAboutDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutDialog.FormDestroy(Sender: TObject);
begin
  FAboutDialog := nil;
end;

function TAboutDialog.GetVersion: string;
begin
  Result := BCCommon.FileUtils.GetFileVersion(Application.ExeName);
end;

end.
