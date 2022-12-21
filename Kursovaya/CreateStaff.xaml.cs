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
    /// Логика взаимодействия для CreateStaff.xaml
    /// </summary>
    public partial class CreateStaff : Page
    {
        Staff _staff = new Staff();
        public CreateStaff(Staff _x)
        {
            InitializeComponent();
            ComboboX.ItemsSource = KursovayaEntities.GetContext().Staffs.Select(_y => _y.Grade).Distinct().ToList();
            if (_x == null)
            {
                _staff = new Staff();
            }
            else
            {
                _staff = _x;
                TB0.Text = _staff.FirstName;
                TB1.Text = _staff.MiddleName;
                TB2.Text = _staff.LastName;
                ComboboX.SelectedItem = _staff.Grade;
                TB4.Text = _staff.Password;
            }
            DataContext = _staff;
        }

        private void CreateStaff_Click(object sender, RoutedEventArgs e)
        {
            _staff.FirstName = TB0.Text;
            _staff.MiddleName = TB1.Text;
            _staff.LastName = TB2.Text;
            _staff.Grade = ComboboX.Text;
            _staff.Password = TB4.Text;
            if (_staff.IdStaff == 0)
                KursovayaEntities.GetContext().Staffs.Add(_staff);
            try
            {
                KursovayaEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены!");
                ClassPage.MainFrame.Navigate(new StaffPage());
            }
            catch (Exception)
            {
                MessageBox.Show("Данные не сохранены!");
            }
        }
        private void GoBack(object sender, RoutedEventArgs e)
        {
            ClassPage.MainFrame.Navigate(new StaffPage());
        }
    }
}
