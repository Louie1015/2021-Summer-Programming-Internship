from cscore import CameraServer
import cv2
import numpy as np
from networktables import NetworkTables
from networktables import NetworkTableEntry


NetworkTables.initialize(server="10.17.81.2")
nt = NetworkTables.getTable('vision')

cs = CameraServer.getInstance()
cs.enableLogging()

camera = cs.startAutomaticCapture()
camera.setResolution(480, 640)

output = cs.putVideo("Hellooo", 480, 640)

sink = cs.getVideo()

def channeler (img):
    output_img = np.zeros((480,640,3), np.uint8) 
    output_img [:,:,0] = img
    output_img [:,:,1] = img
    output_img [:,:,2] = img
    return output_img



input_img = np.zeros((480,640,3), np.uint8)
while True:
    time, input_img = sink.grabFrame(input_img)

    if time == 0: # There is an error
        output.notifyError(sink.getError())
        continue

   
    # Insert processing code here
    hsv_img = cv2.cvtColor(input_img, cv2.COLOR_BGR2HSV)
    binary_img = cv2.inRange(hsv_img, (21, 100, 0), (33, 255, 255))
    _, contours, _ = cv2.findContours(binary_img, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    if len(contours) > 0:
        largest = contours[0]
        for contour in contours:
            if cv2.contourArea(contour) > 100: #cv2.contourArea(largest):
                
                x, y, w, h = cv2.boundingRect(contour)
                cv2.rectangle(input_img,(x,y),(x + w, y + h), (0,255,0),2)

                if cv2.contourArea(contour) > cv2.contourArea(largest):
                    largest = contour

        x, y, w, h = cv2.boundingRect(largest)
        cv2.rectangle(input_img,(x,y),(x + w, y + h), (255,0,0),2)


        x,y,w,h = cv2.boundingRect(largest)

        nt.putNumber('center_x', x + w/2)
        nt.putNumber('center_y', y + h/2)
        print(nt.getNumber('center_x', 0))

        #print(x + w/2)
    else:
        nt.putNumber('center_x', -100)
        nt.putNumber('center_y', -100)

   
    #print (center)

    #corners = cv2.convexHull(contour)
    #corners = cv2.approxPolyDP(corners, 0.1 * cv2.arcLength(contour), True)

    #, _, rotation = cv2.fitEllipse(contour)


    output.putFrame(input_img)
      