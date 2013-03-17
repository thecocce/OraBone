object OptionsDialog: TOptionsDialog
  Left = 580
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 358
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 321
    Width = 470
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object OKButton: TButton
      Left = 308
      Top = 6
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Action = OKButtonAction
      Align = alRight
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 389
      Top = 6
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 383
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 321
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 1
    object PageControl: TBCPageControl
      Left = 6
      Top = 6
      Width = 458
      Height = 315
      ActivePage = EditorTabSheet
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabDragDrop = False
      HoldShiftToDragDrop = False
      ShowCloseButton = False
      object EditorTabSheet: TTabSheet
        Caption = 'Editor'
        object EditorFontGroupBox: TGroupBox
          Left = 6
          Top = 0
          Width = 436
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' Font '
          TabOrder = 0
          object SpeedButton1: TSpeedButton
            Left = 398
            Top = 20
            Width = 23
            Height = 22
            Action = SelectFontAction
            Glyph.Data = {
              FE020000424DFE02000000000000FE0100002800000010000000100000000100
              08000000000000010000120B0000120B0000720000007200000000000000FFFF
              FF00FF00FF00705364009053550077494B00FF828300F27B7D00FF838400F47D
              7F00CE6B6D00FF868700FC848600FF878800B6626300A65A5B00884D4E009957
              5900A65F6000985759007D4B4C00D8707000D7707000D36E6E00AC5B5A00FF86
              8600BD656500A15656008E4D4D00A75B5B00A65B5B00A0585800A15959009F58
              58009C5656009C5757009A5656009F5A590098555500935353007F4949007A47
              4700CF433F00CB433F00E36C6800744544007E4D4C00FE7E0000EA880900AB79
              1F00BD882200968A3400837B310000F3ED0000EDEE0009D9FA0008CBF00008C1
              E900019FD100048EBA000998C5000D779A0011A3D4001176A1002793C100006A
              A600026398001290D3001B90D0004490BA000065A00000609A00056099000A7B
              BD001593DD002295DD00299DE3002E99DD0036ADF80000569000025F9E00035D
              9A000564A3000765A6000963A0000A6099000C66A4000F6EAF001273B400228B
              CF002DA1EE001B5D8B003299DE00095E9E00095F9E0009609E00095D99001F62
              9600428EC900459CEA005083B1004F759C004A6B8B003698FE00216EF2002269
              FA0059658300374D87005B688B000F42F7006F7BA3007782A600062AF8007F82
              9F00020202020202020202020202020202020202020202020202020202020202
              02020202020202020202020202020202020202022821182E02020323121C0202
              0202020202200B0F0202022C1925020202020202020222070414051606110202
              020202020202021F17290216061302020202020202020202211A2D1506220202
              020202020202020202210E0A081B02020202020202020202020226090D1D0202
              0202020202020202020202240C1E020202020202020202020202020227100202
              0202020202020202020202020202020202020202020202020202020202020202
              0202020202020202020202020202020202020202020202020202020202020202
              0202}
          end
          object Panel3: TPanel
            Left = 10
            Top = 20
            Width = 283
            Height = 37
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            BevelOuter = bvNone
            TabOrder = 0
            object FontLabel: TLabel
              Left = 5
              Top = 2
              Width = 128
              Height = 16
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Courier New 10pt'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object LineSpacingGroupBox: TGroupBox
          Left = 6
          Top = 56
          Width = 436
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' Line spacing / Tab spacing '
          TabOrder = 1
          object Label8: TLabel
            Left = 15
            Top = 24
            Width = 53
            Height = 13
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Extra Lines'
          end
          object Label9: TLabel
            Left = 239
            Top = 24
            Width = 49
            Height = 13
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Tab Width'
          end
          object LineSpacingEdit: TBCEdit
            Left = 135
            Top = 20
            Width = 64
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = '0'
            OnlyNumbers = True
            NumbersWithDots = False
            NumbersWithSpots = False
            EditColor = clInfoBk
            NumbersAllowNegative = False
          end
          object TabWidthEdit: TBCEdit
            Left = 357
            Top = 20
            Width = 64
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 1
            Text = '8'
            OnlyNumbers = True
            NumbersWithDots = False
            NumbersWithSpots = False
            EditColor = clInfoBk
            NumbersAllowNegative = False
          end
        end
        object RightEdgeGroupBox: TGroupBox
          Left = 6
          Top = 112
          Width = 214
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' Right Edge '
          TabOrder = 2
          object Label10: TLabel
            Left = 14
            Top = 24
            Width = 62
            Height = 13
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Edge Column'
          end
          object EdgeColumnEdit: TBCEdit
            Left = 135
            Top = 20
            Width = 63
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            TabOrder = 0
            Text = '100'
            OnlyNumbers = True
            NumbersWithDots = False
            NumbersWithSpots = False
            EditColor = clInfoBk
            NumbersAllowNegative = False
          end
        end
        object GroupBox1: TGroupBox
          Left = 228
          Top = 112
          Width = 214
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' Tabs '
          TabOrder = 3
          object MultilineCheckBox: TCheckBox
            Left = 15
            Top = 20
            Width = 147
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = ' Multiline'
            TabOrder = 0
          end
        end
        object GutterGroupBox: TGroupBox
          Left = 6
          Top = 168
          Width = 214
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' Gutter '
          TabOrder = 4
          object LineNumbersCheckBox: TCheckBox
            Left = 15
            Top = 20
            Width = 90
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = ' Line numbers'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object GutterVisibleCheckBox: TCheckBox
            Left = 135
            Top = 20
            Width = 62
            Height = 21
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = ' Visible'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object PollingIntervalGroupBox: TGroupBox
          Left = 228
          Top = 168
          Width = 214
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' DBMS output polling interval: 1 second '
          TabOrder = 5
          DesignSize = (
            214
            54)
          object PollingIntervalSlider: TJvxSlider
            Left = 10
            Top = 15
            Width = 196
            Height = 40
            Increment = 1
            MinValue = 1
            MaxValue = 10
            Options = [soShowPoints, soSmooth]
            TabOrder = 0
            Value = 1
            Anchors = [akLeft, akTop, akRight]
            OnChange = PollingIntervalSliderChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 224
          Width = 436
          Height = 54
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = ' Button Panel Align'
          TabOrder = 6
          object SchemaBrowserLabel: TLabel
            Left = 14
            Top = 24
            Width = 79
            Height = 13
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Schema Browser'
          end
          object ObjectFrameLabel: TLabel
            Left = 238
            Top = 24
            Width = 65
            Height = 13
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Object Frame'
          end
          object SchemaBrowserComboBox: TBCComboBox
            Left = 136
            Top = 20
            Width = 62
            Height = 21
            ItemHeight = 13
            ReadOnly = False
            TabOrder = 0
            Text = 'Bottom'
            Items.Strings = (
              'Bottom'
              'Top')
            EditColor = clInfoBk
            DeniedKeyStrokes = True
            DropDownFixedWidth = 0
          end
          object ObjectFrameComboBox: TBCComboBox
            Left = 356
            Top = 20
            Width = 64
            Height = 21
            ItemHeight = 13
            ReadOnly = False
            TabOrder = 1
            Text = 'Bottom'
            Items.Strings = (
              'Bottom'
              'Top')
            EditColor = clInfoBk
            DeniedKeyStrokes = True
            DropDownFixedWidth = 0
          end
        end
      end
      object DateFormatTabSheet: TTabSheet
        Caption = 'Date Format'
        ImageIndex = 1
        DesignSize = (
          450
          287)
        object DateFormatLabel: TLabel
          Left = 11
          Top = 13
          Width = 60
          Height = 13
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Date Format'
        end
        object DateFormat1Label: TLabel
          Left = 11
          Top = 60
          Width = 425
          Height = 32
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Use the Date Format to specify the default date format used when' +
            ' Oracle makes conversions from internal date format into string ' +
            'values and vice versa.'
          WordWrap = True
          ExplicitWidth = 421
        end
        object DateFormat2Label: TLabel
          Left = 11
          Top = 89
          Width = 37
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'D'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 33
        end
        object DateFormat3Label: TLabel
          Left = 53
          Top = 89
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Day of week (1-7).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label4: TLabel
          Left = 53
          Top = 105
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Day of month (1-31).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label5: TLabel
          Left = 11
          Top = 105
          Width = 37
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'DD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 33
        end
        object Label6: TLabel
          Left = 53
          Top = 121
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Day of year (1-366).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label7: TLabel
          Left = 11
          Top = 121
          Width = 37
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'DDD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 33
        end
        object Label11: TLabel
          Left = 11
          Top = 137
          Width = 45
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'DAY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 41
        end
        object Label12: TLabel
          Left = 53
          Top = 137
          Width = 374
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Name of day, padded with blanks to display width of the widest n' +
            'ame of day in the date language used for this element.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label17: TLabel
          Left = 11
          Top = 169
          Width = 45
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'MM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 41
        end
        object Label18: TLabel
          Left = 53
          Top = 169
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Month (01-12; January = 01).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label19: TLabel
          Left = 11
          Top = 185
          Width = 45
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'MON'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 41
        end
        object Label20: TLabel
          Left = 53
          Top = 185
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Abbreviated name of month.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label21: TLabel
          Left = 11
          Top = 201
          Width = 45
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'MONTH'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 41
        end
        object Label22: TLabel
          Left = 53
          Top = 201
          Width = 374
          Height = 28
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Name of month, padded with blanks to display width of the widest' +
            ' name of month in the date language used for this element.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label23: TLabel
          Left = 11
          Top = 231
          Width = 45
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'YY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 41
        end
        object Label24: TLabel
          Left = 53
          Top = 231
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Year last 2 digits'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label27: TLabel
          Left = 11
          Top = 247
          Width = 45
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'YYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 41
        end
        object Label28: TLabel
          Left = 53
          Top = 247
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Year as 4 digits'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label15: TLabel
          Left = 11
          Top = 39
          Width = 40
          Height = 13
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Example'
        end
        object DateFormatEdit: TBCEdit
          Left = 84
          Top = 10
          Width = 355
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          CharCase = ecUpperCase
          TabOrder = 0
          Text = 'DD.MM.YYYY'
          OnChange = DateFormatEditChange
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          NumbersAllowNegative = False
        end
        object DateFormatExampleEdit: TBCEdit
          Left = 84
          Top = 36
          Width = 355
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabStop = False
          CharCase = ecUpperCase
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 1
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          NumbersAllowNegative = False
        end
      end
      object TimeFormatTabSheet: TTabSheet
        Caption = 'Time Format'
        ImageIndex = 2
        DesignSize = (
          450
          287)
        object Label16: TLabel
          Left = 11
          Top = 13
          Width = 60
          Height = 13
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Date Format'
        end
        object Label25: TLabel
          Left = 11
          Top = 39
          Width = 40
          Height = 13
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Example'
        end
        object Label26: TLabel
          Left = 11
          Top = 65
          Width = 425
          Height = 32
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Use the Time Format property to specify the default time format ' +
            'used when Oracle makes conversions from internal time format int' +
            'o string values and vice versa.'
          WordWrap = True
          ExplicitWidth = 421
        end
        object Label29: TLabel
          Left = 11
          Top = 94
          Width = 37
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'HH'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 33
        end
        object Label30: TLabel
          Left = 53
          Top = 94
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Hour of day (1-12).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label31: TLabel
          Left = 53
          Top = 110
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Hour of day (0-23).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label32: TLabel
          Left = 11
          Top = 110
          Width = 37
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'HH24'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 33
        end
        object Label33: TLabel
          Left = 11
          Top = 126
          Width = 37
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'MI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 33
        end
        object Label34: TLabel
          Left = 11
          Top = 142
          Width = 45
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'SS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 41
        end
        object Label47: TLabel
          Left = 53
          Top = 142
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Second (0-59).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object Label48: TLabel
          Left = 52
          Top = 126
          Width = 393
          Height = 16
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Minute (0-59).'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 389
        end
        object TimeFormatExampleEdit: TBCEdit
          Left = 84
          Top = 36
          Width = 355
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          TabStop = False
          CharCase = ecUpperCase
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          NumbersAllowNegative = False
        end
        object TimeFormatEdit: TBCEdit
          Left = 84
          Top = 10
          Width = 355
          Height = 21
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          CharCase = ecUpperCase
          TabOrder = 1
          Text = 'HH24:MI:SS'
          OnChange = TimeFormatEditChange
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          NumbersAllowNegative = False
        end
      end
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [fdFixedPitchOnly, fdNoSimulations]
    Left = 48
    Top = 360
  end
  object ActionList: TActionList
    Left = 272
    Top = 42
    object SelectFontAction: TAction
      OnExecute = SelectFontActionExecute
    end
    object OKButtonAction: TAction
      Caption = '&OK'
      OnExecute = OKButtonActionExecute
    end
  end
end
