   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   2    ,DeliveryCompanyApplication.DeliveriesDisplay   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	   -   5          � Title$  Wyświetlanie przesyłek��5   	   $��359.702��6(   $��704.477��69    � 	Resources 5      )   #DeliveryCompanyApplication.DataSet1   dataSet1  pRZESYŁKIViewSource �� Source �� Source��%[   &	        &	      7     5   
   6   �� 5   
    6;   �� *
PRZESYŁKI+8   5	      .��5
      �  � DataContext# [ 6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ pRZESYŁKIDataGrid��5         RowDetailsVisibilityMode$ VisibleWhenSelected=�6.      EnableRowVirtualization .    AutoGenerateColumns .  ��6]   �� 	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      -   5        iD_PRZESYŁKIColumn��,  &System.Windows.Controls.DataGridColumn
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 SizeToHeader 5   A      Header$ ID PRZESYŁKI��6V   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6l   �� *ID_PRZESYŁKI+  5      -   5        iD_NADAWCYColumn��$
 SizeToHeader 5   ?   $ 
ID NADAWCY��6T    6h   �� *
ID_NADAWCY+  5      -   5        iD_ODBIORCYColumn��$
 SizeToHeader 5   @   $ ID ODBIORCY��6U    6j   �� *ID_ODBIORCY+  5      -   5        %!iD_KURIERA_DOSTARCZAJĄCEGOColumn��$
 SizeToHeader 5   O   $ 
ID KURIERA��6d    6x   �� *ID_KURIERA_DOSTARCZAJĄCEGO+  5      -   5        tYP_PRZESYŁKIColumn��$
 SizeToHeader 5   B   $ TYP PRZESYŁKI��6W    6n   �� *TYP_PRZESYŁKI+  5      -   5        sTATUS_PRZESYŁKIColumn��$
 SizeToHeader 5   E   $ STATUS PRZESYŁKI��6Z    6t   �� *STATUS_PRZESYŁKI+  5      -	   5        !iD_ADRESU_POCZĄTKOWEGOColumn��$
 SizeToHeader 5   K   $ ID ADRESU POCZĄTKOWEGO��6`    6�   �� *ID_ADRESU_POCZĄTKOWEGO+  5      -
   5        iD_ADRESU_KOŃCOWEGOColumn��$
 SizeToHeader 5   H   $ ID ADRESU KOŃCOWEGO��6]    6z   �� *ID_ADRESU_KOŃCOWEGO+  5      -   5        iD_PŁATNOŚCIColumn��$
 SizeToHeader 5   A   $ ID PŁATNOŚCI��6V    6l   �� *ID_PŁATNOŚCI+4  .System.Windows.Controls.DataGridTemplateColumn  5      -   5        !dATA_NADANIA_PRZESYŁKIColumn��$
 SizeToHeader 5   O   $ DATA NADANIA��6d      CellTemplate 5      �� 5      .R�5      (  "System.Windows.Controls.DatePicker     SelectedDate 6)   �� *DATA_NADANIA_PRZESYŁKI+ �� Mode$ TwoWay=� �� NotifyOnValidationError .  �� ValidatesOnExceptions . 5      5        5      -   5        #dATA_ODEBRANIA_PRZESYŁKIColumn��$
 SizeToHeader 5   Q   $ DATA ODEBRANIA��6f    5      �� 5       .R�5!         6)   �� *DATA_ODEBRANIA_PRZESYŁKI+$ TwoWay=� .  . 5"      5$        5%      -   5        kOSZT_PRZESYŁKIColumn��$
 SizeToHeader 5%   D   $ KOSZT PRZESYŁKI��6Y    6r   �� *KOSZT_PRZESYŁKI+5'      5)      5*      