import socket
import threading
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend

# Establecer conexión con el servidor
server_address = ('10.0.0.2', 12345)
socket_cliente = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket_cliente.connect(server_address)

# Inicializar 'key' como None y definir 'nonce' estático
key = None
nonce = b'0123456789ABCDEF'

# Recibir la clave del servidor
def recibir_clave(sock):
	global key
	key = sock.recv(1024)

# Recibir la clave antes de continuar
recibir_clave(socket_cliente)

def encrip(mensaje):
    if key is None:
        raise ValueError("La clave de cifrado no está definida.")
    cipher = Cipher(algorithms.AES(key), modes.CTR(nonce), backend=default_backend())
    encryptor = cipher.encryptor()
    return encryptor.update(mensaje.encode('utf-8')) + encryptor.finalize()

def desencrip(mensaje):
    if key is None:
        raise ValueError("La clave de cifrado no está definida.")
    cipher = Cipher(algorithms.AES(key), modes.CTR(nonce), backend=default_backend())
    decryptor = cipher.decryptor()
    decrypted_message = decryptor.update(mensaje) + decryptor.finalize()
    return decrypted_message.decode('utf-8')


def recibir_mensajes(sock,ID_cliente,Mensaje):
	while True:
		try:
			raw_longitud_mensaje = sock.recv(4)
			if not raw_longitud_mensaje:
				print("\nConexión cerrada por el servidor.")
				break
			longitud_mensaje = int.from_bytes(raw_longitud_mensaje, byteorder='big')
			datos_cifrados = b''
			while len(datos_cifrados) < longitud_mensaje:
				datos_cifrados += sock.recv(longitud_mensaje - len(datos_cifrados))
			mensaje = desencrip(datos_cifrados)
			# Eliminar saltos de línea y espacios extras al principio y final del mensaje
			mensaje = mensaje.strip()
			# Decidir cómo mostrar el mensaje
			if mensaje.startswith("ID:"):
				print(f"\nTu ID de cliente es: {mensaje[3:]}")
			elif mensaje.startswith("LISTA:"):
				print(f"\nClientes conectados: {mensaje[6:]}")
			else:
				print(f"\nMensaje recibido: {mensaje}")
		except Exception as e:
			print(f"\nError al recibir mensaje: {e}")

def enviar_mensaje(mensaje):
	mensaje_cifrado = encrip(mensaje)
	socket_cliente.sendall(mensaje_cifrado)

global ID_cliente 
ID_cliente = ''
global Mensaje 
Mensaje =  ''
# Iniciar hilo para recibir mensajes
hilo_recepcion = threading.Thread(target=recibir_mensajes, args=(socket_cliente, ID_cliente,Mensaje))
hilo_recepcion.start()

# Bucle para enviar mensajes
try:
	while True:
		ID_cliente = input("\nID del cliente destino : ")
		Mensaje = input('\nMensaje a enviar: ')
		mensaje_completo = f"{ID_cliente}:{Mensaje}"
		enviar_mensaje(mensaje_completo)
		if Mensaje.lower() == 'exit':
			break
finally:
	socket_cliente.close()
	hilo_recepcion.join()
