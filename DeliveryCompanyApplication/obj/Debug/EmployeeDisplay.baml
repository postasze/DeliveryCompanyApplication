   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   0    *DeliveryCompanyApplication.EmployeeDisplay   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	   -   5          � Title$   Wyświetlanie pracowników��5   	   $��332.836��6*   $��859.702��6;    � 	Resources 5      )   #DeliveryCompanyApplication.DataSet1   dataSet1  pRACOWNICYViewSource �� Source �� Source��%[   &	        &	      7     5   
   6   �� 5   
    6<   �� *
PRACOWNICY+8   5	      .��5
      �  � DataContext# [ 6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ pRACOWNICYDataGrid��5         RowDetailsVisibilityMode$ VisibleWhenSelected=�6/   $��0,0,-2,0q�6^      EnableRowVirtualization .    AutoGenerateColumns .  ��6p   �� 	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      -   5        iD_PRACOWNIKAColumn��,  &System.Windows.Controls.DataGridColumn
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 SizeToHeader 5   B      Header$ ID PRACOWNIKA��6W   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6n   �� *ID_PRACOWNIKA+  5      -   5        tYP_PRACOWNIKAColumn��$
 SizeToHeader 5   C   $ TYP PRACOWNIKA��6X    6p   �� *TYP_PRACOWNIKA+  5      -   5        aDRES_ZAMIESZKANIAColumn��$
 SizeToHeader 5   G   $ ADRES ZAMIESZKANIA��6\    6x   �� *ADRES_ZAMIESZKANIA+  5      -   5        iD_LOKALIZACJIColumn��$
 SizeToHeader 5   C   $ ID LOKALIZACJI��6X    6p   �� *ID_LOKALIZACJI+  5      -   5        iD_KONTAColumn��$
 SizeToHeader 5   =   $ ID KONTA��6R    6d   �� *
ID_KONTA+  5      -   5        pIERWSZE_IMIEColumn��$
 SizeToHeader 5   B   $ PIERWSZE IMIE��6W    6n   �� *PIERWSZE_IMIE+  5      -	   5        dRUGIE_IMIEColumn��$
 SizeToHeader 5   @   $ DRUGIE IMIE��6U    6j   �� *DRUGIE_IMIE+  5      -
   5        nAZWISKOColumn��$
 SizeToHeader 5   =   $ NAZWISKO��6R    6d   �� *
NAZWISKO+  5      -   5        wYNAGRODZENIEColumn��$
 SizeToHeader 5   B   $ WYNAGRODZENIE��6W    6n   �� *WYNAGRODZENIE+5      5      5      