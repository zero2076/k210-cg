file = io.open("test.py", "a")

-- 设置默认输出文件为 test.lua
io.output(file)

-- 在文件最后一行添加 Lua 注释
io.write("import image\nimport sensor\nimport lcd\nimport time\nclock = time.clock()\nlcd.init()\nsensor.reset()\nsensor.set_pixformat(sensor.RGB567)\nsensor.set_framesize(sensor.QVGA)\nsensor.set_vflip(0)\nlcd.rotation(2)\nsensor.skip_frames(30)\nwhile True:\n    clock.tick()\n    img = sensor.snapshot()\n    res = img.find_qrcodes() #识别二维码\n    fps =clock.fps()\n    if res:\n        for b in res:\n            tmp=img.draw_rectangle(b[1:4])\n            img.draw_string(2,2, res[0].payload(), color=(0,128,0), scale=2)#将二维码框出\n            print(res[0].payload())\n    lcd.display(img)\n")
print ("Enter the name of a worker")
local name = io.read()
io.write("if res[0].payload()=",name,":\n	uart.write('arrived:',",name,")\nelse\n")
-- 关闭打开的文件
io.close(file)
