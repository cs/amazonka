{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.OpsWorks.DescribeStacks
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Requests a description of one or more stacks.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Show, Deploy, or Manage permissions level for the stack, or an attached
-- policy that explicitly grants permissions. For more information on user
-- permissions, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_DescribeStacks.html>
module Network.AWS.OpsWorks.DescribeStacks
    (
    -- * Request
      DescribeStacks
    -- ** Request constructor
    , describeStacks
    -- ** Request lenses
    , dsStackIds

    -- * Response
    , DescribeStacksResponse
    -- ** Response constructor
    , describeStacksResponse
    -- ** Response lenses
    , dsrStacks
    , dsrStatus
    ) where

import           Network.AWS.OpsWorks.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'describeStacks' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsStackIds'
newtype DescribeStacks = DescribeStacks'
    { _dsStackIds :: Maybe [Text]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeStacks' smart constructor.
describeStacks :: DescribeStacks
describeStacks =
    DescribeStacks'
    { _dsStackIds = Nothing
    }

-- | An array of stack IDs that specify the stacks to be described. If you
-- omit this parameter, @DescribeStacks@ returns a description of every
-- stack.
dsStackIds :: Lens' DescribeStacks [Text]
dsStackIds = lens _dsStackIds (\ s a -> s{_dsStackIds = a}) . _Default;

instance AWSRequest DescribeStacks where
        type Sv DescribeStacks = OpsWorks
        type Rs DescribeStacks = DescribeStacksResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DescribeStacksResponse' <$>
                   (x .?> "Stacks" .!@ mempty) <*> (pure (fromEnum s)))

instance ToHeaders DescribeStacks where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.DescribeStacks" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeStacks where
        toJSON DescribeStacks'{..}
          = object ["StackIds" .= _dsStackIds]

instance ToPath DescribeStacks where
        toPath = const "/"

instance ToQuery DescribeStacks where
        toQuery = const mempty

-- | Contains the response to a @DescribeStacks@ request.
--
-- /See:/ 'describeStacksResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsrStacks'
--
-- * 'dsrStatus'
data DescribeStacksResponse = DescribeStacksResponse'
    { _dsrStacks :: !(Maybe [Stack])
    , _dsrStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeStacksResponse' smart constructor.
describeStacksResponse :: Int -> DescribeStacksResponse
describeStacksResponse pStatus =
    DescribeStacksResponse'
    { _dsrStacks = Nothing
    , _dsrStatus = pStatus
    }

-- | An array of @Stack@ objects that describe the stacks.
dsrStacks :: Lens' DescribeStacksResponse [Stack]
dsrStacks = lens _dsrStacks (\ s a -> s{_dsrStacks = a}) . _Default;

-- | FIXME: Undocumented member.
dsrStatus :: Lens' DescribeStacksResponse Int
dsrStatus = lens _dsrStatus (\ s a -> s{_dsrStatus = a});
