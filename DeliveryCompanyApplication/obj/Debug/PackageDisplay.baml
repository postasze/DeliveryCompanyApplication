   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   /    )DeliveryCompanyApplication.PackageDisplay   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	   -   5          � Title$  Wyświetlanie paczek��5   	   $��326.866��6%   $��517.911��66    � 	Resources 5      )   #DeliveryCompanyApplication.DataSet1   dataSet1  pACZKIViewSource �� Source �� Source��%W   &	        &	      7     5   
   6   �� 5   
    68   �� *PACZKI+8   5	      .��5
      �  � DataContext# [ 6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ pACZKIDataGrid��5         RowDetailsVisibilityMode$ VisibleWhenSelected=�6+      EnableRowVirtualization .    AutoGenerateColumns .  ��6Z   �� 	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      -   5        iD_PACZKIColumn��,  &System.Windows.Controls.DataGridColumn
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 SizeToHeader 5   >      Header$ 	ID PACZKI��6S   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6f   �� *	ID_PACZKI+  5      -   5        iD_PRZESYŁKIColumn��$
 SizeToHeader 5   A   $ ID PRZESYŁKI��6V    6l   �� *ID_PRZESYŁKI+  5      -   5        iD_LOKALIZACJIColumn��$
 SizeToHeader 5   C   $ ID LOKALIZACJI��6X    6p   �� *ID_LOKALIZACJI+  5      -   5        tYP_PACZKIColumn��$
 SizeToHeader 5   ?   $ 
TYP PACZKI��6T    6h   �� *
TYP_PACZKI+  5      -   5        mASA_PACZKIColumn��$
 SizeToHeader 5   @   $ MASA PACZKI��6U    6j   �� *MASA_PACZKI+  5      -   5        wYMIARY_PACZKIColumn��$
 SizeToHeader 5   C   $ WYMIARY PACZKI��6X    6p   �� *WYMIARY_PACZKI+5      5      5      