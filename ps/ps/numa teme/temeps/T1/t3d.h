// Matrici imagine
extern	short			**r;
extern	short			**g;
extern	short			**b;	

// Dimensiune imagine
extern	unsigned short	dx;
extern	unsigned short	dy;

// Proceduri decompresie aritmetica
extern	char citeste_bit(void);
extern	void start_decompresie(void);
extern	char decomprima_bit(int context);
