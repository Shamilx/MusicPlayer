   M S B A M L   `   `   `  ����c  _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35qPclr-namespace:System.Windows.Interactivity;assembly=System.Windows.InteractivitySystem.Windows.Interactivity  5   	   F BMusicPlayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:MusicPlayer.MVVM.ViewMusicPlayer.MVVM.View 5   	       MusicPlayer.MVVM.View.Main   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   b ^MaterialDesignThemes.Wpf, Version=4.2.0.2634, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   XiPclr-namespace:System.Windows.Interactivity;assembly=System.Windows.Interactivity  5   	   /local#clr-namespace:MusicPlayer.MVVM.View  5   	   b ^GalaSoft.MvvmLight.Platform, Version=5.4.1.0, Culture=neutral, PublicKeyToken=5f873c45e98af8a1/command1 http://www.galasoft.ch/mvvmlight  5	   	      Vm  � DataContext#  [  5   	    � Title$ Player��5   	   $	��600��6   $	��500��6%   .   (System.Windows.Interactivity.Interaction   Triggers 5      /   )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Closing��6   .   (System.Windows.Interactivity.TriggerBase   Actions. 5      /  )GalaSoft.MvvmLight.Command.EventToCommand     PassEventArgsToCommand .    Command 6&   �� *OnClosingCommand+6K   5      .��5      � #  [  6    � RowDefinitions 5   
   �� 5      $	��400 �6   �� 5      .+�5   
   #  MaterialDesignThemes.Wpf.Card  $��Center=�5      
���� ��$	��100��5      
�������$	��200��5      $��8q�5          UniformCornerRadius$ 6Q�5!      .��5"      �� $��Center=�6   $��Center=�66   .+�5#      �� $
��Wrap=�6   $��Center=�6w   $��20(�6�   $��Center=�6�   $��Arial)�5$      $��5q�6/   ��5#   0   �� *CurrentSong.Title+	 �� UpdateSourceTrigger$	 PropertyChanged=�5$   /   5%      5&      �� 5(   
   $��1��6   $��Center=�6"   $��Center=�6?   
 �� Orientation$
 
Horizontal=�6Z   .+�5)      �� 
�������  MaterialDesignIconButton#��[ 5,       � ToolTip$
 Back��5-      ��5+      �� *BackButtonCommand+.��5.      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 	ArrowBack=�5/      50      �� 51      
������#��[ 54      $
 Play��55      ��53      �� *PlayButtonCommand+��56      �� *PlayButtonContent+�� 57      
�������#��[ 5:      $ Forward��5;      ��59      �� *ForwardButtonCommand+.��5<        $ ArrowForward=�5=      5>      5?      �� 5A   
   $��1��5B      
�������$��Bottom=�5E      $��Right=�5F      $��10q�5G      #��[ 5H      $ Manage Song List��5I      ��5D      �� *ManageMusicsCommand+.��5J        $ 
ListStatus=�5K      5L      5M      ��5Q      �� 5R   
    �� Opacity$	 0.6Q�6   .��5S      �  � Color$ Purple��6   � 5T      $ MidnightBlue��6    � Offset$	 0.6Q�60   5U      5W      