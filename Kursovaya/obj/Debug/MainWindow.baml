   M S B A M L   `   `   `  ????D  @Kursovaya, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null%clr-namespace:Kursovaya	Kursovaya  5   	       Kursovaya.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )localclr-namespace:Kursovaya     5   	     ? Title$  
MainWindow??5   	   $	??600??6   $
??1000??6)    ? Icon$ Image/unnamed1.jpg??66   .??5	      ?  ? RowDefinitions 5
   
   ?? 5      $	??100 ?6   6+   ?? 5      $??* ?6   6)   ?? 5      $??50 ?6   6*   .+?5   
   ?? $??0??6    ?? Orientation$ 
Horizontal=?6"   
???   ?.+?5      ?? $??Image/unnamed1.jpg??6   $??15 0 0 0q?60   $??75??6B   ?? 5      -   5         ??Name$ CreateStaff??5   *   $??Сотрудники??6   $??35??6?   $	??140??6K   $??15 0 0 0q?6W   $y?Hidden=?6?   ?? 5      -   5        $ UpdateOrder??5   &   $??Заказы??6   $??35??6;   $	??140??6G   $??15 0 0 0q?6S   $y?Hidden=?6y   ?? 5      -   5         ??Name$
 Role??5   B   $??25??6   $??15 0 0 0q?6$   $	??225??66   
???????6P   ?? 5      -   5         ??Name$ Password??5   ?   $??25??6   $??15 0 0 0q?6"   $??90??64   6?   ?? 5      -   5        $ SignIn??5   %   $??
Войти??6   $??25??65   $??75??6A   $??15 0 0 0q?6L   6^   5       ? 5   
   -   5          ?Name$ 	MainFrame??5      $??1??6     ? NavigationUIVisibility$ Hidden=?60   ?? 5   
   $??2??6   $ 
Horizontal=?6"   
???   ?.+?5      ?? -   5        $
 Exit??5   %   $??
Выйти??6   $??35??63   $	??140??6?   $??15 0 0 0q?6K   $y?Hidden=?6q   5      5      5      