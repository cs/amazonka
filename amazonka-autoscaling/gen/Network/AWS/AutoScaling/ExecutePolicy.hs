{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AutoScaling.ExecutePolicy
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Executes the specified policy.
--
-- <http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_ExecutePolicy.html>
module Network.AWS.AutoScaling.ExecutePolicy
    (
    -- * Request
      ExecutePolicy
    -- ** Request constructor
    , executePolicy
    -- ** Request lenses
    , epHonorCooldown
    , epMetricValue
    , epAutoScalingGroupName
    , epBreachThreshold
    , epPolicyName

    -- * Response
    , ExecutePolicyResponse
    -- ** Response constructor
    , executePolicyResponse
    ) where

import           Network.AWS.AutoScaling.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'executePolicy' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'epHonorCooldown'
--
-- * 'epMetricValue'
--
-- * 'epAutoScalingGroupName'
--
-- * 'epBreachThreshold'
--
-- * 'epPolicyName'
data ExecutePolicy = ExecutePolicy'
    { _epHonorCooldown        :: !(Maybe Bool)
    , _epMetricValue          :: !(Maybe Double)
    , _epAutoScalingGroupName :: !(Maybe Text)
    , _epBreachThreshold      :: !(Maybe Double)
    , _epPolicyName           :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ExecutePolicy' smart constructor.
executePolicy :: Text -> ExecutePolicy
executePolicy pPolicyName =
    ExecutePolicy'
    { _epHonorCooldown = Nothing
    , _epMetricValue = Nothing
    , _epAutoScalingGroupName = Nothing
    , _epBreachThreshold = Nothing
    , _epPolicyName = pPolicyName
    }

-- | If this parameter is true, Auto Scaling waits for the cooldown period to
-- complete before executing the policy. Otherwise, Auto Scaling executes
-- the policy without waiting for the cooldown period to complete.
--
-- This parameter is not supported if the policy type is @StepScaling@.
--
-- For more information, see
-- <http://docs.aws.amazon.com/AutoScaling/latest/DeveloperGuide/Cooldown.html Understanding Auto Scaling Cooldowns>
-- in the /Auto Scaling Developer Guide/.
epHonorCooldown :: Lens' ExecutePolicy (Maybe Bool)
epHonorCooldown = lens _epHonorCooldown (\ s a -> s{_epHonorCooldown = a});

-- | The metric value to compare to @BreachThreshold@. This enables you to
-- execute a policy of type @StepScaling@ and determine which step
-- adjustment to use. For example, if the breach threshold is 50 and you
-- want to use a step adjustment with a lower bound of 0 and an upper bound
-- of 10, you can set the metric value to 59.
--
-- If you specify a metric value that doesn\'t correspond to a step
-- adjustment for the policy, the call returns an error.
--
-- This parameter is required if the policy type is @StepScaling@ and not
-- supported otherwise.
epMetricValue :: Lens' ExecutePolicy (Maybe Double)
epMetricValue = lens _epMetricValue (\ s a -> s{_epMetricValue = a});

-- | The name or Amazon Resource Name (ARN) of the Auto Scaling group.
epAutoScalingGroupName :: Lens' ExecutePolicy (Maybe Text)
epAutoScalingGroupName = lens _epAutoScalingGroupName (\ s a -> s{_epAutoScalingGroupName = a});

-- | The breach threshold for the alarm.
--
-- This parameter is required if the policy type is @StepScaling@ and not
-- supported otherwise.
epBreachThreshold :: Lens' ExecutePolicy (Maybe Double)
epBreachThreshold = lens _epBreachThreshold (\ s a -> s{_epBreachThreshold = a});

-- | The name or ARN of the policy.
epPolicyName :: Lens' ExecutePolicy Text
epPolicyName = lens _epPolicyName (\ s a -> s{_epPolicyName = a});

instance AWSRequest ExecutePolicy where
        type Sv ExecutePolicy = AutoScaling
        type Rs ExecutePolicy = ExecutePolicyResponse
        request = post
        response = receiveNull ExecutePolicyResponse'

instance ToHeaders ExecutePolicy where
        toHeaders = const mempty

instance ToPath ExecutePolicy where
        toPath = const "/"

instance ToQuery ExecutePolicy where
        toQuery ExecutePolicy'{..}
          = mconcat
              ["Action" =: ("ExecutePolicy" :: ByteString),
               "Version" =: ("2011-01-01" :: ByteString),
               "HonorCooldown" =: _epHonorCooldown,
               "MetricValue" =: _epMetricValue,
               "AutoScalingGroupName" =: _epAutoScalingGroupName,
               "BreachThreshold" =: _epBreachThreshold,
               "PolicyName" =: _epPolicyName]

-- | /See:/ 'executePolicyResponse' smart constructor.
data ExecutePolicyResponse =
    ExecutePolicyResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ExecutePolicyResponse' smart constructor.
executePolicyResponse :: ExecutePolicyResponse
executePolicyResponse = ExecutePolicyResponse'
