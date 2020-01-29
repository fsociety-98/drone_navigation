
"use strict";

let HeadingCommand = require('./HeadingCommand.js');
let YawrateCommand = require('./YawrateCommand.js');
let MotorStatus = require('./MotorStatus.js');
let RawMagnetic = require('./RawMagnetic.js');
let RuddersCommand = require('./RuddersCommand.js');
let VelocityXYCommand = require('./VelocityXYCommand.js');
let RC = require('./RC.js');
let Compass = require('./Compass.js');
let MotorPWM = require('./MotorPWM.js');
let VelocityZCommand = require('./VelocityZCommand.js');
let ControllerState = require('./ControllerState.js');
let RawImu = require('./RawImu.js');
let Supply = require('./Supply.js');
let Altimeter = require('./Altimeter.js');
let PositionXYCommand = require('./PositionXYCommand.js');
let ServoCommand = require('./ServoCommand.js');
let AttitudeCommand = require('./AttitudeCommand.js');
let ThrustCommand = require('./ThrustCommand.js');
let RawRC = require('./RawRC.js');
let HeightCommand = require('./HeightCommand.js');
let MotorCommand = require('./MotorCommand.js');
let PoseActionResult = require('./PoseActionResult.js');
let LandingActionGoal = require('./LandingActionGoal.js');
let PoseResult = require('./PoseResult.js');
let LandingAction = require('./LandingAction.js');
let LandingFeedback = require('./LandingFeedback.js');
let TakeoffActionResult = require('./TakeoffActionResult.js');
let TakeoffActionFeedback = require('./TakeoffActionFeedback.js');
let LandingGoal = require('./LandingGoal.js');
let PoseGoal = require('./PoseGoal.js');
let PoseFeedback = require('./PoseFeedback.js');
let TakeoffAction = require('./TakeoffAction.js');
let TakeoffActionGoal = require('./TakeoffActionGoal.js');
let PoseActionGoal = require('./PoseActionGoal.js');
let PoseAction = require('./PoseAction.js');
let TakeoffGoal = require('./TakeoffGoal.js');
let TakeoffResult = require('./TakeoffResult.js');
let TakeoffFeedback = require('./TakeoffFeedback.js');
let LandingActionFeedback = require('./LandingActionFeedback.js');
let LandingResult = require('./LandingResult.js');
let LandingActionResult = require('./LandingActionResult.js');
let PoseActionFeedback = require('./PoseActionFeedback.js');

module.exports = {
  HeadingCommand: HeadingCommand,
  YawrateCommand: YawrateCommand,
  MotorStatus: MotorStatus,
  RawMagnetic: RawMagnetic,
  RuddersCommand: RuddersCommand,
  VelocityXYCommand: VelocityXYCommand,
  RC: RC,
  Compass: Compass,
  MotorPWM: MotorPWM,
  VelocityZCommand: VelocityZCommand,
  ControllerState: ControllerState,
  RawImu: RawImu,
  Supply: Supply,
  Altimeter: Altimeter,
  PositionXYCommand: PositionXYCommand,
  ServoCommand: ServoCommand,
  AttitudeCommand: AttitudeCommand,
  ThrustCommand: ThrustCommand,
  RawRC: RawRC,
  HeightCommand: HeightCommand,
  MotorCommand: MotorCommand,
  PoseActionResult: PoseActionResult,
  LandingActionGoal: LandingActionGoal,
  PoseResult: PoseResult,
  LandingAction: LandingAction,
  LandingFeedback: LandingFeedback,
  TakeoffActionResult: TakeoffActionResult,
  TakeoffActionFeedback: TakeoffActionFeedback,
  LandingGoal: LandingGoal,
  PoseGoal: PoseGoal,
  PoseFeedback: PoseFeedback,
  TakeoffAction: TakeoffAction,
  TakeoffActionGoal: TakeoffActionGoal,
  PoseActionGoal: PoseActionGoal,
  PoseAction: PoseAction,
  TakeoffGoal: TakeoffGoal,
  TakeoffResult: TakeoffResult,
  TakeoffFeedback: TakeoffFeedback,
  LandingActionFeedback: LandingActionFeedback,
  LandingResult: LandingResult,
  LandingActionResult: LandingActionResult,
  PoseActionFeedback: PoseActionFeedback,
};
