   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   ,    &DeliveryCompanyApplication.IntroWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	   -   5          � Title$7  1Aplikacja firmy wykonujacej przesyłki kurierskie��5   	   $��420.5��6B   $	��666��6Q    � 	Resources 5      (   "DeliveryCompanyApplication.DataSet   dataSet  aDRESYViewSource �� Source �� Source  kONTAViewSource)   #DeliveryCompanyApplication.DataSet1  dataSet1  kONTAViewSource1��%�   &	        &	      7   &	 ?     7   &	 j     &	 }     7    5   
   6   �� 5   
    68   �� *ADRESY+8   �� 5	   
    67   �� *KONTA+8     5
   
   6   �� 5   
    68   �� *KONTA+8   5      .��5      �  � DataContext# [ 6   $��0,0,28,8q�6;    � ColumnDefinitions 5   
   �� 5      $��0* �6   �� 5      $	��24* �6   �� 5      $
��263* �6   �� 5      $��0* �6   .+�5   
   �� $/��)Zarejestruj się aby stworzyć nowe konto��6   $
��Left=�6B   $��	10,31,0,0q�6]   $	��Top=�6p   $��2��6�   $��26��6�   $	��221��6�   �� 5   
   -   5        $��Rejestracja��5      $��2��6'   $
��Left=�67   $��	10,62,0,0q�6R   $	��Top=�6e   $��75��6}   $��22��6�   �� 5   
   -   5         ��Name$ LoginButton��5      $��	Logowanie��6&   $��2��6:   $
��Left=�6J   $��
10,134,0,0q�6e   $	��Top=�6y   $��75��6�   $��22��6�   �� 5   
   $3��-Zaloguj sie na istniejące konto użytkownika��6   $
��Left=�6F   $��
10,103,0,0q�6a   $	��Top=�6u   $��2��6�   $��26��6�   $	��243��6�   �� 5   
   $7��1Śledzenie przesyłek bez konieczności logowania��6   $
��Left=�6I   $��
10,300,0,0q�6d   $	��Top=�6x   $��2��6�   $��26��6�   $	��263��6�   �� 5   
   -   5        $ DeliveryTrackingButton��5      $��Śledzenie przesyłek��61   $��2��6O   $
��Left=�6_   $��
10,330,0,0q�6z   $	��Top=�6�   $	��121��6�   $��22��6�   �� 5   
   -   5        $ LoginButton2��5      $��	Logowanie��6'   $��2��6;   $
��Left=�6K   $��
10,192,0,0q�6f   $	��Top=�6z   $��75��6�   $��22��6�   �� 5   
   $2��,Zaloguj się na istniejące konto pracownika��6   $
��Left=�6E   $��
10,161,0,0q�6`   $	��Top=�6t   $��2��6�   $��26��6�   $	��243��6�   �� 5   
   -   5        $ LoginButton3��5      $��	Logowanie��6'   $��2��6;   $
��Left=�6K   $��
10,250,0,0q�6f   $	��Top=�6z   $��75��6�   $��22��6�   �� 5   
   $5��/Zaloguj sie na istniejące konto administratora��6   $
��Left=�6I   $��
10,219,0,0q�6d   $	��Top=�6x   $��2��6�   $��26��6�   $	��263��6�   5      5       