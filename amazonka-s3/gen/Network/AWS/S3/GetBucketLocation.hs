{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.S3.GetBucketLocation
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- | Returns the region the bucket resides in.
--
-- <http://docs.aws.amazon.com/AmazonS3/latest/API/GetBucketLocation.html>
module Network.AWS.S3.GetBucketLocation
    (
    -- * Request
      GetBucketLocation
    -- ** Request constructor
    , getBucketLocation
    -- ** Request lenses
    , gblBucket

    -- * Response
    , GetBucketLocationResponse
    -- ** Response constructor
    , getBucketLocationResponse
    -- ** Response lenses
    , gLocationConstraint
    , gStatus
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.S3.Types

-- | /See:/ 'getBucketLocation' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gblBucket'
newtype GetBucketLocation = GetBucketLocation'
    { _gblBucket :: BucketName
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | 'GetBucketLocation' smart constructor.
getBucketLocation :: BucketName -> GetBucketLocation
getBucketLocation pBucket =
    GetBucketLocation'
    { _gblBucket = pBucket
    }

-- | FIXME: Undocumented member.
gblBucket :: Lens' GetBucketLocation BucketName
gblBucket = lens _gblBucket (\ s a -> s{_gblBucket = a});

instance AWSRequest GetBucketLocation where
        type Sv GetBucketLocation = S3
        type Rs GetBucketLocation = GetBucketLocationResponse
        request = get
        response
          = receiveXML
              (\ s h x ->
                 GetBucketLocationResponse' <$>
                   (x .@? "LocationConstraint") <*> (pure (fromEnum s)))

instance ToHeaders GetBucketLocation where
        toHeaders = const mempty

instance ToPath GetBucketLocation where
        toPath GetBucketLocation'{..}
          = mconcat ["/", toText _gblBucket]

instance ToQuery GetBucketLocation where
        toQuery = const (mconcat ["location"])

-- | /See:/ 'getBucketLocationResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gLocationConstraint'
--
-- * 'gStatus'
data GetBucketLocationResponse = GetBucketLocationResponse'
    { _gLocationConstraint :: !(Maybe Region)
    , _gStatus             :: !Int
    } deriving (Eq,Show,Data,Typeable,Generic)

-- | 'GetBucketLocationResponse' smart constructor.
getBucketLocationResponse :: Int -> GetBucketLocationResponse
getBucketLocationResponse pStatus =
    GetBucketLocationResponse'
    { _gLocationConstraint = Nothing
    , _gStatus = pStatus
    }

-- | FIXME: Undocumented member.
gLocationConstraint :: Lens' GetBucketLocationResponse (Maybe Region)
gLocationConstraint = lens _gLocationConstraint (\ s a -> s{_gLocationConstraint = a});

-- | FIXME: Undocumented member.
gStatus :: Lens' GetBucketLocationResponse Int
gStatus = lens _gStatus (\ s a -> s{_gStatus = a});
