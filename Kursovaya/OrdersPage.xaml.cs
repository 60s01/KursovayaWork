using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Kursovaya
{
    /// <summary>
    /// Логика взаимодействия для OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page
    {
        public OrdersPage()
        {
            InitializeComponent();
            var _data = KursovayaEntities.GetContext().Orders.ToList();
            foreach (var i in _data)
            {
                i.Price = i.InfoOrders.Select(io => io.Amount).Sum();
            }
            DG.ItemsSource = _data;
            
        }

        private void InfoOrder_Click(object sender, RoutedEventArgs e)
        {
            var _order = (sender as Button).DataContext as Order;
            ClassPage.MainFrame.Navigate(new CrudOrderPage(_order));
        }

        private void CreateInfoOrder_Click(object sender, RoutedEventArgs e)
        {
            ClassPage.MainFrame.Navigate(new CrudOrderPage(null));
        }

        private void DeletedOrder_Click(object sender, RoutedEventArgs e)
        {
            var _order = (sender as Button).DataContext as Order;
            KursovayaEntities.GetContext().InfoOrders.RemoveRange(_order.InfoOrders);
            KursovayaEntities.GetContext().Orders.Remove(_order);
            KursovayaEntities.GetContext().SaveChanges();
            (DG.ItemsSource as ICollection<Order>).Remove(_order);
            DG.Items.Refresh();
            MessageBox.Show("Заказ Удален");
        }
    }
}
