object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object StringHolder: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'ObjectsSQL'
        Strings.Strings = (
          
            'SELECT a.id, a.name, a.type, a.extratype, NVL(a.status, b.status' +
            ') status'
          '  FROM'
          '(%s) a,'
          '(SELECT DISTINCT object_name, '#39'DISABLED'#39' status'
          '  FROM all_objects'
          ' WHERE status = '#39'INVALID'#39
          '   AND owner = :P_SCHEMA) b'
          ' WHERE b.object_name (+) = a.name'
          'ORDER BY 1, 2')
      end
      item
        Name = 'TablesSQL'
        Strings.Strings = (
          
            'SELECT   1 Id, table_name NAME, '#39'TABLE'#39' TYPE, '#39#39' extratype, '#39#39' s' +
            'tatus'
          '    FROM all_tables'
          '   WHERE owner = :P_SCHEMA'
          
            '        AND table_name NOT IN (SELECT mview_name FROM all_mviews' +
            ' WHERE owner = :P_SCHEMA)'
          '          %s')
      end
      item
        Name = 'TableParametersSQL'
        Strings.Strings = (
          
            'SELECT tablespace_name, NVL(pct_used, 0) pct_used, pct_free, ini' +
            '_trans, max_trans, initial_extent,'
          '       NVL(next_extent, initial_extent) next_extent,'
          
            '       min_extents, max_extents, NVL(pct_increase, 0) pct_increa' +
            'se, buffer_pool,'
          '       DECODE(logging, '#39'YES'#39', '#39'LOGGING'#39', '#39'NOLOGGING'#39') logging,'
          
            '       DECODE(compression, '#39'ENABLED'#39', '#39'COMPRESS'#39', '#39'NOCOMPRESS'#39') ' +
            'compression,'
          '       DECODE(cache, '#39'Y'#39', '#39'CACHE'#39', '#39'NOCACHE'#39') cache,'
          '       DECODE(degree, '#39'1'#39', '#39'NOPARALLEL'#39', '#39'PARALLEL'#39') parallel,'
          
            '       DECODE(monitoring, '#39'YES'#39', '#39'MONITORING'#39', '#39'NOMONITORING'#39') m' +
            'onitoring'
          '  FROM all_tables'
          ' WHERE owner = :P_OWNER'
          '   AND table_name = :P_TABLE_NAME')
      end
      item
        Name = 'ViewsSQL'
        Strings.Strings = (
          'SELECT 2, view_name, type, extratype, status'
          'FROM '
          '(SELECT   view_name, '#39'VIEW'#39' type, '#39#39' extratype, '#39#39' status'
          '    FROM all_views'
          '   WHERE owner = :P_SCHEMA'
          'UNION ALL'
          'SELECT   mview_name, '#39'VIEW'#39', '#39'M'#39', '#39#39
          '    FROM all_mviews'
          '   WHERE owner = :P_SCHEMA)'
          'WHERE 1 = 1'
          '         %s')
      end
      item
        Name = 'FunctionsSQL'
        Strings.Strings = (
          'SELECT DISTINCT  3, NAME, type, '#39#39', '#39#39' status'
          '    FROM all_source'
          '   WHERE TYPE = '#39'FUNCTION'#39
          '     AND owner = :P_SCHEMA'
          '     %s')
      end
      item
        Name = 'ProceduresSQL'
        Strings.Strings = (
          'SELECT   DISTINCT 4, NAME, type, '#39#39', '#39#39' status'
          '    FROM all_source'
          '   WHERE TYPE = '#39'PROCEDURE'#39
          '     AND owner = :P_SCHEMA'
          '     %s')
      end
      item
        Name = 'PackagesSQL'
        Strings.Strings = (
          'SELECT   DISTINCT 5, NAME, type, '#39#39', '#39#39' status'
          '    FROM all_source'
          '   WHERE TYPE = '#39'PACKAGE'#39
          '     AND owner = :P_SCHEMA'
          '    %s')
      end
      item
        Name = 'TriggersSQL'
        Strings.Strings = (
          'SELECT   6, trigger_name, '#39'TRIGGER'#39', '#39#39', status'
          '    FROM all_triggers'
          '   WHERE owner = :P_SCHEMA'
          '  %s'
          '')
      end
      item
        Name = 'ConstraintsSQL'
        Strings.Strings = (
          
            'SELECT   7, constraint_name, '#39'CONSTRAINT'#39', constraint_type, stat' +
            'us'
          '    FROM all_constraints'
          '   WHERE owner = :P_SCHEMA'
          '   %s')
      end
      item
        Name = 'IndexesSQL'
        Strings.Strings = (
          'SELECT   8, index_name, '#39'INDEX'#39', '#39#39', '#39#39' status'
          '    FROM all_indexes'
          '   WHERE owner = :P_SCHEMA'
          '  %s')
      end
      item
        Name = 'IndexParametersSQL'
        Strings.Strings = (
          
            'SELECT tablespace_name, pct_free, ini_trans, max_trans, initial_' +
            'extent,'
          '       NVL(next_extent, initial_extent) next_extent,'
          
            '       min_extents, max_extents, NVL(pct_increase, 0) pct_increa' +
            'se, buffer_pool,'
          '       DECODE(degree, '#39'1'#39', '#39'NOPARALLEL'#39', '#39'PARALLEL'#39') parallel'
          '  FROM all_indexes'
          ' WHERE owner = :P_OWNER'
          '   AND table_name = :P_TABLE_NAME')
      end
      item
        Name = 'SequencesSQL'
        Strings.Strings = (
          'SELECT   9, sequence_name, '#39'SEQUENCE'#39', '#39#39', '#39#39' status'
          '    FROM all_sequences'
          '   WHERE sequence_owner = :P_SCHEMA'
          '  %s')
      end
      item
        Name = 'SynonymsSQL'
        Strings.Strings = (
          'SELECT   10, synonym_name, '#39'SYNONYM'#39', '#39#39', '#39#39' status'
          '    FROM all_synonyms'
          'WHERE table_owner = :P_SCHEMA'
          '       %s')
      end
      item
        Name = 'DBLinksSQL'
        Strings.Strings = (
          'SELECT   11, db_link, '#39'DATABASE LINK'#39', '#39#39', '#39#39' status'
          '    FROM all_db_links'
          '   WHERE username = :P_SCHEMA'
          '         %s')
      end
      item
        Name = 'UsersSQL'
        Strings.Strings = (
          'SELECT   username name, '#39'USER'#39' type, account_status status'
          '    FROM dba_users    '
          '          %s'
          'ORDER BY 1')
      end
      item
        Name = 'ColumnsSQL'
        Strings.Strings = (
          'SELECT   s.column_id,s.column_name,  s.data_type,'
          '               s.data_length column_size,'
          
            '               s.data_precision column_precision, s.data_scale s' +
            'cale,'
          
            '               DECODE(co.pk, '#39#39', '#39'False'#39', '#39'True'#39') primary_key, D' +
            'ECODE (s.nullable, '#39'Y'#39', '#39'False'#39', '#39'True'#39') nullable, s.data_defaul' +
            't column_default, '
          '               c.comments column_comment'
          '    FROM all_col_comments c,'
          '         all_tab_columns s,'
          '         (SELECT b.position pk, b.column_name'
          '            FROM all_constraints a, all_cons_columns b'
          '           WHERE a.table_name = :p_table_name'
          '             AND a.constraint_name = b.constraint_name'
          '             AND a.constraint_type = '#39'P'#39
          '             AND a.owner = :p_owner'
          '             AND b.owner = :p_owner) co'
          '   WHERE c.table_name = s.table_name'
          '     AND c.column_name = s.column_name'
          '     AND s.table_name = :p_table_name'
          '     AND co.column_name(+) = c.column_name'
          '     AND s.owner = :p_owner'
          '     AND c.owner = :p_owner'
          'ORDER BY s.column_id')
      end
      item
        Name = 'TableOrViewCommentsSQL'
        Strings.Strings = (
          'SELECT comments'
          '  FROM all_tab_comments'
          ' WHERE table_name = :p_table_name'
          '   AND owner = :p_owner')
      end
      item
        Name = 'ObjectConstraintsSQL'
        Strings.Strings = (
          
            'SELECT c.constraint_type, c.constraint_name, c.r_constraint_name' +
            ', c.table_name'
          '  FROM all_constraints c'
          'WHERE c.owner = :P_OWNER'
          '     AND c.table_name = :P_OBJECT_NAME'
          '     AND EXISTS (SELECT 1 FROM all_tables'
          '                           WHERE owner = :P_OWNER'
          '                                 AND table_name = c.table_name)'
          
            'ORDER BY DECODE(c.constraint_type, '#39'P'#39', '#39'A'#39', '#39'U'#39', '#39'B'#39', '#39'R'#39', '#39'C'#39',' +
            ' c.constraint_type)')
      end
      item
        Name = 'ObjectTriggersSQL'
        Strings.Strings = (
          'SELECT trigger_name, description, trigger_body'
          '  FROM all_triggers '
          'WHERE table_owner = :P_OWNER '
          '   AND table_name = :P_OBJECT_NAME')
      end
      item
        Name = 'ObjectGrantsSQL'
        Strings.Strings = (
          'SELECT grantee, privilege, grantable, grantor'
          '  FROM all_tab_privs'
          'WHERE table_name = :P_OBJECT_NAME')
      end
      item
        Name = 'ObjectConstraintColumnsSQL'
        Strings.Strings = (
          'SELECT a.position,'
          '       a.column_name,'
          '       b.table_name r_table_name,'
          '       b.column_name r_column_name'
          '  FROM all_cons_columns a, all_cons_columns b'
          ' WHERE a.constraint_name = :p_constraint_name'
          '   AND a.owner = :p_owner'
          '   AND b.constraint_name (+) = :p_r_constraint_name'
          '   AND b.owner (+) = :p_owner'
          '   AND b.position (+) = a.position'
          'ORDER BY 1')
      end
      item
        Name = 'SchemasSQL'
        Strings.Strings = (
          
            'SELECT username FROM all_users WHERE username IN (%s) OR (%d = 0' +
            ') ORDER BY 1')
      end
      item
        Name = 'ConstraintTypeAndNameSQL'
        Strings.Strings = (
          
            'SELECT DECODE(constraint_type, '#39'O'#39', '#39'VIEW'#39', '#39'TABLE'#39') type, table' +
            '_name name FROM all_constraints WHERE constraint_name = :constra' +
            'int_name')
      end
      item
        Name = 'HighlighterObjectsSQL'
        Strings.Strings = (
          'SELECT 1, '#39'TABLE'#39' type, table_name NAME '
          '  FROM all_tables                   '
          ' WHERE owner = :p_owner '
          
            '   AND table_name NOT IN (SELECT mview_name FROM all_mviews WHER' +
            'E owner = :p_owner) '
          'UNION ALL'
          'SELECT 2, '#39'VIEW'#39' type, view_name '
          '  FROM all_views'
          ' WHERE owner = :p_owner '
          'UNION ALL'
          'SELECT 2, '#39'VIEW'#39' type, mview_name '
          '  FROM all_mviews'
          ' WHERE owner = :p_owner '
          'UNION ALL '
          'SELECT DISTINCT 3, type, NAME '
          '   FROM all_source '
          '  WHERE type IN ('#39'FUNCTION'#39', '#39'PROCEDURE'#39', '#39'PACKAGE'#39') '
          '       AND owner = :p_owner '
          'ORDER BY 1, 2, 3')
      end
      item
        Name = 'AllConstrainsSQL'
        Strings.Strings = (
          'SELECT c.constraint_name, c.table_name'
          '  FROM all_constraints c'
          'WHERE c.owner = :P_OWNER'
          '     AND EXISTS (SELECT 1 FROM all_tables'
          '                           WHERE owner = :P_OWNER'
          '                                 AND table_name = c.table_name)'
          
            'ORDER BY DECODE(c.constraint_type, '#39'P'#39', '#39'A'#39', '#39'U'#39', '#39'B'#39', '#39'R'#39', '#39'C'#39',' +
            ' c.constraint_type)')
      end
      item
        Name = 'AllTriggersSQL'
        Strings.Strings = (
          'SELECT trigger_name FROM all_triggers WHERE owner = :P_OWNER')
      end
      item
        Name = 'DateFromDualSQL'
        Strings.Strings = (
          'SELECT TO_CHAR(SYSDATE, '#39'%s'#39') text FROM DUAL')
      end
      item
        Name = 'ConstraintTableNameSQL'
        Strings.Strings = (
          
            'SELECT table_name FROM all_constraints WHERE constraint_name = :' +
            'p_object_name AND owner = :p_owner')
      end
      item
        Name = 'SynonymOwnerSQL'
        Strings.Strings = (
          
            'SELECT owner FROM all_synonyms WHERE synonym_name = :p_object_na' +
            'me AND table_owner = :p_owner')
      end
      item
        Name = 'ConstraintTypeForRenamingSQL'
        Strings.Strings = (
          
            'SELECT DECODE(constraint_type, '#39'O'#39', '#39'VIEW'#39', '#39'TABLE'#39') type, table' +
            '_name name FROM all_constraints WHERE constraint_name = :constra' +
            'int_name')
      end
      item
        Name = 'RenameConstraintSQL'
        Strings.Strings = (
          'ALTER %s %s RENAME CONSTRAINT %s TO %s;')
      end
      item
        Name = 'RenameTriggerSQL'
        Strings.Strings = (
          'ALTER TRIGGER %s RENAME TO %s;')
      end
      item
        Name = 'ObjectNamesSQL'
        Strings.Strings = (
          'SELECT table_name FROM all_tables WHERE owner = :P_SCHEMA '
          'UNION ALL '
          'SELECT  view_name FROM all_views WHERE owner = :P_SCHEMA '
          'UNION ALL '
          
            'SELECT DISTINCT NAME FROM all_source WHERE TYPE IN ('#39'FUNCTION'#39', ' +
            #39'PROCEDURE'#39', '#39'PACKAGE'#39') AND owner = :P_SCHEMA '
          'UNION ALL '
          
            'SELECT sequence_name FROM all_sequences WHERE sequence_owner = :' +
            'P_SCHEMA '
          'ORDER BY 1')
      end
      item
        Name = 'DBLinksOfSchemaSQL'
        Strings.Strings = (
          
            'SELECT db_link FROM all_db_links WHERE owner = :P_SCHEMA ORDER B' +
            'Y 1')
      end
      item
        Name = 'AllUsersSQL'
        Strings.Strings = (
          'SELECT username FROM all_users ORDER BY 1')
      end
      item
        Name = 'AllTablesOfSchemaSQL'
        Strings.Strings = (
          
            'SELECT table_name FROM all_tables WHERE owner = :P_SCHEMA ORDER ' +
            'BY 1')
      end
      item
        Name = 'TableColumnsSQL'
        Strings.Strings = (
          
            'SELECT column_name FROM all_tab_columns WHERE table_name = :P_TA' +
            'BLE_NAME AND owner = :P_SCHEMA ORDER BY column_id')
      end
      item
        Name = 'AllTableAndViewsOfSchemaSQL'
        Strings.Strings = (
          'SELECT table_name FROM all_tables WHERE owner = :P_SCHEMA '
          'UNION ALL '
          'SELECT view_name FROM all_views WHERE owner = :P_SCHEMA '
          'ORDER BY 1')
      end
      item
        Name = 'DistinctGrantedRolesSQL'
        Strings.Strings = (
          'SELECT DISTINCT granted_role FROM dba_role_privs ORDER BY 1')
      end
      item
        Name = 'ViewColumnsSQL'
        Strings.Strings = (
          'SELECT  s.column_id,  s.column_name, c.comments'
          '    FROM all_col_comments c,'
          '         all_tab_columns s'
          '   WHERE c.table_name = s.table_name'
          '     AND c.column_name = s.column_name'
          '     AND s.table_name = :p_view_name'
          '     AND c.owner = :p_owner'
          '     AND s.owner = :p_owner'
          'ORDER BY s.column_id')
      end
      item
        Name = 'ViewTextSQL'
        Strings.Strings = (
          'SELECT text, '#39#39' type '
          '  FROM all_views'
          ' WHERE view_name = :p_view_name'
          '   AND owner = :p_owner'
          ' UNION ALL '
          'SELECT query, '#39'M'#39' '
          '  FROM all_mviews'
          ' WHERE mview_name = :p_view_name'
          '   AND owner = :p_owner')
      end
      item
        Name = 'SearchCaseSensitiveSQL'
        Strings.Strings = (
          
            'SELECT '#39'Table'#39' object_type, owner || '#39'.'#39' || table_name object_na' +
            'me, '#39'Object name'#39' search_result,'
          
            '            :img_idx_table_root level0_index, :img_idx_table_chi' +
            'ld level1_index'
          '  FROM all_tables '
          ' WHERE table_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION '
          
            'SELECT '#39'Table'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obj' +
            'ect name'#39' search_result,'
          
            '            :img_idx_table_root level0_index, :img_idx_table_chi' +
            'ld level1_index'
          '  FROM all_tab_columns c, all_tables t'
          ' WHERE c.column_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.table_name'
          '   AND c.owner = t.owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION'
          
            'SELECT '#39'Table'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obj' +
            'ect name'#39' search_result,'
          
            '            :img_idx_table_root level0_index, :img_idx_table_chi' +
            'ld level1_index'
          '  FROM all_col_comments c, all_tables t'
          ' WHERE c.comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.table_name'
          '   AND c.owner = t.owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION'
          
            'SELECT '#39'Table'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obj' +
            'ect name'#39' search_result,'
          
            '            :img_idx_table_root level0_index, :img_idx_table_chi' +
            'ld level1_index'
          '  FROM all_tab_comments c, all_tables t'
          ' WHERE c.comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.table_name'
          '   AND c.owner = t.owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION ALL'
          
            'SELECT '#39'View'#39' object_type, owner || '#39'.'#39' || view_name object_name' +
            ', '#39'Object name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_root_' +
            'child level1_index'
          '  FROM all_views'
          ' WHERE view_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION'
          
            'SELECT '#39'View'#39' object_type, owner || '#39'.'#39' || mview_name object_nam' +
            'e, '#39'Object name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_mviews'
          ' WHERE mview_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_columns c, all_views t'
          ' WHERE c.column_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.view_name'
          '   AND c.owner = t.owner'
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_columns c, all_mviews t'
          ' WHERE c.column_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.mview_name'
          '   AND c.owner = t.owner'
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_col_comments c, all_views t'
          ' WHERE c.comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.view_name'
          '   AND c.owner = t.owner'
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_col_comments c, all_mviews t'
          ' WHERE c.comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.mview_name'
          '   AND c.owner = t.owner'
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_comments c, all_views t'
          ' WHERE c.comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.view_name'
          '   AND c.owner = t.owner'
          'UNION ALL'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_comments c, all_mviews t'
          ' WHERE c.comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '   AND c.table_name = t.mview_name'
          '   AND c.owner = t.owner'
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '            :img_idx_function_root level0_index, :img_idx_functi' +
            'on_child level1_index'
          '  FROM all_source'
          ' WHERE text LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '     AND type = '#39'FUNCTION'#39
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '            :img_idx_procedure_root level0_index, :img_idx_proce' +
            'dure_child level1_index'
          '  FROM all_source'
          ' WHERE text LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '      AND type = '#39'PROCEDURE'#39
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '            :img_idx_package_root level0_index, :img_idx_package' +
            '_child level1_index'
          '  FROM all_source'
          ' WHERE text LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '       AND type = '#39'PACKAGE'#39
          'UNION ALL'
          
            'SELECT '#39'Trigger'#39' object_type, owner || '#39'.'#39' || trigger_name objec' +
            't_name, '#39'Object name'#39' search_result, '
          
            '             :img_idx_trigger_root level0_index,  :img_idx_trigg' +
            'er_child level1_index'
          '  FROM all_triggers'
          ' WHERE trigger_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '            :img_idx_trigger_root level0_index, :img_idx_trigger' +
            '_child level1_index'
          '  FROM all_source'
          ' WHERE text LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '       AND type = '#39'TRIGGER'#39
          'UNION ALL'
          
            'SELECT '#39'Constraint'#39' object_type, owner || '#39'.'#39' || constraint_name' +
            ' object_name, '#39'Object name'#39' search_result, '
          
            '           :img_idx_constraint_root level0_index, :img_idx_const' +
            'raint_child level1_index'
          '  FROM all_constraints'
          ' WHERE constraint_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION ALL'
          
            'SELECT '#39'Index'#39' object_type, owner || '#39'.'#39' || index_name object_na' +
            'me, '#39'Object name'#39' search_result, '
          
            '            :img_idx_index_root level0_index, :img_idx_index_chi' +
            'ld level1_index'
          '  FROM all_indexes'
          ' WHERE index_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION ALL'
          
            'SELECT  '#39'Sequence'#39' object_type, sequence_owner || '#39'.'#39' || sequenc' +
            'e_name object_name, '#39'Object name'#39' search_result, '
          
            '            :img_idx_sequence_root level0_index, :img_idx_sequen' +
            'ce_child level1_index'
          '  FROM all_sequences'
          ' WHERE sequence_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION ALL'
          
            'SELECT '#39'Synonym'#39' object_type, owner || '#39'.'#39' || synonym_name objec' +
            't_name, '#39'Object name'#39' search_result, '
          
            '            :img_idx_synonym_root level0_index, :img_idx_synonym' +
            '_child level1_index'
          '  FROM all_synonyms'
          ' WHERE synonym_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION ALL'
          
            'SELECT '#39'DB Link'#39' object_type, owner || '#39'.'#39' || db_link object_nam' +
            'e, '#39'Object name'#39' search_result, '
          
            '            :img_idx_dblink_rook level0_index, :img_idx_dblink_c' +
            'hild level1_index'
          '  FROM all_db_links'
          ' WHERE db_link LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          '')
      end
      item
        Name = 'SearchNotCaseSensitiveSQL'
        Strings.Strings = (
          
            'SELECT '#39'Table'#39' object_type, owner || '#39'.'#39' || table_name object_na' +
            'me, '#39'Object name'#39' search_result,'
          
            '            :img_idx_table_root level0_index, :img_idx_table_chi' +
            'ld level1_index'
          '  FROM all_tables '
          ' WHERE UPPER(table_name) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '   AND table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION '
          
            'SELECT '#39'Table'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obj' +
            'ect name'#39' search_result,'
          
            '             :img_idx_table_root level0_index,  :img_idx_table_c' +
            'hild level1_index'
          '  FROM all_tab_columns c, all_tables t'
          
            ' WHERE UPPER(c.column_name) LIKE '#39'%'#39' || UPPER(:searchstring) || ' +
            #39'%'#39
          '   AND c.table_name = t.table_name'
          '   AND c.owner = t.owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION'
          
            'SELECT '#39'Table'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obj' +
            'ect name'#39' search_result,'
          
            '             :img_idx_table_root level0_index,  :img_idx_table_c' +
            'hild level1_index'
          '  FROM all_col_comments c, all_tables t'
          ' WHERE UPPER(c.comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '   AND c.table_name = t.table_name'
          '   AND c.owner = t.owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION'
          
            'SELECT '#39'Table'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obj' +
            'ect name'#39' search_result,'
          
            '             :img_idx_table_root level0_index,  :img_idx_table_c' +
            'hild level1_index'
          '  FROM all_tab_comments c, all_tables t'
          ' WHERE UPPER(c.comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '   AND c.table_name = t.table_name'
          '   AND c.owner = t.owner'
          '   AND t.table_name NOT IN (SELECT mview_name FROM all_mviews) '
          'UNION ALL'
          
            'SELECT '#39'View'#39' object_type, owner || '#39'.'#39' || view_name object_name' +
            ', '#39'Object name'#39' search_result,'
          
            '             :img_idx_view_root level0_index, :img_idx_view_chil' +
            'd level1_index'
          '  FROM all_views'
          ' WHERE UPPER(view_name) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          'UNION'
          
            'SELECT '#39'View'#39' object_type, owner || '#39'.'#39' || mview_name object_nam' +
            'e, '#39'Object name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_mviews'
          ' WHERE UPPER(mview_name) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_columns c, all_views t'
          
            ' WHERE UPPER(c.column_name) LIKE '#39'%'#39' || UPPER(:searchstring) || ' +
            #39'%'#39
          '   AND c.table_name = t.view_name'
          '   AND c.owner = t.owner'
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_columns c, all_mviews t'
          
            ' WHERE UPPER(c.column_name) LIKE '#39'%'#39' || UPPER(:searchstring) || ' +
            #39'%'#39
          '   AND c.table_name = t.mview_name'
          '   AND c.owner = t.owner'
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_col_comments c, all_views t'
          ' WHERE UPPER(c.comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '   AND c.table_name = t.view_name'
          '   AND c.owner = t.owner'
          'UNION'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_col_comments c, all_mviews t'
          ' WHERE UPPER(c.comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '   AND c.table_name = t.mview_name'
          '   AND c.owner = t.owner'
          'UNION '
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_comments c, all_views t'
          ' WHERE UPPER(c.comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '   AND c.table_name = t.view_name'
          '   AND c.owner = t.owner'
          'UNION ALL'
          
            'SELECT '#39'View'#39', c.owner || '#39'.'#39' || c.table_name object_name, '#39'Obje' +
            'ct name'#39' search_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_tab_comments c, all_mviews t'
          ' WHERE UPPER(c.comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '   AND c.table_name = t.mview_name'
          '   AND c.owner = t.owner'
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '            :img_idx_function_root level0_index, :img_idx_functi' +
            'on_child level1_index'
          '  FROM all_source'
          ' WHERE UPPER(text) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '     AND type = '#39'FUNCTION'#39
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '            :img_idx_procedure_root level0_index,  :img_idx_proc' +
            'edure_child level1_index'
          '  FROM all_source'
          ' WHERE UPPER(text) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '      AND type = '#39'PROCEDURE'#39
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '             :img_idx_package_root level0_index,  :img_idx_packa' +
            'ge_child level1_index'
          '  FROM all_source'
          ' WHERE UPPER(text) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '    AND type = '#39'PACKAGE'#39
          'UNION ALL'
          
            'SELECT '#39'Trigger'#39' object_type, owner || '#39'.'#39' || trigger_name  obje' +
            'ct_name, '#39'Object name'#39' search_result, '
          
            '             :img_idx_trigger_root level0_index,  :img_idx_trigg' +
            'er_child level1_index'
          '  FROM all_triggers'
          
            ' WHERE UPPER(trigger_name) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39 +
            '%'#39
          'UNION ALL'
          
            'SELECT INITCAP(type), owner || '#39'.'#39' || name, '#39'Line '#39' || line || '#39 +
            ': '#39' || TRIM(RPAD(text, 255)), '
          
            '             :img_idx_trigger_root level0_index,  :img_idx_trigg' +
            'er_child level1_index'
          '  FROM all_source'
          ' WHERE UPPER(text) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '       AND type = '#39'TRIGGER'#39
          'UNION ALL'
          
            'SELECT '#39'Constraint'#39' object_type, owner || '#39'.'#39' || constraint_name' +
            '  object_name, '#39'Object name'#39' search_result, '
          
            '             :img_idx_constraint_root level0_index, :img_idx_con' +
            'straint_child level1_index'
          '  FROM all_constraints'
          
            ' WHERE UPPER(constraint_name) LIKE '#39'%'#39' || UPPER(:searchstring) |' +
            '| '#39'%'#39
          'UNION ALL'
          
            'SELECT '#39'Index'#39' object_type, owner || '#39'.'#39' || index_name  object_n' +
            'ame, '#39'Object name'#39' search_result, '
          
            '            :img_idx_index_root level0_index, :img_idx_index_chi' +
            'ld level1_index'
          '  FROM all_indexes'
          ' WHERE UPPER(index_name) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          'UNION ALL'
          
            'SELECT '#39'Sequence'#39' object_type, sequence_owner || '#39'.'#39' || sequence' +
            '_name  object_name, '#39'Object name'#39' search_result, '
          
            '            :img_idx_sequence_root level0_index, :img_idx_sequen' +
            'ce_child level1_index'
          '  FROM all_sequences'
          
            ' WHERE UPPER(sequence_name) LIKE '#39'%'#39' || UPPER(:searchstring) || ' +
            #39'%'#39
          'UNION ALL'
          
            'SELECT '#39'Synonym'#39' object_type, owner || '#39'.'#39' || synonym_name  obje' +
            'ct_name, '#39'Object name'#39' search_result, '
          
            '            :img_idx_synonym_root level0_index, :img_idx_synonym' +
            '_child level1_index'
          '  FROM all_synonyms'
          
            ' WHERE UPPER(synonym_name) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39 +
            '%'#39
          'UNION ALL'
          
            'SELECT '#39'DB Link'#39' object_type, owner || '#39'.'#39' || db_link  object_na' +
            'me, '#39'Object name'#39' search_result, '
          
            '            :img_idx_dblink_root level0_index,  :img_idx_dblink_' +
            'child level1_index'
          '  FROM all_db_links'
          ' WHERE UPPER(db_link) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          '')
      end
      item
        Name = 'SearchColumnsCaseSensitiveSQL'
        Strings.Strings = (
          
            'SELECT 1 id, owner || '#39'.'#39' || table_name object_name, table_name ' +
            'column_name, comments search_result'
          '  FROM all_tab_comments'
          ' WHERE comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION ALL'
          
            'SELECT 2, owner || '#39'.'#39' || table_name object_name, column_name, '#39 +
            'Column name'#39' search_result'
          '  FROM all_tab_columns'
          ' WHERE column_name LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'UNION ALL'
          
            'SELECT 3, owner || '#39'.'#39' || table_name object_name, column_name, c' +
            'omments search_result'
          '  FROM all_col_comments'
          ' WHERE comments LIKE '#39'%'#39' || :searchstring || '#39'%'#39
          'ORDER BY 2, 3, 1')
      end
      item
        Name = 'SearchColumnsNotCaseSensitiveSQL'
        Strings.Strings = (
          
            'SELECT 1 id, owner || '#39'.'#39' || table_name object_name, table_name ' +
            'column_name, comments search_result'
          '  FROM all_tab_comments'
          ' WHERE UPPER(comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          'UNION ALL'
          
            'SELECT 2, owner || '#39'.'#39' || table_name object_name, column_name, '#39 +
            'Column name'#39' search_result'
          '  FROM all_tab_columns'
          
            ' WHERE UPPER(column_name) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%' +
            #39
          'UNION ALL'
          
            'SELECT 3, owner || '#39'.'#39' || table_name object_name, column_name, c' +
            'omments search_result'
          '  FROM all_col_comments'
          ' WHERE UPPER(comments) LIKE '#39'%'#39' || UPPER(:searchstring) || '#39'%'#39
          'ORDER BY 2, 3, 1')
      end
      item
        Name = 'SchemaCompareTablesSQL'
        Strings.Strings = (
          
            'SELECT 1 id, '#39'Table'#39' object_type, owner || '#39'.'#39' || table_name obj' +
            'ect_name, 0, '#39#39' column_name, '#39'Object'#39' compare_result,'
          
            '            :img_idx_table_root level0_index, :img_idx_table_chi' +
            'ld level1_index'
          '  FROM all_tables'
          ' WHERE owner = :p_owner '
          '   AND table_name NOT IN (SELECT mview_name FROM all_mviews)')
      end
      item
        Name = 'SchemaCompareViewsSQL'
        Strings.Strings = (
          
            'SELECT 2 id, '#39'View'#39' object_type, owner || '#39'.'#39' || view_name objec' +
            't_name, 0, '#39#39', '#39'Object'#39' compare_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_views'
          ' WHERE owner = :p_owner'
          ' UNION ALL '
          
            'SELECT 2 id, '#39'View'#39' object_type, owner || '#39'.'#39' || mview_name obje' +
            'ct_name, 0, '#39#39', '#39'Object'#39' compare_result,'
          
            '            :img_idx_view_root level0_index, :img_idx_view_child' +
            ' level1_index'
          '  FROM all_mviews'
          ' WHERE owner = :p_owner'
          '')
      end
      item
        Name = 'SchemaCompareFunctionsSQL'
        Strings.Strings = (
          
            'SELECT 3 id, INITCAP(type) object_type, owner || '#39'.'#39' || name obj' +
            'ect_name, line, '#39#39' column_name,'
          
            '            '#39'Line '#39' || line || '#39': '#39' || TRIM(RPAD(text, 255)) com' +
            'pare_result,'
          
            '            :img_idx_function_root level0_index, :img_idx_functi' +
            'on_child level1_index'
          '  FROM all_source'
          ' WHERE owner = :p_owner'
          '   AND type = '#39'FUNCTION'#39)
      end
      item
        Name = 'SchemaCompareProceduresSQL'
        Strings.Strings = (
          
            'SELECT 4 id, INITCAP(type) object_type, owner || '#39'.'#39' || name obj' +
            'ect_name, line, '#39#39' column_name, '
          
            '            '#39'Line '#39' || line || '#39': '#39' || TRIM(RPAD(text, 255)) com' +
            'pare_result,'
          
            '            :img_idx_procedure_root level0_index, :img_idx_proce' +
            'dure_child level1_index'
          '  FROM all_source'
          ' WHERE owner = :p_owner'
          '   AND type = '#39'PROCEDURE'#39)
      end
      item
        Name = 'SchemaComparePackagesSQL'
        Strings.Strings = (
          
            'SELECT 5 id, INITCAP(type) object_type, owner || '#39'.'#39' || name obj' +
            'ect_name, line, '#39#39' column_name,'
          
            '            '#39'Line '#39' || line || '#39': '#39' || TRIM(RPAD(text, 255)) com' +
            'pare_result,'
          
            '            :img_idx_package_root level0_index, :img_idx_package' +
            '_child level1_index'
          '  FROM all_source'
          ' WHERE owner = :p_owner'
          '   AND type = '#39'PACKAGE'#39
          ''
          ''
          ''
          ''
          '')
      end
      item
        Name = 'SchemaCompareTriggersSQL'
        Strings.Strings = (
          
            'SELECT 6 id, '#39'Trigger'#39' object_type, owner || '#39'.'#39' || trigger_name' +
            ' object_name, 0, '#39#39' column_name, '#39'Object'#39' compare_result,'
          
            '            :img_idx_trigger_root level0_index, :img_idx_trigger' +
            '_child level1_index'
          '  FROM all_triggers'
          ' WHERE owner = :p_owner'
          'UNION ALL'
          
            '--SELECT 6 id, '#39'Trigger'#39' object_type, owner || '#39'.'#39' || trigger_na' +
            'me object_name, 0, '#39#39', description search_result,'
          '--           10 level0_index, 11 level1_index'
          '--  FROM all_triggers'
          '-- WHERE owner = :p_owner'
          
            'SELECT 3 id, INITCAP(type) object_type, owner || '#39'.'#39' || name obj' +
            'ect_name, line, '#39#39' column_name,'
          
            '            '#39'Line '#39' || line || '#39': '#39' || TRIM(RPAD(text, 255)) com' +
            'pare_result,'
          
            '           :img_idx_trigger_root level0_index, :img_idx_trigger_' +
            'child level1_index'
          '  FROM all_source'
          ' WHERE owner = :p_owner'
          '   AND type = '#39'TRIGGER'#39)
      end
      item
        Name = 'SchemaCompareConstraintsSQL'
        Strings.Strings = (
          
            'SELECT 7 id, '#39'Constraint'#39' object_type, owner || '#39'.'#39' || constrain' +
            't_name object_name, 0, '#39#39' column_name, '#39'Object'#39' compare_result,'
          
            '           :img_idx_constraint_root level0_index, :img_idx_const' +
            'raint_child level1_index'
          '  FROM all_constraints'
          ' WHERE owner = :p_owner'
          '')
      end
      item
        Name = 'SchemaCompareIndexesSQL'
        Strings.Strings = (
          
            'SELECT 8 id, '#39'Index'#39' object_type, owner || '#39'.'#39' || index_name obj' +
            'ect_name, 0, '#39#39' column_name, '#39'Object'#39' compare_result,'
          
            '            :img_idx_index_root level0_index, :img_idx_index_chi' +
            'ld level1_index'
          '  FROM all_indexes'
          ' WHERE owner = :p_owner'
          '')
      end
      item
        Name = 'SchemaCompareSequencesSQL'
        Strings.Strings = (
          
            'SELECT 9 id, '#39'Sequence'#39' object_type, sequence_owner || '#39'.'#39' || se' +
            'quence_name object_name, 0, '#39#39' column_name, '#39'Object'#39' compare_res' +
            'ult,'
          
            '            :img_idx_sequence_root level0_index, :img_idx_sequen' +
            'ce_child level1_index'
          '  FROM all_sequences'
          ' WHERE sequence_owner = :p_owner')
      end
      item
        Name = 'SchemaCompareSynonymsSQL'
        Strings.Strings = (
          
            'SELECT 10 id, '#39'Synonym'#39' object_type, table_owner || '#39'.'#39' || synon' +
            'ym_name object_name, 0, '#39#39' column_name, '#39'Object'#39' compare_result,'
          
            '            :img_idx_synonym_root level0_index, :img_idx_synonym' +
            '_child level1_index'
          '  FROM all_synonyms'
          ' WHERE table_owner = :p_owner')
      end
      item
        Name = 'SchemaCompareDBLinksSQL'
        Strings.Strings = (
          
            'SELECT 11 id, '#39'DB Link'#39' object_type, username || '#39'.'#39' || db_link ' +
            'object_name, 0, '#39#39' column_name, '#39'Object'#39' compare_result,'
          
            '            :img_idx_dblink_root level0_index,  :img_idx_dblink_' +
            'child level1_index'
          '  FROM all_db_links'
          ' WHERE username = :p_owner'
          ''
          '')
      end
      item
        Name = 'SchemaCompareTableCommentsSQL'
        Strings.Strings = (
          
            'SELECT 12 id, '#39'Table comment'#39' object_type, owner || '#39'.'#39' || table' +
            '_name object_name, 0, table_name column_name,'
          
            '       comments compare_result, 23  level0_index, 23 level1_inde' +
            'x'
          '  FROM all_tab_comments'
          ' WHERE owner = :p_owner'
          '     AND comments IS NOT NULL'
          '')
      end
      item
        Name = 'SchemaCompareColumnNamesSQL'
        Strings.Strings = (
          
            'SELECT 13 id, '#39'Column name'#39'  object_type, owner || '#39'.'#39' || table_' +
            'name object_name, 0, column_name, column_name compare_result,'
          '       22 level0_index, 22 level1_index'
          '  FROM all_tab_columns'
          ' WHERE owner = :p_owner')
      end
      item
        Name = 'SchemaCompareColumnCommentsSQL'
        Strings.Strings = (
          
            'SELECT 14 id, '#39'Column comment'#39' object_type, owner || '#39'.'#39' || tabl' +
            'e_name object_name, 0, column_name, comments compare_result,'
          '       23  level0_index, 23 level1_index'
          '  FROM all_col_comments'
          ' WHERE owner = :p_owner'
          '      AND comments IS NOT NULL')
      end
      item
        Name = 'PackageSpecificationSQL'
        Strings.Strings = (
          'SELECT text'
          '  FROM all_source'
          ' WHERE name = :p_object_name'
          '   AND type = '#39'PACKAGE'#39
          '   AND owner = :p_owner'
          'ORDER BY line')
      end
      item
        Name = 'PackageBodySQL'
        Strings.Strings = (
          'SELECT text'
          '  FROM all_source'
          ' WHERE name = :p_object_name'
          '   AND type = '#39'PACKAGE BODY'#39
          '   AND owner = :p_owner'
          '--   AND line = :p_line')
      end
      item
        Name = 'CreationAndModificationTimestampSQL'
        Strings.Strings = (
          'SELECT created, last_ddl_time'
          '  FROM all_objects'
          ' WHERE owner = :owner'
          '   AND object_name = :object')
      end>
    Left = 54
    Top = 18
  end
end
