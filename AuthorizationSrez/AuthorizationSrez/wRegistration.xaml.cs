using AuthorizationSrez.Entities;
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
using System.Windows.Shapes;

namespace AuthorizationSrez
{
    /// <summary>
    /// Логика взаимодействия для wRegistration.xaml
    /// </summary>
    public partial class wRegistration : Window
    {
        public wRegistration()
        {
            InitializeComponent();
        }

        private void Eyes_MouseEnter(object sender, MouseEventArgs e)
        {
            tbPass.Text = pbPass.Password;
            tbPass.Visibility = Visibility.Visible;
            pbPass.Visibility = Visibility.Hidden;
        }

        private void Eyes_MouseLeave(object sender, MouseEventArgs e)
        {
            tbPass.Visibility = Visibility.Hidden;
            pbPass.Visibility = Visibility.Visible;
        }

        private void btnReg_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Users newUser = new Users();
                int IdUser = ConnectDB.db.Users.Max(c => c.IdUser) + 1;
                newUser.IdUser = IdUser;
                newUser.Surname = tbSurname.Text;
                newUser.Name = tbName.Text;
                newUser.MiddleName = tbMiddleName.Text;
                Log newLog = new Log();
                int IdLog = ConnectDB.db.Log.Max(c => c.Id) + 1;
                newLog.Id = IdLog;
                newLog.Login = tbEmail.Text;
                if (pbPass.Password == pbPass1.Password)
                {
                    newLog.Password = pbPass.Password;
                }
                else
                {
                    MessageBox.Show("Пароли не совпадают!");
                    pbPass.Password = "";
                    pbPass1.Password = "";
                }
                newLog.IdUser = IdUser;
                ConnectDB.db.Users.Add(newUser);
                ConnectDB.db.SaveChanges();
                ConnectDB.db.Log.Add(newLog);
                ConnectDB.db.SaveChanges();
                MessageBox.Show("Аккаунт успешно создан!");
                MainWindow main = new MainWindow();
                this.Close();
                main.ShowDialog();
            }
            catch (Exception)
            {
                MessageBox.Show("Ошибка");
            }
        }

        private void btnAuthor_Click(object sender, RoutedEventArgs e)
        {
            MainWindow main = new MainWindow();
            this.Close();
            main.ShowDialog();
        }

        private void Eyes1_MouseEnter(object sender, MouseEventArgs e)
        {
            tbPass1.Text = pbPass1.Password;
            tbPass1.Visibility = Visibility.Visible;
            pbPass1.Visibility = Visibility.Hidden;
        }

        private void Eyes1_MouseLeave(object sender, MouseEventArgs e)
        {
            tbPass1.Visibility = Visibility.Hidden;
            pbPass1.Visibility = Visibility.Visible;
        }
    }
}
