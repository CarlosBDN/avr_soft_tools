#   Algorithm Builder `   �   K   5   K   K   d   K   K   K   �   K   K   K   K   K   d   K   K   d   K   K     K   K     	       proc_Voltage8  Word       proc_Voltage8_  Word       proc_Voltage8_Correcting  Word       proc_Voltage8_Corrected  Word       proc_NomVoltage8  Word       proc_dVoltage8  Word       proc_Status         proc_ErrorIndex         proc_Voltage8_UpdatedFactor                       proc_ExceedLimitationVoltageValue  Word  80                      	       proc_st_FL 0      proc_st_EQ 1      proc_st_BC 2      proc_st_TC 3      proc_st_TP 4      proc_st_TR 5      proc_st_BD 6             proc_ExceedLimitationVoltageValue_48 18 1V �S  Y                    V1     $
      .  + proc_Status_ansi_E_txt  1 F.            + "Floating~             "  . F.            + "Equalization~         "  . F.            + "Connecting batarey~   "  . F.            + "Capacity batarey test~"  . F.            + "Power batarey test~   "  . F.            + "Recovering charge~    "  . F.            + "Batarey discharge~    "  . V%     %
  	    "  
 proc_Reset  % F&         
    # 0 -> proc_Status  & F3             0 0 -> proc_Voltage8_Correcting  3 F)             & 0 -> proc_Voltage8_  ) F6             3 0 -> proc_Voltage8_UpdatedFactor  6 F9             6 proc_SetVoltage(st_FloatingVoltage)  9 F              Ret   V*     &
      '   proc_Status_txt  * F             "FLT",0   F             "EQU",0   F             "LVR",0   F             "TCP",0   F             "TPW",0   F             "TRC",0   F             "BAT",0   V1     '
      .   proc_Status_ansi_R_txt  1 F.            + "��������~             "  . F.            + "������������ ������~  "  . F.            + "����������� ������~   "  . F.            + "���� ������� �������~ "  . F.            + "���� �������� �������~"  . F.            + "�������������� ������~"  . F.            + "������ �������~       "  . V(     (
       %   proc_DrawMode  ( FR         !    O lcd_LoadStr_Table_Pos(0, proc_Status_txt, proc_Status, 0, 4)  R F         "     Ret   V(     )
  #    %   proc_OnSecond  ( F'         $    $ proc_DetectStatus  ' F         %     proc_Main   F*         &    ' proc_Correct_Voltage  * F         '     Ret   V$     *
  (    ! "  proc_Main  $ C-    �  )    *�llElementsRadioButtonLeftTop� Width� HeightCursorcrHandPointCaptionAll elementsChecked	TabOrder W = $FFFF  #C!    y       r  TRadioButtonJMPVectorRadioButtonLeftTophWidth� HeightCursorcrHandPointCaption
 rect_ACFault = True  -C'    �  *    $llElementsRadioButtonLeftTop� Width� HeightCursorcrHandPointCaptionAll elementsChecked	TabOrder W = $FFFF  #C!    y       r  TRadioButtonJMPVectorRadioButtonLeftTophWidth� HeightCursorcrHandPointCaption
 bat_Count = 0  'F)         +    & proc_ExecuteVoltage  ) F2         ,    / proc_ExceedLimitationVoltage  2 F4         -    1 1 -> rect_WriteVoltage_Enabled  4 F         .     Ret   V     +
  /     &     F,         0    ) proc_SetDefaultVoltage  , F         1     Ret   V     ,
  2     % $    F:         3    7 proc_SetVoltage(st_FloatingVoltage_)  : F4         4    1 1 -> rect_WriteVoltage_Enabled  4 F         5     Ret   V,     -
  6    ) , & proc_DetectStatus  , F/         7    , proc_st_FL -> proc_Status  / C(    �  8    %��flag set on: MA�           =  L     �
           F               ZH ! ZL   F(              % ON_PIN_FACTOR -> X  ( J    "       � � C>    �        ;2   C             �(TOP: $FF;  TOV flag set on: MAX0   #          PWM, rect_Count = 0  (C/    �  9    ,���flag set on: MA�           =  L     �
           F               ZH ! ZL   F(              % ON_PIN_FACTOR -> X  ( J    "       � � C>    �        ;2   C             �(TOP: $FF;  TOV flag set on: MAX0   #          PWM, sto_bat_Discharge = 0  /L     .
  :        F/         ;    , proc_st_BD -> proc_Status  / F         <     Ret   V     /
  =     2     CJ    �  >    G�flag set on: MA�           =  L     �
           F               ZH ! ZL   F(              % ON_PIN_FACTOR -> X  ( J    "       � � C>    �        ;2   C             �(TOP: $FF;  TOV flag set on: MAX0   #          PWM, bat_tst_cap_Activated -= BAT_TST_ACTIVATED_VALUE  JF/         ?    , proc_st_TC -> proc_Status  / F         @     Ret   V     0
  A     5      CJ    �  B    G�� rHandPointCaptionTextTabOrder   TRadioButtonFieldRadioButtonLeftTopWidth� HeightCursorcrHandPointCaptionFieldTabOrder  TRadioButtonVertexRadioButtonLeftTop8Width� HeightCursorcrHandPointCaptionVertexTabOrde bat_tst_pwr_Activated -= BAT_TST_ACTIVATED_VALUE  JF/         C    , proc_st_TP -> proc_Status  / F         D     Ret   V     1
  E     8     CN    �  F    KrHandPointCaptionTextTabOrder   TRadioButtonFieldRadioButtonLeftTopWidth� HeightCursorcrHandPointCaptionFieldTabOrder  TRadioButtonVertexRadioButtonLeftTop8Width� HeightCursorcrHandPointCaptionVertexTabOrde bat_tst_RecoveryActivated -= BAT_TST_ACTIVATED_VALUE  NF/         G    , proc_st_TR -> proc_Status  / F         H     Ret   V     2
  I     <      C6    �  J    3��

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2 lvd_proc_RecoveryVoltage = 0  6F/         K    , proc_st_BC -> proc_Status  / F         L     Ret   V     3
  M     ?     C,    �  N    )�flag set on: MA�           =  L     �
           F               ZH ! ZL   F(              % ON_PIN_FACTOR -> X  ( J    "       � � C>    �        ;2   C             �(TOP: $FF;  TOV flag set on: MAX0   #          PWM, bat_eq_Minutes = 0  ,F/         O    , proc_st_EQ -> proc_Status  / L     4
  P        F         Q     Ret   V.     5
  R    +   proc_SetTypeVoltage  . Fr         S    o rect_SetTypeVoltage(proc_ExceedLimitationVoltageValue, proc_ExceedLimitationVoltageValue_48)  r F         T     Ret   V/     6
  U    , H  proc_Correct_Voltage  / F>         V    ; proc_ExceedLimitationVoltageValue -> rr0  > F         W     << rr0   F         X     << rr0   F         Y     << rr0   F(         Z    % proc_Voltage8 -> X  ( F)         [    & proc_Voltage8_ -> W  ) F)         \    & X -> proc_Voltage8_  ) F8         ]    5 proc_Voltage8_UpdatedFactor -> r18  8 C    �  ^    ���

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2 X = W  F         _     10 -> r18   J    �  `     ��

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2  V     7
  a     R     C(    �  b    %    ��

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2r18 -- r18 -= 0  (L     9
  c        F8         d    5 r18 -> proc_Voltage8_UpdatedFactor  8 F%         e    " st_Voltage -> Y  % F         f     << Y   F         g     << Y   F         h     << Y   F3         i    0 proc_Voltage8_Correcting -> W  3 C(    �  j    %�
	� ��

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2 rect_Count = 0  (C"    �  k    
� ��

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2 r18 -= 0  "C    �  l    
�RETI
NOP
RETI
NOP
RETI
NOP
goto $0
goto $0
goto $0
RETI
NOP
RETI
NOP
goto $0
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP
goto $0
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP
RETI
NOP Y = X  C     �  m    ���lElementsRadioButtonLeftTop� Width� HeightCursorcrHandPointCaptionAll elementsChecked	TabOrder W = $FFFF  #C!    y       r  TRadioButtonJMPVectorRadioButtonLeftTophWidth� HeightCursorcrHandPointCaption
 Y >= X   F         n     W + 1   C+    �  o    ( 
�

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2rr0 -> W W �>= rr0  +J    �  p    �  lElementsRadioButtonLeftTop� Width� HeightCursorcrHandPointCaptionAll elementsChecked	TabOrder W = $FFFF  #C!    y       r  TRadioButtonJMPVectorRadioButtonLeftTophWidth� HeightCursorcrHandPointCaption
  V     ;
  q     `     F         r     W - 1   F         s     - rr0   C*    �  t    '�  	��

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2rr0 -> W W �< rr0  *L     =
  u        F3         v    0 W -> proc_Voltage8_Correcting  3 F         w     X + W   F2         x    / X -> proc_Voltage8_Corrected  2 F         y     Ret   V*     >
  z    ' l  proc_DecVoltage  * F1         {    . proc_TestApproachingVoltage  1 F(         |    % proc_Voltage8 -> X  ( F(         }    % X - proc_dVoltage8  ( F0         ~    - bat_LowVoltageRecover -> Y  0 F              << Y   F         �     << Y   F         �     << Y   C%    �  �    " �  ttonLeft Top WidthKHeightCursorcrHandPointCaptionSearchDefault	TabOrderOnClickSearchButtonClick  TButtonCancelButtonLeft� Top WidthKHeightCursorcrHandPointCancel	CaptionCancelTabOrderOnClickCancelButtonClY -> X X < Y  %F)         �    & X  -> proc_Voltage8  ) F         �     Ret   V*     @
  �    ' l  proc_IncVoltage  * F1         �    . proc_TestApproachingVoltage  1 F(         �    % proc_Voltage8 -> X  ( F(         �    % X + proc_dVoltage8  ( F+         �    ( rect_OverVoltage -> Y  + F         �     << Y   F         �     << Y   F         �     << Y   C%    �  �    " C r18 --   F               r0 -> r16   F-              * CustomByteToHexadecimal  - F"               "]" -> [Y++]  " F               Ret   V2     �       /   rect_mgnold_FillAddress  2 F)              & @cmd_tx_Data+1 -> Y  ) F.              +Y -> X Y < X  %F(         �    % X -> proc_Voltage8  ( F         �     Ret   V6     B
  �    3 l + proc_TestApproachingVoltage  6 C2    �  �    /��Voltage -> rr0  0 F                rr0 -> rr2    F                rr0 -> rr4    F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F ve_EditActivated = False  2C;    �  �    8� Voltage -> rr0  0 F                rr0 -> rr2    F                rr0 -> rr4    F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F ve_Pointer = @st_FloatingVoltage_  ;L     C
  �        F(         �    % proc_Voltage8 -> X  ( F+         �    ( proc_NomVoltage8 -> Y  + F         �     X - Y   C"    �  �     � Voltage -> rr0  0 F                rr0 -> rr2    F                rr0 -> rr4    F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F- X C = 1  "F         �     YH -> YL   F         �     0 -> YH   C2    �  �    /) � Voltage -> rr0  0 F                rr0 -> rr2    F                rr0 -> rr4    F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F1 -> proc_dVoltage8 X < Y  2F         �     Ret   V     F
  �     r      F)         �    & 8 -> proc_dVoltage8  ) F(         �    % proc_Voltage8 -> X  ( F         �     XL & $F8   F(         �    % X -> proc_Voltage8  ( F         �     Ret   V7     G
  �    4 ~ & proc_ExceedLimitationVoltage  7 F)         �    & lvd_AllDisconnected  ) C    �  �    �		�02 ' F               Ret   V.            +   rect_chr_CallStatus  . F&              # rect_chr_tx_Init  & F/               0 -> [Y++] Get Status (#2) / F7              . proc_Voltage8 -> [Y++]:Word (#3,4) 7 F               Ret   V1        T = 1  F(         �    % proc_Voltage8 -> X  ( F%         �    " st_Voltage -> Y  % F;         �    8 Y + proc_ExceedLimitationVoltageValue  ; F         �     << Y   F         �     << Y   F         �     << Y   C%       �    " �.02 ' F               Ret   V.            +   rect_chr_CallStatus  . F&              # rect_chr_tx_Init  & F/               0 -> [Y++] Get Status (#2) / F7              . proc_Voltage8 -> [Y++]:Word (#3,4) 7 F               Ret   V1       Y -> X X > Y  %F(         �    % X -> proc_Voltage8  ( L     I
  �        F         �     Ret   V.     J
  �    + }  proc_ExecuteVoltage  . F0         �    - bat_tst_cap_ExecuteVoltage  0 C"      �       rHandPointCaptionTextTabOrder   TRadioButtonFieldRadioButtonLeftTopWidth� HeightCursorcrHandPointCaptionFieldTabOrder  TRadioButtonVertexRadioButtonLeftTop8Width� HeightCursorcrHandPointCaptionVertexTabOrdeRet T = 1  "F0         �    - bat_tst_pwr_ExecuteVoltage  0 C"      �       rHandPointCaptionTextTabOrder   TRadioButtonFieldRadioButtonLeftTopWidth� HeightCursorcrHandPointCaptionFieldTabOrder  TRadioButtonVertexRadioButtonLeftTop8Width� HeightCursorcrHandPointCaptionVertexTabOrdeRet T = 1  "F3         �    0 lvd_proc_RecoveryVoltage -> X  3 C       �    � rHandPointCaptionTextTabOrder   TRadioButtonFieldRadioButtonLeftTopWidth� HeightCursorcrHandPointCaptionFieldTabOrder  TRadioButtonVertexRadioButtonLeftTop8Width� HeightCursorcrHandPointCaptionVertexTabOrde X -= 0   C-      �    * rHandPointCaptionTextTabOrder   TRadioButtonFieldRadioButtonLeftTopWidth� HeightCursorcrHandPointCaptionFieldTabOrder  TRadioButtonVertexRadioButtonLeftTop8Width� HeightCursorcrHandPointCaptionVertexTabOrde bat_eq_Minutes -= 0  -F.         �    + st_FloatingVoltage_ -> X  . J      �     rHandPointCaptionTextTabOrder   TRadioButtonFieldRadioButtonLeftTopWidth� HeightCursorcrHandPointCaptionFieldTabOrder  TRadioButtonVertexRadioButtonLeftTop8Width� HeightCursorcrHandPointCaptionVertexTabOrde  V     M
  �     �     F)         �    & bat_eq_Voltage -> X  ) L     N
  �        F$         �    ! bat_tc_Execute  $ F         �     << X   F         �     << X   F         �     << X   F+         �    ( X -> proc_NomVoltage8  + F)         �    & 1 -> proc_dVoltage8  ) C+      �    (�� Voltage -> rr0  0 F                rr0 -> rr2    F                rr0 -> rr4    F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F               rr4 >>   F proc_Voltage8 > X  +F(         �    % bat_Charge_Control  ( C      �    ���                                                                                                                                                                                                                                                             T = 1  CJ      �    G%  4

                 r18 --   L     d            F               Ret   V)     e        & f  lcd_ShowFlash_  ) F#                lcd_FillPage_  # F               lcd_Show   F               Ret       O main_05Second_Event = False  5F2proc_IncVoltage proc_Voltage8 -= proc_NomVoltage8  JF         �     Ret   V     P
  �     �     F%         �    " proc_DecVoltage  % F         �     Ret   V     Q
  �     �     F'         �    $ proc_SetVoltage_X  ' F         �     Ret   Y         �     �    V1     R
  �    . � + proc_SetDefaultVoltage  1 C'    	  �    $��  �	�  TRadioButtonAllElementsRadioButtonLeftTop� Width� HeightCursorcrHandPointCaptionAll elementsChecked	TabOrderTabStop50 -> BB bat_ShountVoltage = 0 60 mv <F               Mul_AA_BB   F"               @adc_A1 -> X bat_Count = 0  'C(    
  �    %��  �	�  TRadioButtonAllElementsRadioButtonLeftTop� Width� HeightCursorcrHandPointCaptionAll elementsChecked	TabOrderTabStop50 -> BB bat_ShountVoltage = 0 60 mv <F               Mul_AA_BB   F"               @adc_A1 -> X lvd_Count -= 0  (F1         �    . proc_SetVoltage(st_Voltage)  1 F         �     Ret   V     S
  �     � !    F:         �    7 proc_SetVoltage(st_FloatingVoltage_)  : F         �     Ret   V3    &   �    0 �  proc_SetVoltage(Voltage)  3 F"         �     Voltage -> X  " F'         �    $ proc_SetVoltage_X  ' V,     T
  �    ) �  proc_SetVoltage_X  , F         �     << X   F         �     << X   F         �     << X   F         �     SREG ->   F         �     0 -> I   F(         �    % X -> proc_Voltage8  ( F         �     -> SREG   F         �     Ret   V1     U
  �    . � ! proc_eq_Begin_Text_neg  1 F1        �    . "������. ������  "(LCD_CYR)  1 L-     V
  �    * proc_eq_Begin_Text_pos  - F1        �    . "������.���������"(LCD_CYR)  1 L4     W
  �    1 proc_eq_Begin_ansi_R_Text_neg  4 F5        �    2 "������������ ������� ������",0  5 L4     X
  �    1 proc_eq_Begin_ansi_E_Text_neg  4 F7        �    4 "Batarey equalization is began",0  7 L4     Y
  �    1 proc_eq_Begin_ansi_R_Text_pos  4 F8        �    5 "������������ ������� ���������",0  8 L4     Z
  �    1 proc_eq_Begin_ansi_E_Text_pos  4 F;        �    8 "Batarey equalization is finished ",0  ; V,     [
  �    ) �  proc_eq_Begin_alm  , F+         �    ( alm_CallFactor -> r18  + C*      �    'ntsChecked	TabOrder r18 --   F2         �   / @inv_groups_bps_NomMode -> X  2 F1         �   . inv_groups_Count_Max -> r18  1 L       �       F&         �   # EE[X++] -> [Y++]  & C       �   ��                                    r18 = almcf_ANSI  *C.      �    +�ntZero_OnSave -> ve_OnSave  > F'         Q    $ 2 -> ve_psw_Level  ' F         R     Ret   V7     �  S    4 8  rect_clb_CurrentZero_Caption  7 F2        T    / " ����.0 ����:    "(LCD_CYR)  2 V6     �  U    3 <  rect_clb_CurrentZero_OnSave  6 r18 -= almcf_Display  .C+      �    (	ntZero_OnSave -> ve_OnSave  > F'         Q    $ 2 -> ve_psw_Level  ' F         R     Ret   V7     �  S    4 8  rect_clb_CurrentZero_Caption  7 F2        T    / " ����.0 ����:    "(LCD_CYR)  2 V6     �  U    3 <  rect_clb_CurrentZero_OnSave  6 alm_Polarity -= 0  +F<         �    9 lcd_LoadStr(1, proc_eq_Begin_Text_neg)  < L     \
  �        F         �     Ret   V     ]
  �     �     F<         �    9 lcd_LoadStr(1, proc_eq_Begin_Text_pos)  < F         �     Ret   V     ^
  �     �     C0      �    -	ntsChecked	TabOrder r18 --   F2         �   / @inv_groups_bps_NomMode -> X  2 F1         �   . inv_groups_Count_Max -> r18  1 L       �       F&         �   # EE[X++] -> [Y++]  & C       �   ��                                    alm_ansi_Polarity -= 0  0Fe         �    b ansi_add_Text_lng(proc_eq_Begin_ansi_R_Text_neg, proc_eq_Begin_ansi_E_Text_neg)  e F         �     Ret   V     _
  �     � %    Fe         �    b ansi_add_Text_lng(proc_eq_Begin_ansi_R_Text_pos, proc_eq_Begin_ansi_E_Text_pos)  e F         �     Ret   Y2             / � //  ******  ERRORS  ******  2 V,     `
     ) �  proc_TestVoltage8  , F*            ' proc_Voltage8 -> rr0  * F             rr0 >>   F             rr0 >>   F             rr0 >>   C6         3�	_war_OC_Factor  , F&              # r0 -> st_Options  & F               Ret   V&     t       #   st_OnSecond  & F0              - st_war_OverCurrent_Execute  0 F1              . st_war_UnderVoltage_Execute  1 F0              - st_war_OverVoltage rr0 < st_FloatingVoltage_Min  6C6         3�	�_war_OC_Factor  , F&              # r0 -> st_Options  & F               Ret   V&     t       #   st_OnSecond  & F0              - st_war_OverCurrent_Execute  0 F1              . st_war_UnderVoltage_Execute  1 F0              - st_war_OverVoltage rr0 < st_FloatingVoltage_Max  6L     a
         F:         	   7 proc_SetVoltage(st_FloatingVoltage_)  : L     b
  
       F             Ret       