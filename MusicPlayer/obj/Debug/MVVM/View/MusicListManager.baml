   M S B A M L   `   `   `  ����F  BMusicPlayer, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:MusicPlayer.MVVM.ViewMusicPlayer.MVVM.View  5   	   ,    &MusicPlayer.MVVM.View.MusicListManager   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   b ^MaterialDesignThemes.Wpf, Version=4.2.0.2634, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   /local#clr-namespace:MusicPlayer.MVVM.View  5   	     � Title$  Manager��5	   	   $	��600��6   $	��500��6&   .��5      �    Vm � DataContext# [  6    � ColumnDefinitions 5   
   �� 5      $	��300 �6   �� 5      .+�5   
   �� 
�������$��Center=�6'   $	��Top=�6D   $��5q�6\   $��25��6g   $��16(�5      $��Consolas)�6"   
Music List5      �� 5   
   $��0��5      
�������
�������$	��500��5      $	��280��5      $��Center=�5      $��Center=�5      ��5      �� *
SongList+ �� SelectedItem 5      �� *SelectedMusicItem+5      �� 5    
   $��1��6   $��Right=�6%   $��Bottom=�6A   .+�5!      �� 
�������  MaterialDesignIconButton#��[ 5#       � ToolTip$
 Play��5%      ��5$      �� *PlaySelectedMusicCommand+.��5&      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Play=�5'      5(      �� 5*      
�������#��[ 5,      $	 Add��5.      ��5-      �� *AddMusicCommand+.��5/        $
 Plus=�50      51      �� 53      
�������#��[ 55      $ Delete��57      ��56      �� *DeleteMusicCommand+.��58        $ Delete=�59      5:      5<      5=      ��5?      �� 5@   
    �� Opacity$	 0.4Q�6   .��5A      �  � Color$ Purple��6   � 5B      $ MidnightBlue��6    � Offset$	 0.6Q�60   5C      5F      