unit SchemaDocument;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, OleCtrls,
  SHDocVw, ComCtrls, ToolWin, JvExComCtrls, JvStatusBar, Ora, JvStringHolder, ActnList, Menus, WebBrowser.Container,
  Vcl.ImgList, Vcl.ExtCtrls, Vcl.Buttons, PlatformDefaultStyleActnCtrls, ActnPopup,
  Vcl.Styles.WebBrowser, System.Actions, BCCommon.Images;

type
  TWebBrowser = class(TVclStylesWebBrowser);

  TSchemaDocumentForm = class(TForm)
    JvStatusBar1: TJvStatusBar;
    StringHolder: TJvMultiStringHolder;
    ActionList: TActionList;
    SaveAction: TAction;
    PopupActionBar: TPopupActionBar;
    SaveAction1: TMenuItem;
    PrinterSettingsAction: TAction;
    PrintAction: TAction;
    N1: TMenuItem;
    PrinterSettings1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    Close1: TMenuItem;
    DocumentPanel: TPanel;
    WebBrowser: TWebBrowser;
    ButtonPanel: TPanel;
    ToolBar: TToolBar;
    WordWrapToolButton: TToolButton;
    Toolbar1Bevel: TBevel;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveActionExecute(Sender: TObject);
    procedure PrinterSettingsActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
    FSchemaParam: string;
    FWBContainer: TWBContainer;
    procedure NavigateToURL(const URL: WideString);
    procedure LoadFromStream(const Stream: TStream);
    procedure LoadFromString(const HTML: WideString);
    function GetDocument: WideString;
    function GetHeader: WideString;
    function GetStyles: WideString;
    function GetTitle: WideString;
    function GetToc(TocType: string; var Chapter: Integer): string;
    function GetTableOfContents: WideString;
    function GetTables(var Chapter: Integer): WideString;
    function GetViews(var Chapter: Integer): WideString;
    function GetFunctions(var Chapter: Integer): WideString;
    function GetProcedures(var Chapter: Integer): WideString;
    function GetTriggers(var Chapter: Integer): WideString;
    function GetSequences(var Chapter: Integer): WideString;
    function GetUsersAndPrivileges(var Chapter: Integer): WideString;
    function GetFooter: WideString;
    procedure ReadIniFile;
    procedure WriteIniFile;
    procedure SaveAsHTML(WebBrowser: TWebBrowser; const FileName: string);
  public
    { Public declarations }
    procedure Open(OraSession: TOraSession; SchemaParam: string);
  end;

function SchemaDocumentForm: TSchemaDocumentForm;

implementation

{$R *.dfm}

uses
  Winapi.ActiveX, System.StrUtils, Progress, BigINI, Main, BCCommon.Dialogs, BCCommon.LanguageStrings,
  Data.DB, BCCommon.FileUtils, BCCommon.Messages, BCCommon.Lib;

var
  FSchemaDocumentForm: TSchemaDocumentForm;

function SchemaDocumentForm: TSchemaDocumentForm;
begin
  if not Assigned(FSchemaDocumentForm) then
    Application.CreateForm(TSchemaDocumentForm, FSchemaDocumentForm);
  Result := FSchemaDocumentForm;
end;

procedure TSchemaDocumentForm.ReadIniFile;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Size }
    Width := ReadInteger('SchemaDocumentSize', 'Width', Round(Screen.Width * 0.5));
    Height := ReadInteger('SchemaDocumentSize', 'Height', Round(Screen.Height * 0.5));
    { Position }
    Left := ReadInteger('SchemaDocumentPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('SchemaDocumentPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
  finally
    Free;
  end;
end;

procedure TSchemaDocumentForm.SaveAsHTML(WebBrowser: TWebBrowser; const FileName: string);
var
  PersistStream: IPersistStreamInit;
  Stream: IStream;
  FileStream: TFileStream;
begin
  if not Assigned(WebBrowser.Document) then
  begin
    ShowMessage('Document not loaded!');
    Exit;
  end;

  PersistStream := WebBrowser.Document as IPersistStreamInit;
  FileStream := TFileStream.Create(FileName, fmCreate) ;
  try
    Stream := TStreamAdapter.Create(FileStream, soReference) as IStream;
    if Failed(PersistStream.Save(Stream, True)) then
      ShowErrorMessage('SaveAs HTML fail!');
  finally
   FileStream.Free;
  end;
end;

procedure TSchemaDocumentForm.SaveActionExecute(Sender: TObject);
var
  Filename: string;
  FilterIndex: Cardinal;
begin
  FileName := Format('%s_%s.html', [FSchemaparam, StringReplace(FSession.Server, '.', '_',[rfReplaceAll])]);
  if BCCommon.Dialogs.SaveFile(Handle, '', Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]) +
    'SQL files (*.sql)'#0'*.sql'#0#0, LanguageDataModule.GetConstant('SaveAs'), FilterIndex, FileName) then
  begin
    Application.ProcessMessages; { style fix }
    SaveAsHTML(WebBrowser, BCCommon.Dialogs.Files[0]);
  end;
end;

procedure TSchemaDocumentForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Position }
    WriteInteger('SchemaDocumentPosition', 'Left', Left);
    WriteInteger('SchemaDocumentPosition', 'Top', Top);
    { Size }
    WriteInteger('SchemaDocumentSize', 'Width', Width);
    WriteInteger('SchemaDocumentSize', 'Height', Height);
  finally
    Free;
  end;
end;

procedure TSchemaDocumentForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  WebBrowser.Navigate('about:blank');
  Action := caFree;
  inherited;
end;

procedure TSchemaDocumentForm.FormCreate(Sender: TObject);
begin
  inherited;
  FWBContainer := TWBContainer.Create(WebBrowser);
  FWBContainer.UseCustomCtxMenu := True;
  FWBContainer.Show3DBorder := False;
  FWBContainer.ShowScrollBars := True;
  FWBContainer.AllowTextSelection := True;
 // FWBContainer.CSS := GetStyles;
  ReadIniFile;
end;

procedure TSchemaDocumentForm.FormDestroy(Sender: TObject);
begin
  FWBContainer.Free;
  FSchemaDocumentForm := nil;
end;

// print directly without printer dialog
{procedure WebBrowserPrintNoDialog(WebBrowser: TWebBrowser) ;
var
  vIn, vOut: OleVariant;
begin
  WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut) ;
end; }

//call the printer dialog
procedure WebBrowserPrintWithDialog(WebBrowser: TWebBrowser) ;
var
  vIn, vOut: OleVariant;
begin
  WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

// Print Preview
procedure WebBrowserPrintPreview(WebBrowser: TWebBrowser) ;
var
  vIn, vOut: OleVariant;
begin
  WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut) ;
end;

//Call page setup dialog
procedure WebBrowserPrintPageSetup(WebBrowser: TWebBrowser);
var
  vIn, vOut: OleVariant;
begin
  WebBrowser.ControlInterface.ExecWB(OLECMDID_PAGESETUP, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

function CreateQuery(OraSession: TOraSession; SQL: WideString): TOraQuery;
begin
  Result := TOraQuery.Create(nil);
  Result.Session := OraSession;
  Result.FetchAll := True;
  //Result.FetchRows := 500;
  Result.ReadOnly := True;
  Result.NonBlocking := True;
  Result.AutoCommit := False;
  Result.SQL.Add(SQL);
end;

procedure TSchemaDocumentForm.Open(OraSession: TOraSession; SchemaParam: string);
begin
  FSession := OraSession;
  FSchemaParam := SchemaParam;
  Caption := Format('Schema Document - [%s@%s]', [FSchemaparam, FSession.Server]);
  Show;
  LoadFromString(GetDocument);
end;

procedure TSchemaDocumentForm.PrintActionExecute(Sender: TObject);
begin
  WebBrowserPrintWithDialog(WebBrowser);
end;

procedure TSchemaDocumentForm.PrinterSettingsActionExecute(Sender: TObject);
begin
  WebBrowserPrintPageSetup(WebBrowser);
end;

function TSchemaDocumentForm.GetHeader: WideString;
begin
  Result := StringHolder.StringsByName['HeaderHtml'].Text;
end;

function TSchemaDocumentForm.GetStyles: WideString;
begin
  Result := StringHolder.StringsByName['StylesHtml'].Text;
end;

function TSchemaDocumentForm.GetTitle: WideString;
begin
  Result := Format(StringHolder.StringsByName['TitleHtml'].Text, [FSchemaparam, FSession.Server, FormatDateTime('dd.mm.yyyy', Now)]) + StringHolder.StringsByName['SeparatorHtml'].Text;
end;

function TSchemaDocumentForm.GetToc(TocType: string; var Chapter: Integer): string;
var
  i: Integer;
  OraQuery: TOraQuery;
begin
  OraQuery := CreateQuery(FSession, StringHolder.StringsByName[TocType + 'sSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while OraQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      Result := Format(StringHolder.StringsByName['ContentsHeaderHtml'].Text, [Chapter, Chapter, UpperCase(TocType)]);
      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Result := Result + Format(StringHolder.StringsByName['ContentsRowHtml'].Text, [Chapter, i, Chapter, i,
          FieldByName(UpperCase(TocType) + '_NAME').AsWideString, FieldByName(UpperCase(TocType) + '_NAME').AsWideString]);
        Next;
        Inc(i);
      end;
      Result := Result + StringHolder.StringsByName['ContentsFooterHtml'].Text;
      Inc(Chapter);
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

function TSchemaDocumentForm.GetTableOfContents: WideString;
var
  Chapter: Integer;
begin
  Result := StringHolder.StringsByName['TableOfContentsHeaderHtml'].Text;
  { Tables }
  Chapter := 1;
  Result := Result + GetToc('Table', Chapter);
  { Views }
  Result := Result + GetToc('View', Chapter);
  { Functions }
  Result := Result + GetToc('Function', Chapter);
  { Procedures }
  Result := Result + GetToc('Procedure', Chapter);
  { Triggers }
  Result := Result + GetToc('Trigger', Chapter);
  { Sequences }
  Result := Result + GetToc('Sequence', Chapter);
  { User rights }
  Result := Result + GetToc('User', Chapter);
  Result := Result + StringHolder.StringsByName['TableOfContentsFooterHtml'].Text;
end;

function TSchemaDocumentForm.GetTables(var Chapter: Integer): WideString;
var
  i: Integer;
  Role, Privileges: string;
  TablesQuery, SynonymsQuery, PrivilegesQuery, ColumnsQuery, PrimaryKeysQuery, ForeignKeysQuery,
  IndexesQuery: TOraQuery;
begin
  TablesQuery := CreateQuery(FSession, StringHolder.StringsByName['TablesSQL'].Text);
  with TablesQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while TablesQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      { Open synonyms }
      //if FieldByName('SYNONYM_FOUND').AsString = 'Y' then
      //begin
        SynonymsQuery := CreateQuery(FSession, StringHolder.StringsByName['TableSynonymsSQL'].Text);
        with SynonymsQuery do
        begin
          //ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
          Prepare;
          Open;
          while Executing do
            Application.ProcessMessages;
        end;
      //end;
      { Open table privileges}
      //if FieldByName('TAB_PRIVS_FOUND').AsString = 'Y' then
      //begin
        PrivilegesQuery := CreateQuery(FSession, StringHolder.StringsByName['TablePrivilegesSQL'].Text);
        with PrivilegesQuery do
        begin
          //ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
          Prepare;
          Open;
          while Executing do
            Application.ProcessMessages;
        end;
      //end;
      { Open columns }
      ColumnsQuery := CreateQuery(FSession, StringHolder.StringsByName['TableColumnsSQL'].Text);
      with ColumnsQuery do
      begin
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;
      { Open primary keys }
      PrimaryKeysQuery := CreateQuery(FSession, StringHolder.StringsByName['PrimaryKeysSQL'].Text);
      with PrimaryKeysQuery do
      begin
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;
      { Open foreign keys }
      ForeignKeysQuery := CreateQuery(FSession, StringHolder.StringsByName['ForeignKeysSQL'].Text);
      with ForeignKeysQuery do
      begin
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;
      { Open primary keys }
      IndexesQuery := CreateQuery(FSession, StringHolder.StringsByName['IndexesSQL'].Text);
      with IndexesQuery do
      begin
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;

      Result := Format(StringHolder.StringsByName['ChapterHeader'].Text, [Chapter, Chapter, Chapter, 'TABLES']);
      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Application.ProcessMessages;
        Result := Result + Format(StringHolder.StringsByName['SubChapterHtml'].Text, [Chapter, i, Chapter, i, Chapter, i,
          FieldByName('TABLE_NAME').AsWideString]);
        if not FieldByName('COMMENTS').IsNull then
          Result := Result + Format(StringHolder.StringsByName['DescriptionHtml'].Text, [FieldByName('COMMENTS').AsWideString]);
        { Synonyms }
        with SynonymsQuery do
        if TablesQuery.FieldByName('TABLE_NAME').AsWideString = SynonymsQuery.FieldByName('TABLE_NAME').AsWideString then
        begin
          Result := Result + StringHolder.StringsByName['SynonymHeader'].Text;
          //OraQuery := CreateQuery(FSession, StringHolder.StringsByName['SynonymsSQL'].Text);
          //try
            //ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
            //Prepare;
            //Open;
            //while OraQuery.Executing do
            //  Application.ProcessMessages;
            while not Eof and (TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString)  do
            begin
              if not ProgressDialog(Self).OnProgress then
                Exit;
              Application.ProcessMessages;
              Result := Result + Format(StringHolder.StringsByName['SynonymRowHtml'].Text, [
                FieldByName('SYNONYM_NAME').AsWideString]);
              Next;
            end;
          {finally
            Close;
            UnPrepare;
            FreeAndNil(OraQuery); }
        end;
        { Table privileges }
        with PrivilegesQuery do
        if TablesQuery.FieldByName('TABLE_NAME').AsWideString = PrivilegesQuery.FieldByName('TABLE_NAME').AsWideString then
        begin
          Result := Result + StringHolder.StringsByName['TabPrivsHeaderHtml'].Text;
          //OraQuery := CreateQuery(FSession, StringHolder.StringsByName['TablePrivilegesSQL'].Text);
          //try
          //  ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
          //  Prepare;
          //  Open;
          //  while OraQuery.Executing do
          //    Application.ProcessMessages;
            Role := FieldByName('GRANTEE').AsWideString;
            while not Eof and (TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString)  do
            begin
              if not ProgressDialog(Self).OnProgress then
                Exit;
              Application.ProcessMessages;
              Privileges := '';
              while not Eof and (TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) and (Role = FieldByName('GRANTEE').AsWideString) do
              begin
                if not ProgressDialog(Self).OnProgress then
                  Exit;
                Application.ProcessMessages;
                if Privileges = '' then
                  Privileges := FieldByName('PRIVILEGE').AsWideString
                else
                  Privileges := Privileges + ', ' + FieldByName('PRIVILEGE').AsWideString;
                Next;
              end;
              Result := Result + Format(StringHolder.StringsByName['TabPrivsRowHtml'].Text, [
                Role, Privileges]);
              Role := FieldByName('GRANTEE').AsWideString;
              Next;
            end;
            Result := Result + StringHolder.StringsByName['TabPrivsFooterHtml'].Text;
          {finally
            Close;
            UnPrepare;
            FreeAndNil(OraQuery);
          end; }
        end;
        { Table columns }
        Result := Result + StringHolder.StringsByName['TableColumnsHeaderHtml'].Text;
       // ColumnsQuery := CreateQuery(FSession, StringHolder.StringsByName['TableColumnsSQL'].Text);
        with ColumnsQuery do
        begin
          while not Eof and (TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
          begin
            if not ProgressDialog(Self).OnProgress then
              Exit;
            Application.ProcessMessages;
            Result := Result + Format(StringHolder.StringsByName['TableColumnRowHtml'].Text, [
              FieldByName('COLUMN_ID').AsWideString, FieldByName('COLUMN_NAME').AsWideString,
              FieldByName('DATA_TYPE').AsWideString, FieldByName('PK').AsWideString,
              FieldByName('NULLABLE').AsWideString, FieldByName('DATA_DEFAULT').AsWideString,
              FieldByName('COMMENTS').AsWideString
              ]);
            Next;
          end;
          Result := Result + StringHolder.StringsByName['ColumnsFooterHtml'].Text;
        end;
       { finally
          Close;
          UnPrepare;
          FreeAndNil(OraQuery);
        end;}
        { Primary keys }
        //OraQuery := CreateQuery(FSession, StringHolder.StringsByName['PrimaryKeysSQL'].Text);
        with PrimaryKeysQuery do
        //try
          {ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
          Prepare;
          Open;
          while OraQuery.Executing do
            Application.ProcessMessages; }
          if TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString then
          begin
            Result := Result + StringHolder.StringsByName['PrimaryKeysHeaderHtml'].Text;
            while not Eof and (TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
            begin
              if not ProgressDialog(Self).OnProgress then
                Exit;
              Application.ProcessMessages;
              Result := Result + Format(StringHolder.StringsByName['PrimaryKeyRowHtml'].Text, [
                FieldByName('CONSTRAINT_NAME').AsWideString, FieldByName('POSITION').AsWideString,
                FieldByName('COLUMN_NAME').AsWideString
                ]);
              Next;
            end;
            Result := Result + StringHolder.StringsByName['PrimaryKeysFooterHtml'].Text;
          end;
       { finally
          Close;
          UnPrepare;
          FreeAndNil(OraQuery);
        end; }
        { Foreign keys }

        with ForeignKeysQuery do
        {try
          ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
          Prepare;
          Open;
          while OraQuery.Executing do
            Application.ProcessMessages; }
          if TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString then
          begin
            Result := Result + StringHolder.StringsByName['ForeignKeysHeaderHtml'].Text;
            while not Eof and (TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
            begin
              if not ProgressDialog(Self).OnProgress then
                Exit;
              Application.ProcessMessages;
              Result := Result + Format(StringHolder.StringsByName['ForeignKeyRowHtml'].Text, [
                FieldByName('CONSTRAINT_NAME').AsWideString, FieldByName('POSITION').AsWideString,
                FieldByName('COLUMN_NAME').AsWideString,
                FieldByName('REF_COLUMN_NAME').AsWideString
                ]);
              Next;
            end;
            Result := Result + StringHolder.StringsByName['ForeignKeysFooterHtml'].Text;
          end;
        {finally
          Close;
          UnPrepare;
          FreeAndNil(OraQuery);
        end;}
        { Indexes }
        //IndexesQuery := CreateQuery(FSession, StringHolder.StringsByName['IndexesSQL'].Text);
        with IndexesQuery do
        {try
          ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
          Prepare;
          Open;
          while OraQuery.Executing do
            Application.ProcessMessages;  }
          if TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString then
          begin
            Result := Result + StringHolder.StringsByName['IndexesHeaderHtml'].Text;
            while not Eof and (TablesQuery.FieldByName('TABLE_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
            begin
              if not ProgressDialog(Self).OnProgress then
                Exit;
              Application.ProcessMessages;
              Result := Result + Format(StringHolder.StringsByName['IndexRowHtml'].Text, [
                FieldByName('INDEX_NAME').AsWideString, FieldByName('POSITION').AsWideString, FieldByName('COLUMN_NAME').AsWideString
                ]);
              Next;
            end;
            Result := Result + StringHolder.StringsByName['IndexesFooterHtml'].Text;
          end;
        {finally
          Close;
          UnPrepare;
          FreeAndNil(OraQuery);
        end;  }
        Next;
        Inc(i);
      end;
      Result := Result + StringHolder.StringsByName['SeparatorHtml'].Text;
      Inc(Chapter);
    end;
  finally
    TablesQuery.Close;
    TablesQuery.UnPrepare;
    FreeAndNil(TablesQuery);
    if Assigned(SynonymsQuery) then
    begin
      SynonymsQuery.Close;
      SynonymsQuery.UnPrepare;
      FreeAndNil(SynonymsQuery);
    end;
    if Assigned(PrivilegesQuery) then
    begin
      PrivilegesQuery.Close;
      PrivilegesQuery.UnPrepare;
      FreeAndNil(PrivilegesQuery);
    end;
    if Assigned(ColumnsQuery) then
    begin
      ColumnsQuery.Close;
      ColumnsQuery.UnPrepare;
      FreeAndNil(ColumnsQuery);
    end;
    if Assigned(PrimaryKeysQuery) then
    begin
      PrimaryKeysQuery.Close;
      PrimaryKeysQuery.UnPrepare;
      FreeAndNil(PrimaryKeysQuery);
    end;
    if Assigned(ForeignKeysQuery) then
    begin
      ForeignKeysQuery.Close;
      ForeignKeysQuery.UnPrepare;
      FreeAndNil(ForeignKeysQuery);
    end;
    if Assigned(IndexesQuery) then
    begin
      IndexesQuery.Close;
      IndexesQuery.UnPrepare;
      FreeAndNil(IndexesQuery);
    end;
  end;
end;

function TSchemaDocumentForm.GetViews(var Chapter: Integer): WideString;
var
  i: Integer;
  Role, Privileges: string;
  ViewsQuery, SynonymsQuery, PrivilegesQuery, ColumnsQuery: TOraQuery;
begin
  Result := Format(StringHolder.StringsByName['ChapterHeader'].Text, [Chapter, Chapter, Chapter, 'VIEWS']);

  ViewsQuery := CreateQuery(FSession, StringHolder.StringsByName['ViewsSQL'].Text);
  with ViewsQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while ViewsQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      { Open synonyms }
      SynonymsQuery := CreateQuery(FSession, StringHolder.StringsByName['ViewSynonymsSQL'].Text);
      with SynonymsQuery do
      begin
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;
      { Open privileges }
      PrivilegesQuery := CreateQuery(FSession, StringHolder.StringsByName['ViewPrivilegesSQL'].Text);
      with PrivilegesQuery do
      begin
        //ParamByName('P_TABLE_NAME').AsWideString := TablesQuery.FieldByName('TABLE_NAME').AsWideString;
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;
      { Open columns }
      ColumnsQuery := CreateQuery(FSession, StringHolder.StringsByName['ViewColumnsSQL'].Text);
      with ColumnsQuery do
      begin
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;

      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Application.ProcessMessages;
        Result := Result + Format(StringHolder.StringsByName['SubChapterHtml'].Text, [Chapter, i, Chapter, i, Chapter, i,
          FieldByName('VIEW_NAME').AsWideString]);
        if not FieldByName('COMMENTS').IsNull then
          Result := Result + Format(StringHolder.StringsByName['DescriptionHtml'].Text, [FieldByName('COMMENTS').AsWideString]);

        { Synonyms }
        with SynonymsQuery do
        if ViewsQuery.FieldByName('VIEW_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString then
        begin
          Result := Result + StringHolder.StringsByName['SynonymHeader'].Text;

          while not Eof and (ViewsQuery.FieldByName('VIEW_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
          begin
            if not ProgressDialog(Self).OnProgress then
              Exit;
            Application.ProcessMessages;
            Result := Result + Format(StringHolder.StringsByName['SynonymRowHtml'].Text, [
              FieldByName('SYNONYM_NAME').AsWideString]);
            Next;
          end;
        end;
        { View privileges }
        with PrivilegesQuery do
        if ViewsQuery.FieldByName('VIEW_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString then
        begin
          Result := Result + StringHolder.StringsByName['TabPrivsHeaderHtml'].Text;

          Role := FieldByName('GRANTEE').AsWideString;
          while not Eof and (ViewsQuery.FieldByName('VIEW_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
          begin
            if not ProgressDialog(Self).OnProgress then
              Exit;
            Application.ProcessMessages;
            Privileges := '';
            while not Eof and (Role = FieldByName('GRANTEE').AsWideString) and (ViewsQuery.FieldByName('VIEW_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
            begin
              if not ProgressDialog(Self).OnProgress then
                Exit;
              Application.ProcessMessages;
              if Privileges = '' then
                Privileges := FieldByName('PRIVILEGE').AsWideString
              else
                Privileges := Privileges + ', ' + FieldByName('PRIVILEGE').AsWideString;
              Next;
            end;
            Result := Result + Format(StringHolder.StringsByName['TabPrivsRowHtml'].Text, [
              Role, Privileges]);
            Role := FieldByName('GRANTEE').AsWideString;
            Next;
          end;
          Result := Result + StringHolder.StringsByName['TabPrivsFooterHtml'].Text;
        end;
        { View columns }
        with ColumnsQuery do
        if ViewsQuery.FieldByName('VIEW_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString then
        begin
          Result := Result + StringHolder.StringsByName['ViewColumnsHeaderHtml'].Text;

          while not Eof and (ViewsQuery.FieldByName('VIEW_NAME').AsWideString = FieldByName('TABLE_NAME').AsWideString) do
          begin
            if not ProgressDialog(Self).OnProgress then
              Exit;
            Application.ProcessMessages;
            Result := Result + Format(StringHolder.StringsByName['ViewColumnRowHtml'].Text, [
              FieldByName('COLUMN_ID').AsWideString, FieldByName('COLUMN_NAME').AsWideString,
              FieldByName('DATA_TYPE').AsWideString, FieldByName('NULLABLE').AsWideString,
              FieldByName('COMMENTS').AsWideString
              ]);
            Next;
          end;
          Result := Result + StringHolder.StringsByName['ColumnsFooterHtml'].Text;
        end;

        Next;
        Inc(i);
      end;
      Result := Result + StringHolder.StringsByName['SeparatorHtml'].Text;
      Inc(Chapter);
    end;
  finally
    ViewsQuery.Close;
    ViewsQuery.UnPrepare;
    FreeAndNil(ViewsQuery);
    if Assigned(SynonymsQuery) then
    begin
      SynonymsQuery.Close;
      SynonymsQuery.UnPrepare;
      FreeAndNil(SynonymsQuery);
    end;
    if Assigned(PrivilegesQuery) then
    begin
      PrivilegesQuery.Close;
      PrivilegesQuery.UnPrepare;
      FreeAndNil(PrivilegesQuery);
    end;
    if Assigned(ColumnsQuery) then
    begin
      ColumnsQuery.Close;
      ColumnsQuery.UnPrepare;
      FreeAndNil(ColumnsQuery);
    end;
  end;
end;

function TSchemaDocumentForm.GetFunctions(var Chapter: Integer): WideString;
var
  i: Integer;
  s: WideString;
  FunctionsQuery, OraQuery: TOraQuery;
begin
  FunctionsQuery := CreateQuery(FSession, StringHolder.StringsByName['FunctionsSQL'].Text);
  with FunctionsQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while FunctionsQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      Result := Format(StringHolder.StringsByName['ChapterHeader'].Text, [Chapter, Chapter, Chapter, 'FUNCTIONS']);
      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Application.ProcessMessages;
        { Source }
        s := '';
        OraQuery := CreateQuery(FSession, StringHolder.StringsByName['FuncProcSourceSQL'].Text);
        with OraQuery do
        try
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
          ParamByName('P_OBJECT_NAME').AsWideString := FunctionsQuery.FieldByName('FUNCTION_NAME').AsWideString;
          Prepare;
          Open;
          while OraQuery.Executing do
            Application.ProcessMessages;
          while not Eof do
          begin
            if not ProgressDialog(Self).OnProgress then
              Exit;
            Application.ProcessMessages;
            s := s + FieldByName('TEXT').AsWideString;
            Next;
          end;
          Result := Result + Format(StringHolder.StringsByName['FuncProcSourceHtml'].Text, [Chapter, i, Chapter, i, Chapter, i,
            FunctionsQuery.FieldByName('FUNCTION_NAME').AsWideString, s]);
        finally
          Close;
          UnPrepare;
          FreeAndNil(OraQuery);
        end;
        Next;
        Inc(i);
      end;
      Result := Result + StringHolder.StringsByName['SeparatorHtml'].Text;
      Inc(Chapter);
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(FunctionsQuery);
  end;
end;

function TSchemaDocumentForm.GetProcedures(var Chapter: Integer): WideString;
var
  i: Integer;
  s: WideString;
  ProceduresQuery, OraQuery: TOraQuery;
begin
  ProceduresQuery := CreateQuery(FSession, StringHolder.StringsByName['ProceduresSQL'].Text);
  with ProceduresQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while ProceduresQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      Result := Format(StringHolder.StringsByName['ChapterHeader'].Text, [Chapter, Chapter, Chapter, 'PROCEDURES']);
      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Application.ProcessMessages;
        { Source }
        s := '';
        OraQuery := CreateQuery(FSession, StringHolder.StringsByName['FuncProcSourceSQL'].Text);
        with OraQuery do
        try
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
          ParamByName('P_OBJECT_NAME').AsWideString := ProceduresQuery.FieldByName('PROCEDURE_NAME').AsWideString;
          Prepare;
          Open;
          while OraQuery.Executing do
            Application.ProcessMessages;
          while not Eof do
          begin
            if not ProgressDialog(Self).OnProgress then
              Exit;
            Application.ProcessMessages;
            s := s + FieldByName('TEXT').AsWideString;
            Next;
          end;
          Result := Result + Format(StringHolder.StringsByName['FuncProcSourceHtml'].Text, [Chapter, i, Chapter, i, Chapter, i,
            ProceduresQuery.FieldByName('PROCEDURE_NAME').AsWideString, s]);
        finally
          Close;
          UnPrepare;
          FreeAndNil(OraQuery);
        end;
        Next;
        Inc(i);
      end;
      Result := Result + StringHolder.StringsByName['SeparatorHtml'].Text;
      Inc(Chapter);
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(ProceduresQuery);
  end;
end;

function TSchemaDocumentForm.GetTriggers(var Chapter: Integer): WideString;
var
  i: Integer;
  OraQuery: TOraQuery;
begin
  OraQuery := CreateQuery(FSession, StringHolder.StringsByName['TriggersSQL'].Text);

  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while OraQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      Result := Format(StringHolder.StringsByName['ChapterHeader'].Text, [Chapter, Chapter, Chapter, 'TRIGGERS']);
      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Application.ProcessMessages;
        Result := Result + Format(StringHolder.StringsByName['TriggerHtml'].Text, [Chapter, i, Chapter, i, Chapter, i,
          FieldByName('TRIGGER_NAME').AsWideString, FieldByName('TRIGGER_NAME').AsWideString,
          FieldByName('DESCRIPTION').AsWideString, FieldByName('TRIGGER_BODY').AsWideString]);
        Next;
        Inc(i);
      end;
      Result := Result + StringHolder.StringsByName['SeparatorHtml'].Text;
      Inc(Chapter);
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

function TSchemaDocumentForm.GetSequences(var Chapter: Integer): WideString;
var
  i: Integer;
  OraQuery: TOraQuery;
begin
  OraQuery := CreateQuery(FSession, StringHolder.StringsByName['SequencesSQL'].Text);

  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while OraQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      Result := Format(StringHolder.StringsByName['ChapterHeader'].Text, [Chapter, Chapter, Chapter, 'SEQUENCES']);
      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Application.ProcessMessages;
        Result := Result + Format(StringHolder.StringsByName['SequenceHtml'].Text, [Chapter, i, Chapter, i, Chapter, i,
          FieldByName('SEQUENCE_NAME').AsWideString, FieldByName('INCREMENT_BY').AsWideString,
          FieldByName('LAST_NUMBER').AsWideString, FieldByName('MIN_VALUE').AsWideString,
          FieldByName('MAX_VALUE').AsWideString, FieldByName('CACHE_SIZE').AsWideString,
          FieldByName('CYCLE_FLAG').AsWideString, FieldByName('ORDER_FLAG').AsWideString]);
        Next;
        Inc(i);
      end;
      Result := Result + StringHolder.StringsByName['SeparatorHtml'].Text;
      Inc(Chapter);
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

function TSchemaDocumentForm.GetUsersAndPrivileges(var Chapter: Integer): WideString;
var
  i: Integer;
  Privileges, TableName, PrivType: string;
  OraQuery, RolesQuery: TOraQuery;
begin
  OraQuery := CreateQuery(FSession, StringHolder.StringsByName['UsersSQL'].Text);

  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while OraQuery.Executing do
      Application.ProcessMessages;
    if not IsEmpty then
    begin
      RolesQuery := CreateQuery(FSession, StringHolder.StringsByName['RoleTablesSQL'].Text);
      with RolesQuery do
      begin
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        Prepare;
        Open;
        while Executing do
          Application.ProcessMessages;
      end;

      Result := Format(StringHolder.StringsByName['ChapterHeader'].Text, [Chapter, Chapter, Chapter, 'USERS']);
      i := 1;
      while not Eof do
      begin
        if not ProgressDialog(Self).OnProgress then
          Exit;
        Application.ProcessMessages;

        with RolesQuery do
        //if OraQuery.FieldByName('USER_NAME').AsWideString = FieldByName('GRANTOR').AsWideString then
        begin
          Result := Result + Format(StringHolder.StringsByName['UserHtml'].Text, [Chapter, i, Chapter, i, Chapter, i,
            OraQuery.FieldByName('USER_NAME').AsWideString]);

          while not Eof and (OraQuery.FieldByName('USER_NAME').AsWideString = FieldByName('GRANTOR').AsWideString) do
          begin

            Result := Result + Format(StringHolder.StringsByName['RoleTableHeaderHtml'].Text, [FieldByName('PRIVTYPE').AsWideString]);

            PrivType := FieldByName('PRIVTYPE').AsWideString;
            while not Eof and (OraQuery.FieldByName('USER_NAME').AsWideString = FieldByName('GRANTOR').AsWideString) and
              (PrivType = FieldByName('PRIVTYPE').AsWideString) do
            begin

              Privileges := '';
              TableName := FieldByName('TABLE_NAME').AsWideString;
              while not Eof and (OraQuery.FieldByName('USER_NAME').AsWideString = FieldByName('GRANTOR').AsWideString)
                and (TableName = FieldByName('TABLE_NAME').AsWideString) do
              begin
                if not ProgressDialog(Self).OnProgress then
                  Exit;
                Application.ProcessMessages;

                if Privileges = '' then
                  Privileges := FieldByName('PRIVILEGE').AsWideString
                else
                  Privileges := Privileges + ', ' + FieldByName('PRIVILEGE').AsWideString;
                Next;
              end;
              Result := Result + Format(StringHolder.StringsByName['RolePrivsRowHtml'].Text, [
                TableName, Privileges]);


            end;
            Result := Result + StringHolder.StringsByName['RoleTableFooterHtml'].Text;
          end;


          Inc(i);

        end;

        Next;
      end;
      Result := Result + StringHolder.StringsByName['SeparatorHtml'].Text;
      Inc(Chapter);
    end;
  finally
    OraQuery.Close;
    OraQuery.UnPrepare;
    FreeAndNil(OraQuery);
    if Assigned(RolesQuery) then
    begin
      RolesQuery.Close;
      RolesQuery.UnPrepare;
      FreeAndNil(RolesQuery);
    end;
  end;
end;

function TSchemaDocumentForm.GetFooter: WideString;
begin
  Result := StringHolder.StringsByName['FooterHtml'].Text;
end;

function TSchemaDocumentForm.GetDocument: WideString;
var
  Chapter: Integer;
begin
  //Screen.Cursor := crSQLWait;
  MainForm.OnProgress := True;
  ProgressDialog(Self).Open(0, 12, True, True);
  try
    ProgressDialog(Self).InformationText := 'Adding header...';
    Result := GetHeader;
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding styles...';
    Result := Result + GetStyles;
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding title...';
    Result := Result + GetTitle;
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding table of contents...';
    Result := Result + GetTableOfContents;
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding tables...';
    Chapter := 1;
    Result := Result + GetTables(Chapter);
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding views...';
    Result := Result + GetViews(Chapter);
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding functions...';
    Result := Result + GetFunctions(Chapter);
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding procedures...';
    Result := Result + GetProcedures(Chapter);
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding triggers...';
    Result := Result + GetTriggers(Chapter);
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding sequences...';
    Result := Result + GetSequences(Chapter);
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding users and privileges...';
    Result := Result + GetUsersAndPrivileges(Chapter);
    if not ProgressDialog(Self).OnProgress then
      Exit;
    ProgressDialog(Self).InformationText := 'Adding footer...';
    Result := Result + GetFooter;
  finally
    ProgressDialog(Self).Free;
    MainForm.OnProgress := False;
    //Screen.Cursor := crDefault;
  end;
end;

procedure StringToStreamBOM(const S: WideString; const Stm: TStream;
  const Encoding: TEncoding);
var
  Bytes: TBytes;
  Preamble: TBytes;
begin
  Assert(Assigned(Encoding));
  Bytes := Encoding.GetBytes(S);
  Preamble := Encoding.GetPreamble;
  if Length(Preamble) > 0 then
    Stm.WriteBuffer(Preamble[0], Length(Preamble));
  Stm.WriteBuffer(Bytes[0], Length(Bytes));
end;

procedure TSchemaDocumentForm.LoadFromStream(const Stream: TStream);
var
  PersistStreamInit: IPersistStreamInit;
  StreamAdapter: IStream;
begin
  if not Assigned(WebBrowser.Document) then
    Exit;
  // Get IPersistStreamInit interface on document object
  if WebBrowser.Document.QueryInterface(
    IPersistStreamInit, PersistStreamInit
  ) = S_OK then
  begin
    // Clear document
    if PersistStreamInit.InitNew = S_OK then
    begin
      // Get IStream interface on stream
      StreamAdapter:= TStreamAdapter.Create(Stream);
      // Load data from Stream into WebBrowser
      PersistStreamInit.Load(StreamAdapter);
    end;
  end;
end;

procedure TSchemaDocumentForm.NavigateToURL(const URL: WideString);
  // ---------------------------------------------------------------------------
  procedure Pause(const ADelay: Cardinal);
  var
    StartTC: Cardinal;  // tick count when routine called
  begin
    StartTC := Winapi.Windows.GetTickCount;
    repeat
      Application.ProcessMessages;
    until Int64(Winapi.Windows.GetTickCount) - Int64(StartTC) >= ADelay;
  end;
  // ---------------------------------------------------------------------------
var
  Flags: OleVariant;  // flags that determine action
begin
  // Don't record in history
  Flags := navNoHistory;
  if AnsiStartsText('res://', URL) or AnsiStartsText('file://', URL)
    or AnsiStartsText('about:', URL) or AnsiStartsText('javascript:', URL)
    or AnsiStartsText('mailto:', URL) then
    // don't use cache for local files
    Flags := Flags or navNoReadFromCache or navNoWriteToCache;
  // Do the navigation and wait for it to complete
  WebBrowser.Navigate(URL, Flags);
  while WebBrowser.ReadyState <> READYSTATE_COMPLETE do
    Pause(5);
end;

procedure TSchemaDocumentForm.LoadFromString(const HTML: WideString);
var
  HTMLStm: TMemoryStream;
begin
  Assert(Assigned(TEncoding.Default));
  HTMLStm := TMemoryStream.Create;
  try
    StringToStreamBOM(HTML, HTMLStm, TEncoding.Default);
    HTMLStm.Position := 0;
    NavigateToURL('about:blank');
    LoadFromStream(HTMLStm);
  finally
    HTMLStm.Free;
  end;
end;

end.
