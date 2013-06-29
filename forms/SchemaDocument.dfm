object SchemaDocumentForm: TSchemaDocumentForm
  Left = 0
  Top = 0
  Caption = 'Schema Document'
  ClientHeight = 416
  ClientWidth = 806
  Color = clBtnFace
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
    ExplicitTop = 401
    ExplicitWidth = 1054
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
    ExplicitHeight = 374
    object WebBrowser: TWebBrowser
      Left = 1
      Top = 1
      Width = 804
      Height = 368
      Align = alClient
      PopupMenu = PopupMenu
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
      Images = ImageList
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
      Images = ImageList
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
    Left = 288
    Top = 176
    object SaveAction: TAction
      Caption = 'Save as...'
      ImageIndex = 0
      OnExecute = SaveActionExecute
    end
    object PrinterSettingsAction: TAction
      Caption = 'Printer Settings...'
      Hint = 'Printer settings'
      ImageIndex = 1
      OnExecute = PrinterSettingsActionExecute
    end
    object PrintAction: TAction
      Caption = 'Print...'
      Hint = 'Print'
      ImageIndex = 2
      OnExecute = PrintActionExecute
    end
    object CloseAction: TAction
      Caption = 'Close'
      Hint = 'Close'
    end
  end
  object PopupMenu: TBCPopupMenu
    Images = ImageList
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
      Action = CloseAction
    end
  end
  object ImageList: TImageList
    Height = 17
    Width = 17
    Left = 178
    Top = 122
    Bitmap = {
      494C010104004C00DC0011001100FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000440000002200000001002000000000002024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000888687000000000000000000000000006867
      6700686767007570720000000000000000000000000000000000000000000000
      0000000000000000000086848400868484000000000000000000868484008684
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A6666006933
      3400000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F2B28007F2B2800A1828300A1828300A1828300A182
      8300A1828300A1828300A18283007A1C1C007F2B280000000000000000000000
      000000000000000000000000000000000000000000008886870088868700C7C4
      C4007E7A7A00242323003A383900817F7F00B5B1B400CBC9C900686767000000
      0000000000000000000000000000000000000000000086848400BCBABA00B5B3
      B300868484008684840086848400EBEAEA008684840086848400868484000000
      0000000000000000000000000000000000000000000000000000000000009A66
      66009A666600B9666600BB686800693334000000000000000000000000000000
      000000000000000000000000000000000000000000007F2B2800CA4D4D00B645
      4500DDD4D5007916170079161700DCE0E000D7DADE00CED5D700BDBABD007610
      0F009A2D2D007F2B280000000000000000000000000000000000000000008886
      870088868700F8F8F800FFFFFF00CBC7C900878484002C2B2D000D0D0F000D0D
      0F001F1F1F004C4B4C0068676700757072000000000000000000000000000000
      000086848400E3E2E200B5B3B300B5B3B300B5B3B300515050004F4F4F008687
      8700CDCDCD00E8E9E900C7C6C600868484008684840086848400000000000000
      0000000000009A6666009A666600C66A6B00D06A6B00D2686900C36869006933
      34009A6666009A6666009A6666009A6666009A6666009A666600000000000000
      0000000000007F2B2800C24A4B00B1444400E2D9D9007916170079161700D9D8
      DA00D9DEE100D3D9DC00C1BDC10076111100982D2D007F2B2800000000000000
      0000000000007875760088868700EBE9EA00FFFFFF00E9E5E500BBBABA008886
      8700757070007F7A7D006D6C6C0049484800252426000F101100100F11005957
      580000000000919191000000000086848400DEDDDD00D6D6D600A4A3A300A4A3
      A300A4A3A300565555001615160012121200181818001212120093939300CACA
      CA0086848400000000000000000000000000000000009A666600DE737400D770
      7100D56F7000D56D6E00C76A6D0069333400FEA2A300FCAFB000FABCBD00F9C5
      C600F9C5C6009A6666000000000000000000000000007F2B2800C24A4A00B042
      4200E6DCDC007916170079161700D5D3D500D8DEE100D7DDE000C6C2C500700F
      0F00962C2C007F2B280000000000000000000000000084808100E2E0E000DDDD
      DD00ABA9A900908E8E00A09D9D00B1B0B0008E8A8A007E797A00797777007F7A
      7D008280800075707200504F4F0068676700000000009A9A9A0086848400D6D6
      D600D6D6D600A4A3A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D
      9D0079767700121212001414140013131300868484008F8C8C00000000000000
      0000000000009A666600E0777800DB757600DA747500DA727300CC6E71006933
      340039C5650025CF630029CC630019CB5B00F9C5C6009A666600000000000000
      0000000000007F2B2800C24A4A00B0414100EADEDE00E7DDDD00DDD4D500D7D3
      D500D5D7D900D7D8DA00CAC2C5007E1717009E3131007F2B2800000000000000
      0000000000007D787900989697008E8A8A009C9A9A00BABABA00C4C6C600E7E7
      E500EBE9EB00D1CFCF00B5B4B40098969600828081007A7777007F7A7D007570
      7200000000009494940086848400D6D6D600A4A3A300F3F2F200FFFEFE00FCFB
      FB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBDBD00A2A0A0007371
      7100939191008E8C8C000000000000000000000000009A666600E57D7E00E07A
      7B00DF797A00DF777800D07275006933340042C4680030CD670033CB670024CB
      6000F9C5C6009A6666000000000000000000000000007F2B2800BF474800B845
      4500BA4C4C00BD575700BB575600B64E4E00B4494900BD525100BB4B4C00B542
      4200BF4A4A007F2B2800000000000000000000000000787576009A989A00BAB7
      B700C0C0C000BABABA00D9D9D900C4C1C1008A968A00ABAAAA00BCC0C100C9C9
      C900C6C6C600B6B5B500A3A3A300807F7F00000000009191910086848400A4A3
      A300FFFFFF00FEFDFD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CE
      CF00E0E0E000E1E1E100D4D3D300C7C6C600A7A5A50086838300000000000000
      0000000000009A666600EA828300E57F8000E37D7E00E6808100D37476006933
      34003DC2640029CB63002FCA640020CA5E00F9C5C6009A666600000000000000
      0000000000007F2B2800A33B3900B1605D00C6868400CB918F00CC919000CC90
      8F00CB898800C9898800CB939100CC969600BD4B4C007F2B2800000000000000
      0000000000000000000084818200C2C4C400C1C1C100D1D1D100BAB6B600A19C
      A0008FC49100A7B4AA00B5918A00988E8C000000000000000000000000000000
      00000000000000000000000000008684840086848400F1F0F000C2B9BA009389
      8B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2ADAE00CAC9C900DCDC
      DC00D0D0D000868484000000000000000000000000009A666600F0878800E981
      8200EC969700FBDDDE00D8888A0069333400B8E1AC006BDC89005DD5800046D4
      7300F9C5C6009A6666000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000008481
      8200B0ADAD009A9898009D9C9C00DADADA00F3EFEF00E9E7E900E7D8D400D1CC
      CC00000000009C9C9C000000E100000000000000000000000000000000000000
      00000000000086848400CAA09700BA9E8700A2897E0095817B00897C7F00928C
      9200A5A2A400BBB6B700D7D6D600CFCFCF008684840000000000000000000000
      0000000000009A666600F58C8D00EE868700F0999A00FDDCDD00DA888A006933
      3400FFF5D800FFFFE000FFFFDE00ECFDD400F9C5C6009A666600000000000000
      0000000000007F2B2800BD4B4C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700BD4B4C007F2B2800000000000000
      00000000000000000000000000000000000084818200CCCFCF00BBBBBC008688
      8900A9ADB000C6C9CB00C7CECE00C9C9C9000000000096949400000000000000
      E100000000000000000000000000000000000000000000000000CC9A9900FFEA
      C400FFDDB300EEC39900D5AE8C00C9A78600CC9A990098959600868484008684
      840000000000000000000000000000000000000000009A666600FA919200F48E
      8F00F28B8C00F48C8D00DC7F800069333400FDF3D400FFFFDF00FFFFDD00FFFF
      E000F9C5C6009A6666000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      000000000000FADDD800F6D7C700E2BAAB00DAB7AB00D9BDB700D4C6C000C2C0
      BD00000000000000000000000000000000000000E10000000000000000000000
      00000000000000000000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD3
      9F00CC9A99000000000000000000000000000000000000000000000000000000
      0000000000009A666600FE979800F9939400F8929300F9909200E08585006933
      3400FDF3D400FFFFDF00FFFFDD00FFFFDF00F9C5C6009A666600000000000000
      0000000000007F2B2800BD4B4C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700BD4B4C007F2B2800000000000000
      00000000000000000000000000000000000000000000C0888600FFD4C000FFC1
      AB00FFB49A00FFA78C00FF9D8100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE9D9B00FFEDDA00FFE7
      CE00FFE2C300FFDDB800FFDBAE00CC9A99000000000000000000000000000000
      000000000000000000000000000000000000000000009A666600FF9B9C00FD97
      9800FC969700FE979800E388890069333400FDF3D400FFFFDF00FFFFDD00FFFF
      DF00F9C5C6009A6666000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      000000000000C0888600FFD3C000FFBDAA00FEB19C00FFA98E00F49379000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000009A666600FF9FA000FF9A9B00FF999A00FF9A9B00E78C8D006933
      3400FDF3D400FFFFDF00FFFFDD00FFFFDF00F9C5C6009A666600000000000000
      0000000000007F2B2800BD4B4C00F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700BD4B4C007F2B2800000000000000
      00000000000000000000000000000000000000000000C0888600FFD3C000FFBD
      AA00FEB19C00FEA58C00F89C81000000000000000000000000000000E1000000
      000000000000000000000000000000000000CC9A9900FFFFF500FFFFF500FFF0
      E100FFEBD600FFE8CC00F6D4BA00CC9A99000000000000000000000000000000
      000000000000000000000000000000000000000000009A6666009A666600E98E
      8F00FE999A00FF9D9E00EB8F900069333400FBF0D200FDFCDC00FDFCDA00FDFC
      DC00F9C5C6009A666600000000000000000000000000000000007F2B2800F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F7007F2B28000000000000000000000000000000000000000000000000000000
      0000C0888600F8D7C900FFCFBD00FFC0AB00FFB69D00FBA58C00F69881000000
      00000000000000000000000000000000E1000000000000000000000000000000
      0000CC9A9900CC9A9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A99000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A666600B0717200D7868700DA8888006933
      34009A6666009A6666009A6666009A6666009A6666009A666600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0888600C0888600C0888600C088
      8600EF988600EF98860000000000000000000000000000000000000000000000
      00000000E100000000000000000000000000000000000000000000000000CC9A
      9900CC9A9900CC9A990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009A6666009A666600693334000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000044000000220000000100010000000000980100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FFFFFFFF
      FFFFFFFFF0000000FFFFFEE3FCCFFFCFF0000000C007F801F801FE0FF0000000
      8003E000F00038003000000080038000A0007800300000008003800080003800
      300000008003800080003800300000008003800080003800300000008003C000
      E0003800300000008003E000F8007800300000008003F002FC00F80030000000
      8003F8007C07F800300000008003F81FF80FF800300000008003F810F80FF800
      300000008003F814F00FF80030000000C007F016F01FFE0030000000FFFFF030
      7E3FFF8FF000000000000000000000000000000000000000000000000000}
  end
end
