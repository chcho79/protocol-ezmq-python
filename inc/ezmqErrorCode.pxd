'''
/*******************************************************************************
 * Copyright 2018 Samsung Electronics All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *******************************************************************************/

This is a cython header file written over EZMQErrorCode enum in ezmq cpp library.
'''

cdef extern from "EZMQErrorCodes.h" namespace "ezmq" :

	#This declaration is mapped to EZMQErrorCode enum in ezmq cpp library.
	ctypedef enum EZMQErrorCode "ezmq::EZMQErrorCode" :
		EZMQ_OK "ezmq::EZMQ_OK",
		EZMQ_ERROR "ezmq::EZMQ_ERROR",
		EZMQ_INVALID_TOPIC "ezmq::EZMQ_INVALID_TOPIC",
		EZMQ_INVALID_CONTENT_TYPE "ezmq::EZMQ_INVALID_CONTENT_TYPE"

	#This declaration is mapped to EZMQStatusCode enum in ezmq cpp library.
	ctypedef enum EZMQStatusCode:
		EZMQ_Unknown "ezmq::EZMQ_Unknown",
		EZMQ_Constructed "ezmq::EZMQ_Constructed",
		EZMQ_Initialized "ezmq::EZMQ_Initialized",
		EZMQ_Terminated "ezmq::EZMQ_Terminated"
