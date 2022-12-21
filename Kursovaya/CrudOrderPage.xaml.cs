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
    /// Логика взаимодействия для CrudOrderPage.xaml
    /// </summary>
    public partial class CrudOrderPage : Page
    {
        private Order _order1;
        public CrudOrderPage(Order _order)
        {
            InitializeComponent();
            CMDish.ItemsSource = KursovayaEntities.GetContext().Dishs.ToList();
            CMDish.SelectedIndex = 0;
            if (_order == null)
            {
                _order = new Order();
                _order.Price = 0;
                _order.Staff = MainWindow._staff;
                _order.Status = "Активный";
            }
            this._order1 = _order;
            DG0.ItemsSource = _order.InfoOrders;
            NumberOrder.Text = Convert.ToString(_order.IdOrder);
            PriceOrder.Text = "$ " + Convert.ToString((int) _order.Price);
        }

        private void CreateDish_Click(object sender, RoutedEventArgs e)
        {
            var _infoOrder = new InfoOrder();
            _infoOrder.Dish = CMDish.SelectedItem as Dish;
            _infoOrder.Order = _order1;
            _infoOrder.Quantity = int.Parse(Kolvo.Text);
            _infoOrder.Amount = _infoOrder.Quantity * _infoOrder.Dish.Price;
            _order1.InfoOrders.Add(_infoOrder);
            DG0.ItemsSource = _order1.InfoOrders;
            DG0.Items.Refresh();
            _order1.Price = _order1.InfoOrders.Select(io => io.Amount).Sum();
            PriceOrder.Text = "$ " + Convert.ToString((int)_order1.Price);
            KursovayaEntities.GetContext().InfoOrders.Add(_infoOrder);
            try
            {
                KursovayaEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены!");
            }
            catch (Exception)
            {
                MessageBox.Show("Данные не сохранены!");
                throw;
            }
        }

        private void DeleteDish_Click(object sender, RoutedEventArgs e)
        {
            var _info0 = (sender as Button).DataContext as InfoOrder;
            KursovayaEntities.GetContext().InfoOrders.Remove(_info0);
            KursovayaEntities.GetContext().SaveChanges();
            (DG0.ItemsSource as ICollection<InfoOrder>).Remove(_info0);
            DG0.Items.Refresh();
            _order1.Price = _order1.InfoOrders.Select(io => io.Amount).Sum();
            PriceOrder.Text = "$ " + Convert.ToString((int)_order1.Price);
            _order1.InfoOrders.Remove(_info0);
            MessageBox.Show("блюдо удалено!");
        }
    }
}
