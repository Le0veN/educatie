using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using SoftwareFX.ChartFX.Lite;

namespace api
{
    public partial class main : Form
    {
        int[][] mi = new int[15][];
        int[][] mideal = new int[15][];
        int[][][] arr = new int[20][][];
        bool[] hasArray = new bool[20];
        int aria = 0;

        int x = 0;
        int y = 0;

        imagine frmImagine = new imagine();
        histograma frmHistograma = new histograma();
        public main()
        {
            InitializeComponent();
            
        }

        private void main_Load(object sender, EventArgs e)
        {
            mi = global.readImageFromFile("imagine.txt");
            mideal = global.readImageFromFile("ideal.txt");
            
            frmImagine.Show();
            frmImagine.Focus();
            frmImagine.umpleMatrice(mi, true);
            frmHistograma.Show();

            arr[0] = mi;
            hasArray[0] = true;
        }

        private void despreToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Program realizat de George Enciu, 345AA", "Despre");
            
        }

        private void incarcareToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        

        private void button1_Click(object sender, EventArgs e)
        {
            if (hasArray[0])
            {
                arr[1] = filtre.fm1(arr[0]);
                frmImagine.umpleMatrice(arr[1], true);
                hasArray[1] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (hasArray[0])
            {
                arr[2] = filtre.fm2(arr[0]);
                frmImagine.umpleMatrice(arr[2], true);
                hasArray[2] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (hasArray[0])
            {
                arr[3] = filtre.fm3(arr[0]);
                frmImagine.umpleMatrice(arr[3], true);
                hasArray[3] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (hasArray[0])
            {
                arr[4] = filtre.vecinatatile5puncte(arr[0]);
                frmImagine.umpleMatrice(arr[4], true);
                MessageBox.Show("Cea de-a 2-a matrice", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

                arr[4] = filtre.vecinatatile5puncte(arr[4]);
                frmImagine.umpleMatrice(arr[4], true);
                hasArray[4] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (hasArray[0])
            {
                arr[5] = global.binarizareCuPrag(arr[0], 1);
                frmImagine.umpleMatrice(arr[5], true);
                hasArray[5] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (hasArray[5])
            {
                arr[6] = filtre.filtruNetezireLogica_1(arr[5]);
                
                arr[6] = filtre.filtruNetezireLogica_2(arr[6]);
                frmImagine.umpleMatrice(arr[6], true);
                hasArray[6] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (hasArray[1])
            {
                int[] histData = filtre.histogramaI1(arr[1]);
                frmHistograma.deseneaza(histData);

                arr[7] = global.binarizareCuPrag(arr[1], 4);
                frmImagine.umpleMatrice(arr[7], true);

                hasArray[7] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if (hasArray[2])
            {
                int[] histData = filtre.histogramaI1(arr[2]);
                frmHistograma.deseneaza(histData);

                arr[8] = global.binarizareCuPrag(arr[2], 5);
                frmImagine.umpleMatrice(arr[8], true);

                hasArray[8] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button9_Click(object sender, EventArgs e)
        {
            if (hasArray[3])
            {
                int[] histData = filtre.histogramaI1(arr[3]);
                frmHistograma.deseneaza(histData);

                arr[9] = global.binarizareCuPrag(arr[3], 5);
                frmImagine.umpleMatrice(arr[9], true);

                hasArray[9] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button10_Click(object sender, EventArgs e)
        {
            if (hasArray[4])
            {
                int[] histData = filtre.histogramaI1(arr[4]);
                frmHistograma.deseneaza(histData);

                arr[10] = global.binarizareCuPrag(arr[4], 1);
                frmImagine.umpleMatrice(arr[10], true);

                hasArray[10] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            if (hasArray[6] && hasArray[7] && hasArray[8] && hasArray[9] && hasArray[10])
            {
                int[][][] data = new int[5][][];
                data[0] = arr[6];
                data[1] = arr[7];
                data[2] = arr[8];
                data[3] = arr[9];
                data[4] = arr[10];
                int celMai = filtre.matriceaCeaMaiIdeala(mideal, data);
                celMai += 6;

                arr[11] = arr[celMai];
                MessageBox.Show("Imaginea gasita este I" + celMai.ToString(), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                frmImagine.umpleMatrice(arr[11], true);

                hasArray[11] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button12_Click(object sender, EventArgs e)
        {
            int[][] r1 = new int[15][];
            int[][] r2 = new int[15][];
            int[][] a = new int[15][];

            if (hasArray[4])
            {
                arr[12] = filtre.filtruRoberts2x2(arr[4], 3, ref r1, ref r2, ref a);
                frmImagine.umpleMatrice(r1, false);
                MessageBox.Show("Apasati OK", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                frmImagine.umpleMatrice(r2, false);
                MessageBox.Show("Apasati OK", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
                frmImagine.umpleMatrice(a, false);
                MessageBox.Show("Apasati OK", "", MessageBoxButtons.OK, MessageBoxIcon.Error);

                frmImagine.umpleMatrice(arr[12], true);

                hasArray[12] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button13_Click(object sender, EventArgs e)
        {
            if (hasArray[11])
            {
                arr[13] = filtre.conturVecintati(arr[11]);
                frmImagine.umpleMatrice(arr[13], true);

                hasArray[13] = true;
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button14_Click(object sender, EventArgs e)
        {
            if (hasArray[11])
            {
                int aria = filtre.aria(arr[11]);

                MessageBox.Show("Aria imaginii I11 este egala cu " + aria.ToString(), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button15_Click(object sender, EventArgs e)
        {
            if (hasArray[13])
            {
                int perim = filtre.aria(arr[13]);

                MessageBox.Show("Perimetrul imaginii I13 este egal cu " + perim.ToString(), "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button16_Click(object sender, EventArgs e)
        {
            if (hasArray[11])
            {
                int perim = 0;
                filtre.ariaSIperimetrul(arr[11], ref aria, ref perim);
                hasArray[16] = true;

                MessageBox.Show("Perimetrul imaginii I11 este egal cu" + perim.ToString() + " iar aria este egala cu" + aria.ToString(), "Cerinta 16", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button17_Click(object sender, EventArgs e)
        {
            if (hasArray[11] && hasArray[16])
            {

                filtre.centrulDeGreutate(arr[11], aria, ref x, ref y);

                MessageBox.Show("Centrul de greutatea al imaginii I11 este in punctul (" + x.ToString() + ", " + y.ToString() + ")", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button18_Click(object sender, EventArgs e)
        {
            if (hasArray[11])
            {
                double raza_min = 0;
                double raza_max = 0;
                double raza_med = 0;
                filtre.calculRaze(arr[11], x, y, ref raza_min, ref raza_max, ref raza_med);

                MessageBox.Show("Raza minima este egala cu " + raza_min.ToString("N2") + " , Raza maxima este egala cu " + raza_max.ToString("N2") + " , Raza medie este egala cu " + raza_med.ToString("N2") , "", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Eroare", "", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button19_Click(object sender, EventArgs e)
        {
            int parg = global.determinarePragOptim(arr[4], mideal);

            MessageBox.Show("aia optima: " + parg.ToString());
        }
    }
        
}