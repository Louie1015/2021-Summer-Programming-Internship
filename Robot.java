// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

package frc.robot;

import edu.wpi.first.wpilibj.Joystick;
import edu.wpi.first.wpilibj.TimedRobot;
import com.revrobotics.CANSparkMax;
import com.revrobotics.CANSparkMaxLowLevel.MotorType;
import edu.wpi.first.networktables.NetworkTable;
import edu.wpi.first.networktables.NetworkTableEntry;
import edu.wpi.first.networktables.NetworkTableInstance;
import edu.wpi.first.wpilibj.SpeedControllerGroup;
import edu.wpi.first.wpilibj.Timer;
import edu.wpi.first.wpilibj.drive.DifferentialDrive;

/**
 * The VM is configured to automatically run this class, and to call the
 * functions corresponding to each mode, as described in the TimedRobot
 * documentation. If you change the name of this class or the package after
 * creating this project, you must also update the build.gradle file in the
 * project.
 */
public class Robot extends TimedRobot {

  private CANSparkMax right1 = new CANSparkMax(22, MotorType.kBrushless);
  private CANSparkMax left1 = new CANSparkMax(21, MotorType.kBrushless);
  private Joystick joy1 = new Joystick(0);
  private SpeedControllerGroup leftMotors = new SpeedControllerGroup(left1);
  private SpeedControllerGroup rightMotors = new SpeedControllerGroup(right1);
  private DifferentialDrive drivechain = new DifferentialDrive(left1, right1);
  private double leftMotorStartPosition;
  private double rightMotorStartPosition;
  private double encoderCount;
  NetworkTableInstance inst;
  NetworkTable table;
  NetworkTableEntry xEntry;
  NetworkTableEntry yEntry;
  private Joystick joystick;
  private double encoderCountDifferenceL;
  private double encoderCountDifferenceLB;
  private double encoderCountDifferenceS;
  private double encoderCountDifferenceSB;
  private double encoderCountDifferenceT;
  private double encoderCountDifferenceTB;
  private double threshold = (1); // amount of error needed before we need to do something about it! (add
  private double Mode = (0);
  double x = 0;
  double y = 0;

  Timer autoTimer = new Timer();

  @Override
  public void robotInit() {
    joystick = new Joystick(0);

    inst = NetworkTableInstance.getDefault();
    table = inst.getTable("vision");
    xEntry = table.getEntry("center_x");
    yEntry = table.getEntry("center_y");
  }

  @Override
  public void robotPeriodic() {

  }

  @Override
  public void autonomousInit() {

    leftMotorStartPosition = left1.getEncoder().getPosition();
    rightMotorStartPosition = right1.getEncoder().getPosition();
    encoderCount = left1.getEncoder().getPosition();
    Reset();
    Mode = (0);

  }

  private void driveStraight(double encoder_Count) {
    encoderCount = right1.getEncoder().getPosition();

    if (encoderCount < encoder_Count) {
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
        adjuster = 0.06;
      }
    }
    left1.set(0.2 + adjuster);

    right1.set(-0.2 - adjuster);
  }

  private void driveStraightB(double encoder_Count) // this does the exact opposite of drive straight and drives
                                                    // backwards for no set amount of time
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
    left1.set(-0.2 - adjuster);

    right1.set(0.2 + adjuster);
  }

  private void turnLeft(double encoder_Count) {
    encoderCount = right1.getEncoder().getPosition();

    // System.out.println(encoderCount + " : " + encoder_Count);

    if (encoderCount < encoder_Count) {
      Reset();
      Mode++;
      return;
    }

    leftMotors.set(-0.1);
    rightMotors.set(-0.1);
  }

  private void turnRight(double encoder_Count) {
    encoderCount = right1.getEncoder().getPosition();

    // System.out.println(encoderCount + " : " + encoder_Count);

    if (encoderCount > encoder_Count) {
      Reset();
      Mode++;
      return;
    }

    leftMotors.set(0.2);
    rightMotors.set(0.2);
  }

  public void Reset() {
    encoderCountDifferenceL = right1.getEncoder().getPosition() - 550; // encoder counts needed for long side in first
                                                                       // run
    encoderCountDifferenceLB = right1.getEncoder().getPosition() + 550; // encoder counts needed for long side in second
                                                                        // run
    encoderCountDifferenceS = right1.getEncoder().getPosition() - 295; // encoder counts needed for short side in first
                                                                       // run
    encoderCountDifferenceSB = right1.getEncoder().getPosition() + 295; // encoder counts needed for short side in
                                                                        // second run
    encoderCountDifferenceT = right1.getEncoder().getPosition() - 45; // encoder counts needed for turn left
    encoderCountDifferenceTB = right1.getEncoder().getPosition() + 40; // encoder counts needed for turn right

    try { // this is basically letting the robot take a second break after each mode/state
      Thread.sleep(1000);
    } catch (Exception e) {
      System.out.println(e);
    }
  }

  @Override
  public void autonomousPeriodic() {
    /*
     * left1.set (0.2); right1.set (-0.2); encoderCount =
     * left1.getEncoder().getPosition();
     * System.out.println(right1.getEncoder().getPosition());
     */

    System.out.println(Mode); // tells us the mode/state of the robot
    System.out.println(encoderCount + "=" + encoderCountDifferenceS);

    if (Mode == 0) // if mode = 0 then drive straight until the encode count goal is reached, then
                   // move to next mode! rinse and repeat!
    {
      driveStraight(encoderCountDifferenceS);
    } else

    if (Mode == 1) {
      turnLeft(encoderCountDifferenceT);
    } else

    if (Mode == 2) {
      driveStraight(encoderCountDifferenceL);
    } else if (Mode == 3) {

      turnLeft(encoderCountDifferenceT);

    } else if (Mode == 4) {
      driveStraight(encoderCountDifferenceS);
    }

    else if (Mode == 5) {
      driveStraightB(encoderCountDifferenceSB);
    }

    else if (Mode == 6) {
      turnRight(encoderCountDifferenceTB);
    }

    else if (Mode == 7) {
      driveStraightB(encoderCountDifferenceLB);
    }
  }

  @Override
  public void teleopInit() {
  }

  @Override
  public void teleopPeriodic() {

    x = xEntry.getDouble(0);
    y = yEntry.getDouble(0);

    System.out.println(table.getEntry("center_x").getDouble(0) + ":" + (x));

    if (joy1.getRawButton(1)) {
      if (x < 640/3){
        System.out.println("Turning LEFT");
        left1.set(-0.1);
        right1.set(-0.1);
      }

      else if (x > 2*(640/3)){
        System.out.println("Turning RIGHT");
        left1.set(0.1);
        right1.set(0.1);
      }

      else {
        System.out.println("ON TARGET!");
        left1.set(0);
        right1.set(0);
      }
    }

  }
}
