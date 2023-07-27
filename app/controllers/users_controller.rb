require 'serialport'

class UsersController < ApplicationController
  before_action :connect_to_arduino, only: [:turn_on_led, :turn_off_led, :turn_on_led_pin11, :turn_off_led_pin11, :turn_on_led_pin13, :turn_off_led_pin13]
  after_action :close_arduino_connection, only: [:turn_on_led, :turn_off_led, :turn_on_led_pin11, :turn_off_led_pin11, :turn_on_led_pin13, :turn_off_led_pin13]
  helper_method :image_path_for_param
 

  def index

    @serial_param = session[:last_serial_param]
    session[:last_serial_param] = nil # Restablecer el último parámetro después de mostrarlo
  end

  def image_path_for_param(param)
    if param == 'encendido'
      view_context.image_path('encendido.jpg') #Devuelve la ruta de la imagen 'encendido.jpg' dentro de la carpeta de assets.
    elsif param == 'apagado'
      view_context.image_path('apagado.jpg')
    else
      view_context.image_path('default.jpg')# Devuelve la ruta de la imagen 'default.jpg' dentro de la carpeta de assets como ruta por defecto.
    end
  end
  

  def turn_on_led
    byte = 'a'
    send_serial_command(byte) # Enviar el byte para encender el LED del pin 12
    session[:last_serial_param] = byte # Almacenar el último parámetro recibido en la sesión
    redirect_to root_path
  end

  def turn_off_led
    byte = 'b'
    send_serial_command(byte) # Enviar el byte para apagar el LED del pin 12
    session[:last_serial_param] = byte # Almacenar el último parámetro recibido en la sesión
    redirect_to root_path
  end

  def turn_on_led_pin11
    byte = 'c'
    send_serial_command(byte) # Enviar el byte para encender el LED del pin 11
    session[:last_serial_param] = byte # Almacenar el último parámetro recibido en la sesión
    redirect_to root_path
  end

  def turn_off_led_pin11
    byte = 'd'
    send_serial_command(byte) # Enviar el byte para apagar el LED del pin 11
    session[:last_serial_param] = byte # Almacenar el último parámetro recibido en la sesión
    redirect_to root_path
  end

  def turn_on_led_pin13
    byte = 'e'
    send_serial_command(byte) # Enviar el byte para encender el LED del pin 13
    session[:last_serial_param] = byte # Almacenar el último parámetro recibido en la sesión
    redirect_to root_path
  end

  def turn_off_led_pin13
    byte = 'f'
    send_serial_command(byte) # Enviar el byte para apagar el LED del pin 13
    session[:last_serial_param] = byte # Almacenar el último parámetro recibido en la sesión
    redirect_to root_path
  end

  private

  def connect_to_arduino  # Método para conectar con Arduino a través del puerto serial.      
    port_str = 'COM3' # Puerto serie en tu sistema (puede variar)
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = 0 # Paridad desactivada

    if port_connected?(port_str)
      @arduino = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
      sleep(2) # Esperar 2 segundos para permitir que Arduino se inicie correctamente
    end
  end

  def send_serial_command(byte) # Método para enviar un byte de datos a Arduino a través del puerto serial.
    @arduino.write(byte) if @arduino
  end

  def close_arduino_connection # Método para cerrar la conexión con Arduino al finalizar la acción.
    @arduino.close if @arduino # Cerrar el puerto de serie al finalizar la acción
  end

  def port_connected?(port) # Método para verificar si el puerto está conectado.
    File.exist?(port) # Verificar si el puerto existe
  end
end
