pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
ballx = 64
bally = 64
ballsize = 3
ballxdir = 5
ballydir = 3
padx = 53
pady = 122
padw = 24
padh = 4
padx2	=	53
pady2	= 4
padw2	= 24
padh2 = 4
score = 0
lives = 1393
r = 0

function movepaddle()
	if btn(0) then
			padx -=3
	elseif btn(1) then
			padx += 3
	end
end

function movepaddle2()
	if btn(2) then
		padx2 -= 3
	elseif btn(3) then
		padx2 += 3
	end
end

function bounceball()
	if ballx < ballsize then
		ballxdir =- ballxdir
		sfx(0)
	end
	if ballx > 128 - ballsize then
		ballxdir =- ballxdir
		sfx(0)
	end
end

function bouncepaddle()
	if ballx >= padx and ballx <= padx + padw and bally > pady then
		sfx(0)
		ballydir =- ballydir
		score += 10
	end
end

function bouncepaddle2()
	if ballx >= padx2 and ballx <= padx2 + padw2 and bally < pady2+4 then
		sfx(0)
		ballydir =- ballydir
		score += 10
	end
end

function moveball()
	ballx += ballxdir/2
	bally += ballydir/2
end

function loseball()
	if bally < 0 then
		if lives > 0 then
			sfx(3)
			bally = 64
			lives -= 1
		end
		else if lives == 0 then
			ballydir = 0
			ballxdir = 0
			bally = 64
			sfx(5)
		end
	end
	if bally > 128 then
		if lives > 0 then
			sfx(3)
			bally = 24
			lives -= 1
		end
		else if lives == 0 then
			ballydir = 0
			ballxdir = 0
			bally = 64
			sfx(5)
		end
	end
end

function _update()
	bounceball()
	bouncepaddle()
	bouncepaddle2()
	movepaddle()
	movepaddle2()
	loseball()
	moveball()
end

function _draw()
	
	rectfill(0,0,128,128,3)
	print(score, 12,20,156)
	
	for i = 1, lives do
		spr(000,100,18)
	end
	
	print(lives,110,20,15)
	
	rectfill(padx2,pady2,padx2+padw2,pady2+padh2,15)
	
	rectfill(padx,pady,padx+padw,pady+padh,15)
	circfill(ballx,bally,ballsize, 15)	end
__gfx__
aaaaaaaa777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
aafffaaa777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
affffffa777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
f77ff77f777777707777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
f71ff17f777777707777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
ffffffff777077777777777777707777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
ff4444ff777077777777707777777770077077777700077777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
f44ff44f777077777777007777077700070007777007777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777077777777000777077707000707777000077777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777077777770000077077707707707777077777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777077777777070777077707777707777000007777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777700777077777777070777777777777707777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777770770077777777077777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777770000777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777700077777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777007700777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777770077770077777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777770777777077777777700777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777770777777077777700070000777777777770777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777707777777077777007777770077777777700777777707777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777707077700077770077777777007777777700077777707777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777707000007777770777777777707777777077077777077777777707777fffffff00000000000000000000000000000000000000000000000000000000
07777777707777777777770777777777707777770777077777077777770077777fffffff00000000000000000000000000000000000000000000000000000000
07777777707777777777770777777777707777770777077777077777700777777fffffff00000000000000000000000000000000000000000000000000000000
07777777707777777777770777777777707777700777077770777777007777777fffffff00000000000000000000000000000000000000000000000000000000
07777777707777777777770077777777707777707777077770777770077777777fffffff00000000000000000000000000000000000000000000000000000000
07777777707777777777777077777777707777707777077707777770777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777707777777777777700777777077777707777707707777770777000777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777770007770077777707777707007777770777770077fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777700000777777777777707077777770077777077fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777700077777777000777077fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777000077fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
07777777777777777777777777777777777777777777777777777777777777777fffffff00000000000000000000000000000000000000000000000000000000
__map__
0102030405060708010203040506070801020304050607080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112131415161718111213141516171811121314151617180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2122232425262728212223242526272821222324252627280000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3132333435363738313233343536373831323334353637380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4142434445464748414243444546474841424344454647480000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5152535455565758515253545556575851525354555657580000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6162636465666768616263646566676861626364656667680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7172737475767778717273747576777871727374757677780000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102030405060708010203040506070801020304050607080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1112131415161718111213141516171811121314151617180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2122232425262728212223242526272821222324252627280000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3132333435363738313233343536373831323334353637380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4142434445464748414243444546474841424344454647480000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5152535455565758515253545556575851525354555657580000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6162636465666768616263646566676861626364656667680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7172737475767778717273747576777871727374757677780000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000000000000000000010400104001040010400104000000000000000000000000000001000070000700004000040000000000000070000700000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001505009030000701c010080300b0701302000000230500002018050000301707008050200202007005060000401c0501f050000701d0501f0100d030000700e05000020000000f070190200000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000162301e25024250323602c260205601f1702b37022170342700f360291602a1600736007360072600626006260072600f2602526028550323503624036230322302d230272301c230102300822002210
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000
00 00000000

