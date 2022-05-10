import spidev
import time
import os
 
# Open SPI bus
spi = spidev.SpiDev()
spi.open(0,0)
 
# Function to read SPI data from MCP3008 chip
# Channel must be an integer 0-7
def ReadChannel(channel):
  adc = spi.xfer2([1,(8+channel)<<4,0])
  data = ((adc[1]&3) << 8) + adc[2]
  return data
 
# Function to convert data to voltage level,
# rounded to specified number of decimal places.
def ConvertVolts(data,places):
  volts = (data * 3.3) / float(1023)
  volts = round(volts,places)
  return volts
 
# Define sensor channels
input1 = 0
input2  = 1
 
# Define delay between readings
delay = 5
 
while True:
 
  # Read input1 data
  input1_level = ReadChannel(input1)
  input1_volts = ConvertVolts(input1_level,2)
 
  # Read input2 data
  input2_level = ReadChannel(input2)
  input2_volts = ConvertVolts(input2_level,2)
 
  # Print out results
  print "--------------------------------------------"
  print("input1: {} ({}V)".format(input1_level,input1_volts))
  print("input2: {} ({}V)".format(input2_level,input2_volts))
 
  # Wait before repeating loop
  time.sleep(delay)
  
  ###################################################lm358n###################################################
  #include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include "gb_common.h"
#include "gb_spi.h"

// For A to D we only need the SPI bus and SPI chip select A
void setup_gpio()
{
   INP_GPIO(8);  SET_GPIO_ALT(8,0);
   INP_GPIO(9);  SET_GPIO_ALT(9,0);
   INP_GPIO(10); SET_GPIO_ALT(10,0);
   INP_GPIO(11); SET_GPIO_ALT(11,0);
} // setup_gpio

// Catch ctrl-c to kill program but run restore_io() first
void int_handler(int sig) {
  restore_io;
  printf("Restore IO\n");
  exit(0);
}

//
//  Read TMP036 temperature via ADC input 0 
//
int main(int argc, char* argv[])
{
  int r, v;
  int chan = -1;
  int delay = 1000000;
  double vref = 3.3;
  double temp = 0.0;
  double volts = 0.0;

  signal(SIGINT, int_handler); // Handler for ctrl-C
  
  if (argc < 2 || argc > 4) {
    printf("usage: tmp036 channel [delay] [Vcc]\n");
    exit(-1);
  }

  chan = atoi(argv[1]);
  printf("Channel = %d\n", chan);

  if (chan < 0 || chan > 1) {
    printf("Channel must be 0 or 1\n");
    exit(1);
  }

  if (argc > 2) {
    delay = 1000000.0 * atof(argv[2]);
  }

  printf("Delay = %fs\n", (double)delay / 1000000.0);

  if (argc > 3) {
    vref = atof(argv[3]);
  }

  printf("Vref = %f\n", vref);

  // Map the I/O sections
  printf("Setup IO\n");
  setup_io();

  // activate SPI bus pins
  printf("Setup GPIO\n");
  setup_gpio();

  // Setup SPI bus
  printf("Setup SPI\n");
  setup_spi();

  for (;1;)
  {
    v = read_adc(chan);

    volts = (vref * (double)v / 1023.0) * 1000.0;
    temp = ((vref * (double)v / 1023.0) - 0.5) * 100.0;  // TMP036 has 500mV offset

    printf("%04d\t", v);
    printf("%4.2f mV\t", volts);
    printf("%4.2f C", temp);
    printf("\n");
    fflush(stdout);
 
    usleep(delay);
  } // repeated read

  printf("\n");
  restore_io();
} // main