using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TrenRezervasyon.DAL;
using TrenRezervasyon.Entitiy;
using static TrenRezervasyon.DAL.HelperKullanici;

namespace TrenRezervasyon
{
    public partial class KayitForm : Form
    {
        public KayitForm()
        {
            InitializeComponent();
            comboBox1.DataSource = Enum.GetNames(typeof(Cinsiyet));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string str = textBox1.Text;
            char[]arr = str.ToCharArray();
            //if (arr.Contains())
            //{

            //}
            List<Kullanici> kullanicilar = HelperKullanici.GetListKullanici();
            foreach (var item in kullanicilar)
            {
                if (item.kullaniciAdi.ToLower().Contains(textBox1.Text.ToLower()))
                {
                    if (item.kullaniciAdi == textBox1.Text)
                    {
                        MessageBox.Show("Böyle bir kullanıcı adı bulunmaktadır!");
                        break;
                    }
                }
            }
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || textBox5.Text == ""
                || textBox6.Text == "" || textBox7.Text == "")
            {
                MessageBox.Show("Boş alan bırakılamaz!");
            }
            else
            {

                Kullanici k = new Kullanici();

                k.kullaniciTip = true;
                k.kullaniciAdi = textBox1.Text;
                k.kullaniciSifre = textBox2.Text;
                k.adi = textBox3.Text;
                k.soyadi = textBox4.Text;
                k.adres = textBox5.Text;
                k.telefon = textBox6.Text;
                k.tckimlikno = textBox7.Text;
                if (comboBox1.SelectedIndex == 0)
                {
                    k.cinsiyet = false;
                }
                else
                {
                    k.cinsiyet = true;
                }
                var f = HelperKullanici.KayitOl(k);
                if (f.Item2)
                {
                    MessageBox.Show("Kayıt Başarı İle Gerçekleşti!");
                    this.Hide();
                    Form1 f1 = new Form1();
                    f1.Show();
                }
                else
                {
                    MessageBox.Show("Lütfen Bilgilerinizi Gözden Geçiriniz!");
                }
            }

        }
    }
}
