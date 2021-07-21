// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot;

import edu.wpi.first.wpilibj.Joystick;
import edu.wpi.first.wpilibj.TimedRobot;
import com.revrobotics.CANSparkMax;
import com.revrobotics.CANSparkMaxLowLevel.MotorType;

import edu.wpi.first.wpilibj.SpeedControllerGroup;
import edu.wpi.first.wpilibj.Timer;
import edu.wpi.first.wpilibj.drive.DifferentialDrive;
import java.lang.*;

/**
 * The VM is configured to automatically run this class, and to call the
 * functions corresponding to each mode, as described in the TimedRobot
 * documentation. If you change the name of this class or the package after
 * creating this project, you must also update the build.gradle file in the
 * project.
 */
public class Robot extends TimedRobot {

  private CANSparkMax right1 = new CANSparkMax(22, MotorType.kBrushless);
  private CANSparkMax right2 = new CANSparkMax(24, MotorType.kBrushless);
  private CANSparkMax left1 = new CANSparkMax(21, MotorType.kBrushless);
  private CANSparkMax left2 = new CANSparkMax(23, MotorType.kBrushless);
  private Joystick joy1 = new Joystick(0);
  private SpeedControllerGroup leftMotors = new SpeedControllerGroup(left1, left2);
  private SpeedControllerGroup rightMotors = new SpeedControllerGroup(right1, right2);
  private DifferentialDrive drivechain = new DifferentialDrive(leftMotors, rightMotors);
  private double leftMotorStartPosition;
  private double rightMotorStartPosition;
  private double encoderCount;
  private Joystick joystick;
  private double encoderCountDifferenceL;
  private double encoderCountDifferenceS;
  private double encoderCountDifferenceT;
  private double threshold = (9);
  private double Mode = (0);

  Timer autoTimer = new Timer();

  @Override
  public void robotInit() {
    joystick = new Joystick(0);
  }

  @Override
  public void robotPeriodic() {

  }

  @Override
  public void autonomousInit() {

  }

  @Override
  public void autonomousPeriodic() {

  }

  @Override
  public void teleopInit() {

    leftMotorStartPosition = left1.getEncoder().getPosition();
    rightMotorStartPosition = right1.getEncoder().getPosition();
    encoderCount = left1.getEncoder().getPosition();
    Reset();
    Mode = (0);
  }

  private void DriveStraight(double encoder_Count)
{
   if (encoderCount > encoder_Count) {
    Reset();
    Mode++;
    return;
  }

  double adjuster = (0);
  double differenceof_rotation = leftMotorStartPosition - rightMotorStartPosition;
  if (Math.abs(differenceof_rotation) > threshold) {
    if (differenceof_rotation > (0)) {
      adjuster = -0.02;
    }
    if (differenceof_rotation < (0)) {
      adjuster = 0.02;
    }
  }
  left1.set(0.2 + adjuster);

  right1.set(-0.2 - adjuster);
  }


  private void TurnLeft(double encoder_Count) 
  {
    //System.out.println(encoderCount + " : " + encoder_Count);

    if  (encoderCount < encoder_Count) {
      Reset();
      Mode++;
      return;
    }

    leftMotors.set(-0.2); 
    rightMotors.set(-0.2);
  }


  private void TurnRight(double encoder_Count) 
  {
    //System.out.println(encoderCount + " : " + encoder_Count);

    if  (encoderCount < encoder_Count) {
      Reset();
      Mode++;
      return;
    }

    leftMotors.set(0.2); 
    rightMotors.set(0.2);
  }


public void Reset()
{
  encoderCountDifferenceL = encoderCount + 85;
  encoderCountDifferenceS = encoderCount + 40;
  encoderCountDifferenceT = encoderCount - 6.3; 
  try {
    Thread.sleep(1000);
  } catch (Exception e) {
    System.out.println(e);
  }
}


  @Override
  public void teleopPeriodic() {

    encoderCount = left1.getEncoder().getPosition();

    //if(joystick.getRawButton(3)){

    //System.out.println(right1.getEncoder().getPosition());

    if (joystick.getRawButton(4))
    {
      Reset();  
    }


    if (joystick.getRawButton(2)) 
     { System.out.println (Mode);

      //System.out.println(encoderCount + "  < " + encoderCountDifferenceS);
      if (Mode == 0/*encoderCount < encoderCountDifferenceS*/)
       {
        DriveStraight(encoderCountDifferenceS);
       } else

       if (Mode == 1/*encoderCount < encoderCountDifferenceT*/)
      { 
        TurnLeft(encoderCountDifferenceT);
      }else 

      if (Mode == 2/*encoderCount < encoderCountDifferenceL*/)  
      {
        DriveStraight(encoderCountDifferenceL);
      }else if (Mode == 3) {
      
      TurnLeft(encoderCountDifferenceT);

      } else if (Mode == 4) {
        DriveStraight(encoderCountDifferenceS);
      } 

      else if (Mode == 5) {
        TurnLeft(encoderCountDifferenceT);
      }

      /*else if (Mode == 6) {
        DriveStraight(encoderCountDifferenceS);
      }

      else if (Mode == 7) {
        TurnRight(encoderCountDifferenceT);
      }

      else if (Mode == 8) {
        DriveStraight(encoderCountDifferenceL);
      }

      else if (Mode == 9) {
        TurnRight(encoderCountDifferenceT);
      }

      else if (Mode == 10) {
        DriveStraight(encoderCountDifferenceS);
      }*/
      
    }

    
     

     else {

      double speed = -joy1.getRawAxis(1) * 0.6;
      double turn = -joy1.getRawAxis(0) * 0.3;

      double left = speed + turn;
      double right = speed - turn;

      drivechain.tankDrive(left, right);

    }
  
  }
  
}
