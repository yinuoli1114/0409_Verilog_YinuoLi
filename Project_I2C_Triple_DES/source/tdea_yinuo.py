#!/usr/bin/env python
#***********************************************************************************************************************************************************************#
#	DES Verification System																		#
#	Supports:	1. Single DES Encryption (se)															#
#			2. Single DES Decryption (sd)															#
#			3. Triple DES Encryption (te)															#
#			4. Triple DES Decryption (td)															#
#			5. Detailed Output of Single DES Encryption (alle)												#
#			6. Detailed Output of Single DES Decryption (alld)												#
#			7. Expansion Output Testing (exp)														#
#			8. Substitution Output Testing (sub)														#
#			9. Permutation Output Testing (perm)														#
#			10. Round Key Verification (rkey)														#
#																					#
#	Usage:	./tdea.py																		#
#	In DES mode: use above index to indicate which mode to use, eg. SE = Single DES Encryption Mode									#
#***********************************************************************************************************************************************************************#
import sys, os

## Pre-determined tables for each step ##
##Expansion permutation array##
exp_perm = [31,0,1,2,3,4,3,4,5,6,7,8,7,8,9,10,11,12,11,12,13,14,15,16,15,16,17,18,19,20,19,20,21,22,23,24,23,24,25,26,27,28,27,28,29,30,31,0]

##Substitution boxes##
sbox1 =	[[14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7],[0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8],[4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0],[15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13]]
sbox2 = [[15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10],[3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5],[0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15],[13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9]]
sbox3 = [[10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8],[13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1],[13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7],[1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12]]
sbox4 = [[7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15],[13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9],[10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4],[3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14]]
sbox5 = [[2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9],[14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6],[4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14],[11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3]]
sbox6 = [[12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11],[10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8],[9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6],[4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13]]
sbox7 = [[4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1],[13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6],[1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2],[6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12]]
sbox8 = [[13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7],[1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2],[7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8],[2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11]]
##P-box permutation##
pbox = [15,6,19,20,28,11,27,16,0,14,22,25,4,17,30,9,1,7,23,13,31,26,2,8,18,12,29,5,21,10,3,24]

##Round key rotation units##
rkey = [1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1]

##round key permutation choice 1##
perm_key1 = [56,48,40,32,24,16,8,0,57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,60,52,44,36,28,20,12,4,27,19,11,3]

##round key permutation choice 2##
perm_key2 = [13,16,10,23,0,4,2,27,14,5,20,9,22,18,11,3,25,7,15,6,26,19,12,1,40,51,30,36,46,54,29,39,50,44,32,47,43,48,38,55,33,52,45,41,49,35,28,31]

## Function calls for each step ##
## Expansion step ##
def expand(inputData):
	#print " Input:\t%s %s %s %s %s %s %s %s" % (inputData[0:4],inputData[4:8],inputData[8:12],inputData[12:16],inputData[16:20],inputData[20:24],inputData[24:28],inputData[28:32])
	outData = ''
	for i in range(0,48):
		outData += inputData[exp_perm[i]]
	#print " Output:%s %s %s %s %s %s %s %s" % (outData[0:6],outData[6:12],outData[12:18],outData[18:24],outData[24:30],outData[30:36],outData[36:42],outData[42:48])
	return outData

## Key generation ##
def keyGen(key):
	roundKey = []
	key = toBinary(key)
	#print "%s %s %s %s %s %s %s %s" % (key[0:8],key[8:16],key[16:24],key[24:32],key[32:40],key[40:48],key[48:56],key[56:64])
	#if(key == "0011101100111000100110000011011100010101001000001111011101011110"):
	#	print "true"
	outKey = ''
	for i in range(55,-1,-1):
		outKey += key[63-perm_key1[i]]
	rightKey = outKey[28:56]
	leftKey = outKey[0:28]
	for i in range(0,16):
		newRight = rightKey[rkey[i]:]
		newRight += rightKey[0:rkey[i]]
		rightKey = newRight
		newLeft = leftKey[rkey[i]:]
		newLeft += leftKey[0:rkey[i]]
		leftKey = newLeft
		inkey = leftKey+rightKey
		keyPerm = ''
		for j in range(47,-1,-1):
			keyPerm += inkey[55-perm_key2[j]]
		roundKey.append(keyPerm)
	return roundKey
	
## XOR with key ##
def keyXor(key,data):
	outData = ''
	for i in range(0,48):
		if(key[i] != data[i]):
			outData += '1'
		else:
			outData += '0'
	return outData
		
## Substitution ##
def substitute(data):
	dataBlock1 = data[0:6]
	dataBlock2 = data[6:12]
	dataBlock3 = data[12:18]
	dataBlock4 = data[18:24]
	dataBlock5 = data[24:30]
	dataBlock6 = data[30:36]
	dataBlock7 = data[36:42]
	dataBlock8 = data[42:48]
	outData1 = bin(sbox1[int(dataBlock1[0]+dataBlock1[5],2)][int(dataBlock1[1:5],2)])[2:].zfill(4)
	outData2 = bin(sbox2[int(dataBlock2[0]+dataBlock2[5],2)][int(dataBlock2[1:5],2)])[2:].zfill(4)
	outData3 = bin(sbox3[int(dataBlock3[0]+dataBlock3[5],2)][int(dataBlock3[1:5],2)])[2:].zfill(4)
	outData4 = bin(sbox4[int(dataBlock4[0]+dataBlock4[5],2)][int(dataBlock4[1:5],2)])[2:].zfill(4)
	outData5 = bin(sbox5[int(dataBlock5[0]+dataBlock5[5],2)][int(dataBlock5[1:5],2)])[2:].zfill(4)
	outData6 = bin(sbox6[int(dataBlock6[0]+dataBlock6[5],2)][int(dataBlock6[1:5],2)])[2:].zfill(4)
	outData7 = bin(sbox7[int(dataBlock7[0]+dataBlock7[5],2)][int(dataBlock7[1:5],2)])[2:].zfill(4)
	outData8 = bin(sbox8[int(dataBlock8[0]+dataBlock8[5],2)][int(dataBlock8[1:5],2)])[2:].zfill(4)
	outData = outData1+outData2+outData3+outData4+outData5+outData6+outData7+outData8
	return outData

## Permutation ##
def dataPerm(data):
	outData =''
	for i in range(31,-1,-1):
		outData += data[pbox[i]]
	return outData
## Xor with left block ##
def dataXor(left,right):
	outData = ''
	for i in range(31,-1,-1):
		if(left[i]!=right[i]):
			outData += '1'
		else: 
			outData += '0'
	return outData
## Change to binary ##
def toBinary(inputData):
	binData = bin(int(inputData,16))[2:].zfill(64)
	return binData

## Change to Hex ##
def toHex(inputData):
	hexData = hex(int(inputData,2))
	return hexData

## Header I/O ##
def header(desmode,r,inputmsg,key):
	if(desMode == "se"):
		print "\n Single DES Encryption Mode(%d)" % r
	if(desMode == "sd"):
		print "\n Single DES Decryption Mode(%d)" % r
	if(desMode == "te"):
		print "\n Triple DES Encryption Mode(%d)" % r
	if(desMode == "td"):
		print "\n Triple DES Decryption Mode(%d)" % r
	if(desMode == "alle"):
		print "\n Detailed Single DES Encryption Output"
	if(desMode == "alld"):
		print "\n Detailed Single DES Decryption Output"
	if(desMode == "exp"):
		print "\n Expansion Block Testing"
	if(desMode == "sub"):
		print "\n Substitution Block Testing"
	if(desMode == "perm"):
		print "\n Permutation Block Testing"
	if(desMode == "rkey"):
		print "\n Round Key Verification" 
	print " Input Message:\t0x" + inputmsg
	print " Key:\t\t0x" + key
	print "================================================================================================"


## General System dump ##
def outputMessage(exp, keyxor, sub, perm, dataxor, outputmsg ):
	print " Expansion:\t%s\n %s %s %s %s %s %s %s %s" % (toHex(exp),exp[0:6],exp[6:12],exp[12:18],exp[18:24],exp[24:30],exp[30:36],exp[36:42],exp[42:48])
	print " Key Xor:\t%s\n %s %s %s %s %s %s %s %s" % (toHex(keyxor),keyxor[0:6],keyxor[6:12],keyxor[12:18],keyxor[18:24],keyxor[24:30],keyxor[30:36],keyxor[36:42],keyxor[42:48])
	print " Sub:\t\t%s\n %s %s %s %s %s %s %s %s" % (toHex(sub),sub[0:4], sub[4:8], sub[8:12], sub[12:16], sub[16:20], sub[20:24], sub[24:28], sub[28:32])
	print " Perm: \t\t%s\n %s %s %s %s %s %s %s %s" % (toHex(perm),perm[0:4], perm[4:8], perm[8:12], perm[12:16], perm[16:20], perm[20:24], perm[24:28], perm[28:32])
	print " Xor Left:\t%s\n %s %s %s %s %s %s %s %s" % (toHex(dataxor), dataxor[0:4],dataxor[4:8],dataxor[8:12],dataxor[12:16],dataxor[16:20],dataxor[20:24],dataxor[24:28],dataxor[28:32])
	print " \nOutput Message:" + outputmsg

## Detailed System dump ##
def outputDetail(r,exp, keyxor, sub, perm, dataxor, outputmsg):
	print " Round #%d: " % r
	print " Expansion in Hex:\t%s " % toHex(exp).zfill(12)
	print " Expansion in Binary:\t%s %s %s %s %s %s %s %s\n" % (exp[0:6],exp[6:12],exp[12:18],exp[18:24],exp[24:30],exp[30:36],exp[36:42],exp[42:48])
	print " Key XOR in Hex:\t%s " % toHex(keyxor)
	print " Key XOR in Binary:\t%s %s %s %s %s %s %s %s\n" % (keyxor[0:6],keyxor[6:12],keyxor[12:18],keyxor[18:24],keyxor[24:30],keyxor[30:36],keyxor[36:42],keyxor[42:48])
	print " Substitution in Hex:\t%s " % toHex(sub)
	print " Substitution in Binary:%s %s %s %s %s %s %s %s\n" % (sub[0:4],sub[4:8],sub[8:12],sub[12:16],sub[16:20],sub[20:24],sub[24:28],sub[28:32])
	print " Permutation in Hex: \t%s " % toHex(perm)
	print " Permutation in Binary: %s %s %s %s %s %s %s %s\n" % (perm[0:4],perm[4:8],perm[8:12],perm[12:16],perm[16:20],perm[20:24],perm[24:28],perm[28:32])
	print " Data XOR in Hex:\t%s " % toHex(dataxor)
	print " Data XOR in Binary:\t%s %s %s %s %s %s %s %s\n" % (dataxor[0:4], dataxor[4:8], dataxor[8:12], dataxor[12:16], dataxor[16:20], dataxor[20:24], dataxor[24:28], dataxor[28:32])
	print " Output in Hex:\t\t%s " % toHex(outputmsg)
	print " OUtput in Binary:\t%s %s %s %s %s %s %s %s" % (outputmsg[0:8], outputmsg[8:16], outputmsg[16:24], outputmsg[24:32], outputmsg[32:40], outputmsg[40:48], outputmsg[48:56], outputmsg[56:64])
	print "================================================================================================"

## Main Function ##

#inputBlock = raw_input("Input data to be process: ")
#inputKey = raw_input("Input key: ")
#if(len(inputKey) != 16):
#	print "Error! Key needs to be 64-bits in form of Hexadecimal"
#	sys.exit(1)
#desMode = raw_input("Input DES mode: ")
#if(desMode != "alle" or desMode != "alld"):
#	desRound = int(raw_input("Input DES round: "))
desMode = "sub"
desRound = 1
inputBlock = "0123456789abcdef"
inputKey = "3b3898371520f75e"

data = toBinary(inputBlock)
left = data[0:32]
right = data[32:64]
roundKey = []
roundKey = keyGen(inputKey)
header(desMode,desRound,inputBlock,inputKey);
if(desMode == "se"):
	for se in range(0,desRound):
		expandData = expand(right)
		keyXdata = keyXor(roundKey[se],expandData)
		subData = substitute(keyXdata)
		permData = dataPerm(subData)
		dataXdata = dataXor(left,permData)
		left = right
		right = dataXdata
	outData = right+left
	outputMessage(expandData, keyXdata, subData, permData, dataXdata, toHex(outData))

if(desMode == "sd"):
	for sd in range(desRound-1,-1,-1):
		expandData = expand(right)
		keyXdata = keyXor(roundKey[sd],expandData)
		subData = substitute(keyXdata)
		permData = dataPerm(subData)
		dataXdata = dataXor(left,permData)
		left = right
		right = dataXdata
	outData = right+left
	outputMessage(expandData, keyXdata, subData, permData, dataXdata, toHex(outData))

#if(desMode == "te"):

#if(desMode == "td"):

if(desMode == "alle"):	
	for ae in range(0,16):
		expandData = expand(right)
		keyXdata = keyXor(roundKey[ae],expandData)
		subData = substitute(keyXdata)
		permData = dataPerm(subData)
		dataXdata = dataXor(left,permData)
		left = right
		right = dataXdata
		outputDetail(ae, expandData, keyXdata, subData, permData, dataXdata, left+right)
	outData = right+left
	print " Output in Hex:\t\t%s " % toHex(outData)
	print " OUtput in Binary:\t%s %s %s %s %s %s %s %s" % (outData[0:8], outData[8:16], outData[16:24], outData[24:32], outData[32:40], outData[40:48], outData[48:56], outData[56:64])

if(desMode == "alld"):	
	for ae in range(15,-1,-1):
		expandData = expand(right)
		keyXdata = keyXor(roundKey[ae],expandData)
		subData = substitute(keyXdata)
		permData = dataPerm(subData)
		dataXdata = dataXor(left,permData)
		left = right
		right = dataXdata
		outputDetail(ae, expandData, keyXdata, subData, permData, dataXdata, left+right)
	outData = right+left
	print " Output in Hex:\t\t%s " % toHex(outData)
	print " OUtput in Binary:\t%s %s %s %s %s %s %s %s" % (outData[0:8], outData[8:16], outData[16:24], outData[24:32], outData[32:40], outData[40:48], outData[48:56], outData[56:64])

if(desMode == "exp"):
	exp = expand(right)
	print " Expansion in Hex:\t%s " % toHex(exp).zfill(12)
	print " Expansion in Binary:\t%s %s %s %s %s %s %s %s\n" % (exp[0:6],exp[6:12],exp[12:18],exp[18:24],exp[24:30],exp[30:36],exp[36:42],exp[42:48])	
	
if(desMode == "sub"):
	exp = expand(right)
	keyXdata = keyXor(roundKey[0],exp)
	print toHex(keyXdata)
	sub = substitute(keyXdata)
	print " Substitution in Hex:\t%s " % toHex(sub)
	print " Substitution in Binary:%s %s %s %s %s %s %s %s" % (sub[0:4],sub[4:8],sub[8:12],sub[12:16],sub[16:20],sub[20:24],sub[24:28],sub[28:32])

if(desMode == "perm"):
	if(len(inputBlock) != 16):
		print "Error! Input needs to be 32-bits in form of Hexadecimal"
		sys.exit(1)
	pout = dataPerm(right)
	perm = dataXor(left,pout)
	print " Permutation in Hex: \t%s " % toHex(perm)
	print " Permutation in Binary: %s %s %s %s %s %s %s %s\n" % (perm[0:4],perm[4:8],perm[8:12],perm[12:16],perm[16:20],perm[20:24],perm[24:28],perm[28:32])

if(desMode == "rkey"):
	for rk in range(0,16):
		print "Round %d:\t%s" % (rk+1,toHex(roundKey[rk]))
		print "%s %s %s %s %s %s" % (roundKey[rk][0:8],roundKey[rk][8:16],roundKey[rk][16:24],roundKey[rk][24:32],roundKey[rk][32:40],roundKey[rk][40:48])

sys.exit(0)
