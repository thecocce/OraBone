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
      494C010104000900040011001100FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000004182BD003D80BB003D80BB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AC731400AD751900AC73
      1600AC721400AB721400AA711300AA701300AA701300AA711300AC741900B07A
      23000000000000000000000000000000000000000000C09E7900B5844E004C8E
      C30057A4D60059A0D3004C8FC5003D80BB009A7E610000000000000000000000
      0000000000000000000000000000000000000000000000000000C09E7900B584
      4E00B3824B00B3814B00B3814B00B3824B00B5844E00C09E7900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004B7DA30068A4D90000000000C3AB7A00B7821600B37A0600D7D0
      D400D8D1D300A96D0B00F7EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC7419000000000000000000000000000000
      000000000000BA854B00FFFFFC005193C800B7E7FB0052A0D300579FD2004B8F
      C6003D80BB000000000000000000000000000000000000000000000000000000
      00000000000000000000BA854B00FFFFFC00FFFFF500FFFFF400FFFFF400FFFF
      F500FFFFFC00BA854B0000000000000000000000000000000000000000005C5C
      5C005C5C5C005E5B5A005E5A59005D5A5A005B5A5B005A5B5B005A5B5B005A5B
      5B005B5A5A005C595600576876004E7EA4004C80AC005082AB0065A2D5000000
      0000B7821800F6CC8A00F0C17200F9F7FC00FFFFFF00A6690500F5EBDA00979A
      9F005354560095969700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AA71
      1400000000009A9A9A0081818100818182007F838600BD854600FFFFF7003D80
      BB00509DD100B4E5FA00509FD300529ED4005571870066696B00676768006C6C
      6C009A9A9A00000000009A9A9A0081818100818182007F838600BD854600FFFF
      F700FFF3DA00FFF2D900FFF2D900FFF3DA00FFFFF700BD8546007F8386008181
      8200818181009A9A9A00000000000000000000000000000000003F69A5007566
      6700706869006D6969006C6A69006C6A69006C6A68006E6762004C89BA004E85
      B2004D83AE005D8CB200629ED10000000000B6811600F3CA8600EBB66000F8F5
      F800FFFFFF00A5680300F5EAD900FFFFFF0057575700FFFFFF00FBFBFA00F6F6
      F500F5F5F400F5F7F700FFFFFF00AA7113000000000081818100D5D2D100CBC9
      C9007D7C7C0067676800A8A6A800A4A2A4003D80BB004F9DD100B1E4FB0081B1
      D200B4ABA30089837E0088848100908D8B00676767000000000081818100D5D2
      D100CBC9C9007D7C7C0067676800A8A6A800A4A2A400A3A2A300A3A2A300A4A2
      A400A8A6A800676768007D7C7C00CBC9C900D5D2D10081818100000000000000
      0000000000000000000013826B0000934600715C62006A626300676463006664
      63006764620068615B004F8ABB005086B4004F84B1006895B9005F9BCD000000
      0000B6811600F1CA8900E8B15500F9F8FD00FAF8FB00A6690500F6ECDB008C8E
      9200545556008B8B8C00E3E2E300DFDEDE00DEDEDE00DDDEE000FFFFFF00AA71
      1400000000007F7F7F00DAD7D600C2BFBE00C8C5C400AFACAC00AFACAB00ADAA
      AA00ADAAAA003D80BB006C95B800E7DBD400D3CFCD00D4D3D200EDECEB00E3E2
      E100908E8C00000000007F7F7F00DAD7D600C2BFBE00C8C5C400AFACAC00AFAC
      AB00ADAAAA00ADAAAA00ADAAAA00ADAAAA00AFACAB00AFACAC00C8C5C400C2BF
      BE00DAD7D6007F7F7F0000000000000000000000000000000000008C46004FDD
      B000008D43006B585E00655E60006361600062605F00645D5700518DBE00528A
      B7005187B400739FC2005D97C90000000000B6811500F3CB8F00E6AD4D00FDFF
      FF00EEE7E500A76B0900F6EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC741900000000007E7E7E00E1E0DF00BDBB
      B90092908E007B7977007D7B78007D7B78007D7B78007D7B78007D7B78009F9C
      9900DCD9D900CFCDCC0094918F0094918F0098959300000000007E7E7E00E1E0
      DF00BDBBB90092908E007B7977007D7B78007D7B78007D7B78007D7B78007D7B
      78007D7B78007B79770092908E00BDBBB900E1E0DF007E7E7E00000000000D91
      5400008A4700008845000084410000DAA20060D9B300008D420068545A00625B
      5C00605C5A00605852005490C200558CBA004E81AD007EA6C8005A94C4000000
      0000B6811500F3D09500E4AA4600E8CBA500FFFFFF00A66D1000A76F1300A76D
      1000A66D0E00A66C0E00A56C0E00A56B0E00A66C0E00A96F1200AC741900B07A
      2300000000007D7D7D00EDEBEB00B8B5B300646261006B6968006C6A69006C6A
      69006C6A69006C6A69006C6A6900A09A9600D8D6D500C3BFBF0094918F00BEBC
      BC0064646400000000007D7D7D00EDEBEB00B8B5B300646261006B6968006C6A
      69006C6A69006C6A69006C6A69006C6A69006C6A69006B69680064626100B8B5
      B300EDEBEB007D7D7D0000000000008A470063EDD00000D4A00000D29E0000CC
      9C0000CD9C006FDCBD0000934600615457005C5756005B534D005794C500588E
      BC0047749B0088AFCF005790C00000000000B6811500F3D39C00E3A53E00E2A2
      3700E4A13200E6A43700E7A53A00E7A63A00E7A63A00E7A63C00E7A84000E8AA
      4300F6D69E00B88212000000000000000000000000007C7C7D00F9F8F800F3F4
      F200949190009B9897009C9998009C9998009C9998009C9998009C9998009F9C
      9900E2E0E000B1AFAC0094918F0094918F0094918F00000000007C7C7D00F9F8
      F800F3F4F200949190009B9897009C9998009C9998009C9998009C9998009C99
      98009C9998009B98970094919000F3F4F200F9F8F8007C7C7D0000000000008A
      470061E1D00060DDCA0063DCC80000C49B0000C69C0082E1C800009447005C50
      540058535300574F4A005A96CA005B8FBE0022B9F70095B5D300548DBC000000
      0000B6811400F4D5A400E09E3100F4E0B700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F4E1B800E19F3200F5D6A400B6811400000000000000
      0000000000007C7C7D00F4F3F200D3D1D000827F7E0088868500898686008986
      850089868500898685008986850099979600D0CECD00F2F1F000E0E0DF00CBC9
      C700A5A3A100000000007C7C7D00F4F3F200D3D1D000827F7E00888685008986
      8600898685008986850089868500898685008986860088868500827F7E00D3D1
      D000F4F3F2007C7C7D000000000010945700008A47000088440000853F0000C1
      A00097E3D100008F43005A484E005650510053514F00524B45005B9ACD005C91
      C10020B7F5009EBCD7005189B80000000000B6801400F5DAAE00DF982200FCFF
      FF00797C8000A1A3A500FEFBF200797A7C00A3A4A600A0A3A700FBFEFF00DF97
      2200F5DAAE00B68014000000000000000000000000007E7E7E00FFFFFF00FFFF
      FF006D6B6A00706F6F006C6B6B006A6867006A6867006A6867006A6867006C6B
      6B009C9B9900ABA9A700ACAAA800BAB9B7007E7E7E00000000007E7E7E00FFFF
      FF00FFFFFF006D6B6A00706F6F006C6B6B006A6867006A6867006A6867006A68
      67006C6B6B00706F6F006D6B6A00FFFFFF00FFFFFF007E7E7E00000000000000
      00000000000000000000008B4400A0E8DA000091440055434A00524B4D004F4D
      4E004F4D4C004D4641005E9CD2005C95C5005990C100A6C4DF004E86B5000000
      0000B6801300F7DFB900DD921500FCFCFC00FDF8EC00FFF8EA00FDF6E800FCF6
      E800FBF4E700F9F4E800FAFAFA00DC911500F7DFB900B6801300000000000000
      000000000000A9A9A9007F7F7F007F7F800080838700BF864800FFFFF800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF800BF864800808387007F7F80007F7F
      7F00A9A9A90000000000A9A9A9007F7F7F007F7F800080838700BF864800FFFF
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF800BF864800808387007F7F
      80007F7F7F00A9A9A9000000000000000000000000000000000017866D000096
      4700523F45004F4749004D494A004C4A4A004C4848004A423D0060A0D5005D98
      C9005894C600AFCCE6004B83B00000000000B67F1200FAE5C500DA8C0900FEFE
      FF00787879007A797900A2A1A1009F9E9E00F5EBE0009B9B9D00FCFCFF00DA8C
      0900FAE5C500B67F120000000000000000000000000000000000000000000000
      000075777A00BA834700FFFFF300FFF0DD00FFEFDC00FFEFDC00FFF0DD00FFFF
      F300BA83470075777A0000000000000000000000000000000000000000000000
      00000000000075777A00BA834700FFFFF300FFF0DD00FFEFDC00FFEFDC00FFF0
      DD00FFFFF300BA83470075777A00000000000000000000000000000000000000
      000000000000000000004D7BB0004C3D3B004A43430048454400484644004846
      440047454200433C36005FA1D8005C9ACC005896C900B8D3EB004980AC000000
      0000B67F1200FBECD200D8840000FFFFFF00F1E5DA00F2E6DA00F2E6DA00F0E4
      D800EEE2D700EEE2D800FEFFFF00D8830000FBECD200B67F1200000000000000
      00000000000000000000000000000000000000000000B7834900FFFFF400FFE1
      C000FFE0BF00FFE0BF00FFE1C000FFFFF400B783490000000000000000000000
      0000000000000000000000000000000000000000000000000000B7834900FFFF
      F400FFE1C000FFE0BF00FFE0BF00FFE1C000FFFFF400B7834900000000000000
      00000000000000000000000000000000000000000000000000004A7FAC004438
      3100433B3700433D3800433D3800433D3800423B36003C332C00B9DAF5007FB0
      DA005495CC00C0DAEF00467CA80000000000B7811400FFECCD00FCE6C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE6
      C300FFECCD00B781140000000000000000000000000000000000000000000000
      000000000000B7854E00FFFFFD00FFFFF500FFFEF400FFFEF400FFFFF500FFFF
      FD00B7854E000000000000000000000000000000000000000000000000000000
      00000000000000000000B7854E00FFFFFD00FFFFF500FFFEF400FFFEF400FFFF
      F500FFFFFD00B7854E0000000000000000000000000000000000000000000000
      0000000000000000000082A6C3004A82AE004A83B0004A83B0004A83B0004A83
      B0004A82AF00447DA900709CBF00B9D5EB00B3D1EA00C1DBF2004279A5000000
      0000DEC69500B7811400B57E0F00B57C0B00B57C0900B57C0900B57C0900B57C
      0900B57C0900B57C0900B57C0B00B57E0F00B7811400DEC69500000000000000
      00000000000000000000000000000000000000000000CEAE8A00B5844F00B382
      4B00B3814B00B3814B00B3824B00B5844F00CEAE8A0000000000000000000000
      0000000000000000000000000000000000000000000000000000CEAE8A00B584
      4F00B3824B00B3814B00B3814B00B3824B00B5844F00CEAE8A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CEE3F5003F75A10000000000424D3E000000000000003E000000
      2800000044000000220000000100010000000000980100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FFFFFFFF
      FFFFFFFFF0000000FFFFFF1FFFFFFFFFF0000000F800F807FC03FFFF90000000
      0000F807FC03E000100000000000800040003C00100000000000800040003C00
      100000000000800040003C001000000000008000400020001000000000008000
      4000200010000000000380004000200010000000000380004000200010000000
      0003800040003C00100000000003800040003C00100000000003F003F801FC00
      100000000003F807FC03FC00100000000003F807FC03FC00100000000003F807
      FC03FFFF9000000000000000000000000000000000000000000000000000}
  end
end
