   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   .    (DeliveryCompanyApplication.SenderDisplay   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	   -   5          � Title$  Wyświetlanie nadawców��5   	   $��379.104��6'   $��532.836��68    � 	Resources 5      )   #DeliveryCompanyApplication.DataSet1   dataSet1  nADAWCYViewSource �� Source �� Source��%X   &	        &	      7     5   
   6   �� 5   
    69   �� *	NADAWCY+8   5	      .��5
      �  � DataContext# [ 6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ nADAWCYDataGrid��5         RowDetailsVisibilityMode$ VisibleWhenSelected=�6,      EnableRowVirtualization .    AutoGenerateColumns .  ��6[   �� 	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      -   5        iD_NADAWCYColumn��,  &System.Windows.Controls.DataGridColumn
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 SizeToHeader 5   ?      Header$ 
ID NADAWCY��6T   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6h   �� *
ID_NADAWCY+  5      -   5        iD_KONTAColumn��$
 SizeToHeader 5   =   $ ID KONTA��6R    6d   �� *
ID_KONTA+  5      -   5        aDRES_ZAMIESZKANIAColumn��$
 SizeToHeader 5   G   $ ADRES ZAMIESZKANIA��6\    6x   �� *ADRES_ZAMIESZKANIA+  5      -   5        pIERWSZE_IMIEColumn��$
 SizeToHeader 5   B   $ PIERWSZE IMIE��6W    6n   �� *PIERWSZE_IMIE+  5      -   5        dRUGIE_IMIEColumn��$
 SizeToHeader 5   @   $ DRUGIE IMIE��6U    6j   �� *DRUGIE_IMIE+  5      -   5        nAZWISKOColumn��$
 SizeToHeader 5   =   $ NAZWISKO��6R    6d   �� *
NAZWISKO+5      5      5      