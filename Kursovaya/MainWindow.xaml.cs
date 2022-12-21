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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static Staff _staff;
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new ClearPage());
            ClassPage.MainFrame = MainFrame;
        }
        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Password.Text = "";
            Role.Text = "";
            SignIn.Visibility = Visibility.Visible;
            Password.Visibility = Visibility.Visible;
            UpdateOrder.Visibility = Visibility.Hidden;
            Exit.Visibility = Visibility.Hidden;
            CreateStaff.Visibility = Visibility.Hidden;
            MainFrame.Navigate(new ClearPage());
            ClassPage.MainFrame = MainFrame;
        }
        private void Order_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new OrdersPage());
            ClassPage.MainFrame = MainFrame;
        }
        private void SignIn_Click(object sender, RoutedEventArgs e)
        {
            foreach (var i in KursovayaEntities.GetContext().Staffs)
            {
                if (Password.Text == i.Password)
                {
                    Role.Text = i.FirstName + " " + i.Grade;
                    _staff = i;
                    if (i.Grade == "Менеджер")
                    {
                        CreateStaff.Visibility = Visibility.Visible;
                    }
                    SignIn.Visibility = Visibility.Hidden;
                    Password.Visibility = Visibility.Hidden;
                    UpdateOrder.Visibility = Visibility.Visible;
                    Exit.Visibility = Visibility.Visible;
                }
            }
        }
        private void CreateStaff_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new StaffPage());
            ClassPage.MainFrame = MainFrame;
        }
    }
}
