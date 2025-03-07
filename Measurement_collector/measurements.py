import Database
import Listening_socket

from P4.throughput import start_throughput_measurements_thread
from P4.rtt import start_rtt_measurements_thread
from P4.queue_delay import start_queue_delay_measurements_thread
from P4.retr import start_retr_measurements_thread
from P4.new_flow import start_new_flow_measurements_thread


class Measurements:
    def __init__(self,port=60001):
        self.N = 0

        # Initiate database instance
        try:
            self.DB = Database.database("10.0.0.1",11888)

            # Initiate the socket
            self.Socket = Listening_socket.Socket(port=port).get_Listener()
        
            # Start measurement collection
            if port == 60002:
                start_new_flow_measurements_thread(self)
            if port == 60003:
                start_rtt_measurements_thread(self)
            elif port == 60004:
                start_throughput_measurements_thread(self)
            elif port == 60005:
                start_queue_delay_measurements_thread(self)
            elif port == 60006:
                start_retr_measurements_thread(self)
        except:
            print("Cannot connect to logstash")

