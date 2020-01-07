using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using TrenRezervasyon.DAL;
using TrenRezervasyon.Entitiy;

namespace TrenRezervasyon
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            //Thread t = new Thread(new ThreadStart(StartForm));
            //t.Start();
            //Thread.Sleep(5000);
            InitializeComponent();
            //t.Abort();
            textBox2.PasswordChar = '*';
            CapsLockControl();
        }
        public void CapsLockControl()
        {
            if (Control.IsKeyLocked(Keys.CapsLock))
            {
                label1.Text = "Caps Lock Açık";
            }
            else
            {
                label1.Visible = false;
            }
        }
        public void StartForm()
        {
            Application.Run(new formSplash());
        } 

        private void button1_Click(object sender, EventArgs e)
        {
            var isim = textBox1.Text;
            var sifre = textBox2.Text;
            var f = HelperKullanici.SignIn(isim, sifre);
            if (f.Item2)
            {
                if (f.Item1.kullaniciTip == false)
                {
                    this.Hide();
                    MessageBox.Show("Admin Kullanıcı! Hoşgeldiniz!");
                    AdminForm a = new AdminForm();
                    a.Show();
                }
                else
                {
                    Kullanici kullanici = new Kullanici();
                    kullanici.adi = f.Item1.adi;
                    kullanici.soyadi = f.Item1.soyadi;
                    kullanici.tckimlikno = f.Item1.tckimlikno;
                    kullanici.kullaniciTip = f.Item1.kullaniciTip;
                    kullanici.telefon = f.Item1.telefon;
                    kullanici.adres = f.Item1.adres;
                    kullanici.cinsiyet = f.Item1.cinsiyet;
                    kullanici.KullaniciID = f.Item1.KullaniciID;
                    kullanici.kullaniciAdi = f.Item1.kullaniciAdi;
                    MessageBox.Show($"Hoşgeldiniz Sayın {f.Item1.adi}");
                    KullaniciForm k = new KullaniciForm(kullanici);
                    k.Show();
                }
            }
            else
            {
                MessageBox.Show("Böyle bir kullanici bulunamadı!");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            KayitForm k = new KayitForm();
            k.Show();
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_TextChanged(object sender, EventArgs e)
        {
            CapsLockControl();
            label1.Visible = true;
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            label1.Visible = true;
            CapsLockControl();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
