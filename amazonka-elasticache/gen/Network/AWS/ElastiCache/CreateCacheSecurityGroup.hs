{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ElastiCache.CreateCacheSecurityGroup
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | The /CreateCacheSecurityGroup/ action creates a new cache security
-- group. Use a cache security group to control access to one or more cache
-- clusters.
--
-- Cache security groups are only used when you are creating a cache
-- cluster outside of an Amazon Virtual Private Cloud (VPC). If you are
-- creating a cache cluster inside of a VPC, use a cache subnet group
-- instead. For more information, see
-- <http://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSubnetGroup.html CreateCacheSubnetGroup>.
--
-- <http://docs.aws.amazon.com/AmazonElastiCache/latest/APIReference/API_CreateCacheSecurityGroup.html>
module Network.AWS.ElastiCache.CreateCacheSecurityGroup
    (
    -- * Request
      CreateCacheSecurityGroup
    -- ** Request constructor
    , createCacheSecurityGroup
    -- ** Request lenses
    , ccsgCacheSecurityGroupName
    , ccsgDescription

    -- * Response
    , CreateCacheSecurityGroupResponse
    -- ** Response constructor
    , createCacheSecurityGroupResponse
    -- ** Response lenses
    , ccsgrCacheSecurityGroup
    , ccsgrStatus
    ) where

import           Network.AWS.ElastiCache.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Represents the input of a /CreateCacheSecurityGroup/ action.
--
-- /See:/ 'createCacheSecurityGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ccsgCacheSecurityGroupName'
--
-- * 'ccsgDescription'
data CreateCacheSecurityGroup = CreateCacheSecurityGroup'
    { _ccsgCacheSecurityGroupName :: !Text
    , _ccsgDescription            :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateCacheSecurityGroup' smart constructor.
createCacheSecurityGroup :: Text -> Text -> CreateCacheSecurityGroup
createCacheSecurityGroup pCacheSecurityGroupName pDescription =
    CreateCacheSecurityGroup'
    { _ccsgCacheSecurityGroupName = pCacheSecurityGroupName
    , _ccsgDescription = pDescription
    }

-- | A name for the cache security group. This value is stored as a lowercase
-- string.
--
-- Constraints: Must contain no more than 255 alphanumeric characters.
-- Cannot be the word \"Default\".
--
-- Example: @mysecuritygroup@
ccsgCacheSecurityGroupName :: Lens' CreateCacheSecurityGroup Text
ccsgCacheSecurityGroupName = lens _ccsgCacheSecurityGroupName (\ s a -> s{_ccsgCacheSecurityGroupName = a});

-- | A description for the cache security group.
ccsgDescription :: Lens' CreateCacheSecurityGroup Text
ccsgDescription = lens _ccsgDescription (\ s a -> s{_ccsgDescription = a});

instance AWSRequest CreateCacheSecurityGroup where
        type Sv CreateCacheSecurityGroup = ElastiCache
        type Rs CreateCacheSecurityGroup =
             CreateCacheSecurityGroupResponse
        request = post
        response
          = receiveXMLWrapper "CreateCacheSecurityGroupResult"
              (\ s h x ->
                 CreateCacheSecurityGroupResponse' <$>
                   (x .@? "CacheSecurityGroup") <*> (pure (fromEnum s)))

instance ToHeaders CreateCacheSecurityGroup where
        toHeaders = const mempty

instance ToPath CreateCacheSecurityGroup where
        toPath = const "/"

instance ToQuery CreateCacheSecurityGroup where
        toQuery CreateCacheSecurityGroup'{..}
          = mconcat
              ["Action" =:
                 ("CreateCacheSecurityGroup" :: ByteString),
               "Version" =: ("2015-02-02" :: ByteString),
               "CacheSecurityGroupName" =:
                 _ccsgCacheSecurityGroupName,
               "Description" =: _ccsgDescription]

-- | /See:/ 'createCacheSecurityGroupResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ccsgrCacheSecurityGroup'
--
-- * 'ccsgrStatus'
data CreateCacheSecurityGroupResponse = CreateCacheSecurityGroupResponse'
    { _ccsgrCacheSecurityGroup :: !(Maybe CacheSecurityGroup)
    , _ccsgrStatus             :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateCacheSecurityGroupResponse' smart constructor.
createCacheSecurityGroupResponse :: Int -> CreateCacheSecurityGroupResponse
createCacheSecurityGroupResponse pStatus =
    CreateCacheSecurityGroupResponse'
    { _ccsgrCacheSecurityGroup = Nothing
    , _ccsgrStatus = pStatus
    }

-- | FIXME: Undocumented member.
ccsgrCacheSecurityGroup :: Lens' CreateCacheSecurityGroupResponse (Maybe CacheSecurityGroup)
ccsgrCacheSecurityGroup = lens _ccsgrCacheSecurityGroup (\ s a -> s{_ccsgrCacheSecurityGroup = a});

-- | FIXME: Undocumented member.
ccsgrStatus :: Lens' CreateCacheSecurityGroupResponse Int
ccsgrStatus = lens _ccsgrStatus (\ s a -> s{_ccsgrStatus = a});
