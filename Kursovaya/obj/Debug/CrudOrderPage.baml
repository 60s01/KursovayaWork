   M S B A M L   `   `   `  ????D  @Kursovaya, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Kursovaya	Kursovaya  5          Kursovaya.CrudOrderPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      )localclr-namespace:Kursovaya     5        N? Title$  CrudOrderPage??5	      .??5      ? .+?5   
   ?? .+?5      ??  ?? Orientation$ 
Horizontal=?6   $	??Top=?62   .+?5      ?? $??Номер заказа??6   $??	10 10 0 0q?60   $??20??6C   $
??Bold"?6O   ?? 5      -   5         ??Name$ NumberOrder??5      $??5 10 0 0q?61   $
??auto??6C   $??20??6P   $
??Bold"?6\   ?? 5      $%??Стоимость Заказа??6   $??	35 10 0 0q?64   $??20??6G   $
??Bold"?6S   ?? 5      -   5        $ 
PriceOrder??5      $??5 10 0 0q?60   $
??auto??6B   $??20??6O   $
??Bold"?6[   5      &   System.Windows.Controls.DataGrid  5      -   5          Name$	 DG0??5      $??	0 10 0 10q?6$   $
??auto??67      AutoGenerateColumns .     Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 
Блюдо??6)      Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6W   1  +System.Windows.Controls.DataGridBoundColumn   Binding 68   ?? *
Dish.Title+6W     5      $ Количетсво??6)   $
 auto 6Z    6=   ?? *
Quantity+6Z     5      $ 
Сумма??6)   $
 auto 6n    68   ?? 	 ?? Path$	 Amount?
 ?? StringFormat$
 {0:C}??6n   4  .System.Windows.Controls.DataGridTemplateColumn  5         CellTemplate 5      ?? 5      .R?5   "   ??  ??Name$ 
DeleteDish??6L   -   5        $??Удалить блюдо??5   )   $??5q?6A   6`   5      5      5       ?? 5!      $ 
Horizontal=?6   $??Bottom=?62   .+?5"      ?? -   5        $ 
CreateDish??5"   2   $!??Добавить Блюдо??6   $	??150??6F   $??30??6R   $??
50 10 0 20q?6^   6s   5$      ?? 5%      $ 
Horizontal=?6   .+?5&      ?? $
??Auto??6   $ Vertical=?6*   .+?5'      ?? $!??Выберете Блюдо??6    $??20q?66   ?? 5(      $#??Количество Блюд??6    $??20q?67   5)      ?? 5*      $	??200??6   .+?5+      ?? -   5         ??Name$ CMDish??5+      $??20q?6/    ?? DisplayMemberPath$ Title??6;   ?? 5,      -   5         ??Name$ Kolvo??5,      $??20q?6-   5-      5.      5/      50      51      