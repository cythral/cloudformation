using System;

using Cythral;
using Cythral.CloudFormation;
using Cythral.CloudFormation.Entities;

namespace Cythral.CloudFormation.Events {
    public class AlarmEvent {
        public string AlarmName { get; set; }
        public string AlarmDescription { get; set; }
        public string AWSAccountId { get; set; }
        public string NewStateValue { get; set; }
        public string StateChangeTime { get; set; }
        public string Region { get; set; }
        public string OldStateValue { get; set; }
        public Trigger Trigger { get; set; }
    }
}