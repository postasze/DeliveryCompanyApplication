   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   3    -DeliveryCompanyApplication.RegistrationWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	     � Title$  Rejestracja��5   	   $��460.142��6   $��704.478��6.    � 	Resources 5       �� 
TargetType �� Triggers P� Property P� Value �� Property �� Value �� RelativeSource	 �� Path   validationTemplate��%N  '��       &	  �     �� 5   
   " ��6    5	      P� 5
       �@=�HasError . . �5      ��  �@�ToolTip 60   ��  �� *Self+$)	 #(Validation.Errors)[0].ErrorContent�5      5      �� 5   
   .R�5      ]� .+�5      �� 
���  ��$��20(�6-   !6>   �� 5      5      5      5      .��5      � $��	0,0,26,12q�6   .+�5   
   �� -   5        
 ��Name$
 RegistrationButton��5      $��Zarejestruj��6-   $
��Left=�6C   $��354,386,0,0q�6^   $	��Top=�6s   $��74��6�    J� RenderTransformOrigin$ 
2.38,2.432&�6�   �� 5   
   -   5         ��Name$ loginTextBox��5      $
��Left=�6(   $��23��6C   $��
168,57,0,0q�6O    �� TextWrapping$
 Wrap=�6c   $	��Top=�6w   $	��120��6�   .��6�   ��5   
   �� 5      $	 
inputLogin�6    �� UpdateSourceTrigger$ 	LostFocus=�6(    �� ValidationRules 5      /  )DeliveryCompanyApplication.loginValidator  5      5      .��5       5!      �� 5"   
   $��Podaj login��6   $
��Left=�6&   $��	36,57,0,0q�6A   $	��Top=�6T   �� 5#   
   $��Podaj hasło��6   $
��Left=�6&   $��
38,225,0,0q�6A   $	��Top=�6U   �� 5$   
   $��Podaj ulicę��6   $
��Left=�6&   $��
339,68,0,0q�6A   $	��Top=�6U   �� 5%   
   $��Podaj adres e-mail��6   $
��Left=�6-   $��	36,88,0,0q�6H   $	��Top=�6[   �� 5&   
   $��Powtórz hasło��6   $
��Left=�6(   $��
38,259,0,0q�6C   $	��Top=�6W   �� 5'   
   -   5        $ MailTextBox��5'      $
��Left=�6'   $��23��6B   $��
168,88,0,0q�6N   $
 Wrap=�6b   $	��Top=�6v   $	��120��6�   .��6�   ��5(   
   �� 5)      $	 	inputMail�6   $ 	LostFocus=�6'    5*      .  (DeliveryCompanyApplication.mailValidator  5+      5-      .��5.      5/      �� 50   
   -   5        $ StreetTextBox��50      $
��Left=�6)   $��22��6D   $��
508,66,0,0q�6P   $
 Wrap=�6d   $	��Top=�6x   $	��120��6�   .��6�   ��51   
   �� 52      $	 inputStreet�6   $ 	LostFocus=�6)    53      7  1DeliveryCompanyApplication.StringTextBoxValidator  54      56      .��57      58      �� 59   
   $��Podaj numer mieszkania��6   $
��Left=�61   $��337,128,0,0q�6L   $	��Top=�6a   �� 5:   
   $��Podaj miasto��6   $
��Left=�6'   $��337,244,0,0q�6B   $	��Top=�6W   �� 5;   
   $��Podaj numer domu��6   $
��Left=�6+   $��
337,96,0,0q�6F   $	��Top=�6Z   �� 5<   
   $��Podaj kod pocztowy��6   $
��Left=�6-   $��337,154,0,0q�6H   $	��Top=�6]   �� 5=   
   -   5        $ StreetNumberTextBox��5=       =� ErrorTemplate# [  6R   $
��Left=�6�   $��22��6�   $��508,100,0,0q�6�   $
 Wrap=�6�   $	��Top=�6�   $	��120��6�   ��6/   �� *inputStreetNumber+6�   �� 5>   
   -   5        $ HomeNumberTextBox��5>      # [  6N   $
��Left=�6�   $��24��6�   $��508,130,0,0q�6�   $
 Wrap=�6�   $	��Top=�6�   $	��120��6�   ��6-   �� *inputHomeNumber+6�   G� 5?   
   -   5         G�Name$ PasswordBox1��5?      $
��Left=�6,   $��167,231,0,0q�6G   $	��Top=�6\   $	��119��6t   G� 5@   
   -   5        $ PasswordBox2��5@      $
��Left=�6,   $��168,265,0,0q�6G   $	��Top=�6\   $	��119��6t   �� 5A   
   $$��Podaj swój adres zamieszkania��6   $
��Left=�68   $��
339,19,0,0q�6S   $	��Top=�6g   �� 5B   
   $��Podaj podstawowe dane��6   $
��Left=�60   $��	36,19,0,0q�6K   $	��Top=�6^   �� 5C   
   -	   5         ��Name$ AccountComboBox��5C      $
��Left=�6R   $��
38,323,0,0q�6m   $	��Top=�6�   $	��251��6�    �� SelectedIndex 6,   �� *accountType+6�   �� 5D   
   $��Wybierz rodzaj konta��6   $
��Left=�6/   $��
37,293,0,0q�6J   $	��Top=�6^   $��24��6v   �� 5E   
   -
   5        $ PostalCodeTextBox��5E      $
��Left=�6-   $��24��6H   $��508,160,0,0q�6T   $
 Wrap=�6i   $	��Top=�6}   $	��120��6�   .��6�   ��5F   
   �� 5G      $	 inputPostalCode�6   $ 	LostFocus=�6-    5H      4  .DeliveryCompanyApplication.PostalCodeValidator  5I      5K      .��5L      5M      �� 5N   
   -   5        $ CityComboBox��5N      $
��Left=�6M   $��508,248,0,0q�6h   $	��Top=�6}   $	��120��6�    6)   �� *	inputCity+6�   �� 5O   
   $��Podaj państwo��6   $
��Left=�6(   $��337,188,0,0q�6C   $	��Top=�6X   �� 5P   
   -   5        $ CountryComboBox��5P      $
��Left=�6S   $��508,194,0,0q�6n   $	��Top=�6�   $	��120��6�    6,   �� *inputCountry+6�   �� 5Q   
   $��Podaj województwo��6   $
��Left=�6,   $��337,218,0,0q�6G   $	��Top=�6\   �� 5R   
   -   5        $ RegionComboBox��5R      $
��Left=�6Q   $��508,222,0,0q�6l   $	��Top=�6�   $	��120��6�    6+   �� *inputRegion+6�   �� 5S   
   -   5        $ EmployeeTypeComboBox��5S      $
��Left=�6X   $��337,323,0,0q�6s   $	��Top=�6�   $	��291��6�    61   �� *employeeType+6�   �� 5T   
   $S��MWybierz typ pracownika (tylko w przypadku konta
pracownika i administratora)��6   $
��Left=�6p   $��336,275,0,0q�6�   $	��Top=�6�   $	��292��6�   �� 5U   
   -   5        $ NameTextBox��5U      $
��Left=�6'   $��23��6B   $��168,123,0,0q�6N   $
 Wrap=�6c   $	��Top=�6w   $	��120��6�   .��6�   ��5V   
   �� 5W      $
	 name�6   $ 	LostFocus=�6"    5X        5Y      5[      .��5\      5]      �� 5^   
   $��Podaj pierwsze imię��6   $
��Left=�6.   $��
36,123,0,0q�6I   $	��Top=�6]   �� 5_   
   $��Podaj drugie imię��6   $
��Left=�6,   $��
36,154,0,0q�6G   $	��Top=�6[   �� 5`   
   -   5        $ SecondNameTextBox��5`      $
��Left=�6-   $��23��6H   $��168,154,0,0q�6T   $
 Wrap=�6i   $	��Top=�6}   $	��120��6�   .��6�   ��5a   
   �� 5b      $	 
secondName�6   $ 	LostFocus=�6(    5c        5d      5f      .��5g      5h      �� 5i   
   $��Podaj nazwisko��6   $
��Left=�6)   $��
37,188,0,0q�6D   $	��Top=�6X   �� 5j   
   -   5        $ SurnameTextBox��5j      $
��Left=�6*   $��23��6E   $��169,188,0,0q�6Q   $
 Wrap=�6f   $	��Top=�6z   $	��120��6�   .��6�   ��5k   
   �� 5l      $	 surname�6   $ 	LostFocus=�6%    5m        5n      5p      .��5q      5r      �� 5s   
   -   5        $
 CancelButton��5s      $��Anuluj��6'   $
��Left=�68   $��258,386,0,0q�6S   $	��Top=�6h   $��74��6�   $ 
2.38,2.432&�6�   5t      5u      