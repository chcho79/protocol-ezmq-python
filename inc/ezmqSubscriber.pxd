'''
Copyright 2018 Samsung Electronics All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License")

This is a cython header file written over EZMQSubscriber class in ezmq cpp library.
'''

from libcpp.list cimport list as clist
from libcpp.string cimport string
from cython.operator cimport dereference as deref
from ezmqErrorCode cimport  EZMQErrorCode
from ezmqMessage cimport EZMQMessage, EZMQContentType

#Callback declarations mapped to callbacks in EZMQSubscriber.
#Callbacks to get all the subscribed events.
ctypedef void (*EZMQSubCB)(const EZMQMessage &event)
#Callbacks to get all the subscribed events.
ctypedef void (*EZMQSubTopicCB)(string topic, EZMQMessage &event)

cdef extern from "EZMQSubscriber.h" namespace "ezmq" :
	#This class contains cython declarations mapped to EZMQSubscriber class in ezmq cpp library
        #It contains API declarations related to start, stop, subscribe APIs of EZMQ Subscriber.
	cdef cppclass EZMQSubscriber:

		#Declaration of Construtor for EZMQSubscriber class.
		#@param ip - ip to be used for subscriber socket.
		#@param port - Port to be used for subscriber socket.
		#@param subCallback- Subscriber callback to receive events.
		#@param topicCallback - Subscriber callback to receive events for a particular topic.
		EZMQSubscriber(string ip, int port, EZMQSubCB subCB, EZMQSubTopicCB subTopicCB)

		EZMQErrorCode setClientKeys(const string clientPrivateKey, const string clientPublicKey)
		EZMQErrorCode setServerPublicKey(const string key)
		
		#Declaration of start() API of EZMQSubscriber class.
		#@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode start()

		#Declaration of subscriber() API of EZMQSubscriber class.
		#Subscribe for event/messages.
		#@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode subscribe()

		#Declaration of subscriber() API of EZMQSubscriber class.
                #Subscribe for event/messages on a particular topic.
		#@param topic - Topic to be subscribed.
		#@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode subscribe(string topic)

		#Declaration of subscriber() API of EZMQSubscriber class.
		#Subscribe for event/messages on given list of topics.
		#@param topic - List of topics to be subscribed
		#@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode subscribe(clist[string] topic)

		#Declaration of subscriber() API of EZMQSubscriber class.
                #Subscribe for event/messages from given IP:Port on the given topic.
		#@param ip - Target[Publisher] IP address.
		#@param port - Target[Publisher] Port number.
		#@param topic - Topic to be subscribed.
		#@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.	
		EZMQErrorCode subscribe(const string &ip, const int &port, string &topic)
		
		#Declaration of unSubscriber() API of EZMQSubscriber class.
		#Un-subscribe all the events from publisher.
		#@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode unSubscribe()

		#Declaration of unSubscriber() API of EZMQSubscriber class.
                #Un-subscribe specific topic events.
		#@param topic - topic to be unsubscribed.
                #@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode unSubscribe(string topic)

		#Declaration of unSubscriber() API of EZMQSubscriber class.
                #Un-subscribe event/messages on given list of topics.
		#@param topic - List of topics to be unsubscribed
                #@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode unSubscribe(clist[string] topic)

		#Declaration of stop() API of EZMQSubscriber class.
                #@return EZMQErrorCode - EZMQ_OK on success, otherwise appropriate error code.
		EZMQErrorCode stop()

		#Declaration of getPort() API of EZMQSubscriber class.
                #@return port number as integer.		
		int getPort()

		#Declaration of getIp() API of EZMQSubscriber class.
		#@return IP address as String.
		string& getIp()
