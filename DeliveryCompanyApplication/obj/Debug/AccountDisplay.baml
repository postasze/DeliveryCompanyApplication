   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   /    )DeliveryCompanyApplication.AccountDisplay   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	   -   5          � Title$  Wyświetlanie kont��5   	   $��443.672��6#   $��519.881��64    � 	Resources 5      )   #DeliveryCompanyApplication.DataSet1   dataSet1  kONTAViewSource �� Source �� Source��%V   &	        &	      7     5   
   6   �� 5   
    67   �� *KONTA+8   5	      .��5
      �  � DataContext# [ 6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ kONTADataGrid��5         RowDetailsVisibilityMode$ VisibleWhenSelected=�6*      EnableRowVirtualization .    AutoGenerateColumns .  ��6Y   �� 	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      -   5        iD_KONTAColumn��,  &System.Windows.Controls.DataGridColumn
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 SizeToHeader 5   =      Header$ ID KONTA��6R   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6d   �� *
ID_KONTA+  5      -   5        
nICKColumn��$	
 120 5   9   $
 NICK��6E    6S   �� *NICK+  5      -   5        tYP_KONTAColumn��$	
 100 5   >   $ 	TYP KONTA��6J    6]   �� *	TYP_KONTA+  5      -   5        hASŁOColumn��$	
 100 5   :   $ HASŁO��6F    6U   �� *HASŁO+  5      -   5        
mAILColumn��$	
 120 5   9   $
 MAIL��6E    6S   �� *MAIL+5      5      5      