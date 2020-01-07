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
using TrenRezervasyon.Models;
using static TrenRezervasyon.DAL.HelperKullanici;

namespace TrenRezervasyon
{
    public partial class KullaniciForm : Form
    {

        Kullanici kullanici = new Kullanici();
        static int seciliButon;
        List<Koltuk> koltuks = new List<Koltuk>();
        public KullaniciForm(Kullanici kullanici)

        {
            InitializeComponent();
            comboBox3.DataSource = Enum.GetNames(typeof(Cinsiyet));
            SeferListesiDoldur();

            this.kullanici.kullaniciAdi = kullanici.kullaniciAdi;
            this.kullanici.KullaniciID = kullanici.KullaniciID;
            this.kullanici.kullaniciTip = kullanici.kullaniciTip;
            this.kullanici.adi = kullanici.adi;
            this.kullanici.soyadi = kullanici.soyadi;
            this.kullanici.adres = kullanici.adres;
            this.kullanici.telefon = kullanici.telefon;
            this.kullanici.cinsiyet = kullanici.cinsiyet;
            this.kullanici.tckimlikno = kullanici.tckimlikno;
            textBox1.Text = this.kullanici.adi;
            textBox2.Text = this.kullanici.soyadi;
            textBox3.Text = this.kullanici.telefon;
            textBox5.Text = this.kullanici.adres;
            textBox4.Text = this.kullanici.tckimlikno;
            comboBox3.SelectedIndex = Convert.ToInt32(this.kullanici.cinsiyet);
            flowVagon1.Visible = false;
            flowVagon2.Visible = false;
            flowVagon3.Visible = false;
            flowVagon4.Visible = false;
            flowVagon5.Visible = false;
            İptalListesiDoldur();
            label6.Text = this.kullanici.adi;
            label6.ForeColor = Color.Green;


        }
        private void KoltuklarıListele()
        {
            flowVagon1.Controls.Clear();
            flowVagon2.Controls.Clear();
            flowVagon3.Controls.Clear();
            flowVagon4.Controls.Clear();
            flowVagon5.Controls.Clear();

            var c = HelperTren.GetTrenByName(label3.Text);
            List<Koltuk> koltuklar = HelperKoltuk.GetListKoltuk();
            List<Koltuk> koltuklarByTrenID = new List<Koltuk>();
            foreach (var item in koltuklar)
            {
                if (c.TrenID == item.TrenID)
                {
                    koltuklarByTrenID.Add(item);
                }
            }

            for (int i = 0; i <= 19; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon1.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon1.Controls.Add(b);
                }
            }
            for (int i = 20; i <= 39; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon2.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon2.Controls.Add(b);
                }
            }
            for (int i = 40; i <= 59; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon3.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon3.Controls.Add(b);
                }
            }
            for (int i = 60; i <=79; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon4.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon4.Controls.Add(b);
                }
            }
            for (int i = 80; i <=99; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon5.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon5.Controls.Add(b);
                }
            }
        }
        private void İptalListesiDoldur()
        {


            var sc = HelperKoltuk.GetListKoltuk();
            dataIptalList.Rows.Clear();
            foreach (var item in sc)
            {
                if (this.kullanici.KullaniciID == item.KullaniciID && item.durum == false)
                {
                    dataIptalList.Rows.Add($"{item.KoltukID}", $"{item.adi}", $"{item.soyadi}", $"{item.telefon}", $"{item.tcno}", $"{item.adres}");
                }
            }
            //if (this.kullanici.KullaniciID == s.KullaniciID)
            //{
            //    dataIptalList.Rows.Add($"{s.KoltukID}", $"{s.adi}", $"{s.soyadi}", $"{s.telefon}", $"{s.tcno}", $"{s.adres}");
            //}

        }
        private void SeferListesiDoldur()
        {
            List<Sefer> guzergahlar = HelperSefer.GetSeferList();
            List<SeferModel> guzergahModels = HelperSefer.GetSeferModels(guzergahlar);

            dataGridView1.Rows.Clear();
            foreach (var item in guzergahModels)
            {
                if (item.durum)
                {
                    dataGridView1.Rows.Add($"{item.SeferID}", $"{item.seferYonu}", $"{item.varisYonu}", $"{item.seferTarihi.ToString()}", $"{item.tren.trenAdi}");
                }
            }
        }

        private void KullaniciForm_Load(object sender, EventArgs e)
        {
        }
        public void b_Click(object sender, EventArgs e)
        {
            seciliButon = Convert.ToInt32((sender as Button).Text);
            groupBox2.Visible = true;
        }
        private void tabPage2_Click(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            var c1 = MessageBox.Show("Biletinizi kaydetmek istiyor musunuz?", "Bilgilendirme", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (c1 == DialogResult.Yes)
            {

                if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || textBox5.Text == "")
                {
                    MessageBox.Show("Lütfen boş alan bırakmayınız!", "Bilgilendirme", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

                else if (!int.TryParse(textBox4.Text, out int a))
                {
                    MessageBox.Show("TC'no nuz sadece rakam içermelidir.");
                }
                else if (!int.TryParse(textBox3.Text, out int b))
                {
                    MessageBox.Show("TEL'no nuz sadece rakam içermelidir.");
                }
                else
                {


                    var f = HelperKoltuk.GetListKoltuk();
                    Tren tren = HelperTren.GetTrenByName(label3.Text);
                    List<Koltuk> koltuks = new List<Koltuk>();
                    foreach (var item in f)
                    {

                        if (item.TrenID == tren.TrenID)
                        {
                            koltuks.Add(item);
                        }
                    }
                    if (koltuks[seciliButon-1].TrenID == tren.TrenID)
                    {

                        var l = HelperTren.GetTrenByName(label3.Text);
                        Koltuk koltuk = new Koltuk();
                        koltuk.KoltukID = Convert.ToInt32(koltuks[seciliButon-1].KoltukID);
                        koltuk.TrenID = tren.TrenID;
                        koltuk.durum = false;
                        koltuk.adi = textBox1.Text;
                        koltuk.soyadi = textBox2.Text;
                        koltuk.tcno = textBox4.Text;
                        koltuk.telefon = textBox3.Text;
                        koltuk.adres = textBox5.Text;
                        koltuk.KullaniciID = this.kullanici.KullaniciID;
                        var c = HelperKoltuk.Update(koltuk);
                        if (c.Item2)
                        {
                            MessageBox.Show("Biletiniz eklenmiştir.");
                        }
                        else
                        {
                            MessageBox.Show("Eklenme sırasında hata oluştu!");
                        }
                        dataIptalList.Rows.Clear();
                        dataIptalList.Rows.Add($"{koltuk.KoltukID}", $"{koltuk.adi}", $"{koltuk.soyadi}", $"{koltuk.telefon}", $"{koltuk.tcno}", $"{koltuk.adres}");
                    }
                }
            }
            else
            {
                MessageBox.Show("Bilet alma işlemi iptal edildi.");
            }

            İptalListesiDoldur();
            KoltuklarıListele();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            flowVagon1.Controls.Clear();
            flowVagon2.Controls.Clear();
            flowVagon3.Controls.Clear();
            flowVagon4.Controls.Clear();
            flowVagon5.Controls.Clear();
            Tren tren = HelperTren.GetTrenByName(dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[4].Value.ToString());
            List<Koltuk> koltuklar = HelperKoltuk.GetListKoltuk();
            List<Koltuk> koltuklarByTrenID = new List<Koltuk>();
            foreach (var item in koltuklar)
            {
                if (tren.TrenID == item.TrenID)
                {
                    koltuklarByTrenID.Add(item);
                }
            }

            for (int i = 0; i <= 19; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon1.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon1.Controls.Add(b);
                }
            }
            for (int i = 20; i <= 39; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon2.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon2.Controls.Add(b);
                }
            }
            for (int i = 40; i <= 59; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon3.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon3.Controls.Add(b);
                }
            }
            for (int i = 60; i <= 79; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon4.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon4.Controls.Add(b);
                }
            }
            for (int i = 80; i <= 99; i++)
            {
                Button b = new Button();
                if (koltuklarByTrenID[i].durum == false)
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Red;
                    b.Enabled = false;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon5.Controls.Add(b);
                }
                else
                {
                    b.Text = (i + 1).ToString();
                    b.BackColor = Color.Green;
                    b.Size = new Size(80, 40);
                    b.Click += b_Click;
                    flowVagon5.Controls.Add(b);
                }
            }
            label3.Text = dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[4].Value.ToString();
        }





        private void button1_Click(object sender, EventArgs e)
        {
            flowVagon1.Visible = true;
            flowVagon2.Visible = false;
            flowVagon3.Visible = false;
            flowVagon4.Visible = false;
            flowVagon5.Visible = false;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            flowVagon1.Visible = false;
            flowVagon2.Visible = true;
            flowVagon3.Visible = false;
            flowVagon4.Visible = false;
            flowVagon5.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            flowVagon1.Visible = false;
            flowVagon2.Visible = false;
            flowVagon3.Visible = true;
            flowVagon4.Visible = false;
            flowVagon5.Visible = false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            flowVagon1.Visible = false;
            flowVagon2.Visible = false;
            flowVagon3.Visible = false;
            flowVagon4.Visible = true;
            flowVagon5.Visible = false;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            flowVagon1.Visible = false;
            flowVagon2.Visible = false;
            flowVagon3.Visible = false;
            flowVagon4.Visible = false;
            flowVagon5.Visible = true;
        }



        private void button7_Click_1(object sender, EventArgs e)
        {
            var f1 = MessageBox.Show("Bu kaydı silmek istediginize emin misiniz?", "Bilgilendirme", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (f1 == DialogResult.Yes)
            {
                var c = HelperKoltuk.GetKoltukByID(Convert.ToInt32(dataIptalList.Rows[dataIptalList.CurrentRow.Index].Cells[0].Value));
                c.durum = true;
                var sf = HelperKoltuk.Update(c);
                if (sf.Item2)
                {
                    MessageBox.Show("Biletiniz iptal edildi");
                }
                else
                {
                    MessageBox.Show("İptal işlemi gerçekleşmedi!");
                }
            }
            else
            {

            }

            İptalListesiDoldur();
            KoltuklarıListele();

        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 form1 = new Form1();
            form1.Show();
        }
    }
}



