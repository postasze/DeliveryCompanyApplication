   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   /    )DeliveryCompanyApplication.AddressDisplay   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	   -   5          � Title$  Wyświetlanie adresów��5   	   $��362.686��6&   $��758.209��67    � 	Resources 5      )   #DeliveryCompanyApplication.DataSet1   dataSet1  aDRESYViewSource �� Source �� Source��%W   &	        &	      7     5   
   6   �� 5   
    68   �� *ADRESY+8   5	      .��5
      �  � DataContext# [ 6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ aDRESYDataGrid��5         RowDetailsVisibilityMode$ VisibleWhenSelected=�6+      EnableRowVirtualization .    AutoGenerateColumns .  ��6Z   �� 	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      -   5        iD_ADRESUColumn��,  &System.Windows.Controls.DataGridColumn
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 SizeToHeader 5   >      Header$ 	ID ADRESU��6S   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6f   �� *	ID_ADRESU+  5      -   5        uLICAColumn��$	
 100 5   :   $ ULICA��6F    6U   �� *ULICA+  5      -   5        nUMER_DOMUColumn��$
 SizeToHeader 5   ?   $ 
NUMER DOMU��6T    6h   �� *
NUMER_DOMU+  5      -   5        nUMER_MIESZKANIAColumn��$
 SizeToHeader 5   E   $ NUMER MIESZKANIA��6Z    6t   �� *NUMER_MIESZKANIA+  5      -   5        kOD_POCZTOWYColumn��$
 SizeToHeader 5   A   $ KOD POCZTOWY��6V    6l   �� *KOD_POCZTOWY+  5      -   5        mIASTOColumn��$
 80 5   ;   $ MIASTO��6F    6V   �� *MIASTO+  5      -	   5        wOJEWÓDZTWOColumn��$
 SizeToHeader 5   @   $ WOJEWÓDZTWO��6U    6j   �� *WOJEWÓDZTWO+  5      -
   5        pAŃSTWOColumn��$
 76 5   <   $ PAŃSTWO��6G    6X   �� *
PAŃSTWO+5      5      5      