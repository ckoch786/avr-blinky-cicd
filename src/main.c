#define F_CPU 16000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <stdint.h>

#define LED PB5
#define DELAY_MS 50

int main(void) {
	DDRB |= (1<< LED);
	

	while(1) {
		PORTB |= (1 << LED);
		_delay_ms(DELAY_MS);
		PORTB &= ~(1 << LED);
		_delay_ms(DELAY_MS);
	}

	return 0;
}


