#   Algorithm Builder `   �   t   K   �   K   d   K   K   K   �   K   K   K   K   K   d   K   K   �   K   K   �   �   K   �         eth_menu_Index         eth_Socket_menu_Index         eth_Socket_Index         eth_Socket_Menu_Caption  Int24       eth_PostResetSeconds         eth_rx_jTimeOut         eth_get_Init  Int24       eth_get_Resume  Int24       eth_set_Init  Int24       eth_Reset_Timer  Word       eth_Reset_menu_Index                       eth_Reset_Enabled    True      eth_Reset_Timeout    4                   eth_Reset_DD DDRD.7      eth_Reset_PORT PortD.7  	       etha_EM203 0      etha_W5100 1      eth_Adapter_Max 1      eth_Device 1             eth_Reset_Timeout_Min 1      eth_Reset_Timeout_Max 30      eth_Reset_Timer_Max eth_Reset_Timeout_Max*60         �f  Y                    V'     j
      $  , eth_OnSecond  ' F1             . eth_PostResetSeconds -> r18  1 C#    *       �� onlyTabOrder  TRadioButtonAlgorithmRadioButtonLeftTopHWidth� HeightCursorcrHandPointCaptionin Algorithm onlyTabOrder  	TGroupBoxElementGroupBoxLeftTop`Width� Height� CaptionIn elementsTabOrder TRadioButtonText r18 = 255  #F              r18 ++   F1             . r18 -> eth_PostResetSeconds  1 L     k
          F(             % eth_Reset_OnSecond  ( F              Ret   V$     l
  	    !   eth_Reset  $ F)         
    & 0 -> eth_menu_Index  ) F/             , 0 -> eth_Reset_menu_Index  / F0             - 0 -> eth_Socket_menu_Index  0 F/             , 0 -> eth_PostResetSeconds  / F)             & 0 -> eth_get_Resume  ) F+ @           ( 0 -> eth_set_InitData  + F0             - EE[eea_eth_Adapter] -> r18  0 C0    +      -�� onlyTabOrder  TRadioButtonAlgorithmRadioButtonLeftTopHWidth� HeightCursorcrHandPointCaptionin Algorithm onlyTabOrder  	TGroupBoxElementGroupBoxLeftTop`Width� Height� CaptionIn elementsTabOrder TRadioButtonText r18 <= eth_Adapter_Max  0F.             + 1 -> EE[eea_eth_Adapter]  . L     m
          F              eth_Init   F              Ret   V#     n
          eth_Init  # F               em203_Init    F*             ' 0 -> eth_Reset_Timer  * F/             , 0 -> eth_PostResetSeconds  / F'             $ 1 -> eth_Reset_DD  ' C1    ,      .	�                                                                                                                                                      key_OnPressed -= menu_OnKeyPressed  <CB    _        ?�                                        EE[eea_eth_Adapter] = 0  1F)             & 0 -> eth_Reset_PORT  ) F&             # ctrl_Pause(1000)  & F)             & 1 -> eth_Reset_PORT  ) F              Ret   V     o
        	 !    F)         !    & 1 -> eth_Reset_PORT  ) F&         "    # ctrl_Pause(1000)  & F)         #    & 0 -> eth_Reset_PORT  ) F         $     Ret   V#     p
  %        eth_Loop  # CF@      &    C��                                                                                                                                                      key_OnPressed -= menu_OnKeyPressed  <CB    _        ?�                                        em203_ResumeByte -= com_rx_Custom_ResumeByte  FC;@      '    8�gorithmTableGroupBoxLeftTopWidth� HeightCaption
Find in : TabOrder TRadioButtonAllSectionsRadioButtonLeftTopWidth� HeightCursorcrHandPointCaption
EverywhereTabOrder   TRadioButtonTableRadioButtonLeftTop0Wid com_rx_Status -= com_rxs_Complete  ;F6 @       (    3 com_rxs_Standby -> com_rx_Status  6 F4 @       )    1 NonZero_ECALL(em203_OnReceive)  4 F" @       *     com_rx_Reset  " L     q
  +        F         ,     Ret   Y0         -    -  //  ******  MENU  ******  0 V/     r
  .    ,   eth_menu_ItemCaption  / F1        /    . " Ethernet...    "(LCD_CYR)  1 L'     s
  0    $ eth_menu_Caption  ' F1        1    . "--- ETHERNET ---"(LCD_CYR)  1 V,     t
  2    ) , 
 eth_menu_InitItem  , F<         3    9 eth_menu_ItemCaption -> menu_item_Text  < F<         4    9 eth_menu_Init -> menu_item_InitSubMenu  < F         5     Ret   V)     u
  6    &   eth_menu_Items  ) F5        7    2 DWord eth_Adapter_menu_InitItem  5 F7        8    4 DWord eth_IPAddress_menu_InitItem  7 F2        9    / DWord eth_Mask_menu_InitItem  2 F5        :    2 DWord eth_Gateway_menu_InitItem  5 F1        ;    . DWord eth_MAC_menu_InitItem  1 F5        <    2 DWord eth_Version_menu_InitItem  5 F5        =    2 DWord eth_Manager_menu_InitItem  5 F1        >    . DWord eth_WEB_menu_InitItem  1 F.        ?    + DWord snmp_menu_InitItem  . F2        @    / DWord eth_BOOT_menu_InitItem  2 F4        A    1 DWord eth_Reset_menu_item_Init  4 L&     v
  B    # eth_menu_Items_  & V(     w
  C    % ,  eth_menu_Init  ( C=    -  D    :�gorithmTableGroupBoxLeftTopWidth� HeightCaption
Find in : TabOrder TRadioButtonAllSectionsRadioButtonLeftTopWidth� HeightCursorcrHandPointCaption
EverywhereTabOrder   TRadioButtonTableRadioButtonLeftTop0Wid EE[eea_com_Channel] -= cch_Ethernet  =C3    .  E    0	    �    & lcd_LoadStr_Y_Count  ) Y:         �    7 � //  ******  RUNNING STRING  ******  : VM    +   �    J � ' lcd_Load_Running_Table_m(Table, Index, ItemLength)  M F"         �     Index -> r16  " F'         �    $ ItemLength -> r17  ' F         eth_PostResetSeconds >= 8  3L     x
  F        F         G     ctrl_Pop   F         H     Ret   V     y
  I     / (    F3         J    0 @eth_menu_Index -> menu_Index  3 F6         K    3 eth_menu_Caption -> menu_Caption  6 F2         L    / eth_menu_Items -> menu_Items  2 F7         M    4 eth_menu_Items_ -> menu_Items_End  7 F(         N    % em203_menu_OnEnter  ( F         O     menu_Init   F         P     Ret   Y3         Q    0 : //  ******  ADAPTER  ******  3 V4     z
  R    1 < 
 eth_Adapter_menu_InitItem  4 F8         S    5 eth_Adapter_Text -> menu_item_Text  8 F6         T    3 eea_eth_Adapter -> ve_ee_Pointer  6 F!         U     0 -> ve_Min  ! F/         V    , eth_Adapter_Max -> ve_Max  / F:         W    7 eth_Adapter_Texts -> ve_ListCaptions  : F,         X    ) 8 -> ve_ListCaptionLen  , F!         Y     8 -> ve_Pos  ! F*         Z    ' vf_List -> ve_Format  * F'         [    $ 1 -> ve_psw_Level  ' F         \     Ret   V+     {
  ]    ( <  eth_Adapter_Text  + F1        ^    . " �����.:        "(LCD_CYR)  1 L(     |
  _    % eth_Adapter_Texts  ( F)        `    & "EM202   "(LCD_CYR)  ) F         a     "W5100   "    Y6         b    3 H //  ******  IP ADDRESS  ******  6 V7     }
  c    4 J  eth_IPAddress_menu_item_Text  7 F1        d    . " IP �����...    "(LCD_CYR)  1 L)     ~
  e    & eth_IPAddress_Text  ) FA        f    > "--- IP ����� ---    .   .   .   "(LCD_CYR)  A V6     
  g    3 J  eth_IPAddress_menu_InitItem  6 F%         h    " eth_edit32_Init  % F:         i    7 eth_IPAddress_Text -> editArray_Text  : F7         j    4 eth_IPAddress_Get -> eth_get_Init  7 F7         k    4 eth_IPAddress_Set -> eth_set_Init  7 FD         l    A eth_IPAddress_menu_item_Text -> menu_item_Text  D F=         m    : editArray_Init -> menu_item_InitSubMenu  = F         n     Ret   V,     �
  o    ) S  eth_IPAddress_Get  , F,         p    ) eth_get_Common_Init(0)  , F         q     Ret   V,     �
  r    ) S  eth_IPAddress_Set  , F,         s    ) eth_set_Common_Init(0)  , F+         t    ( editArray_com_tx_Init  + F         u     Ret   Y0         v    - X //  ******  MASK  ******  0 V4     �
  w    1 Z  eth_Mask_menu_ItemCaption  4 F1        x    . " �����...       "(LCD_CYR)  1 L$     �
  y    ! eth_Mask_Text  $ FA        z    > " --- ����� ---      .   .   .   "(LCD_CYR)  A V1     �
  {    . Z  eth_Mask_menu_InitItem  1 F%         |    " eth_edit32_Init  % F5         }    2 eth_Mask_Text -> editArray_Text  5 F2         ~    / eth_Mask_Get -> eth_get_Init  2 F2             / eth_Mask_Set -> eth_set_Init  2 FA         �    > eth_Mask_menu_ItemCaption -> menu_item_Text  A F=         �    : editArray_Init -> menu_item_InitSubMenu  = F         �     Ret   V'     �
  �    $ c  eth_Mask_Get  ' F,         �    ) eth_get_Common_Init(1)  , F         �     Ret   V'     �
  �    $ c  eth_Mask_Set  ' F,         �    ) eth_set_Common_Init(1)  , F+         �    ( editArray_com_tx_Init  + F         �     Ret   Y3         �    0 h //  ******  GATEWAY  ******  3 V7     �
  �    4 j  eth_Gateway_menu_ItemCaption  7 F1        �    . " ����...        "(LCD_CYR)  1 L'     �
  �    $ eth_Gateway_Text  ' FA        �    > "  --- ���� ---      .   .   .   "(LCD_CYR)  A V4     �
  �    1 j  eth_Gateway_menu_InitItem  4 F%         �    " eth_edit32_Init  % F8         �    5 eth_Gateway_Text -> editArray_Text  8 F5         �    2 eth_Gateway_Get -> eth_get_Init  5 F5         �    2 eth_Gateway_Set -> eth_set_Init  5 FD         �    A eth_Gateway_menu_ItemCaption -> menu_item_Text  D F=         �    : editArray_Init -> menu_item_InitSubMenu  = F         �     Ret   V*     �
  �    ' s  eth_Gateway_Get  * F,         �    ) eth_get_Common_Init(2)  , F         �     Ret   V*     �
  �    ' s  eth_Gateway_Set  * F,         �    ) eth_set_Common_Init(2)  , F+         �    ( editArray_com_tx_Init  + F         �     Ret   Y7         �    4 x //  ******  MAC ADDRESS  ******  7 V3     �
  �    0 z  eth_MAC_menu_ItemCaption  3 F1        �    . " MAC �����...   "(LCD_CYR)  1 L&     �
  �    # eth_MAC_Caption  & F1        �    . "---MAC �����--- "(LCD_CYR)  1 V0     �
  �    - z % eth_MAC_menu_InitItem  0 F(         �    % eth_editArray_Init  ( F*         �    ' 6 -> editArray_Count  * F6         �    ( 1 -> editArray_Format Hexadecimal 6 F7         �    4 eth_MAC_Caption -> editArray_Text  7 F1         �    . eth_MAC_Get -> eth_get_Init  1 F1         �    . eth_MAC_Set -> eth_set_Init  1 F@         �    = eth_MAC_menu_ItemCaption -> menu_item_Text  @ F=         �    : editArray_Init -> menu_item_InitSubMenu  = F         �     Ret   V&     �
  �    # �  eth_MAC_Get  & F,         �    ) eth_get_Common_Init(3)  , F         �     Ret   V&     �
  �    # �  eth_MAC_Set  & F,         �    ) eth_set_Common_Init(3)  , F+         �    ( editArray_com_tx_Init  + F         �     Ret   Y8         �    5 � //  ******  SOFT VERSION  ******  8 V0     �
  �    - �  eth_Version_menu_Text  0 F1        �    . " ������:        "(LCD_CYR)  1 V4     �
  �    1 � % eth_Version_menu_InitItem  4 F=         �    : eth_Version_menu_Text -> menu_item_Text  = F=         �    : eth_Version_Draw -> menu_item_DrawValue  = F5         �    2 eth_Version_Get -> eth_get_Init  5 F>         �    ; eth_Version_get_Resume -> eth_get_Resume  > F'         �    $ 0 -> eth_set_Init  ' F         �     eth_Get   F         �     Ret   V*     �
  �    ' �  eth_Version_Get  * F,         �    ) eth_get_Common_Init(4)  , F         �     Ret   V+     �
  �    ( �  eth_Version_Draw  + F,         �    ) ve_Custom[0]:Word -> X  , C    /  �    ��ectPagesRadioButtonLeftTop@Width� HeightCursorcrHandPointCaptionProject pagesTabOrder   TEditReplaceEditLeft`Top0Width� HeightFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Fon X = 0  F9         �    6 WordToDecimal_R(X, lcd_Str1, 12, 2)  9 L     �
  �        F         �     Ret   V1     �
  �    . � $ eth_Version_get_Resume  1 C8    0  �    5
 gorithmTableGroupBoxLeftTopWidth� HeightCaption
Find in : TabOrder TRadioButtonAllSectionsRadioButtonLeftTopWidth� HeightCursorcrHandPointCaption
EverywhereTabOrder   TRadioButtonTableRadioButtonLeftTop0Wid com_call_Result = com_callr_Ok  8F,         �    ) 0 -> ve_Custom[0]:Word  , F         �     Ret   V     �
  �     � .    FC         �    @ com_call_rx_Data[0]:Word -> ve_Custom[0]:Word  C F         �     Ret   Y/         �    , � //  ******  GET  ******  / V2    /   �    / �  eth_get_Common_Init(is)  2 F         �     is -> r18   F*         �    ' eth_get_Common_Init_  * V/     �
  �    , �  eth_get_Common_Init_  / F(         �    % 1 -> com_tx_Device  ( F,         �    ) 3 -> com_tx_HeaderSize  , F1         �    ( 1 -> com_tx_Header[0] is Get 1 F6         �    ( 0 -> com_tx_Header[1] General get 6 F/         �    * r18 -> com_tx_Header[2] is / F*         �    ' 0 -> com_tx_DataSize  * F         �     Ret   V"     �
  �     � ( eth_Get  " F,         �    ) com_Call(eth_get_Init)  , C    2  �    ��ectPagesRadioButtonLeftTop@Width� HeightCursorcrHandPointCaptionProject pagesTabOrder   TEditReplaceEditLeft`Top0Width� HeightFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Fon T = 0  F3         �    0 NonZero_ECALL(eth_get_Resume)  3 L     �
  �        F         �     Ret   V2    3   �    / �  eth_get_Socket_Init(is)  2 F         �     is -> r18   F*         �    ' eth_get_Socket_Init_  * V/     �
  �    , �  eth_get_Socket_Init_  / F(         �    % 1 -> com_tx_Device  ( F,         �    ) 4 -> com_tx_HeaderSize  , F1         �    ( 1 -> com_tx_Header[0] is Get 1 F5         �    ( 1 -> com_tx_Header[1] Socket get 5 F@         �    7 eth_Socket_Index -> com_tx_Header[2] Socket @ F/         �    * r18 -> com_tx_Header[3] is / F*         �    ' 0 -> com_tx_DataSize  * F         �     Ret   Y/         �    , � //  ******  SET  ******  / V2    5   �    / �  eth_set_Common_Init(is)  2 F         �     is -> r18   F*         �    ' eth_set_Common_Init_  * V2    6   �    / �  eth_set_Socket_Init(is)  2 F         �     is -> r18   F*         �    ' eth_set_Socket_Init_  * V/     �
  �    , �  eth_set_Common_Init_  / F(         �    % 1 -> com_tx_Device  ( F,         �    ) 3 -> com_tx_HeaderSize  , F1         �    ( 2 -> com_tx_Header[0] is Set 1 F6         �    ( 0 -> com_tx_Header[1] General set 6 F/         �    * r18 -> com_tx_Header[2] is / F         �     Ret   V/     �
  �    , �  eth_set_Socket_Init_  / F(         �    % 1 -> com_tx_Device  ( F,         �    ) 4 -> com_tx_HeaderSize  , F1         �    ( 2 -> com_tx_Header[0] is Set 1 F5         �    ( 1 -> com_tx_Header[1] Socket set 5 F@             7 eth_Socket_Index -> com_tx_Header[2] Socket @ F/            * r18 -> com_tx_Header[3] is / F             Ret   V"     �
      � ) eth_Set  " F,            ) com_Call(eth_set_Init)  , C    4     ��ectPagesRadioButtonLeftTop@Width� HeightCursorcrHandPointCaptionProject pagesTabOrder   TEditReplaceEditLeft`Top0Width� HeightFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Fon T = 0  F3            0 NonZero_ECALL(eth_get_Resume)  3 L     �
         F             Ret   Y3         	   0 � //  ******  MANAGER  ******  3 V5     �
  
   2 �  eth_Manager_menu_item_Text  5 F1           . " ��������...    "(LCD_CYR)  1 L/     �
     , eth_Manager_menu_Caption  / F1           . "--- �������� ---"(LCD_CYR)  1 V4     �
     1 �  eth_Manager_menu_InitItem  4 F+            ( 1 -> eth_Socket_Index  + FB            ? eth_Manager_menu_item_Text -> menu_item_Text  B FI            F eth_Manager_menu_Caption -> eth_Socket_menu_Caption  I FC            @ eth_Socket_menu_Init -> menu_item_InitSubMenu  C F             Ret   Y/            , � //  ******  WEB  ******  / V1     �
     . �  eth_Web_menu_item_Text  1 F1           . " Web...         "(LCD_CYR)  1 L+     �
     ( eth_Web_menu_Caption  + F1           . "  --- WEB ---   "(LCD_CYR)  1 V0     �
     - �  eth_Web_menu_InitItem  0 F+            ( 2 -> eth_Socket_Index  + F>            ; eth_Web_menu_item_Text -> menu_item_Text  > FE            B eth_Web_menu_Caption -> eth_Socket_menu_Caption  E FC            @ eth_Socket_menu_Init -> menu_item_InitSubMenu  C F             Ret   Y0 @          - � //  ******  SNMP  ******  0 V2 @   A       / �  eth_SNMP_menu_item_Text  2 F1 @      !   . " SNMP...        "(LCD_CYR)  1 L, @   B   "   ) eth_SNMP_menu_Caption  , F1 @      #   . "  --- SNMP ---  "(LCD_CYR)  1 V1 @   C   $   . �  eth_SNMP_menu_InitItem  1 F+ @       %   ( 3 -> eth_Socket_Index  + F? @       &   < eth_SNMP_menu_item_Text -> menu_item_Text  ? FF @       '   C eth_SNMP_menu_Caption -> eth_Socket_menu_Caption  F FC @       (   @ eth_Socket_menu_Init -> menu_item_InitSubMenu  C F @       )    Ret   Y0         *   - � //  ******  BOOT  ******  0 V2     �
  +   / �  eth_BOOT_menu_item_Text  2 F1        ,   . " ���������...   "(LCD_CYR)  1 L,     �
  -   ) eth_BOOT_menu_Caption  , F1        .   . "---���������--- "(LCD_CYR)  1 V1     �
  /   . �  eth_BOOT_menu_InitItem  1 F+         0   ( 0 -> eth_Socket_Index  + F?         1   < eth_BOOT_menu_item_Text -> menu_item_Text  ? FF         2   C eth_BOOT_menu_Caption -> eth_Socket_menu_Caption  F FC         3   @ eth_Socket_menu_Init -> menu_item_InitSubMenu  C F         4    Ret   Y7         5   4 � //  ******  SOCKET MENU  ******  7 V0     �
  6   - �  eth_Socket_menu_Items  0 F9        7   6 DWord eth_Socket_Port_menu_InitItem  9 F=        8   : DWord eth_Socket_Protocol_menu_InitItem  = L-     �
  9   * eth_Socket_menu_Items_  - V/     �
  :   , � 	 eth_Socket_menu_Init  / F:         ;   7 @eth_Socket_menu_Index -> menu_Index  : F=         <   : eth_Socket_menu_Caption -> menu_Caption  = F9         =   6 eth_Socket_menu_Items -> menu_Items  9 F>         >   ; eth_Socket_menu_Items_ -> menu_Items_End  > F         ?    menu_Init   F         @    Ret   Y0         A   - � //  ******  PORT  ******  0 V4     �
  B   1 �  eth_Socket_Port_menu_Text  4 F1        C   . " ����:          "(LCD_CYR)  1 V8     �
  D   5 � $ eth_Socket_Port_menu_InitItem  8 FA         E   > eth_Socket_Port_menu_Text -> menu_item_Text  A F9         F   6 eth_Socket_Port_Get -> eth_get_Init  9 FB         G   ? eth_Socket_Port_get_Resume -> eth_get_Resume  B F9         H   6 eth_Socket_Port_Set -> eth_set_Init  9 F         I    eth_Get   F*         J   ' eth_Set -> ve_OnSave  * F.         K   + @ve_Custom -> ve_Pointer  . F!         L    0 -> ve_Min  ! F%         M   " 65535 -> ve_Max  % F"         N    13 -> ve_Pos  " F*         O   ' vf_Word -> ve_Format  * F         P    Ret   V.     �
  Q   + 
 eth_Socket_Port_Get  . F,         R   ) eth_get_Socket_Init(0)  , F         S    Ret   V5     �
  T   2 
 eth_Socket_Port_get_Resume  5 C8    5  U   5
 gorithmTableGroupBoxLeftTopWidth� HeightCaption
Find in : TabOrder TRadioButtonAllSectionsRadioButtonLeftTopWidth� HeightCursorcrHandPointCaption
EverywhereTabOrder   TRadioButtonTableRadioButtonLeftTop0Wid com_call_Result = com_callr_Ok  8F,         V   ) 0 -> ve_Custom[0]:Word  , F         W    Ret   V     �
  X    	    FC         Y   @ com_call_rx_Data[0]:Word -> ve_Custom[0]:Word  C F         Z    Ret   V.     �
  [   + 
 eth_Socket_Port_Set  . F,         \   ) eth_set_Socket_Init(0)  , F*         ]   ' 2 -> com_tx_DataSize  * F>         ^   ; ve_Custom[0]:Word -> com_tx_Data[0]:Word  > F         _    Ret   Y4         `   1 //  ******  PROTOCOL  ******  4 V8     �
  a   5  eth_Socket_Protocol_menu_Text  8 F1        b   . " ��������:      "(LCD_CYR)  1 L7     �
  c   4 eth_Socket_Protocol_ItemCaptions  7 F%        d   " "UDP "(LCD_CYR)  % F%        e   " "TCP "(LCD_CYR)  % V<     �
  f   9 " eth_Socket_Protocol_menu_InitItem  < FE         g   B eth_Socket_Protocol_menu_Text -> menu_item_Text  E F=         h   : eth_Socket_Protocol_Get -> eth_get_Init  = FF         i   C eth_Socket_Protocol_get_Resume -> eth_get_Resume  F F=         j   : eth_Socket_Protocol_Set -> eth_set_Init  = F         k    eth_Get   F!         l    0 -> ve_Min  ! F!         m    1 -> ve_Max  ! F"         n    11 -> ve_Pos  " F*         o   ' eth_Set -> ve_OnSave  * F.         p   + @ve_Custom -> ve_Pointer  . FI         q   F eth_Socket_Protocol_ItemCaptions -> ve_ListCaptions  I F,         r   ) 4 -> ve_ListCaptionLen  , F*         s   ' vf_List -> ve_Format  * F         t    Ret   V2     �
  u   / 	 eth_Socket_Protocol_Get  2 F,         v   ) eth_get_Socket_Init(1)  , F         w    Ret   V9     �
  x   6 #	 eth_Socket_Protocol_get_Resume  9 C8    6  y   5
 gorithmTableGroupBoxLeftTopWidth� HeightCaption
Find in : TabOrder TRadioButtonAllSectionsRadioButtonLeftTopWidth� HeightCursorcrHandPointCaption
EverywhereTabOrder   TRadioButtonTableRadioButtonLeftTop0Wid com_call_Result = com_callr_Ok  8F'         z   $ 0 -> ve_Custom[0]  ' F         {    Ret   V     �
  |    &    F9         }   6 com_call_rx_Data[0] -> ve_Custom[0]  9 F         ~    Ret   V2     �
     / %" eth_Socket_Protocol_Set  2 F,         �   ) eth_set_Socket_Init(1)  , F*         �   ' 1 -> com_tx_DataSize  * F4         �   1 ve_Custom[0] -> com_tx_Data[0]  4 F         �    Ret   Y6         �   3 +//  ******  EDIT ARRAY  ******  6 V*     �
  �   ' .
 eth_edit32_Init  * F(         �   % eth_EditArray_Init  ( F*         �   ' 4 -> editArray_Count  * F2         �   ( 0 -> editArray_Format Decimal 2 F         �    Ret   V-     �
  �   * . eth_editArray_Init  - F.         �   + eth_Get -> editArray_Get  . F.         �   + eth_Set -> editArray_Set  . FD         �   A editArray_com_call_rx_Resume -> eth_get_Resume  D F         �    Ret   Y7         �   4 4//  ******  RESET. MENU  ******  7 V3     �
  �   0 6 eth_Reset_menu_item_Text  3 F1        �   . " �����...       "(LCD_CYR)  1 L-     �
  �   * eth_Reset_menu_Caption  - F1        �   . " --- ����� ---  "(LCD_CYR)  1 V3     �
  �   0 =
 eth_Reset_menu_item_Init  3 F@         �   = eth_Reset_menu_item_Text -> menu_item_Text  @ FB         �   ? eth_Reset_menu_Init -> menu_item_InitSubMenu  B F         �    Ret   V/     �
  �   , 6 eth_Reset_menu_Items  / F;        �   8 DWord eth_Reset_Manual_menu_item_Init  ; F<        �   9 DWord eth_Reset_Enabled_menu_item_Init  < F<        �   9 DWord eth_Reset_Timeout_menu_item_Init  < F:        �   7 DWord eth_Reset_Timer_menu_init_Item  : L/     �
  �   , eth_Reset_menu_Items_End  / V.     �
  �   + C
 eth_Reset_menu_Init  . F9         �   6 @eth_Reset_menu_Index -> menu_Index  9 F<         �   9 eth_Reset_menu_Caption -> menu_Caption  < F8         �   5 eth_Reset_menu_Items -> menu_Items  8 F@         �   = eth_Reset_menu_Items_End -> menu_Items_End  @ F         �    menu_Init   F         �    Ret   Y9         �   6 K//  ******  RESET. MANUAL  ******  9 V:     �
  �   7 M eth_Reset_Manual_menu_item_Init  : FG         �   D eth_Reset_Manual_menu_item_Text -> menu_item_Text  G F1         �   . @ve_BoolValue -> ve_Pointer  1 F+         �   ( False -> ve_BoolValue  + F/         �   , txt_No -> ve_FalseCaption  / F/         �   , txt_Yes -> ve_TrueCaption  / F"         �    11 -> ve_Pos  " F*         �   ' vf_Bool -> ve_Format  * F+         �   ( eth_Init -> ve_OnSave  + F         �    Ret   V:     �
  �   7 M eth_Reset_Manual_menu_item_Text  : F1        �   . " �������:       "(LCD_CYR)  1 Y:         �   7 X//  ******  RESET. ENABLED  ******  : V;     �
  �   8 Z	 eth_Reset_Enabled_menu_item_Init  ; F9         �   6 @eth_Reset_Enabled -> ve_ee_Pointer  9 F>         �   ; eth_Reset_Enabled_Text -> menu_item_Text  > F/         �   , txt_No -> ve_FalseCaption  / F/         �   , txt_Yes -> ve_TrueCaption  / F!         �    7 -> ve_Pos  ! F*         �   ' vf_Bool -> ve_Format  * F'         �   $ 1 -> ve_psw_Level  ' F         �    Ret   Y:         �   7 d//  ******  RESET. TIMEOUT  ******  : V1     �
  �   . Z eth_Reset_Enabled_Text  1 F1        �   . " ����:          "(LCD_CYR)  1 V;     �
  �   8 f
 eth_Reset_Timeout_menu_item_Init  ; FC         �   @ eth_Reset_Timeout_menu_Text -> menu_item_Text  C F9         �   6 @eth_Reset_Timeout -> ve_ee_Pointer  9 F5         �   2 eth_Reset_Timeout_Min -> ve_Min  5 F5         �   2 eth_Reset_Timeout_Max -> ve_Max  5 F"         �    11 -> ve_Pos  " F*         �   ' vf_Byte -> ve_Format  * F'         �   $ 1 -> ve_psw_Level  ' F         �    Ret   V6     �
  �   3 f eth_Reset_Timeout_menu_Text  6 F1        �   . " �������:    �  "(LCD_CYR)  1 Y8         �   5 p//  ******  RESET. TIMER  ******  8 V9     �
  �   6 r	 eth_Reset_Timer_menu_init_Item  9 FA         �   > eth_Reset_Timer_menu_Text -> menu_item_Text  A FA         �   > eth_Reset_Timer_Draw -> menu_item_DrawValue  A F         �    Ret   V/     �
  �   , w eth_Reset_Timer_Draw  / FG         �   D WordToDecimal_R(eth_Reset_Timer, lcd_Str1, 12, 0)  G F         �    Ret   V4     �
  �   1 r eth_Reset_Timer_menu_Text  4 F1        �   . " ������:      � "(LCD_CYR)  1 Y:         �   7 |//  ******  RESET. EXECUTE  ******  : V)     �
  �   & ~ eth_Reset_Init  ) F.         �   + eth_Reset_Timeout -> r16  . F         �    60 -> r17   F         �    r16 * r17   F,         �   ) rr0 -> eth_Reset_Timer  , F         �    Ret   V-     �
  �   * ~ eth_Reset_OnSecond  - C3    7  �   0���ectPagesRadioButtonLeftTop@Width� HeightCursorcrHandPointCaptionProject pagesTabOrder   TEditReplaceEditLeft`Top0Width� HeightFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Fon eth_Reset_Enabled = False  3F*         �   ' eth_Reset_Timer -> X  * CI    8  �   F. �ectPagesRadioButtonLeftTop@Width� HeightCursorcrHandPointCaptionProject pagesTabOrder   TEditReplaceEditLeft`Top0Width� HeightFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Foneth_Reset_Timer_Max -> X X > eth_Reset_Timer_Max  IC    9  �   ��ectPagesRadioButtonLeftTop@Width� HeightCursorcrHandPointCaptionProject pagesTabOrder   TEditReplaceEditLeft`Top0Width� HeightFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Fon X = 0  F         �    X - 1   F*         �   ' X -> eth_Reset_Timer  * C    :  �   �ectPagesRadioButtonLeftTop@Width� HeightCursorcrHandPointCaptionProject pagesTabOrder   TEditReplaceEditLeft`Top0Width� HeightFont.CharsetRUSSIAN_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameCourier New
Fon -=  F         �    eth_Init   L     �
  �       F         �    Ret   V     �
  �    �    F*         �   ' 0 -> eth_Reset_Timer  * F         �    Ret       