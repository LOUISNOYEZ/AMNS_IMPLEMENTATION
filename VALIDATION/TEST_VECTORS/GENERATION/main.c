#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <gmp.h>
#include <openssl/bn.h>

#include "structs_data.h"
//#include "add_mult_poly.c"
#include "useful_functs.c"
#include "amns_init.c"

#define BILLION 1000000000L

void display_coeff(uint32_t* src, uint32_t size);

//~ Compilation command : gcc -Wall -O3 main.c -o main -lgmp -lcrypto
//~ Execution command : ./main

//~ Important : polynomials representations form is P(X) = a0 + ... + an.X^n = (a0, ..., an).

uint32_t V[8] = {0xC9BD1905, 0x15538399, 0x9C46C2C2, 0x95F2B761, 0xBCB223FE, 0xDC24A059, 0xD838091D, 0xD2253531};
uint32_t P[8] = {0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFE, 0xFFFFFC2F};

int main(void){

    uint32_t A[6];
    uint32_t B[6];
    time_t t = time(NULL);
    srand((unsigned) time(&t));
    for(int i=0;i<100;i++) {
        for (int j = 0; j < 6; j++) {
            if (j == 0) {
                A[j] = ((rand() << 16) ^ rand()) % P[0];
                B[j] = ((rand() << 16) ^ rand()) % P[0];
            } else {
                A[j] =  (rand() << 16) ^ rand() ;
                B[j] =  (rand() << 16) ^ rand();
            }
        }
        display_coeff(A, 6);
        display_coeff(B, 6);
    }
    return 0;
}

void display_coeff(uint32_t* src, uint32_t size)
{
    printf("{");
    for(int i=0;i<size-1;i++)
    {
        printf("0x%08x, ",src[i]);
    }
    printf("0x%08x},\n",src[size-1]);
}

void internal_reduction(int64_t *rop, int128 *op){

	uint64_t tmp_q[NB_COEFF];
	int128 tmp_zero[NB_COEFF];

	//~ computation of : op*neg_inv_ri_rep_coeff mod((X^n - c), mont_phi)
	tmp_q[0] = ((uint64_t)op[0] * 14404731248266644585UL) + ((((uint64_t)op[1] * 3286953480751773897UL) + ((uint64_t)op[2] * 5408557101331171271UL) + ((uint64_t)op[3] * 6945810801382881972UL)) * 5);
	tmp_q[1] = ((uint64_t)op[0] * 6945810801382881972UL) + ((uint64_t)op[1] * 14404731248266644585UL) + ((((uint64_t)op[2] * 3286953480751773897UL) + ((uint64_t)op[3] * 5408557101331171271UL)) * 5);
	tmp_q[2] = ((uint64_t)op[0] * 5408557101331171271UL) + ((uint64_t)op[1] * 6945810801382881972UL) + ((uint64_t)op[2] * 14404731248266644585UL) + ((uint64_t)op[3] * 16434767403758869485UL);
	tmp_q[3] = ((uint64_t)op[0] * 3286953480751773897UL) + ((uint64_t)op[1] * 5408557101331171271UL) + ((uint64_t)op[2] * 6945810801382881972UL) + ((uint64_t)op[3] * 14404731248266644585UL);

	//~ computation of : tmp_q*red_int_coeff mod(X^n - c)
	tmp_zero[0] = ((int128)tmp_q[0] * 128659502648371L) + ((((int128)tmp_q[1] * 95477151974086L) + ((int128)tmp_q[2] * 95597758307649L) + ((int128)tmp_q[3] * 99992787138717L)) * 5);
	tmp_zero[1] = ((int128)tmp_q[0] * 99992787138717L) + ((int128)tmp_q[1] * 128659502648371L) + ((((int128)tmp_q[2] * 95477151974086L) + ((int128)tmp_q[3] * 95597758307649L)) * 5);
	tmp_zero[2] = ((int128)tmp_q[0] * 95597758307649L) + ((int128)tmp_q[1] * 99992787138717L) + ((int128)tmp_q[2] * 128659502648371L) + ((int128)tmp_q[3] * 477385759870430L);
	tmp_zero[3] = ((int128)tmp_q[0] * 95477151974086L) + ((int128)tmp_q[1] * 95597758307649L) + ((int128)tmp_q[2] * 99992787138717L) + ((int128)tmp_q[3] * 128659502648371L);

	//~ computation of : (op + tmp_zero)/mont_phi
	rop[0] = (op[0] + tmp_zero[0]) >> WORD_SIZE;
	rop[1] = (op[1] + tmp_zero[1]) >> WORD_SIZE;
	rop[2] = (op[2] + tmp_zero[2]) >> WORD_SIZE;
	rop[3] = (op[3] + tmp_zero[3]) >> WORD_SIZE;
}