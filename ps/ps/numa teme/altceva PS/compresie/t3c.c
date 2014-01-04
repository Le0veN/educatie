#include <stdio.h>
#include <stdlib.h>

extern	void comprima(void);
extern	void descarca_biti(void);

// Structura de date de tip RGB utilizata pentru citirea
//  din fisierul bitmap
typedef	struct{	unsigned char	b,g,r;}rgb;

// Matrici imagine pentru componentele
//  r - rosu
//  g - verde
//  b - albastru
short				**r;
short				**g;
short				**b;

// Dimensiunile imaginii (multiple de 8)
unsigned short		dx,dy;

// Fisier destinatie
FILE				*fd;

int main(void)
{
	char			baza[32];
	char			nume[32];
	int				i;
	FILE			*fs;
	unsigned char	antet[54];
	unsigned short	dxi,dyi,nl,x,y;
	rgb				*t;

	// Citeste de la tastatura numele fisierului
	printf("Nume fisier [.bmp]: ");
	scanf("%s",baza);

	// Genereaza numele fisierului sursa prin completarea
	//  extensiei implicite [.bmp]
	i=-1;
	while(baza[++i]!=0) nume[i]=baza[i];
	nume[i++]='.';
	nume[i++]='b';
	nume[i++]='m';
	nume[i++]='p';
	nume[i]=0;

	// Deschide fisierul sursa
	if(NULL==(fs=fopen(nume,"rb"))){
		printf("Eroare la deschiderea fisierului <%s> !\n",nume);
		return 1;
		}

	// Citeste antetul fisierului sursa
	fread(antet,1,54,fs);

	// Extrage dimensiunile imaginii
	dxi=*((unsigned short *)(antet+18));
	dyi=*((unsigned short *)(antet+22));

	// Calculeaza dimensiunea unei linii din fisierul bitmap
	nl=4*((3*dxi+3)/4);

	// Calculeaza dimensiunile prin extindere la cel mai apropiat
	//  intreg multilu de 8
	dx=8*((dxi+7)/8);
	dy=8*((dyi+7)/8);
	printf("Dx: %u -> %u , Dy: %u -> %u  (nl: %u)\n",dxi,dx,dyi,dy,nl);
	
	// Genereaza numele fisierului destinatie prin completarea
	//  extensiei implicite [.img]
	i=-1;
	while(baza[++i]!=0) nume[i]=baza[i];
	nume[i++]='.';
	nume[i++]='i';
	nume[i++]='m';
	nume[i++]='g';
	nume[i]=0;

	// Deschide fisierul destinatie
	if(NULL==(fd=fopen(nume,"wb"))){
		printf("Eroare la deschiderea fisierului <%s> !\n",nume);
		return 1;
		}

	// Scrie antetul in fisierul destinatie
	fwrite(antet,1,54,fd);
	
	// Aloca memorie pentru vectorii cu pointeti catre liniile
	//  matricilor r,g si b
	r=(short **)malloc(dy*sizeof(short *));
	if(r==NULL){
		printf("Memorie insuficienta !\n");
		return;
		}
	g=(short **)malloc(dy*sizeof(short *));
	if(g==NULL){
		printf("Memorie insuficienta !\n");
		return;
		}
	b=(short **)malloc(dy*sizeof(short *));
	if(b==NULL){
		printf("Memorie insuficienta !\n");
		return 1;
		}

	// Aloca memorie pentru vectorul temporar in care se va citi
	//  cite o linie din fisierul bitmap
	t=(rgb *)malloc(nl);
	if(t==NULL){
		printf("Memorie insuficienta !\n");
		return 1;
		}
	
	// Citeste liniile din fisierul sursa
	for(y=0;y<dyi;y++){
		// Citeste o linie din fisierul sursa
		fread((unsigned char *)t,1,nl,fs);

		// Aloca memorie pentru o linie noua in matricile r,g si b
		r[y]=(short *)malloc(dx*sizeof(short));
		if(r[y]==NULL){
			printf("Memorie insuficienta !\n");
			return 1;
			}
		g[y]=(short *)malloc(dx*sizeof(short));
		if(g[y]==NULL){
			printf("Memorie insuficienta !\n");
			return 1;
			}
		b[y]=(short *)malloc(dx*sizeof(short));
		if(b[y]==NULL){
			printf("Memorie insuficienta !\n");
			return 1;
			}

		// Copiaza pixelii din linie in matrici
		for(x=0;x<dxi;x++){
			r[y][x]=t[x].r-128;
			g[y][x]=t[x].g-128;
			b[y][x]=t[x].b-128;
			}

		// Extinde pixelii din linie pina la dimensiunea multipla de 8
		//  prin copierea ultiului pixel
		for(x=dxi;x<dx;x++){
			r[y][x]=r[y][dxi-1];
			g[y][x]=g[y][dxi-1];
			b[y][x]=b[y][dxi-1];
			}
		}

	// Extinde liniile pina la dimensiunea multipla de 8 prin 
	//  repetarea ultimei linii existente in imagine
	for(y=dyi;y<dy;y++){
		// Aloca memorie pentru o linie noua in matricile r,g si b
		r[y]=(short *)malloc(dx*sizeof(short));
		if(r[y]==NULL){
			printf("Memorie insuficienta !\n");
			return 1;
			}
		g[y]=(short *)malloc(dx*sizeof(short));
		if(g[y]==NULL){
			printf("Memorie insuficienta !\n");
			return 1;
			}
		b[y]=(short *)malloc(dx*sizeof(short));
		if(b[y]==NULL){
			printf("Memorie insuficienta !\n");
			return 1;
			}

		// Copiaza ultima linie din imagine pe linia curenta
		for(x=0;x<dx;x++){
			r[y][x]=r[dyi-1][x];
			g[y][x]=g[dyi-1][x];
			b[y][x]=b[dyi-1][x];
			}
		}

	// ********** Procedura de compresie **********
	comprima();
}
