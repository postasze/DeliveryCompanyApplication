   M S B A M L   `   `   `  ����U  QDeliveryCompanyApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullG(clr-namespace:DeliveryCompanyApplicationDeliveryCompanyApplication  5   	   ,    &DeliveryCompanyApplication.LogInWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :local(clr-namespace:DeliveryCompanyApplication     5   	     � Title$  	Logowanie��5   	   $��270.5��6   $	��368��6*    � 	Resources 5       �� 
TargetType �� Triggers P� Property P� Value �� Property �� Value �� RelativeSource	 �� Path��%�   '��       �� 5   
   " ��6    5	      P� 5
       �@=�HasError . . �5      ��  �@�ToolTip 60   ��  �� *Self+$)	 #(Validation.Errors)[0].ErrorContent�5      5      5      .��5      � .+�5   
   �� -   5        
 ��Name$
 loginTextBox��5      $
��Left=�6(   $��22��6C   $��
144,52,0,0q�6O    �� TextWrapping$
 Wrap=�6c   $	��Top=�6w   $	��172��6�   .��6�   ��5   
   �� 5      $	 login�6    �� UpdateSourceTrigger$ 	LostFocus=�6#    �� ValidationRules 5      7  1DeliveryCompanyApplication.StringTextBoxValidator  5      5      .��5      5      �� 5   
   $��Podaj login��6   $
��Left=�6&   $��	30,52,0,0q�6A   $	��Top=�6T   �� 5   
   $��Podaj hasło��6   $
��Left=�6&   $��	30,88,0,0q�6A   $	��Top=�6T   G� 5   
   -   5         G�Name$ PasswordBox��5      $
��Left=�6+   $��
144,94,0,0q�6F   $	��Top=�6Z   $	��172��6r   �� 5   
   -   5         ��Name$ LoginButton��5      $��Zaloguj��6&   $
��Left=�68   $��192,176,0,0q�6S   $	��Top=�6h   $��74��6�    J� RenderTransformOrigin$ 
2.38,2.432&�6�    �� 	IsDefault . 6�   �� 5   
   -   5        $ CancelButton��5      $��Anuluj��6'   $
��Left=�68   $��
98,176,0,0q�6S   $	��Top=�6g   $��74��6   $ 
2.38,2.432&�6�    �� IsCancel . 6�   5!      5"      