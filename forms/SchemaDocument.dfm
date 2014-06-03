object SchemaDocumentForm: TSchemaDocumentForm
  Left = 0
  Top = 0
  Caption = 'Schema Document'
  ClientHeight = 416
  ClientWidth = 806
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object JvStatusBar1: TJvStatusBar
    Left = 0
    Top = 397
    Width = 806
    Height = 19
    Panels = <>
  end
  object DocumentPanel: TPanel
    Left = 0
    Top = 27
    Width = 806
    Height = 370
    Align = alClient
    BevelOuter = bvLowered
    Caption = 'DocumentPanel'
    TabOrder = 1
    object WebBrowser: TWebBrowser
      Left = 1
      Top = 1
      Width = 804
      Height = 368
      Align = alClient
      PopupMenu = PopupActionBar
      TabOrder = 0
      ControlData = {
        4C00000019530000092600000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126209000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    TabOrder = 2
    object Toolbar1Bevel: TBevel
      AlignWithMargins = True
      Left = 32
      Top = 4
      Width = 4
      Height = 19
      Margins.Left = 6
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alLeft
      Shape = bsLeftLine
    end
    object ToolBar: TToolBar
      Left = 2
      Top = 2
      Width = 24
      Height = 23
      Align = alLeft
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'ToolBar'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = ImagesDataModule.ImageList
      TabOrder = 0
      object WordWrapToolButton: TToolButton
        Left = 0
        Top = 0
        Action = SaveAction
      end
    end
    object ToolBar1: TToolBar
      Left = 39
      Top = 2
      Width = 48
      Height = 23
      Align = alLeft
      ButtonHeight = 23
      ButtonWidth = 24
      Caption = 'ToolBar'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = ImagesDataModule.ImageList
      TabOrder = 1
      object ToolButton4: TToolButton
        Left = 0
        Top = 0
        Action = PrinterSettingsAction
      end
      object ToolButton5: TToolButton
        Left = 24
        Top = 0
        Action = PrintAction
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object StringHolder: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'HeaderHtml'
        Strings.Strings = (
          '<html><body>')
      end
      item
        Name = 'StylesHtml'
        Strings.Strings = (
          '<style>'
          'table.prettytable { '
          'margin: 1em 1em 1em 2em; '
          'background: whitesmoke; '
          'border-collapse: collapse; '
          '} '
          'table.prettytable th, table.prettytable td { '
          'border: 1px silver solid; '
          'padding: 0.2em; '
          'font-size:0.8em;'
          '} '
          'table.prettytable th { '
          'background: gainsboro; '
          'text-align: left; '
          'font-size:0.8em;'
          '} '
          'table.prettytable caption { '
          'margin-left: inherit; '
          'margin-right: inherit; '
          '} '
          'div.toc     { margin-left: 0em; } '
          'div.toc2     { margin-left: 1em; } '
          'body { '
          'padding: 2em 1em 2em 2em; '
          'margin: 0; '
          'font-family: Verdana, Arial, Helvetica, sans-serif;'
          'color: black; '
          'background: white; '
          'font-size:0.8em;'
          '} '
          'h1, h2, h3 { color: #005A9C; background: white } '
          'h1 { font: 170% sans-serif } '
          'h2 { font: 140% sans-serif } '
          'h3 { font: 120% sans-serif } '
          'h4 { font: bold 100% sans-serif; margin-left:2em; } '
          'h5 { font: italic 100% sans-serif } '
          'h6 { font: small-caps 100% sans-serif } '
          'p { margin-left:4em; } '
          'pre { margin-left:4em; } '
          '</style>')
      end
      item
        Name = 'TitleHtml'
        Strings.Strings = (
          '<h1>SCHEMA DOCUMENT</h1>'
          '<h2>%s@%s, %s</h2>')
      end
      item
        Name = 'SeparatorHtml'
        Strings.Strings = (
          '<hr/>')
      end
      item
        Name = 'TableOfContentsHeaderHtml'
        Strings.Strings = (
          '<h2>TABLE OF CONTENTS</h2>'
          '<div class="toc">'
          '')
      end
      item
        Name = 'ContentsHeaderHtml'
        Strings.Strings = (
          '%d <a href="#sec-%d">%sS</a><br/>'
          '<div class="toc2">')
      end
      item
        Name = 'ContentsRowHtml'
        Strings.Strings = (
          '%d.%d <a href="#sec-%d.%d">%s</a><br/>')
      end
      item
        Name = 'ContentsFooterHtml'
        Strings.Strings = (
          '</div>')
      end
      item
        Name = 'TablesSQL'
        Strings.Strings = (
          'SELECT t.table_name, tc.comments'
          '  FROM all_tables t,  all_tab_comments tc'
          'WHERE t.owner = :p_owner'
          '  AND tc.owner (+) = t.owner'
          '  AND tc.table_name (+) = t.table_name'
          
            '  AND t.table_name NOT IN (SELECT mview_name FROM all_mviews WHE' +
            'RE owner = :p_owner)'
          'ORDER BY 1')
      end
      item
        Name = 'ViewsSQL'
        Strings.Strings = (
          'SELECT t.view_name, tc.comments'
          '  FROM all_views t,  all_tab_comments tc'
          'WHERE t.owner = :P_OWNER'
          '  AND tc.owner (+) = t.owner'
          '  AND tc.table_name (+) = t.view_name'
          ' UNION ALL '
          'SELECT t.mview_name, tc.comments'
          '  FROM all_mviews t,  all_tab_comments tc'
          'WHERE t.owner = :P_OWNER'
          '  AND tc.owner (+) = t.owner'
          '  AND tc.table_name (+) = t.mview_name'
          'ORDER BY 1')
      end
      item
        Name = 'FunctionsSQL'
        Strings.Strings = (
          'SELECT  DISTINCT NAME function_name'
          '    FROM all_source'
          '   WHERE TYPE = '#39'FUNCTION'#39
          '     AND owner = :P_OWNER'
          'ORDER BY 1')
      end
      item
        Name = 'ProceduresSQL'
        Strings.Strings = (
          'SELECT DISTINCT NAME procedure_name'
          '    FROM all_source'
          '   WHERE TYPE = '#39'PROCEDURE'#39
          '     AND owner = :P_OWNER'
          'ORDER BY 1')
      end
      item
        Name = 'TriggersSQL'
        Strings.Strings = (
          'SELECT trigger_name, description, trigger_body'
          '  FROM all_triggers'
          'WHERE base_object_type = '#39'TABLE'#39
          '      AND owner = :p_owner '
          'ORDER BY 1')
      end
      item
        Name = 'SequencesSQL'
        Strings.Strings = (
          'SELECT   sequence_name, min_value, '
          
            '               DECODE(max_value, 1E27,'#39'9999999999999999999999999' +
            '99'#39', max_value)  max_value, increment_by, last_number,'
          '                cache_size,'
          '               DECODE(cycle_flag, '#39'N'#39', '#39'No'#39', '#39'Yes'#39') cycle_flag,'
          '               DECODE(order_flag, '#39'N'#39', '#39'No'#39', '#39'Yes'#39') order_flag'
          '          FROM all_sequences'
          '        WHERE  sequence_owner = :p_owner '
          'ORDER BY 1'
          ''
          ''
          '')
      end
      item
        Name = 'UsersSQL'
        Strings.Strings = (
          'SELECT DISTINCT grantor user_name'
          'FROM (SELECT p.grantor'
          '  FROM all_tab_privs p, all_tables t'
          '  WHERE p.table_name = t.table_name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          'SELECT p.grantor'
          '  FROM all_tab_privs p, all_views t'
          '  WHERE p.table_name = t.view_name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          'SELECT p.grantor'
          '  FROM all_tab_privs p, (SELECT DISTINCT owner, name'
          '                           FROM all_source'
          '                          WHERE type = '#39'FUNCTION'#39') t'
          '  WHERE p.table_name = t.name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          'SELECT p.grantor'
          '  FROM all_tab_privs p, (SELECT DISTINCT owner, name'
          '                           FROM all_source'
          '                          WHERE type = '#39'PROCEDURE'#39') t'
          '  WHERE p.table_name = t.name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          'SELECT p.grantor'
          '  FROM all_tab_privs p, (SELECT DISTINCT owner, name'
          '                           FROM all_source'
          '                          WHERE type = '#39'PACKAGE'#39') t'
          '  WHERE p.table_name = t.name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          'SELECT p.grantor'
          '  FROM all_tab_privs p, all_sequences t'
          '  WHERE p.table_name = t.sequence_name'
          '    AND t.sequence_owner = :p_owner)'
          'ORDER BY 1'
          ''
          '/*'
          'SELECT   username user_name'
          '    FROM dba_users    '
          '   WHERE :P_OWNER = :P_OWNER'
          'ORDER BY 1'
          '*/')
      end
      item
        Name = 'TableOfContentsFooterHtml'
        Strings.Strings = (
          '</div>'
          '<hr/>')
      end
      item
        Name = 'ChapterHeader'
        Strings.Strings = (
          '<h2><a id="sec-%d" name="sec-%d"/>%d %s</h2>')
      end
      item
        Name = 'SubChapterHtml'
        Strings.Strings = (
          '<h3><a id="sec-%d.%d" name="sec-%d.%d"/>%d.%d %s</h3>')
      end
      item
        Name = 'DescriptionHtml'
        Strings.Strings = (
          '<h4>Description</h4>'
          '<p>%s</p>')
      end
      item
        Name = 'SynonymHeader'
        Strings.Strings = (
          '<h4>Synonyms</h4>')
      end
      item
        Name = 'TableSynonymsSQL'
        Strings.Strings = (
          
            'SELECT s.table_name, s.synonym_name || '#39' ('#39' || DECODE(s.owner, '#39 +
            'PUBLIC'#39', '#39'PUBLIC'#39', '#39'PRIVATE'#39') || '#39')'#39' synonym_name'
          '  FROM all_synonyms s, all_tables t'
          ' WHERE s.table_name = t.table_name'
          '   AND t.owner = :p_owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'ORDER BY 1, 2')
      end
      item
        Name = 'SynonymRowHtml'
        Strings.Strings = (
          '<p>%s</p>')
      end
      item
        Name = 'TabPrivsHeaderHtml'
        Strings.Strings = (
          '<h4>Privileges</h4>'
          '<table class="prettytable">'
          '<tr><th>Role</th><th>Privilege</th></tr>')
      end
      item
        Name = 'TablePrivilegesSQL'
        Strings.Strings = (
          'SELECT p.table_name, p.grantee, p.privilege'
          '  FROM all_tab_privs p, all_tables t'
          ' WHERE p.grantor = :p_owner'
          '   AND p.table_name = t.table_name'
          '   AND t.owner = :p_owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          '--  WHERE table_name = :p_table_name'
          'ORDER BY 1, 2, 3')
      end
      item
        Name = 'TabPrivsRowHtml'
        Strings.Strings = (
          '<tr><td>%s</td><td>%s</td></tr>')
      end
      item
        Name = 'TabPrivsFooterHtml'
        Strings.Strings = (
          '</table>')
      end
      item
        Name = 'TableColumnsHeaderHtml'
        Strings.Strings = (
          '<h4>Columns</h4>'
          '<table class="prettytable">'
          '<tr><th>ID</th><th>Column Name</th><th>Data Type</th><th>Pk</th>'
          '<th>Nullable</th><th>Default</th><th>Comments</th></tr>')
      end
      item
        Name = 'TableColumnsSQL'
        Strings.Strings = (
          
            'SELECT  s.table_name,  s.column_id, RPAD (s.column_name, 30) col' +
            'umn_name,'
          '         RPAD (   s.data_type'
          '               || DECODE (s.data_type,'
          
            '                          '#39'VARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_len' +
            'gth) || '#39')'#39','
          
            '                          '#39'RAW'#39', '#39'('#39' || TO_CHAR (s.data_length) ' +
            '|| '#39')'#39','
          
            '                          '#39'CHAR'#39', '#39'('#39' || TO_CHAR (s.data_length)' +
            ' || '#39')'#39','
          
            '                          '#39'NCHAR'#39', '#39'('#39' || TO_CHAR (s.data_length' +
            ') || '#39')'#39','
          
            '                          '#39'NVARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_le' +
            'ngth) || '#39')'#39','
          '                          '#39'NUMBER'#39', DECODE (s.data_precision,'
          '                                            '#39#39', '#39#39','
          
            '                                            '#39'('#39' || TO_CHAR (s.da' +
            'ta_precision) || DECODE(s.data_scale, '#39'0'#39', '#39#39', '#39', '#39' || TO_CHAR (' +
            's.data_scale)) || '#39')'#39
          '                                           )'
          '                         ),'
          '               14'
          '              ) data_type,'
          
            '         RPAD(co.pk, 1) pk, DECODE (s.nullable, '#39'Y'#39', '#39'Null'#39', '#39'No' +
            't null'#39') nullable, s.data_default,'
          '         c.comments'
          '    FROM all_tables t,'
          '         all_col_comments c,'
          '         all_tab_columns s,'
          '         (SELECT a.table_name, b.position pk, b.column_name'
          '            FROM all_constraints a, all_cons_columns b'
          '           WHERE --a.table_name = :p_table_name'
          '             --AND'
          '             a.constraint_name = b.constraint_name'
          '             AND a.constraint_type = '#39'P'#39
          '             AND a.owner = :p_owner'
          '             AND b.owner = :p_owner) co'
          '   WHERE s.table_name = t.table_name'
          '     AND t.owner = :p_owner'
          '     AND c.table_name = s.table_name'
          '     AND c.column_name = s.column_name'
          '    -- AND s.table_name = :p_table_name'
          '     AND co.table_name(+) = c.table_name'
          '     AND co.column_name(+) = c.column_name'
          '     AND s.owner = :p_owner'
          '     AND c.owner = :p_owner'
          
            '     AND t.table_name NOT IN (SELECT mview_name FROM all_mviews)' +
            ' '
          'ORDER BY 1, 2')
      end
      item
        Name = 'TableColumnRowHtml'
        Strings.Strings = (
          
            '<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%' +
            's</td><td>%s</td></tr>')
      end
      item
        Name = 'ColumnsFooterHtml'
        Strings.Strings = (
          '</table>')
      end
      item
        Name = 'PrimaryKeysHeaderHtml'
        Strings.Strings = (
          '<h4>Primary Keys</h4>'
          '<table class="prettytable">'
          
            '<tr><th>Constraint Name</th><th>Position</th><th>Column Name</th' +
            '></tr>')
      end
      item
        Name = 'PrimaryKeyRowHtml'
        Strings.Strings = (
          '<tr><td>%s</td><td>%s</td><td>%s</td></tr>')
      end
      item
        Name = 'PrimaryKeysSQL'
        Strings.Strings = (
          
            'SELECT a.table_name, a.constraint_name, b.position, b.column_nam' +
            'e'
          '        FROM all_tables t, all_constraints a, all_cons_columns b'
          '       WHERE a.constraint_name = b.constraint_name'
          '         AND a.constraint_type = '#39'P'#39
          '         AND a.table_name = t.table_name'
          '         AND t.owner = :p_owner'
          '         AND a.owner = :p_owner'
          '         AND b.owner = :p_owner'
          
            '         AND t.table_name NOT IN (SELECT mview_name FROM all_mvi' +
            'ews) '
          'ORDER BY 1, 3')
      end
      item
        Name = 'PrimaryKeysFooterHtml'
        Strings.Strings = (
          '</table>')
      end
      item
        Name = 'ForeignKeysHeaderHtml'
        Strings.Strings = (
          '<h4>Foreign Keys</h4>'
          '<table class="prettytable">'
          
            '<tr><th>Constraint Name</th><th>Position</th><th>Column Name</th' +
            '><th>Ref. Column Name</th></tr>')
      end
      item
        Name = 'ForeignKeyRowHtml'
        Strings.Strings = (
          '<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>')
      end
      item
        Name = 'ForeignKeysSQL'
        Strings.Strings = (
          
            'SELECT a.table_name, a.constraint_name, b.position, b.column_nam' +
            'e,'
          
            '             c.table_name || '#39'.'#39' || c.column_name ref_column_nam' +
            'e'
          
            '        FROM all_tables t, all_constraints a, all_cons_columns b' +
            ', all_cons_columns c'
          '       WHERE c.POSITION = b.POSITION'
          '         AND a.constraint_name = b.constraint_name'
          '         AND a.r_constraint_name = c.constraint_name'
          '         AND a.constraint_type = '#39'R'#39
          '         AND a.table_name =t.table_name'
          '         AND t.owner = :p_owner'
          '         AND a.owner = :p_owner'
          '         AND b.owner = :p_owner'
          '         AND c.owner = :p_owner'
          
            '         AND t.table_name NOT IN (SELECT mview_name FROM all_mvi' +
            'ews) '
          'ORDER BY 1, 2, 3')
      end
      item
        Name = 'ForeignKeysFooterHtml'
        Strings.Strings = (
          '</table>')
      end
      item
        Name = 'TriggerHeaderHtml'
        Strings.Strings = (
          '<h2><a id="sec-5" name="sec-5"/>5 TRIGGERS</h2>')
      end
      item
        Name = 'TriggerHtml'
        Strings.Strings = (
          '<h3><a id="sec-%d.%d" name="sec-%d.%d"/>%d.%d %s</h3>'
          '<h4>Description</h4>'
          '<pre>'
          'CREATE OR REPLACE TRIGGER %s'
          '%s'
          '</pre>')
      end
      item
        Name = 'FooterHtml'
        Strings.Strings = (
          '</body></html>')
      end
      item
        Name = 'IndexesHeaderHtml'
        Strings.Strings = (
          '<h4>Indexes</h4>'
          '<table class="prettytable">'
          
            '<tr><th>Index Name</th><th>Position</th><th>Column Name</th></tr' +
            '>')
      end
      item
        Name = 'IndexRowHtml'
        Strings.Strings = (
          '<tr><td>%s</td><td>%s</td><td>%s</td></tr>')
      end
      item
        Name = 'IndexesSQL'
        Strings.Strings = (
          
            'SELECT b.table_name, a.index_name, b.column_position position, b' +
            '.column_name'
          '   FROM all_tables t, all_indexes a, all_ind_columns b'
          ' WHERE a.index_name = b.index_name'
          '      AND b.table_name = t.table_name'
          '      AND t.owner = :p_owner'
          '      AND a.owner = :p_owner'
          
            '      AND t.table_name NOT IN (SELECT mview_name FROM all_mviews' +
            ') '
          'ORDER BY 1, 2, 3')
      end
      item
        Name = 'IndexesFooterHtml'
        Strings.Strings = (
          '</table>')
      end
      item
        Name = 'ViewColumnsSQL'
        Strings.Strings = (
          'SELECT  s.table_name,  s.column_id, s.column_name,'
          '         RPAD (   s.data_type'
          '               || DECODE (s.data_type,'
          
            '                          '#39'VARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_len' +
            'gth) || '#39')'#39','
          
            '                          '#39'RAW'#39', '#39'('#39' || TO_CHAR (s.data_length) ' +
            '|| '#39')'#39','
          
            '                          '#39'CHAR'#39', '#39'('#39' || TO_CHAR (s.data_length)' +
            ' || '#39')'#39','
          
            '                          '#39'NCHAR'#39', '#39'('#39' || TO_CHAR (s.data_length' +
            ') || '#39')'#39', '
          
            '                          '#39'NVARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_le' +
            'ngth) || '#39')'#39', '
          '                          '#39'NUMBER'#39', DECODE (s.data_precision,'
          '                                            '#39#39', '#39#39','
          
            '                                            '#39'('#39' || TO_CHAR (s.da' +
            'ta_precision) || '#39')'#39
          '                                           )'
          '                         ),'
          '               14'
          '              ) data_type,'
          '         DECODE (s.nullable, '#39'Y'#39', '#39'Null'#39', '#39'Not null'#39') nullable,'
          '         c.comments'
          '    FROM all_views v, all_col_comments c,'
          '         all_tab_columns s'
          '   WHERE s.table_name = v.view_name'
          '     AND v.owner = :p_owner'
          '     AND s.owner = :p_owner'
          '     AND c.table_name = s.table_name'
          '     AND c.column_name = s.column_name'
          '     AND c.owner = :p_owner'
          '     AND s.owner = :p_owner'
          ' UNION ALL '
          'SELECT  s.table_name,  s.column_id, s.column_name,'
          '         RPAD (   s.data_type'
          '               || DECODE (s.data_type,'
          
            '                          '#39'VARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_len' +
            'gth) || '#39')'#39','
          
            '                          '#39'RAW'#39', '#39'('#39' || TO_CHAR (s.data_length) ' +
            '|| '#39')'#39','
          
            '                          '#39'CHAR'#39', '#39'('#39' || TO_CHAR (s.data_length)' +
            ' || '#39')'#39','
          
            '                          '#39'NCHAR'#39', '#39'('#39' || TO_CHAR (s.data_length' +
            ') || '#39')'#39', '
          
            '                          '#39'NVARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_le' +
            'ngth) || '#39')'#39', '
          '                          '#39'NUMBER'#39', DECODE (s.data_precision,'
          '                                            '#39#39', '#39#39','
          
            '                                            '#39'('#39' || TO_CHAR (s.da' +
            'ta_precision) || '#39')'#39
          '                                           )'
          '                         ),'
          '               14'
          '              ) data_type,'
          '         DECODE (s.nullable, '#39'Y'#39', '#39'Null'#39', '#39'Not null'#39') nullable,'
          '         c.comments'
          '    FROM all_mviews v, all_col_comments c,'
          '         all_tab_columns s'
          '   WHERE s.table_name = v.mview_name'
          '     AND v.owner = :p_owner'
          '     AND s.owner = :p_owner'
          '     AND c.table_name = s.table_name'
          '     AND c.column_name = s.column_name'
          '     AND c.owner = :p_owner'
          '     AND s.owner = :p_owner'
          'ORDER BY 1, 2')
      end
      item
        Name = 'ViewColumnRowHtml'
        Strings.Strings = (
          '<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>')
      end
      item
        Name = 'FuncProcSourceSQL'
        Strings.Strings = (
          'SELECT text'
          '  FROM all_source'
          ' WHERE name = :p_object_name'
          '   AND owner = :p_owner'
          'ORDER BY line')
      end
      item
        Name = 'FuncProcSourceHtml'
        Strings.Strings = (
          '<h3><a id="sec-%d.%d" name="sec-%d.%d"/>%d.%d %s</h3>'
          '<h4>Source</h4>'
          '<pre>'
          '%s'
          '</pre>')
      end
      item
        Name = 'ViewColumnsHeaderHtml'
        Strings.Strings = (
          '<h4>Columns</h4>'
          '<table class="prettytable">'
          
            '<tr><th>ID</th><th>Column Name</th><th>Data Type</th><th>Nullabl' +
            'e</th><th>Comments</th></tr>')
      end
      item
        Name = 'SequenceHtml'
        Strings.Strings = (
          '<h3><a id="sec-%d.%d" name="sec-%d.%d"/>%d.%d %s</h3>'
          '<h4>Description</h4>'
          '<p>'
          'Increment By: %s<br/>'
          'Last Number: %s<br/>'
          'Min Value: %s<br/>'
          'Max Value: %s<br/>  '
          'Cache Size: %s<br/>'
          'Cycle: %s<br/>'
          'Order: %s'
          '</p>')
      end
      item
        Name = 'UserHtml'
        Strings.Strings = (
          '<h3><a id="sec-%d.%d" name="sec-%d.%d"/>%d.%d %s</h3>')
      end
      item
        Name = 'RoleTablesSQL'
        Strings.Strings = (
          
            'SELECT 1, '#39'Table'#39' privtype, p.grantor, p.grantee, p.table_name, ' +
            'p.privilege'
          '  FROM all_tab_privs p, all_tables t'
          '  WHERE p.table_name = t.table_name'
          '    AND t.owner = :p_owner'
          '    AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION ALL'
          
            'SELECT 2, '#39'View'#39', p.grantor, p.grantee, p.table_name, p.privileg' +
            'e'
          '  FROM all_tab_privs p, all_views t'
          '  WHERE p.table_name = t.view_name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          
            'SELECT 2, '#39'View'#39', p.grantor, p.grantee, p.table_name, p.privileg' +
            'e'
          '  FROM all_tab_privs p, all_mviews t'
          '  WHERE p.table_name = t.mview_name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          
            'SELECT 3, '#39'Function'#39', p.grantor, p.grantee, p.table_name, p.priv' +
            'ilege'
          '  FROM all_tab_privs p, (SELECT DISTINCT owner, name'
          '                           FROM all_source'
          '                          WHERE type = '#39'FUNCTION'#39') t'
          '  WHERE p.table_name = t.name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          
            'SELECT 4, '#39'Procedure'#39', p.grantor, p.grantee, p.table_name, p.pri' +
            'vilege'
          '  FROM all_tab_privs p, (SELECT DISTINCT owner, name'
          '                           FROM all_source'
          '                          WHERE type = '#39'PROCEDURE'#39') t'
          '  WHERE p.table_name = t.name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          
            'SELECT 5, '#39'Package'#39', p.grantor, p.grantee, p.table_name, p.privi' +
            'lege'
          '  FROM all_tab_privs p, (SELECT DISTINCT owner, name'
          '                           FROM all_source'
          '                          WHERE type = '#39'PACKAGE'#39') t'
          '  WHERE p.table_name = t.name'
          '    AND t.owner = :p_owner'
          'UNION ALL'
          
            'SELECT 6, '#39'Sequence'#39', p.grantor, p.grantee, p.table_name, p.priv' +
            'ilege'
          '  FROM all_tab_privs p, all_sequences t'
          '  WHERE p.table_name = t.sequence_name'
          '    AND t.sequence_owner = :p_owner'
          ' ORDER BY 3, 1, 4, 5, 6'
          '')
      end
      item
        Name = 'RoleTableHeaderHtml'
        Strings.Strings = (
          '<h4>%s Privileges</h4>'
          '<table class="prettytable">'
          '<tr><th>Object</th><th>Privilege</th></tr>')
      end
      item
        Name = 'RoleTableFooterHtml'
        Strings.Strings = (
          '</table>')
      end
      item
        Name = 'RolePrivsRowHtml'
        Strings.Strings = (
          '<tr><td>%s</td><td>%s</td></tr>')
      end
      item
        Name = 'RolePrivsFooterHtml'
        Strings.Strings = (
          '</table>')
      end
      item
        Name = 'ViewSynonymsSQL'
        Strings.Strings = (
          
            'SELECT s.table_name, s.synonym_name || '#39' ('#39' || DECODE(s.owner, '#39 +
            'PUBLIC'#39', '#39'PUBLIC'#39', '#39'PRIVATE'#39') || '#39')'#39' synonym_name'
          '  FROM all_synonyms s, all_views v'
          ' WHERE s.owner = :p_owner'
          '     AND s.table_name = v.view_name'
          '     AND v.owner = :p_owner'
          ' UNION ALL '
          
            'SELECT s.table_name, s.synonym_name || '#39' ('#39' || DECODE(s.owner, '#39 +
            'PUBLIC'#39', '#39'PUBLIC'#39', '#39'PRIVATE'#39') || '#39')'#39' synonym_name'
          '  FROM all_synonyms s, all_mviews v'
          ' WHERE s.owner = :p_owner'
          '     AND s.table_name = v.mview_name'
          '     AND v.owner = :p_owner'
          'ORDER BY 1, 2')
      end
      item
        Name = 'ViewPrivilegesSQL'
        Strings.Strings = (
          'SELECT p.table_name, p.grantee, p.privilege'
          '  FROM all_tab_privs p, all_views v'
          ' WHERE p.grantor = :p_owner'
          '       AND p.table_name = v.view_name'
          '       AND v.owner = :p_owner'
          ' UNION ALL '
          'SELECT p.table_name, p.grantee, p.privilege'
          '  FROM all_tab_privs p, all_mviews v'
          ' WHERE p.grantor = :p_owner'
          '       AND p.table_name = v.mview_name'
          '       AND v.owner = :p_owner'
          'ORDER BY 1, 2, 3')
      end>
    Left = 92
    Top = 124
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 288
    Top = 176
    object SaveAction: TAction
      Caption = 'Save as...'
      ImageIndex = 169
      OnExecute = SaveActionExecute
    end
    object PrinterSettingsAction: TAction
      Caption = 'Printer Settings...'
      Hint = 'Printer settings'
      ImageIndex = 151
      OnExecute = PrinterSettingsActionExecute
    end
    object PrintAction: TAction
      Caption = 'Print...'
      Hint = 'Print'
      ImageIndex = 150
      OnExecute = PrintActionExecute
    end
  end
  object PopupActionBar: TPopupActionBar
    Images = ImagesDataModule.ImageList
    Left = 460
    Top = 156
    object SaveAction1: TMenuItem
      Action = SaveAction
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PrinterSettings1: TMenuItem
      Action = PrinterSettingsAction
    end
    object Print1: TMenuItem
      Action = PrintAction
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Close1: TMenuItem
      Caption = 'Close'
      Hint = 'Close'
    end
  end
end
